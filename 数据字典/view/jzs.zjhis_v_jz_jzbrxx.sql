create or replace view jzs.zjhis_v_jz_jzbrxx as
select b.rysj rysj,
     b.jlxh yjjlxh,
     b.bah bah,
     b.jzkh jzkh,
     b.brxm brxm,
     to_number(decode(b.xb,'ÄÐ',1,'Å®',2,3)) xb,
     jzs.uf_get_age(b.csrq,b.rysj,1) nl,
     b.zy zy,
     b.lxdh lxdh,
     b.lxdz lxdz,
     b.ksmc yjks,
     b.hzksmc hzks,
     b.cbzd yjzd,
     b.bz yjbz,
     a.lqsj lqsj,
     a.ksmc lqks,
     a.lqqx lqqx,
     a.lqzd lqzd,
     a.cwh cwh,
     a.bz lqbz,
     a.lstd lstdbz,
     b.csbz csbz,
     b.tw tw,
     b.mb mb,
     b.ssy ssy,
     b.szy szy,
     b.xybhd xybhd,
     b.hx hx,
     b.jzfq jzfq,
     (select lqqx from jzs.jz_jzlqxxdjb0 where yjjlxh = a.yjjlxh) brqx
From jzs.jz_jzlqxxdjb a,jzs.jz_jzyjbrdjb b
Where a.yjjlxh = b.jlxh
  and (not exists(select * from jzs.jz_jzlqxxdjb0 where yjjlxh = a.yjjlxh)
       or exists(select * from jzs.jz_jzlqxxdjb0 where yjjlxh = a.yjjlxh and lqsj > sysdate - 1)
      )
union all
Select b.rysj rysj,
     b.jlxh yjjlxh,
     b.bah bah,
     b.jzkh jzkh,
     b.brxm brxm,
     to_number(decode(b.xb,'ÄÐ',1,'Å®',2,3)) xb,
     jzs.uf_get_age(b.csrq,b.rysj,1) nl,
     b.zy zy,
     b.lxdh lxdh,
     b.lxdz lxdz,
     b.ksmc yjks,
     b.hzksmc hzks,
     b.cbzd yjzd,
     b.bz yjbz,
     null lqsj,
     null lqks,
     null lqqx,
     null lqzd,
     null cwh,
     null lqbz,
     null lstdbz,
     b.csbz csbz,
     b.tw tw,
     b.mb mb,
     b.ssy ssy,
     b.szy szy,
     b.xybhd xybhd,
     b.hx hx,
     b.jzfq jzfq,
     null brqx
From jzs.jz_jzyjbrdjb b
Where b.rysj between sysdate - 1 and sysdate
  and not exists(select * from jzs.jz_jzlqxxdjb where yjjlxh = b.jlxh)
union all
select a.rysj rysj,
     null yjjlxh,
     a.bah bah,
     a.jzkh jzkh,
     a.brxm brxm,
     to_number(decode(a.xb,'ÄÐ',1,'Å®',2,3)) xb,
     jzs.uf_get_age(a.csrq,a.rysj,1) nl,
     a.zy zy,
     a.lxdh lxdh,
     a.lxdz lxdz,
     a.ksmc yjks,
     null hzks,
     null yjzd,
     null yjbz,
     null lqsj,
     null lqks,
     null lqqx,
     null lqzd,
     null cwh,
     null lqbz,
     null lstdbz,
     null csbz,
     null tw,
     null mb,
     null ssy,
     null szy,
     null xybhd,
     null hx,
     null jzfq,
     null brqx
From jzs.jz_ghxx a
Where a.rysj between sysdate - 1 and sysdate
  and a.ksdm in ('1012300','1012400')
With read only;

/

create or replace view zjhis.jz_jzbrxx as
select * from jzs.zjhis_v_jz_jzbrxx;