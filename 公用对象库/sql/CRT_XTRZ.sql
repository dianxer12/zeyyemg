--系统日志表
DROP TABLE xtrz;
DROP SEQUENCE SEQ_XTRZ;
CREATE TABLE xtrz
(
  JLXH        NUMBER(10)    NOT NULL,
  XTXH        NUMBER(2)     NOT NULL,
  YHDM        VARCHAR2(10)  NOT NULL,
  OPERATION   VARCHAR2(20)  NOT NULL,
  DLSJ        DATE          NULL,
  TCSJ        DATE          NULL,
  CZSJ        DATE          NULL,
  JQM         VARCHAR2(50)  NULL,
  IPADDRESS   VARCHAR2(15)  NULL,
  NICADDRESS  VARCHAR2(12)  NULL,
  VERSION     VARCHAR2(30)  NULL,
  CONSTRAINT PK_XTRZ PRIMARY KEY(JLXH)
)tablespace JZGLXT;
CREATE SEQUENCE SEQ_XTRZ_JLXH START WITH 1;
CREATE INDEX IDX_XTRZ_DLSJ ON XTRZ(DLSJ) tablespace JZGLXT;