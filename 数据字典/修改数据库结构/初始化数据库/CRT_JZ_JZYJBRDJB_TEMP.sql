--����Ԥ�첡�˵ǼǱ�ɾ���ļ�¼��ʱ��ţ�
DROP TABLE JZ_JZYJBRDJB_TEMP;
CREATE TABLE JZ_JZYJBRDJB_TEMP
(
  JLXH   VARCHAR2(9)   NOT NULL,    --��¼���
  JZKH   VARCHAR2(20)  NULL,        --���￨��
  DJRQ   DATE          NOT NULL,    --�Ǽ�����
  DJR    VARCHAR2(10)  NOT NULL,    --�Ǽ���
  XGRQ   DATE          NULL,        --����޸�����
  XGR    VARCHAR2(10)  NULL,        --����޸���
  RYSJ   DATE          NOT NULL,    --��Ժʱ��
  BRXM   VARCHAR2(20)  NOT NULL,    --��������
  XB     NUMBER(1)     NOT NULL,    --�Ա�
  CSRQ   DATE          NULL,        --��������
  ZY     VARCHAR2(20)  NULL,        --ְҵ
  KSDM   VARCHAR2(10)  NULL,        --���Ҵ���
  KSMC   VARCHAR2(20)  NULL,        --��������
  HZKSDM VARCHAR2(60)  NULL,        --������Ҵ���
  HZKSMC VARCHAR2(120) NULL,        --�����������
  CBZD   VARCHAR2(50)  NULL,        --�������
  BRQX   VARCHAR2(20)  NULL,        --����ȥ��
  LXDH   VARCHAR2(20)  NULL,        --��ϵ�绰
  LXDZ   VARCHAR2(50)  NOT NULL,    --��ϵ��ַ
  BZ     VARCHAR2(50)  NULL,        --��ע
  TW     DECIMAL(3,1)  NULL,        --����(��λ:��)
  MB     NUMBER(3)     NULL,        --����(��/��)
  XY     VARCHAR2(10)  NULL,        --Ѫѹ(MMHG)
  SSY    NUMBER(4)     NULL,        --����ѹ(MMHG)
  SZY    NUMBER(4)     NULL,        --����ѹ(MMHG)
  XYBHD  DECIMAL(5,4)  NULL,        --Ѫ�����Ͷ�(%)
  HX     NUMBER(3)     NULL,        --����(��/��)
  JZFQ   VARCHAR2(20)  NULL,        --�������
  CSBZ   NUMBER(1)     NULL,        --���˱�־  0���Ǵ���   1������
  SCRQ   DATE          NOT NULL,    --ɾ������
  SCR    VARCHAR2(10)  NOT NULL,    --ɾ����
  CONSTRAINT PK_JZ_JZYJBRDJB_TEMP PRIMARY KEY(JLXH)
)tablespace JZGLXT;
CREATE INDEX IDX_JZ_JZYJBRDJB_TEMP_DJRQ ON JZ_JZYJBRDJB_TEMP(DJRQ);
CREATE INDEX IDX_JZ_JZYJBRDJB_TEMP_JZKH ON JZ_JZYJBRDJB_TEMP(JZKH);
CREATE INDEX IDX_JZ_JZYJBRDJB_TEMP_BRXM ON JZ_JZYJBRDJB_TEMP(BRXM);  