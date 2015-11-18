create or replace view zjhis.jzs_v_jz_brjbxxk as
select bah,
       jzkh,
       xm,
       xb,
       csrq,
       sfzh,
       (select mc from gy_gydm where dmlb = 3 and dm = a.zydm) zy,
       lxdh,
       lxdz,
       NVL(zfpb,0) zfpb,
       NVL(brzzbz,0) brzzbz,
       ldrq jdrq
  from zjhis.gy_brjbxxk a
with read only;

grant select on zjhis.jzs_v_jz_brjbxxk to jzs;

create or replace view jzs.jz_brjbxxk as
select * from zjhis.jzs_v_jz_brjbxxk;
