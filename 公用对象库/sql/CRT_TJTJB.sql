--统计条件表
DROP TABLE tjtjb;
DROP SEQUENCE SEQ_tjtjb_jlxh;
CREATE TABLE tjtjb
(
  JLXH          NUMBER(10)    NOT NULL,  --记录序号
  XTXH          NUMBER(2)     NOT NULL,  --系统序号
  DATAOBJECT    VARCHAR2(20)  NOT NULL,  --源数据对象
  TJTJMC        VARCHAR2(100) NOT NULL,  --统计条件名称
  TJTJ		VARCHAR2(500) NULL,	 --统计条件描述
  TJTJ_SQL	VARCHAR2(500) NULL,	 --统计条件SQL
  YHDM		VARCHAR2(5)   NULL,      --用户代码
  CONSTRAINT PK_TJTJB PRIMARY KEY(JLXH)
);
CREATE SEQUENCE SEQ_TJTJB_JLXH START WITH 1;
CREATE INDEX IDX_TJTJB_XTXH_DATAOBJECT ON TJTJB(XTXH,DATAOBJECT);