--��λ�����
DROP TABLE dwdmb;
CREATE TABLE dwdmb
(
    DWDM      VARCHAR2(4)            NOT NULL,  --��λ����
    DWLB      NUMBER(1)              NULL,  --��λ���
    DWMC      VARCHAR(50)            NULL,  --��λ����
    DWJC      VARCHAR2(50)           NULL,  --��λ���
    BZDM      VARCHAR2(10)           NULL,  --��׼����
    DWPYM     VARCHAR2(6)            NULL,  --��λƴ����
    ZFPB      NUMBER(1)              NULL,  --�����б�
    LXR       VARCHAR2(10)           NULL,  --��ϵ��
    LXDH      VARCHAR2(50)           NULL,  --��ϵ�绰
    CZ        VARCHAR2(50)           NULL,  --����
    YB        VARCHAR2(8)            NULL,  --�ʱ�
    DZ        VARCHAR2(100)          NULL,  --��ַ
    ZFFS      VARCHAR2(8)            NULL,  --֧����ʽ
    KHYH      VARCHAR2(30)           NULL,  --��������
    YHZH      VARCHAR2(15)           NULL,  --�����ʺ�
    EMAIL     VARCHAR2(50)           NULL,  --EMAIL
    WZ        VARCHAR2(50)           NULL,  --��ַ
    DQDM      VARCHAR2(5)            NULL,  --��������
    XYED      NUMBER(10,2) 	     NULL,  --�������
    BZ        VARCHAR2(100)          NULL,  --��ע
    CONSTRAINT PK_DWDMB PRIMARY KEY(DWDM)
);