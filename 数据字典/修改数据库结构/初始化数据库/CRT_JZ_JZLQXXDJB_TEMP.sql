--����������Ϣ�ǼǱ�ɾ���ļ�¼��ʱ��ţ�
DROP TABLE JZ_JZLQXXDJB_TEMP;
CREATE TABLE JZ_JZLQXXDJB_TEMP
(
  JLXH   NUMBER(9)     NOT NULL,    --��¼���
  YJJLXH VARCHAR2(9)   NOT NULL,    --Ԥ���¼���
  JZKH   VARCHAR2(20)  NULL,        --���￨��
  DJRQ   DATE          NOT NULL,    --�Ǽ�����
  DJR    VARCHAR2(10)  NOT NULL,    --�Ǽ���
  XGRQ   DATE          NULL,        --����޸�����
  XGR    VARCHAR2(10)  NULL,        --����޸���
  LQSJ   DATE          NOT NULL,    --����ʱ��
  BRXM   VARCHAR2(20)  NOT NULL,    --��������
  XB     INTEGER       NOT NULL,    --�Ա�
  CSRQ   DATE          NULL,        --��������
  KSDM   VARCHAR2(10)  NULL,        --���Ҵ���
  KSMC   VARCHAR2(20)  NULL,        --��������
  LQZD   VARCHAR2(100)  NULL,       --�������
  LQQX   VARCHAR2(20)  NULL,        --����ȥ��
  CWH    VARCHAR2(10)  NULL,        --��λ��
  BZ     VARCHAR2(50)  NULL,        --��ע
  LSTD   NUMBER(1)     DEFAULT 0 NOT NULL, --��ɫͨ����־��1���� 0����
  MBXH   NUMBER(2)     NOT NULL,    --ģ�����
  SCRQ   DATE          NOT NULL,    --ɾ������
  SCR    VARCHAR2(10)  NOT NULL,    --ɾ����
  CONSTRAINT PK_JZ_JZLQXXDJB_TEMP PRIMARY KEY(JLXH)
);
CREATE INDEX IDX_JZ_JZLQXXDJB_TEMP_JZKH ON JZ_JZLQXXDJB_TEMP(JZKH);
CREATE INDEX IDX_JZ_JZLQXXDJB_TEMP_DJRQ ON JZ_JZLQXXDJB_TEMP(DJRQ);
CREATE INDEX IDX_JZ_JZLQXXDJB_TEMP_BRXM ON JZ_JZLQXXDJB_TEMP(BRXM);  