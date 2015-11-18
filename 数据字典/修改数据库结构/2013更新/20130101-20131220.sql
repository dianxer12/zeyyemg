alter table jz_jzyjbrdjb add bah varchar2(10);
alter table jz_jzyjbrdjb_temp add bah varchar2(10);


alter table jz_jzlqxxdjb0 add bqdm varchar2(10);
alter table jz_jzlqxxdjb0_temp add bqdm varchar2(10);
alter table jz_jzlqxxdjb0 add ksdm varchar2(10);
alter table jz_jzlqxxdjb0_temp add ksdm varchar2(10);
alter table jz_jzlqxxdjb0 add ysgh varchar2(20);
alter table jz_jzlqxxdjb0_temp add ysgh varchar2(20);

--重建zjhis用户下视图：zjhis.jzs_v_jz_inpatient
--重建jzs用户下视图：jzs.jz_inpatient

--建zjhis用户下视图：zjhis.jzs_v_jz_ksmc
--建jzs用户下视图：jzs.jz_ksmc


alter table xtcsb modify csz1 varchar2(1000);
alter table xtcsb modify bz varchar2(1000);
alter table xtcsb modify csz2 NUMBER(10,2);
alter table xtcsb add pxxh number(10);

insert into xtcsb (XTXH, CSFL, CSMC, CSZ1, CSZ2, BZ, ISUPDATE, CSRQ, CSZ3, JLXH, PXXH)
values (5, 'YWCS', '系统锁定', '', 30.00, '参数名称：系统锁定；参数设置：数值型参数，单位（分钟）；说明：鼠标或键盘指定时间内未操作后，系统界面锁定，必须输入登录人口令后方可解锁。', 1, null, null, 1158, 40);
commit;

--重建jzs用户下函数：uf_get_yjfj.plb

--20130219
--VERSION 1.0.198
--重建jzs用户下函数：uf_get_yjfj.plb
--重建zjhis用户下视图：zjhis.jzs_v_jz_brjbxxk.sql
--重建zjhis用户下存储过程：zjhis.up_jzyygh2.plb  //未执行 

--20130409
--重建jzs用户下视图：jzs.zjhis_v_jz_jzbrxx

--20130628
--version:1.0.208
增加参数：
参数名称：唯一号控制；参数设置：字符型参数；说明：启用或不启用。启用时分配唯一号，必须输入唯一号。
参数名称：唯一号名称；参数设置：字符型参数；说明：参数不为空时，界面以此参数显示唯一号名称。
参数名称：生命体征接口类型；参数设置：字符型参数；说明：参数不为空时，系统通过该接口类型自动导入生命体征信息。
参数名称：生命体征文件路径；参数设置：字符型参数；说明：参数不为空时，系统从该路径访问生命体征接口文件。
参数名称：过敏史；参数设置：字符型参数；说明：启用或不启用。启用时可查看编辑病人过敏史。
参数名称：LMP；参数设置：字符型参数；说明：启用或不启用。启用时可查看编辑LMP。
参数名称：转归时间；参数设置：字符型参数；说明：启用或不启用。启用时可查看编辑转归时间。

增加公用代码：
监护仪设备(JHYSB)
诊室(ZSMC)
过敏源(GMY)


alter table jz_jzyjbrdjb add smtz_sbdm varchar2(100);
alter table jz_jzyjbrdjb_temp add smtz_sbdm varchar2(100);
alter table jz_jzyjbrdjb add smtz_sjsj date;
create index idx_jz_jzyjbrdjb_smtz_sjsj on jz_jzyjbrdjb(smtz_sjsj) nologging;
alter table jz_jzyjbrdjb_temp add smtz_sjsj date;
alter table jz_jzyjbrdjb add zsdm varchar2(20);
alter table jz_jzyjbrdjb_temp add zsdm varchar2(20);
alter table jz_jzyjbrdjb add zsmc varchar2(50);
alter table jz_jzyjbrdjb_temp add zsmc varchar2(50);
alter table jz_jzyjbrdjb add zgsj date;
alter table jz_jzyjbrdjb_temp add zgsj date;
alter table jz_jzyjbrdjb add lmp date;
alter table jz_jzyjbrdjb_temp add lmp date;
alter table jz_jzlqxxdjb modify lqzd varchar2(500);
alter table jz_jzlqxxdjb_temp modify lqzd varchar2(500);
alter table jz_jzlqxxdjb0 add lqzd varchar2(500);
alter table jz_jzlqxxdjb0_temp add lqzd varchar2(500);

