--�û���Ȩ�ޱ�
drop table yhzqx;
CREATE TABLE yhzqx
(
  XTXH        NUMBER(2)    NULL,      --ϵͳ���
  YHZXH       NUMBER(2)    NOT NULL,  --�û�����
  CDX	      VARCHAR2(20) NOT NULL,  --�˵���
  CONSTRAINT PK_YHZQX PRIMARY KEY(XTXH,YHZXH,CDX)
)tablespace JZGLXT;