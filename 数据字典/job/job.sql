variable job1 number;
begin
dbms_job.submit(:job1,'up_auto_interface;',sysdate + 5/(24*60),'sysdate + 5/(24*60)');
end;
/

variable job1 number;
begin
dbms_job.submit(:job1,'up_update_jzyjbrdjxx;',sysdate+1/(24*60),'sysdate+1/(24*60)');
end;
/

commit;

