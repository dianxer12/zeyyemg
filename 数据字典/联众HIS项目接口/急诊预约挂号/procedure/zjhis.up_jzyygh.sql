create or replace procedure zjhis.up_jzyygh(ai_ghlx in number,adt_rq in date,as_ksdm in varchar2,as_id in varchar2,as_yjjlxh in varchar2,as_bah in varchar2,as_brxm in varchar2,al_ghjlxh in number,al_yyjlxh out number,ai_result out number,as_result out varchar2)
is
  --备注：ai_ghlx = 1表示预约模式；ai_ghlx=2表示挂号模式
  vtemp        number(4);
  vpbjlxh      number(10);
  vyjsb        number(10);
  vrq          date;
  vsysdate     date;
  vdqsxwfgsj  date;          --当前上下午分隔时间
  vdqpbfgsj   date;          --当前排班分隔时间
  vxcpbfgsj   date;          --下次排班分隔时间
  vsxwfgsj    varchar2(20); --上下午分隔时间
  vpbfgsj     varchar2(20); --排班分隔时间
  vdqsj       varchar2(20); --当前时间
  vsxw        number(2);
  vghxh       number(4);
  vbrxm        varchar2(50);
  vjzkh        varchar2(20);
  vjzcs        number(4);
  vbrlb        number(4);
  vbrxzdm      varchar2(20);
  vghf        number(4,1);
  vzlf        number(4,1);
  vghf_ylxh    number(10);
  vzlf_ylxh    number(10);
  vghfsfxm    number(10);
  vzlfsfxm    number(10);
  verror      varchar2(200);
  vfybh				number(4);
  exception1  exception;
