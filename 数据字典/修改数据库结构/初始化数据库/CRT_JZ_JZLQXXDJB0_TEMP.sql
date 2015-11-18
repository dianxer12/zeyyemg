--����������Ϣ�ǼǱ�ɾ���ļ�¼��ʱ��ţ�
DROP TABLE JZ_JZLQXXDJB0_TEMP;
CREATE TABLE JZ_JZLQXXDJB0_TEMP
(
  JLXH   NUMBER(9)     NOT NULL,    --��¼���
  YJJLXH VARCHAR2(9)   NOT NULL,    --Ԥ���¼���
  JZKH   VARCHAR2(20)  NULL,        --���￨��
  DJRQ   DATE          NOT NULL,    --�Ǽ�����
  DJR    VARCHAR2(10)  NOT NULL,    --�Ǽ���
  XGRQ   DATE          NULL,        --����޸�����
  XGR    VARCHAR2(10)  NULL,        --����޸���
  LQSJ   DATE          NOT NULL,    --����ʱ��
  LQQX   VARCHAR2(20)  NULL,        --����ȥ��
  BRXM   VARCHAR2(20)  NOT NULL,    --��������
  XB     INTEGER       NOT NULL,    --�Ա�
  CSRQ   DATE          NULL,        --��������
  ZYH    VARCHAR2(10)  NULL,        --סԺ��
  CWH    VARCHAR2(20)  NULL,        --��λ��
  KSMC   VARCHAR2(30)  NULL,        --��������
  BZ     VARCHAR2(50)  NULL,        --��ע
  ZLYY	 VARCHAR2(50)  NULL,        --����ԭ��
  MBXH   NUMBER(2)     NOT NULL,    --ģ�����
  SCRQ   DATE          NOT NULL,    --ɾ������
  SCR    VARCHAR2(10)  NOT NULL,    --ɾ����
  CONSTRAINT PK_JZ_JZLQXXDJB0_TEMP PRIMARY KEY(JLXH)
);
CREATE INDEX IDX_JZ_JZLQXXDJB0_TEMP_JZKH ON JZ_JZLQXXDJB0_TEMP(JZKH);
CREATE INDEX IDX_JZ_JZLQXXDJB0_TEMP_DJRQ ON JZ_JZLQXXDJB0_TEMP(DJRQ);
CREATE INDEX IDX_JZ_JZLQXXDJB0_TEMP_BRXM ON JZ_JZLQXXDJB0_TEMP(BRXM);  