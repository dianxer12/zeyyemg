create or replace view jzs.batj_v_bajk50 as
select a.jlxh key5001,	--记录序号
       a.brxm col5001,	--姓名
       decode(a.xb,'男',1,'女',2) col5002,	--性别
       a.csrq col5003,	--出生日期
       to_char(jzs.uf_get_age(a.csrq,sysdate,1))||'Y' col5004,	--年龄
       b.sfzh col5005,	--身份证号
       b.lxdz col5006,	--联系地址
       b.lxdh col5007,	--联系电话
       a.rysj col5008,	--预检时间
       (select baksdm from jzs.jz_ksmc where ksdm = c.ghksdm) col5009,	--病案科室代码
       (select dm from jzs.gydmb where dmlb = 'RYTJ' and dmmc = a.rytj) col5010,	--入院途径
       a.rytjmx col5011,	--入院途径说明
       a.tw col5012,	--体温
       a.mb col5013,	--脉搏
       a.hx col5014,	--呼吸
       decode(a.ssy||'/'||a.szy,'/',null,a.ssy||'/'||a.szy) col5015, --血压
       (select jzs.uf_get_ews(a.hx,a.xybhd,a.tw,a.ssy,a.mb,a.avpu) from dual) col5016,	--ews评分
       a.ttpf col5017,	--疼痛评分
       d.lqsj col5018,	--留抢时间
       (select baksdm from jzs.jz_ksmc aa,jzs.ksdmb bb where aa.ksdm = bb.ghksdm and bb.ksdm = d.ksdm) col5019,	--留抢病案科室
       d.lqzd col5020,	--留抢诊断
       e.lqsj col5021,	--离抢时间
       null col5022,	--病情评估、症状
       e.ttpf col5023,	--离抢疼痛评分
       null col5024,	--感染
       null col5025,	--传染性疾病
       (select dm from jzs.gydmb where dmlb = 'LQQX0' and dmmc = e.lqqx) col5027,	--离抢去向
       e.lqqxmx col5028,	--离抢去向说明
       null col5029,	--主管科室
       (select bb.baksdm from jzs.jz_bqmc aa,jzs.jz_ksmc bb where aa.bqdm = bb.ksdm and aa.bqdm = e.bqdm) col5030,	--入住病区
       (select dm from jzs.gydmb where dmlb = 'ZYTJ' and dmmc = e.zytj) col5031,	--转运途径
       e.zytjmx col5032,	--转运途径明细
       e.ysgh col5033,	--主管医师
       null col5034,	--经管医师
       null col5035,	--责任护士
       null col5036,	--入住次数
       to_number(nvl(e.zyh,a.bah)) col5037,	--病案号
       0 flag	--审核标志
  from jzs.jz_jzyjbrdjb a,jzs.jz_brjbxxk b,jzs.ksdmb c,jzs.jz_jzlqxxdjb d,jzs.jz_jzlqxxdjb0 e
 where a.jzkh = b.jzkh
   and nvl(a.ksdm,d.ksdm) = c.ksdm
   and a.jlxh = d.yjjlxh
   and a.jlxh = e.yjjlxh
   and e.lqsj >= to_date('20120101','yyyymmdd');