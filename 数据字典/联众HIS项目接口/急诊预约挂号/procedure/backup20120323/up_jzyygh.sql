create or replace procedure up_jzyygh(adt_rq in date,as_ksdm in varchar2,as_id in varchar2,as_yjjlxh in varchar2,al_yyjlxh out number,ai_result out number)
is
	vtemp		number(4);
	vpbjlxh	number(10);
	vrq			date;
	vsxwsj  varchar2(20); --上下午分隔时间
	vdqsj   varchar2(20); --当前时间
	vpbsj   varchar2(20); --排班分隔时间
	vsxw    number(2);
  vghxh   number(4);
  verror  varchar2(200);
	exception1  exception;
begin
	ai_result := 0;
	
	select jlxh,rq			--取排班记录序号、挂号日期
	  into vpbjlxh,vrq
	  from gh_ghks
	 where mzlbxh = 2
	   and ksdm = as_ksdm;
	if adt_rq < trunc(vrq) then --比较日期
		 raise exception1;
  end if;
  
	select csz1,to_char(sysdate,'hh24:mi')
	  into vsxwsj,vdqsj
	  from gy_xtcs
	 where xtxh = 23 and csmc = 'SXWSJ'; --取上下午分隔时间、当前时间
	select csz1
	  into vpbsj
	  from gy_xtcs
	 where xtxh = 23 and csmc = 'PBSJ';  --取排班分隔时间
	if vdqsj > vsxwsj or vdqsj < vpbsj then --判断上下午
		vsxw := 2;	--下午
	else
		vsxw := 1;	--上午
	end if;
	
	select nvl(count(*),0)
    into vtemp
	  from gh_mzyyk
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
		  from gy_xhb
		 where bm = upper('gh_mzyyk');

		if vsxw = 1 then
			update gh_mzpbk set swdqh = swdqh + 1 where jlxh = vpbjlxh;
      commit;
			select swdqh
			  into vghxh
			  from gh_mzpbk
			 where jlxh = vpbjlxh;
		elsif vsxw = 2 then
			update gh_mzpbk set xwdqh = xwdqh + 1 where jlxh = vpbjlxh;
      commit;
			select xwdqh
			  into vghxh
			  from gh_mzpbk
			 where jlxh = vpbjlxh;
		end if;
		 
		insert into gh_mzyyk(yyxh,xm,yyrq1,pbxh,ksdm,djrq,zt,yyf,czgh,yylb,yysj,ghxh,mzlbxh,checkid)
		values(al_yyjlxh,vghxh,vrq,vpbjlxh,as_ksdm,sysdate,0,0,as_id,1,vsxw,vghxh,2,as_yjjlxh);
		commit;
		ai_result := 1;
  elsif vtemp > 0 then
  	select yyxh
	    into al_yyjlxh
		  from gh_mzyyk
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
    rollback;
    dbms_output.put_line('急诊预约挂号无效！');
  WHEN OTHERS THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    rollback;
    dbms_output.put_line('急诊预约挂号错误！');
end up_jzyygh;

/

grant execute on up_jzyygh to jzs;