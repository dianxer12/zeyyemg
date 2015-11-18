create or replace view zjhis.jzs_v_jz_ksmc as
select ksdm,
       ksmc,
       flksdm,
       srm1,
       ghpb,
       baksdm
  from zjhis.gy_ksdm a
with read only;

grant select on zjhis.jzs_v_jz_ksmc to jzs;