--20140428
--version:1.0.223
增加参数：
参数名称：排队叫号接口事务2；参数设置：字符型参数；说明：启用或不启用。启用时通过独立接口事务获取排队叫号接口信息。

--新建jzs用户下函数：uf_cal_day.plb
--新建jzs用户下函数：uf_cal_hour.plb

--20140831
--version:1.0.227
--排队叫号时间
alter table jz_jzyjbrdjb add pdjhsj date;
alter table jz_jzyjbrdjb_temp add pdjhsj date;
--诊间分诊时间
alter table jz_jzyjbrdjb add zjfzsj date;
alter table jz_jzyjbrdjb_temp add zjfzsj date;

--20140915
--version:1.0.228
--增加急诊留观信息登记表
create table jz_jzlgxxdjb
(
  JLXH   NUMBER(9) not null,
  YJJLXH VARCHAR2(9) not null,
  JZKH   VARCHAR2(20),
  DJRQ   DATE not null,
  DJR    VARCHAR2(10) not null,
  XGRQ   DATE,
  XGR    VARCHAR2(10),
  LGSJ   DATE not null,
  BRXM   VARCHAR2(20) not null,
  XB     VARCHAR2(4) not null,
  CSRQ   DATE,
  LGZD   VARCHAR2(500),
  LGQX   VARCHAR2(20),
  CWH    VARCHAR2(10),
  BZ     VARCHAR2(50),
  KSDM   VARCHAR2(10),
  KSMC   VARCHAR2(20),
  LSTD   NUMBER(1) default 0,
  JHC    NUMBER(1),
  JTSG   NUMBER(1)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table jz_jzlgxxdjb
  add constraint PK_JZ_JZLGXXDJB primary key (JLXH)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IDX_JZ_JZLGXXDJB_BRXM on  jz_jzlgxxdjb(BRXM)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    minextents 1
    maxextents unlimited
  );
create index IDX_JZ_JZLGXXDJB_DJRQ on  jz_jzlgxxdjb(DJRQ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    minextents 1
    maxextents unlimited
  );
create index IDX_JZ_JZLGXXDJB_JZKH on  jz_jzlgxxdjb(JZKH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    minextents 1
    maxextents unlimited
  );
create index IDX_JZ_JZLGXXDJB_KSMC on  jz_jzlgxxdjb(KSMC)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    minextents 1
    maxextents unlimited
  );
create index IDX_JZ_JZLGXXDJB_LQSJ on  jz_jzlgxxdjb(LGSJ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    minextents 1
    maxextents unlimited
  );
create unique index UIDX_JZ_JZLGXXDJB_YJJLXH on  jz_jzlgxxdjb(YJJLXH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    minextents 1
    maxextents unlimited
  );


--增加急诊离观信息登记表
create table jz_jzlgxxdjb0
(
  JLXH   NUMBER(9) not null,
  YJJLXH VARCHAR2(9) not null,
  JZKH   VARCHAR2(20),
  DJRQ   DATE not null,
  DJR    VARCHAR2(10) not null,
  XGRQ   DATE,
  XGR    VARCHAR2(10),
  LGSJ   DATE not null,
  LGQX   VARCHAR2(20),
  BRXM   VARCHAR2(20) not null,
  XB     VARCHAR2(4) not null,
  CSRQ   DATE,
  ZYH    VARCHAR2(10),
  CWH    VARCHAR2(20),
  BZ     VARCHAR2(50),
  KSMC   VARCHAR2(30),
  ZLYY   VARCHAR2(50),
  TTPF   NUMBER(4),
  LGQXMX VARCHAR2(100),
  ZYTJ   VARCHAR2(100),
  ZYTJMX VARCHAR2(100),
  BQDM   VARCHAR2(10),
  KSDM   VARCHAR2(10),
  YSGH   VARCHAR2(20),
  LGZD   VARCHAR2(500)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table jz_jzlgxxdjb0
  add constraint PK_JZ_JZLGXXDJB0 primary key (JLXH)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IDX_JZ_JZLGXXDJB0_BRXM on  jz_jzlgxxdjb0(BRXM)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    minextents 1
    maxextents unlimited
  );
create index IDX_JZ_JZLGXXDJB0_DJRQ on  jz_jzlgxxdjb0(DJRQ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    minextents 1
    maxextents unlimited
  );
create index IDX_JZ_JZLGXXDJB0_JZKH on  jz_jzlgxxdjb0(JZKH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    minextents 1
    maxextents unlimited
  );
create index IDX_JZ_JZLGXXDJB0_LQSJ on  jz_jzlgxxdjb0(LGSJ)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    minextents 1
    maxextents unlimited
  );
create unique index UIDX_JZ_JZLGXXDJB0_YJJLXH on  jz_jzlgxxdjb0(YJJLXH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 3M
    minextents 1
    maxextents unlimited
  );


-- Create sequence 
create sequence seq_jz_jzlgxxdjb_jlxh
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

-- Create sequence 
create sequence seq_jz_jzlgxxdjb0_jlxh
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;