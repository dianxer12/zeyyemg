--ϵͳ������
DROP TABLE xtcsb;
CREATE TABLE xtcsb 	       
(
  XTXH      	NUMBER(1)       NOT NULL,  --ϵͳ���
  CSFL		VARCHAR2(10)    NOT NULL,  --��������
  CSMC   	VARCHAR2(20)    NOT NULL,  --��������
  CSZ1   	VARCHAR2(100)   NULL,      --����ֵ1
  CSZ2   	NUMBER(1)       NULL,      --����ֵ2
  BZ     	VARCHAR2(200)   NULL,      --��ע
  ISUPDATE 	NUMBER(1)   	NULL,      --�������
  CONSTRAINT PK_XTCSB_XTXHCSMC PRIMARY KEY (xtxh,csfl,csmc)
)tablespace JZGLXT;

--�������
INSERT INTO xtcsb(xtxh,csfl,csmc,csz1,csz2,bz,isupdate)
VALUES(1,'JMCS','DLXSDHCK',null,0,'��½�Ƿ���ʾ�������� 0:����ʾ 1:��ʾ',1);
--���ݿ����
INSERT INTO xtcsb(xtxh,csfl,csmc,csz1,csz2,bz,isupdate)
VALUES(1,'SJKCS','DLXSDHCK',null,0,'��½�Ƿ���ʾ�������� 0:����ʾ 1:��ʾ',1);
--ҵ�����
INSERT INTO xtcsb(xtxh,csfl,csmc,csz1,csz2,bz,isupdate)
VALUES(1,'YWCS','DLXSDHCK',null,0,'��½�Ƿ���ʾ�������� 0:����ʾ 1:��ʾ',1);

COMMIT;