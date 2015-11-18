--���Ҵ����
CREATE TABLE ksdmb
(
    KSDM      VARCHAR2(10)      NOT NULL,   --���Ҵ���
    KSMC      VARCHAR2(30)      NOT NULL,   --��������
    FLKSDM    VARCHAR2(10)      NULL,       --������Ҵ���
    FLKSMC    VARCHAR2(30)      NULL,	    --�����������
    SRM       VARCHAR2(10)      NOT NULL,   --������
    XH        NUMBER(4)         NULL,       --�������
    ZFPB      NUMBER(1)		NULL,	    --�����б�
    MJPB      NUMBER(1)		NULL,       --ĩ���б�
    YCPB      NUMBER(1)		NULL,       --�����б�
    BZ        VARCHAR2(10)      NULL,       --��ע
    CONSTRAINT PK_KSDMB PRIMARY KEY(ksdm)
)tablespace JZGLXT;

CREATE INDEX IDX_KSDMB_SRM ON KSDMB(SRM) tablespace JZGLXT;
CREATE INDEX IDX_KSDMB_KSMC ON KSDMB(KSMC) tablespace JZGLXT;

insert into ksdmb(ksdm,ksmc,flksdm,srm,zfpb,mjpb)
select ksdm,ksmc,flksdm,srm1,zfpb,mjpb from gy_ksdm;

commit;
