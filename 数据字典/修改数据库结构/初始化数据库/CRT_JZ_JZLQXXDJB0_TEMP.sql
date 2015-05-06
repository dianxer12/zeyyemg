--急诊离抢信息登记表（删除的记录临时存放）
DROP TABLE JZ_JZLQXXDJB0_TEMP;
CREATE TABLE JZ_JZLQXXDJB0_TEMP
(
  JLXH   NUMBER(9)     NOT NULL,    --记录序号
  YJJLXH VARCHAR2(9)   NOT NULL,    --预检记录序号
  JZKH   VARCHAR2(20)  NULL,        --就诊卡号
  DJRQ   DATE          NOT NULL,    --登记日期
  DJR    VARCHAR2(10)  NOT NULL,    --登记人
  XGRQ   DATE          NULL,        --最后修改日期
  XGR    VARCHAR2(10)  NULL,        --最后修改人
  LQSJ   DATE          NOT NULL,    --离抢时间
  LQQX   VARCHAR2(20)  NULL,        --离抢去向
  BRXM   VARCHAR2(20)  NOT NULL,    --病人姓名
  XB     INTEGER       NOT NULL,    --性别
  CSRQ   DATE          NULL,        --出生日期
  ZYH    VARCHAR2(10)  NULL,        --住院号
  CWH    VARCHAR2(20)  NULL,        --床位号
  KSMC   VARCHAR2(30)  NULL,        --科室名称
  BZ     VARCHAR2(50)  NULL,        --备注
  ZLYY	 VARCHAR2(50)  NULL,        --滞留原因
  MBXH   NUMBER(2)     NOT NULL,    --模板序号
  SCRQ   DATE          NOT NULL,    --删除日期
  SCR    VARCHAR2(10)  NOT NULL,    --删除人
  CONSTRAINT PK_JZ_JZLQXXDJB0_TEMP PRIMARY KEY(JLXH)
);
CREATE INDEX IDX_JZ_JZLQXXDJB0_TEMP_JZKH ON JZ_JZLQXXDJB0_TEMP(JZKH);
CREATE INDEX IDX_JZ_JZLQXXDJB0_TEMP_DJRQ ON JZ_JZLQXXDJB0_TEMP(DJRQ);
CREATE INDEX IDX_JZ_JZLQXXDJB0_TEMP_BRXM ON JZ_JZLQXXDJB0_TEMP(BRXM);  