create or replace view jzs.zjhis_v_jz_lqbrxx as
Select a.yjjlxh yjjlxh,
     b.bah bah,
     b.jzkh jzkh,
     b.brxm brxm,
     to_number(decode(b.xb,'ÄÐ',1,'Å®',2,3)) xb,
     jzs.uf_get_age(b.csrq,b.rysj,1) nl,
     b.zy zy,
     b.lxdh lxdh,
     b.lxdz lxdz,
     a.cwh cwh,
     b.ksmc yjks,
     b.hzksmc hzks,
     b.cbzd yjzd,
     b.bz yjbz,
     a.lqsj lqsj,
     a.ksmc lqks,
     a.lqqx lqqx,
     a.lqzd lqzd,
     a.bz lqbz,
     a.lstd lstdbz,
     b.csbz csbz,
     b.tw tw,
     b.mb mb,
     b.ssy ssy,
     b.szy szy,
     b.xybhd xybhd,
     b.hx hx,
     (select lqqx from jzs.jz_jzlqxxdjb0 where yjjlxh = a.yjjlxh) brqx
From jzs.jz_jzlqxxdjb a,jzs.jz_jzyjbrdjb b
Where a.yjjlxh = b.jlxh
and not exists(select * from jzs.jz_jzlqxxdjb0 where yjjlxh = a.yjjlxh)
With read only;
/
create or replace view zjhis.jz_lqbrxx as
select * from jzs.zjhis_v_jz_lqbrxx;