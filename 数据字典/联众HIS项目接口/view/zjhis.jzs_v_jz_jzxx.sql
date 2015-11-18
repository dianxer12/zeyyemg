create or replace view zjhis.jzs_v_jz_jzxx as
select jzxh jzjlxh,
       (select bah from gy_brjbxxk where jzkh = a.jzkh) bah,
       jzkh jzkh,
       sksj jzsj,
       brxm brxm,
       DECODE(brxb,1,'ÄÐ',2,'Å®',NULL) xb,
       ghxh ghjlxh
  from zj_jzxx a
 where jzrq > sysdate - 3
with read only;

grant select on zjhis.jzs_v_jz_jzxx to jzs;