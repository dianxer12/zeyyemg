create or replace procedure up_jzyygh2(adt_rq in date,as_ksdm in varchar2,as_id in varchar2,as_yjjlxh in varchar2,as_brxm in varchar2,al_yyjlxh out number,ai_result out number)
is
	vtemp				number(4);
	vpbjlxh			number(10);
	vrq					date;
	vsysdate 		date;
	vdqsxwfgsj  date;					--��ǰ������ָ�ʱ��
	vdqpbfgsj   date;					--��ǰ�Ű�ָ�ʱ��
	vxcpbfgsj   date;					--�´��Ű�ָ�ʱ��
	vsxwfgsj  	varchar2(20); --������ָ�ʱ��
	vpbfgsj   	varchar2(20); --�Ű�ָ�ʱ��
	vdqsj   		varchar2(20); --��ǰʱ��
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
	 where xtxh = 23 and csmc = 'SXWSJ'; --ȡ������ָ�ʱ�䡢��ǰʱ��
	select csz1,
				 to_date(decode(sign(sysdate-to_date(to_char(sysdate,'yyyymmdd')||' '||csz1,'yyyymmdd hh24:mi')),-1,to_char(sysdate-1,'yyyymmdd'),to_char(sysdate,'yyyymmdd'))||' '||csz1,'yyyymmdd hh24:mi'),
			   to_date(decode(sign(sysdate-to_date(to_char(sysdate,'yyyymmdd')||' '||csz1,'yyyymmdd hh24:mi')),-1,to_char(sysdate,'yyyymmdd'),to_char(sysdate+1,'yyyymmdd'))||' '||csz1,'yyyymmdd hh24:mi')
	  into vpbfgsj,vdqpbfgsj,vxcpbfgsj
	  from zjhis.gy_xtcs
	 where xtxh = 23 and csmc = 'PBSJ';  --ȡ�Ű�ָ�ʱ��
	if vdqsj > vsxwfgsj or vdqsj < vpbfgsj then --�ж�������
		vsxw := 2;	--����
	else
		vsxw := 1;	--����
	end if;

	if adt_rq < trunc(vsysdate) or adt_rq > vsysdate + 30/(24*60) then --У�鴫�������Ƿ���Ч
		 raise exception1;
  end if;

	if vsysdate between vdqsxwfgsj - 15/(24*60) and vdqsxwfgsj then --�ж��Ƿ���ǰ��ǰ������ָ�ʱ��15����
		vsxw := 2;	--�л�������
	end if;
	if vsysdate between vxcpbfgsj - 5/(24*60) and vxcpbfgsj then --�ж��Ƿ���ǰ�´��Ű�ָ�ʱ��5����
		vdqpbfgsj := vxcpbfgsj;	--�л�������
	end if;

	select jlxh,rq			--ȡ�Ű��¼��š��Һ�����
	  into vpbjlxh,vrq
	  from zjhis.gh_mzpbk
	 where rq between trunc(vdqpbfgsj) and trunc(vdqpbfgsj) + 1 - 0.00001
	   and mzlbxh = 2
	   and ksdm = as_ksdm;
	 
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
    dbms_output.put_line('����ԤԼ�Һ���Ч��');
  WHEN OTHERS THEN
    ai_result := -1;
    verror := to_char(SQLCODE||'---'||SQLERRM);
    rollback;
    dbms_output.put_line('����ԤԼ�ҺŴ���');
end;

/

grant execute on zjhis.up_jzyygh2 to jzs;