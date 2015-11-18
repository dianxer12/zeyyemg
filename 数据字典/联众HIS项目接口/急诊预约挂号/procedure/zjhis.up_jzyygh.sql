create or replace procedure zjhis.up_jzyygh(ai_ghlx in number,adt_rq in date,as_ksdm in varchar2,as_id in varchar2,as_yjjlxh in varchar2,as_bah in varchar2,as_brxm in varchar2,al_ghjlxh in number,al_yyjlxh out number,ai_result out number,as_result out varchar2)
is
  --��ע��ai_ghlx = 1��ʾԤԼģʽ��ai_ghlx=2��ʾ�Һ�ģʽ
  vtemp        number(4);
  vpbjlxh      number(10);
  vyjsb        number(10);
  vrq          date;
  vsysdate     date;
  vdqsxwfgsj  date;          --��ǰ������ָ�ʱ��
  vdqpbfgsj   date;          --��ǰ�Ű�ָ�ʱ��
  vxcpbfgsj   date;          --�´��Ű�ָ�ʱ��
  vsxwfgsj    varchar2(20); --������ָ�ʱ��
  vpbfgsj     varchar2(20); --�Ű�ָ�ʱ��
  vdqsj       varchar2(20); --��ǰʱ��
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
   where xtxh = 23 and csmc = 'SXWSJ'; --ȡ������ָ�ʱ�䡢��ǰʱ��
  select csz1,
         to_date(decode(sign(sysdate-to_date(to_char(sysdate,'yyyymmdd')||' '||csz1,'yyyymmdd hh24:mi')),-1,to_char(sysdate-1,'yyyymmdd'),to_char(sysdate,'yyyymmdd'))||' '||csz1,'yyyymmdd hh24:mi'),
         to_date(decode(sign(sysdate-to_date(to_char(sysdate,'yyyymmdd')||' '||csz1,'yyyymmdd hh24:mi')),-1,to_char(sysdate,'yyyymmdd'),to_char(sysdate+1,'yyyymmdd'))||' '||csz1,'yyyymmdd hh24:mi')
    into vpbfgsj,vdqpbfgsj,vxcpbfgsj
    from zjhis.gy_xtcs
   where xtxh = 23 and csmc = 'PBSJ';  --ȡ�Ű�ָ�ʱ��
  if vdqsj > vsxwfgsj or vdqsj < vpbfgsj then --�ж�������
    vsxw := 2;  --����
  else
    vsxw := 1;  --����
  end if;
  
  if adt_rq < trunc(vsysdate) or adt_rq > vsysdate + 30/(24*60) then --У�鴫�������Ƿ���Ч
     as_result := '����������Ч';
     raise exception1;
  end if;

  if vsysdate between vdqsxwfgsj - 15/(24*60) and vdqsxwfgsj then --�ж��Ƿ���ǰ��ǰ������ָ�ʱ��15����
    vsxw := 2;  --�л�������
  end if;
  if vsysdate between vxcpbfgsj - 5/(24*60) and vxcpbfgsj then --�ж��Ƿ���ǰ�´��Ű�ָ�ʱ��5����
    vdqpbfgsj := vxcpbfgsj;  --�л�������
  end if;

  select jlxh,rq      --ȡ�Ű��¼��š��Һ�����
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

  if ai_ghlx = 1 then --ԤԼģʽ
    select nvl(count(*),0) --���ԤԼ���
      into vtemp
      from zjhis.gh_mzyyk
     where yyrq1 = vrq
       and pbxh = vpbjlxh
       and ksdm = as_ksdm
       and yysj = vsxw
       and checkid = as_yjjlxh;

    if vpbjlxh > 0 and vtemp <= 0 then --�����Űಢ��δԤԼ
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
      as_result := 'ԤԼ�ɹ�';
    elsif vtemp > 0 then --��ԤԼ
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
      as_result := '��ԤԼ';
    else --�����ڹҺ��Ű�
      ai_result := -1;
      as_result := '�����ڹҺ��Ű�';
    end if;
  elsif ai_ghlx = 2 then --�Һ�ģʽ
    --ע���:1.yj_yjk1���ghxh����>=0�Ż᲻��ʱ���շ�,����gh_ghk.jlxh��yj_yjk1���ghxh�轨����; 2.yj_yjk2���fybh��Ҫ���ǲ���
    select nvl(count(*),0) --���Һ����
      into vtemp
      from zjhis.yj_yjk1
     where kdsj between adt_rq - 1 and adt_rq + 1
       and ghxh = al_ghjlxh
       and ghxh > 0;

    if vpbjlxh > 0 and vtemp <= 0 then --�����Űಢ��δ�Һ�
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

      --ȡ���˻�����Ϣ
      select jzkh,jzcs,brlb,brxzdm
        into vjzkh,vjzcs,vbrlb,vbrxzdm
        from zjhis.gy_brjbxxk
       where bah = as_bah
         and nvl(brzzbz,0) = 1
         and rownum = 1;

      --ȡ�Һŷѡ����Ʒ���Ϣ
      select nvl((select dj from zjhis.gy_ylsf where ylxh = a.ghf_ylxh),0),
      			 nvl((select dj from zjhis.gy_ylsf where ylxh = a.zlf_ylxh),2),
      			 ghf_ylxh,
      			 zlf_ylxh,
             (select sfxm from zjhis.gy_ylsf where ylxh = a.ghf_ylxh),
             (select sfxm from zjhis.gy_ylsf where ylxh = a.zlf_ylxh)
        into vghf,vzlf,vghf_ylxh,vzlf_ylxh,vghfsfxm,vzlfsfxm
        from zjhis.gh_mzlbk a
       where mzlbxh = 2;

      --1.����Һ���Ϣ
      Insert Into Gh_Ghk(Jlxh,Jzkh,Brxm,Jzcs,Brlb,Brxz,Dwbh,Mzlbxh,Ksdm,Ghrq,Pbxh,Ghxh,Ysgh,Sjlb,Ghf,Zlf,Zlfds,Czgh,Thbz,Czrq,Ybkh,
                          Jzje,Ickje,Lnzhje,Tcjjje,Zbbzje,Gfzh,Blkh,Fsjbz,Fsjjzje,Fphm,Ghlb,Fybh)
      Values (al_yyjlxh,vjzkh,vbrxm,vjzcs,vbrlb,vbrxzdm,'',2,as_ksdm,adt_rq,vpbjlxh,vghxh,null,vsxw,0,0,1,as_id,0,SysDate,null,
              0,0,0,0,0,null,0,0,0,Null,1,vfybh);
      --2.����yj_yjk1
      If vghf + vzlf > 0 Then
        Insert Into Yj_Yjk1(Yjsb,Jzkh,Brxm,Sjysgh,Sjksdm,Kdsj,Sjsj,Mzpb,Ghxh,Jzxh,czgh,Fybh,shpb)
        Values (vyjsb,vjzkh,vbrxm,null,as_ksdm,adt_rq,sysdate,1,al_yyjlxh,-1,as_id,vfybh,1);
      end if;
      --3.����yj_yjk2
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
      as_result := '�Һųɹ�';
    elsif vtemp > 0 then
      al_yyjlxh := al_ghjlxh;
      ai_result := 1;
      as_result := '�ѹҺ�';
    else --�������Ű�
      ai_result := -1;
      as_result := '�����ڹҺ��Ű�';
    end if;
  end if;
EXCEPTION
  WHEN exception1 THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    as_result := '����ԤԼ�Һ���Ч��'||verror;
    rollback;
    dbms_output.put_line('����ԤԼ�Һ���Ч��');
  WHEN OTHERS THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    as_result := '����ԤԼ�ҺŴ���'||verror;
    rollback;
    dbms_output.put_line('����ԤԼ�ҺŴ���');
end;

/

grant execute on zjhis.up_jzyygh to jzs;