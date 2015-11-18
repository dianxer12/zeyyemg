create or replace procedure up_sync_yhb as
begin
/*start 自动更新用户表*/
insert into yhb(xtxh,yhdm,yhm,yhmm)
select 1,id,xm,upper(id)
  from hl_hlryjbxx a
 where ksmc like '%急诊抢救%'
   and not exists(select * from yhb where xtxh = 1 and yhdm = a.id);
insert into yhqx(xtxh,yhzxh,yhdm)
select 1,2,id
  from hl_hlryjbxx a
 where ksmc like '%急诊抢救%'
   and not exists(select * from yhqx where xtxh = 1 and yhzxh = 2 and yhdm = a.id);

delete from yhqx a
where yhzxh = 2
and not exists(select * 
                 from hl_hlryjbxx 
                where id = a.yhdm
                  and ksmc like '%急诊抢救%');

/*end 自动更新用户表*/
commit;

end;

/
