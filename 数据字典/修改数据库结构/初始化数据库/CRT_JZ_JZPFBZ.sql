--急诊评分标准
DROP TABLE JZ_JZPFBZ;
CREATE TABLE JZ_JZPFBZ
(
  JLXH   VARCHAR2(9)   NOT NULL,    --记录序号
  PFBZDM VARCHAR2(20)  NOT NULL,    --评分标准代码
  PFBZMC VARCHAR2(20)  NOT NULL,    --评分标准名称
  PFCS   VARCHAR2(20)  NOT NULL,    --评分参数
  PFFZMS VARCHAR2(20)  NOT NULL,    --评分分值描述
  PFFZ   NUMBER(3)     NOT NULL,    --评分分值
  CONSTRAINT PK_JZ_JZPFBZ PRIMARY KEY(JLXH)
);
CREATE SEQUENCE SEQ_JZ_JZPFBZ_JLXH START WITH 1;
CREATE INDEX IDX_JZ_JZPFBZ_PFBZDM ON JZ_JZPFBZ(PFBZDM);
CREATE INDEX IDX_JZ_JZPFBZ_PFBZMC ON JZ_JZPFBZ(PFBZMC);  