create table jz_jzyjbrxx_gms
(
	jzkh	varchar2(20),
	bah 	varchar2(20),
	pxxh	number(4),
	brxm	varchar2(50),
	gmy 	varchar2(100),
	bz 	varchar2(200),
	djr 	varchar2(10),
	djrxm 	varchar2(20),
	djsj 	date,
	constraint pk_jz_jzyjbrxx_gms primary key(bah,pxxh)
);
create index idx_jz_jzyjbrxx_gms_1 on jz_jzyjbrxx_gms(jzkh);

--20130720
--version:1.0.209
增加参数：
参数名称：意识评分；参数设置：字符型参数；参考参数值：AVPU或GCS；说明：意识评分采用AVPU或者GCS评分标准。

alter table jzs.jz_jzyjbrdjb add gcs_e number(1);
alter table jzs.jz_jzyjbrdjb add gcs_v number(1);
alter table jzs.jz_jzyjbrdjb add gcs_m number(1);

--新建jzs用户下函数：uf_get_rts.plb
--重建jzs用户下函数：uf_get_yjfj.plb

create table sjckcsb
(
	dataobject	varchar2(50),
	columnname	varchar2(50),
	dbname			varchar2(50),
	constraint pk_sjckcsb primary key(dataobject,columnname)
)
/

--20131028
--version:1.0.214
增加参数：
参数名称：排队叫号接口事务；参数设置：字符型参数；说明：启用或不启用。启用时通过独立接口事务获取排队叫号接口信息。
参数名称：排队叫号接口数据库类型；参数设置：字符型参数；说明：数据库类型（SQLSERVER或ORACLE）。排队叫号接口事务启用时通过独立接口事务获取排队叫号接口信息。

--20131121
alter table jzs.jz_jzyjbrdjb modify jlxh VARCHAR2(18);
alter table jzs.jz_jzyjbrdjb modify cbzd VARCHAR2(200);
alter table jzs.jz_jzyjbrdjb add wddybz NUMBER(1);
alter table jzs.jz_jzyjbrdjb add jzzt NUMBER(1);
alter table jzs.jz_jzyjbrdjb modify jzzt default 0;
alter table jzs.jz_jzyjbrdjb add zlzt VARCHAR2(2);
alter table jzs.jz_jzyjbrdjb add szysgh VARCHAR2(10);

--jzs用户下新建同义词链接至zjhis用户下存储过程：zjhis.up_jzyygh2.plb
grant execute on ZJHIS.UP_JZYYGH2 to jzs;
create or replace synonym JZS.UP_JZYYGH2 for ZJHIS.UP_JZYYGH2;   //ORA-01031: insufficient privileges

--新建zjhis用户下存储过程：zjhis.up_jzyygh.plb

--jzs用户下新建同义词链接至zjhis用户下存储过程：zjhis.up_jzyygh.plb
grant execute on ZJHIS.UP_JZYYGH to jzs;
create or replace synonym JZS.UP_JZYYGH for ZJHIS.UP_JZYYGH;  //ORA-01031: insufficient privileges

--20131220
--version:1.0.218
增加参数：
参数名称：急诊预检挂号；参数设置：字符型参数；参数名称：急诊预检挂号；参数设置：字符型参数；说明：启用或不启用。启用时预检自动挂急诊号，收费时统一收取急诊挂号诊疗费。


