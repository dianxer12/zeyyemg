--统计条件明细表
DROP TABLE tjtjmxb;
CREATE TABLE tjtjmxb
(
  JLXH          NUMBER(10)    NOT NULL,  --记录序号
  XH            NUMBER(2)     NOT NULL,  --排序序号
  CODE1         VARCHAR2(20)  NULL,      --代码1
  CODE1_NAME    VARCHAR2(50)  NULL,      --代码1名称
  CODE2         NUMBER(2)     NULL,      --代码2
  CODE2_NAME    VARCHAR2(50)  NULL,      --代码2名称
  CODE3         VARCHAR2(20)  NULL,      --代码3
  CODE3_NAME    VARCHAR2(50)  NULL,      --代码3名称
  CODE4         VARCHAR2(20)  NULL,      --代码4
  CODE4_NAME    VARCHAR2(100) NULL,      --代码4名称
  CODE5         VARCHAR2(20)  NULL,      --代码5
  CODE5_NAME    VARCHAR2(50)  NULL,      --代码5名称
  CONSTRAINT PK_TJTJMXB PRIMARY KEY(JLXH,XH)
);