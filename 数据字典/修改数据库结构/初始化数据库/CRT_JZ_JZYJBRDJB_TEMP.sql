--急诊预检病人登记表（删除的记录临时存放）
DROP TABLE JZ_JZYJBRDJB_TEMP;
CREATE TABLE JZ_JZYJBRDJB_TEMP
(
  JLXH   VARCHAR2(9)   NOT NULL,    --记录序号
  JZKH   VARCHAR2(20)  NULL,        --就诊卡号
  DJRQ   DATE          NOT NULL,    --登记日期
  DJR    VARCHAR2(10)  NOT NULL,    --登记人
  XGRQ   DATE          NULL,        --最后修改日期
  XGR    VARCHAR2(10)  NULL,        --最后修改人
  RYSJ   DATE          NOT NULL,    --入院时间
  BRXM   VARCHAR2(20)  NOT NULL,    --病人姓名
  XB     NUMBER(1)     NOT NULL,    --性别
  CSRQ   DATE          NULL,        --出生日期
  ZY     VARCHAR2(20)  NULL,        --职业
  KSDM   VARCHAR2(10)  NULL,        --科室代码
  KSMC   VARCHAR2(20)  NULL,        --科室名称
  HZKSDM VARCHAR2(60)  NULL,        --会诊科室代码
  HZKSMC VARCHAR2(120) NULL,        --会诊科室名称
  CBZD   VARCHAR2(50)  NULL,        --初步诊断
  BRQX   VARCHAR2(20)  NULL,        --病人去向
  LXDH   VARCHAR2(20)  NULL,        --联系电话
  LXDZ   VARCHAR2(50)  NOT NULL,    --联系地址
  BZ     VARCHAR2(50)  NULL,        --备注
  TW     DECIMAL(3,1)  NULL,        --体温(单位:度)
  MB     NUMBER(3)     NULL,        --脉搏(次/分)
  XY     VARCHAR2(10)  NULL,        --血压(MMHG)
  SSY    NUMBER(4)     NULL,        --收缩压(MMHG)
  SZY    NUMBER(4)     NULL,        --舒张压(MMHG)
  XYBHD  DECIMAL(5,4)  NULL,        --血氧饱和度(%)
  HX     NUMBER(3)     NULL,        --呼吸(次/分)
  JZFQ   VARCHAR2(20)  NULL,        --急诊分区
  CSBZ   NUMBER(1)     NULL,        --创伤标志  0：非创伤   1：创伤
  SCRQ   DATE          NOT NULL,    --删除日期
  SCR    VARCHAR2(10)  NOT NULL,    --删除人
  CONSTRAINT PK_JZ_JZYJBRDJB_TEMP PRIMARY KEY(JLXH)
)tablespace JZGLXT;
CREATE INDEX IDX_JZ_JZYJBRDJB_TEMP_DJRQ ON JZ_JZYJBRDJB_TEMP(DJRQ);
CREATE INDEX IDX_JZ_JZYJBRDJB_TEMP_JZKH ON JZ_JZYJBRDJB_TEMP(JZKH);
CREATE INDEX IDX_JZ_JZYJBRDJB_TEMP_BRXM ON JZ_JZYJBRDJB_TEMP(BRXM);  