create or replace procedure jzs.up_update_jzyjbrdjxx
is
  verror  varchar2(200);
begin
	/*更新病人信息、挂号信息*/
	update jzs.jz_jzyjbrdjb a
	   set bah = (select d.bah from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
	   		 jzkh = (select d.jzkh from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
	   		 brxm = (select d.xm from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
	   		 xb = (select decode(d.xb,1,'男',2,'女','不详') from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
	   		 csrq = (select d.csrq from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
				 zy = (select d.zy from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
				 lxdh = (select d.lxdh from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
				 lxdz = (select d.lxdz from jzs.jz_mzyyk b,jzs.jz_ghxx c,jzs.jz_brjbxxk d where b.jlxh = c.ghjlxh and c.jzkh = d.jzkh and b.yyxh = a.ghyyxh),
				 ghjlxh = (select c.ghjlxh from jzs.jz_mzyyk b,jzs.jz_ghxx c where b.jlxh = c.ghjlxh and b.yyxh = a.ghyyxh),
				 ghsj = (select c.rysj from jzs.jz_mzyyk b,jzs.jz_ghxx c where b.jlxh = c.ghjlxh and b.yyxh = a.ghyyxh)
	 where a.djrq > sysdate - 1
		 and a.ghyyxh > 0
		 and a.ghjlxh is null
		 and exists(select * 
		 							from jzs.jz_mzyyk b,jzs.jz_ghxx c
		 						 where b.jlxh = c.ghjlxh
		 						   and b.yyxh = a.ghyyxh
		 					 );
  commit;
  
  /*更新就诊信息*/
  update jzs.jz_jzyjbrdjb a
	   set jzjlxh = (select min(b.jzjlxh) from jzs.jz_jzxx b where b.jzkh = a.jzkh and b.ghjlxh = a.ghjlxh),
				 jzsj = (select min(b.jzsj) from jzs.jz_jzxx b where b.jzkh = a.jzkh and b.ghjlxh = a.ghjlxh)
	 where a.djrq > sysdate - 1
		 and a.ghjlxh > 0
		 and a.jzjlxh is null
		 and exists(select * 
		 							from jzs.jz_jzxx b
		 						 where b.jzkh = a.jzkh
		 						   and b.ghjlxh = a.ghjlxh
		 					 );
  commit;
  
  update jzs.jz_jzyjbrdjb a
	   set jzjlxh = (select min(b.jzjlxh) from jzs.jz_jzxx b where b.jzkh = a.jzkh and b.jzsj > a.rysj),
				 jzsj = (select min(b.jzsj) from jzs.jz_jzxx b where b.jzkh = a.jzkh and b.jzsj > a.rysj)
	 where a.djrq > sysdate - 1
		 and a.ghjlxh > 0
		 and a.jzjlxh is null
		 and exists(select * 
		 						 from jzs.jz_jzxx b
		 						where b.jzkh = a.jzkh
                  and b.jzsj >= a.rysj
		 					     );
  commit;
  
  update jzs.jz_jzyjbrdjb a
     set bah = (select bah from jzs.jz_brjbxxk where jzkh = a.jzkh),
         brxm = (select xm from jzs.jz_brjbxxk where jzkh = a.jzkh),
         xb = (select decode(xb,1,'男',2,'女') from jzs.jz_brjbxxk where jzkh = a.jzkh),
         csrq = (select csrq from jzs.jz_brjbxxk where jzkh = a.jzkh)
   where djrq > sysdate - 3
     and exists(select * from jzs.jz_brjbxxk where jzkh = a.jzkh and bah = a.bah and (xm <> a.brxm or decode(xb,1,'男',2,'女') <> a.xb or csrq <> a.csrq))
  and rownum < 10;
	commit;
	
EXCEPTION
  WHEN OTHERS THEN
    verror := to_char(SQLCODE||'---'||SQLERRM);
    rollback;
    dbms_output.put_line('更新急诊预检病人登记信息错误！');
end;

/

