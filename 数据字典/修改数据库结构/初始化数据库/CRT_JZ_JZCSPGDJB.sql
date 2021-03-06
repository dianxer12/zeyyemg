--急诊创伤评估登记表
DROP TABLE JZ_JZCSPGDJB;
CREATE TABLE JZ_JZCSPGDJB
(
  JLXH   NUMBER(9)     NOT NULL,    --记录序号
  YJJLXH VARCHAR2(9)   NOT NULL,    --预检记录序号
  JZKH   VARCHAR2(20)  NULL,        --就诊卡号
  DJRQ   DATE          NOT NULL,    --登记日期
  DJR    VARCHAR2(10)  NOT NULL,    --登记人
  XGRQ   DATE          NULL,        --最后修改日期
  XGR    VARCHAR2(10)  NULL,        --最后修改人
  BRXM   VARCHAR2(20)  NOT NULL,    --病人姓名
  XB     INTEGER       NOT NULL,    --性别
  CSRQ   DATE          NULL,        --出生日期
  CRAMS  NUMBER(2)     NULL,        --CRAMS评分
  RTS    NUMBER(2)     NULL,        --DTS评分
  GCS    NUMBER(2)     NULL,        --GCS评分
  RTTBZ	 VARCHAR2(300) NULL,        --人体图标志
  MBXH   NUMBER(2)     NOT NULL,    --模板序号
  CONSTRAINT PK_JZ_JZCSPGDJB PRIMARY KEY(JLXH)
);
CREATE SEQUENCE SEQ_JZ_JZCSPGDJB_JLXH START WITH 1;
CREATE UNIQUE INDEX UIDX_JZ_JZCSPGDJB_YJJLXH ON JZ_JZCSPGDJB(YJJLXH);
CREATE INDEX IDX_JZ_JZCSPGDJB_JZKH ON JZ_JZCSPGDJB(JZKH);
CREATE INDEX IDX_JZ_JZCSPGDJB_DJRQ ON JZ_JZCSPGDJB(DJRQ);
CREATE INDEX IDX_JZ_JZCSPGDJB_BRXM ON JZ_JZCSPGDJB(BRXM);  