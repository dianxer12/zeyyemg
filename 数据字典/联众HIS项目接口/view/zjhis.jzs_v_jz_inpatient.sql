create or replace view zjhis.jzs_v_jz_inpatient as
select a.bah zyh,
       a.bah bah,
       a.name brxm,
       DECODE(NVL(a.sex,0),1,'男',2,'女','不详') xb,
       birthday csrq,
       a.zzys ysgh,
       a.curr_ks ksdm,
       a.curr_bq bqdm,
       (select bqmc from zjhis.gy_bqdm where bqdm = a.curr_bq) ksmc,
       nvl(a.curr_bed,'自动更新') cwh
from zjhis.zy_patient_information a
where out_date is null
with read only;

grant select on zjhis.jzs_v_jz_inpatient to jzs;