create or replace view dblink.batj_v_bajk50 as
select * from bajk50@batj;

grant select,insert,update on dblink.batj_v_bajk50 to jzs;