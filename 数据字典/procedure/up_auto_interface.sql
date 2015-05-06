create or replace procedure up_auto_interface as
begin
/*start 自动更新急诊离抢信息登记表床位*/
update jz_jzlqxxdjb0 a
   set cwh = (select cwh from jz_inpatient where zyh = a.zyh and ksmc = a.ksmc and rownum = 1)
 where a.lqsj > sysdate - 3
   and (instr(a.lqqx,'住院') > 0 or instr(a.lqqx,'手术') > 0)
   and instr(cwh,'自动更新') > 0;

update jz_jzlqxxdjb0 a
   set cwh = null
 where a.lqsj > sysdate - 3
   and (instr(a.lqqx,'住院') > 0 or instr(a.lqqx,'手术') > 0)
   and instr(cwh,'自动更新') > 0;
/*end 自动更新急诊留抢信息登记表床位*/
commit;

end;
/