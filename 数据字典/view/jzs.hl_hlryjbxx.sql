create or replace view hlb.jzs_v_hl_hlryjbxx as
select a.id,a.xm,a.xb,b.ksmc from hl_hlryjbxx a,ksdmb b
where a.ksdm = b.ksdm
and b.ksmc like '%º±’Ô«¿æ»%'
with read only;

grant select on hlb.jzs_v_hl_hlryjbxx to jzs;

create or replace view jzs.hl_hlryjbxx as
select * from hlb.jzs_v_hl_hlryjbxx
with read only;