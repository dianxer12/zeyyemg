create or replace procedure up_auto_interface as
begin
/*start �Զ����¼���������Ϣ�ǼǱ�λ*/
update jz_jzlqxxdjb0 a
   set cwh = (select cwh from jz_inpatient where zyh = a.zyh and ksmc = a.ksmc and rownum = 1)
 where a.lqsj > sysdate - 3
   and (instr(a.lqqx,'סԺ') > 0 or instr(a.lqqx,'����') > 0)
   and instr(cwh,'�Զ�����') > 0;

update jz_jzlqxxdjb0 a
   set cwh = null
 where a.lqsj > sysdate - 3
   and (instr(a.lqqx,'סԺ') > 0 or instr(a.lqqx,'����') > 0)
   and instr(cwh,'�Զ�����') > 0;
/*end �Զ����¼���������Ϣ�ǼǱ�λ*/
commit;

end;
/