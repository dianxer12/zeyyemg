create or replace procedure up_jzyygh2(adt_rq in date,as_ksdm in varchar2,as_id in varchar2,as_yjjlxh in varchar2,as_brxm in varchar2,al_yyjlxh out number,ai_result out number)
is
	vtemp				number(4);
	vpbjlxh			number(10);
	vrq					date;
	vsysdate 		date;
	vdqsxwfgsj  date;					--当前上下午分隔时间
	vdqpbfgsj   date;					--当前排班分隔时间
	vxcpbfgsj   date;					--下次排班分隔时间
	vsxwfgsj  	varchar2(20); --上下午分隔时间
	vpbfgsj   	varchar2(20); --排班分隔时间
	vdqsj   		varchar2(20); --当前时间
	vsxw    		number(2);
  vghxh   		number(4);
  vbrxm				varchar2(50);
  verror  		varchar2(200);
	exception1  exception;
begin
	ai_result := 0;

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
		vsxw := 2;	--下午
	else
		vsxw := 1;	--上午
	end if;

	if adt_rq < trunc(vsysdate) or adt_rq > vsysdate + 30/(24*60) then --校验传入日期是否有效
		 raise exception1;
  end if;

	if vsysdate between vdqsxwfgsj - 15/(24*60) and vdqsxwfgsj then --判断是否提前当前上下午分隔时间15分钟
		vsxw := 2;	--切换到下午
	end if;
	if vsysdate between vxcpbfgsj - 5/(24*60) and vxcpbfgsj then --判断是否提前下次排班分隔时间5分钟
		vdqpbfgsj := vxcpbfgsj;	--切换到明日
	end if;

	select jlxh,rq			--取排班记录序号、挂号日期
	  into vpbjlxh,vrq
	  from zjhis.gh_mzpbk
	 where rq between trunc(vdqpbfgsj) and trunc(vdqpbfgsj) + 1 - 0.00001
	   and mzlbxh = 2
	   and ksdm = as_ksdm;
	 
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
  elsif vtemp > 0 then
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
	end if;

EXCEPTION
  WHEN exception1 THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    rollback;
    dbms_output.put_line('急诊预约挂号无效！');
  WHEN OTHERS THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    rollback;
    dbms_output.put_line('急诊预约挂号错误！');
end;

/

grant execute on zjhis.up_jzyygh2 to jzs;