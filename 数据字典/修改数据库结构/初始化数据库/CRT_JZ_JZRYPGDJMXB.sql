--急诊创伤评估登记明细表
CREATE TABLE JZ_JZRYPGDJMXB
(
  JLXH     NUMBER(9)     NOT NULL,    --记录序号
  YJJLXH   VARCHAR2(9)   NOT NULL,    --预检记录序号
  PGFS     VARCHAR2(10)  NOT NULL,    --评估方式
  PGCSDM   VARCHAR2(10)  NOT NULL,    --评估参数代码
  PGCSMC   VARCHAR2(20)  NOT NULL,    --评估参数名称
  PGCSTYPE VARCHAR2(10)  NOT NULL,    --评估参数类型
  PGCSZ1   VARCHAR2(20)  NULL,        --评估参数值1 字符型
  PGCSZ2   NUMBER(4)     NULL,        --评估参数值2 数值型
  PGCSZ3   DATE          NULL,        --评估参数值3 日期型
  CONSTRAINT PK_JZ_JZRYPGDJMXB PRIMARY KEY(JLXH)
);
CREATE SEQUENCE SEQ_JZ_JZRYPGDJMXB_JLXH START WITH 1;
CREATE INDEX IDX_JZ_JZRYPGDJMXB_DJXH ON JZ_JZRYPGDJMXB(yjjlxh);
CREATE INDEX IDX_JZ_JZRYPGDJMXB_PGFS ON JZ_JZRYPGDJMXB(pgfs);
CREATE INDEX IDX_JZ_JZRYPGDJMXB_PGCSDM ON JZ_JZRYPGDJMXB(PGCSDM);