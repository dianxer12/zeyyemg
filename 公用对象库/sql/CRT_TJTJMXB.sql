--ͳ��������ϸ��
DROP TABLE tjtjmxb;
CREATE TABLE tjtjmxb
(
  JLXH          NUMBER(10)    NOT NULL,  --��¼���
  XH            NUMBER(2)     NOT NULL,  --�������
  CODE1         VARCHAR2(20)  NULL,      --����1
  CODE1_NAME    VARCHAR2(50)  NULL,      --����1����
  CODE2         NUMBER(2)     NULL,      --����2
  CODE2_NAME    VARCHAR2(50)  NULL,      --����2����
  CODE3         VARCHAR2(20)  NULL,      --����3
  CODE3_NAME    VARCHAR2(50)  NULL,      --����3����
  CODE4         VARCHAR2(20)  NULL,      --����4
  CODE4_NAME    VARCHAR2(100) NULL,      --����4����
  CODE5         VARCHAR2(20)  NULL,      --����5
  CODE5_NAME    VARCHAR2(50)  NULL,      --����5����
  CONSTRAINT PK_TJTJMXB PRIMARY KEY(JLXH,XH)
);