begin
  ai_result := 0;
  as_result := '';

  select csz1,to_char(sysdate,'hh24:mi'),
         sysdate,
         to_date(to_char(sysdate,'yyyymmdd')||csz1,'yyyymmdd hh24:mi:ss')
    into vsxwfgsj,vdqsj,vsysdate,vdqsxwfgsj
    from zjhis.gy_xtcs
   where xtxh = 23 and csmc = 'SXWSJ'; --取上下午分隔时间、当前时间
  select csz1,
         to_date(decode(sign(sysdate-to_date(to_char(sysdate,'yyyymmdd')||' '||csz1,'yyyymmdd hh24:mi')),-1,to_char(sysdate-1,'yyyymmdd'),to_char(sysdate,'yyyymmdd'))||' '||csz1,'yyyymmdd hh24:mi'),
         to_date(decode(sign(sysdate-to_date(to_char(sysdate,'yyyymmdd')||' '||csz1,'yyyymmdd hh24:mi')),-1,to_char(sysdate,'yyyymmdd'),to_char(sysdate+1,'yyyymmdd'))||' '||csz1,'yyyymmdd hh24:mi')
    into vpbfgsj,vdqpbfgsj,vxcpbfgsj
    from zjhis.gy_xtcs
   where xtxh = 23 and csmc = 'PBSJ';  --取排班分隔时间
  if vdqsj > vsxwfgsj or vdqsj < vpbfgsj then --判断上下午
    vsxw := 2;  --下午
  else
    vsxw := 1;  --上午
  end if;
  
  if adt_rq < trunc(vsysdate) or adt_rq > vsysdate + 30/(24*60) then --校验传入日期是否有效
     as_result := '传入日期无效';
     raise exception1;
  end if;

  if vsysdate between vdqsxwfgsj - 15/(24*60) and vdqsxwfgsj then --判断是否提前当前上下午分隔时间15分钟
    vsxw := 2;  --切换到下午
  end if;
  if vsysdate between vxcpbfgsj - 5/(24*60) and vxcpbfgsj then --判断是否提前下次排班分隔时间5分钟
    vdqpbfgsj := vxcpbfgsj;  --切换到明日
  end if;

  select jlxh,rq      --取排班记录序号、挂号日期
    into vpbjlxh,vrq
    from zjhis.gh_mzpbk
   where rq between trunc(vdqpbfgsj) and trunc(vdqpbfgsj) + 1 - 0.00001
     and mzlbxh = 2
     and ksdm = as_ksdm;
	
	select nvl(fybh,0)
	  into vfybh
	  from zjhis.gy_ksdm
	 where ksdm = as_ksdm;
  /*****************************************************************************************************/

  if ai_ghlx = 1 then --预约模式
    select nvl(count(*),0) --检查预约情况
      into vtemp
      from zjhis.gh_mzyyk
     where yyrq1 = vrq
       and pbxh = vpbjlxh
       and ksdm = as_ksdm
       and yysj = vsxw
       and checkid = as_yjjlxh;

    if vpbjlxh > 0 and vtemp <= 0 then --存在排班并且未预约
      update gy_xhb set dqz = dqz + zz
      where bm = upper('gh_mzyyk');
      commit;
      select dqz
        into al_yyjlxh
        from zjhis.gy_xhb
       where bm = upper('gh_mzyyk');

      if vsxw = 1 then
        update gh_mzpbk set swdqh = swdqh + 1 where jlxh = vpbjlxh;
        commit;
        select swdqh
          into vghxh
          from zjhis.gh_mzpbk
         where jlxh = vpbjlxh;
      elsif vsxw = 2 then
        update gh_mzpbk set xwdqh = xwdqh + 1 where jlxh = vpbjlxh;
        commit;
        select xwdqh
          into vghxh
          from zjhis.gh_mzpbk
         where jlxh = vpbjlxh;
      end if;

      if as_brxm is null then
        vbrxm := vghxh;
      else
        vbrxm := as_brxm;
      end if;

      insert into gh_mzyyk(yyxh,xm,yyrq1,pbxh,ksdm,djrq,zt,yyf,czgh,yylb,yysj,ghxh,mzlbxh,checkid)
      values(al_yyjlxh,vbrxm,vrq,vpbjlxh,as_ksdm,sysdate,0,0,as_id,1,vsxw,vghxh,2,as_yjjlxh);
      commit;
      ai_result := 1;
      as_result := '预约成功';
    elsif vtemp > 0 then --已预约
      select yyxh
        into al_yyjlxh
        from zjhis.gh_mzyyk
       where yyrq1 = vrq
         and pbxh = vpbjlxh
         and ksdm = as_ksdm
         and yysj = vsxw
         and checkid = as_yjjlxh
         and rownum = 1;
      ai_result := 1;
      as_result := '已预约';
    else --不存在挂号排班
      ai_result := -1;
      as_result := '不存在挂号排班';
    end if;
  elsif ai_ghlx = 2 then --挂号模式
    --注意点:1.yj_yjk1里的ghxh必须>=0才会不限时间收费,插入gh_ghk.jlxh。yj_yjk1里的ghxh需建索引; 2.yj_yjk2里的fybh不要忘记插入
    select nvl(count(*),0) --检查挂号情况
      into vtemp
      from zjhis.yj_yjk1
     where kdsj between adt_rq - 1 and adt_rq + 1
       and ghxh = al_ghjlxh
       and ghxh > 0;

    if vpbjlxh > 0 and vtemp <= 0 then --存在排班并且未挂号
      if vsxw = 1 then
        update gh_mzpbk set swdqh = swdqh + 1 where jlxh = vpbjlxh;
        commit;
        select swdqh
          into vghxh
          from zjhis.gh_mzpbk
         where jlxh = vpbjlxh;
      elsif vsxw = 2 then
        update gh_mzpbk set xwdqh = xwdqh + 1 where jlxh = vpbjlxh;
        commit;
        select xwdqh
          into vghxh
          from zjhis.gh_mzpbk
         where jlxh = vpbjlxh;
      end if;

      if as_brxm is null then
        vbrxm := vghxh;
      else
        vbrxm := as_brxm;
      end if;

      update gy_xhb set dqz = dqz + zz
      where bm = upper('gh_ghk');
      commit;
      select dqz
        into al_yyjlxh
        from zjhis.gy_xhb
       where bm = upper('gh_ghk');

      update gy_xhb set dqz = dqz + zz
      where bm = upper('yj_yjk1');
      commit;
      select dqz
        into vyjsb
        from zjhis.gy_xhb
       where bm = upper('yj_yjk1');

      --取病人基本信息
      select jzkh,jzcs,brlb,brxzdm
        into vjzkh,vjzcs,vbrlb,vbrxzdm
        from zjhis.gy_brjbxxk
       where bah = as_bah
         and nvl(brzzbz,0) = 1
         and rownum = 1;

      --取挂号费、诊疗费信息
      select nvl((select dj from zjhis.gy_ylsf where ylxh = a.ghf_ylxh),0),
      			 nvl((select dj from zjhis.gy_ylsf where ylxh = a.zlf_ylxh),2),
      			 ghf_ylxh,
      			 zlf_ylxh,
             (select sfxm from zjhis.gy_ylsf where ylxh = a.ghf_ylxh),
             (select sfxm from zjhis.gy_ylsf where ylxh = a.zlf_ylxh)
        into vghf,vzlf,vghf_ylxh,vzlf_ylxh,vghfsfxm,vzlfsfxm
        from zjhis.gh_mzlbk a
       where mzlbxh = 2;

      --1.插入挂号信息
      Insert Into Gh_Ghk(Jlxh,Jzkh,Brxm,Jzcs,Brlb,Brxz,Dwbh,Mzlbxh,Ksdm,Ghrq,Pbxh,Ghxh,Ysgh,Sjlb,Ghf,Zlf,Zlfds,Czgh,Thbz,Czrq,Ybkh,
                          Jzje,Ickje,Lnzhje,Tcjjje,Zbbzje,Gfzh,Blkh,Fsjbz,Fsjjzje,Fphm,Ghlb,Fybh)
      Values (al_yyjlxh,vjzkh,vbrxm,vjzcs,vbrlb,vbrxzdm,'',2,as_ksdm,adt_rq,vpbjlxh,vghxh,null,vsxw,0,0,1,as_id,0,SysDate,null,
              0,0,0,0,0,null,0,0,0,Null,1,vfybh);
      --2.更新yj_yjk1
      If vghf + vzlf > 0 Then
        Insert Into Yj_Yjk1(Yjsb,Jzkh,Brxm,Sjysgh,Sjksdm,Kdsj,Sjsj,Mzpb,Ghxh,Jzxh,czgh,Fybh,shpb)
        Values (vyjsb,vjzkh,vbrxm,null,as_ksdm,adt_rq,sysdate,1,al_yyjlxh,-1,as_id,vfybh,1);
      end if;
      --3.更新yj_yjk2
      If vzlf > 0 Then
        Insert Into Yj_Yjk2(Yjsb,Ylxh,Dj,Sl,Fygb,Zfbl,Zxysgh,Zxksdm,Brxz,requestmode,Fybh)
        Values (vyjsb,vzlf_ylxh,vzlf,1,vzlfsfxm,1,null,as_ksdm,vbrxzdm,0,vfybh);
      end if;
      If vghf > 0 Then
         Insert Into Yj_Yjk2(Yjsb,Ylxh,Dj,Sl,Fygb,Zfbl,Zxysgh,Zxksdm,Brxz,requestmode,Fybh)
         Values (vyjsb,vghf_ylxh,vghf,1,vghfsfxm,1,null,as_ksdm,vbrxzdm,0,vfybh);
      end if;
      commit;
      ai_result := 1;
      as_result := '挂号成功';
    elsif vtemp > 0 then
      al_yyjlxh := al_ghjlxh;
      ai_result := 1;
      as_result := '已挂号';
    else --不存在排班
      ai_result := -1;
      as_result := '不存在挂号排班';
    end if;
  end if;
EXCEPTION
  WHEN exception1 THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    as_result := '急诊预约挂号无效！'||verror;
    rollback;
    dbms_output.put_line('急诊预约挂号无效！');
  WHEN OTHERS THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    as_result := '急诊预约挂号错误！'||verror;
    rollback;
    dbms_output.put_line('急诊预约挂号错误！');
end;

/

grant execute on zjhis.up_jzyygh to jzs;