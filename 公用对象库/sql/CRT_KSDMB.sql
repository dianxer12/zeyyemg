--科室代码表
CREATE TABLE ksdmb
(
    KSDM      VARCHAR2(10)      NOT NULL,   --科室代码
    KSMC      VARCHAR2(30)      NOT NULL,   --科室名称
    FLKSDM    VARCHAR2(10)      NULL,       --父类科室代码
    FLKSMC    VARCHAR2(30)      NULL,	    --父类科室名称
    SRM       VARCHAR2(10)      NOT NULL,   --输入码
    XH        NUMBER(4)         NULL,       --排序序号
    ZFPB      NUMBER(1)		NULL,	    --作废判别
    MJPB      NUMBER(1)		NULL,       --末级判别
    YCPB      NUMBER(1)		NULL,       --隐藏判别
    BZ        VARCHAR2(10)      NULL,       --备注
    CONSTRAINT PK_KSDMB PRIMARY KEY(ksdm)
)tablespace JZGLXT;

CREATE INDEX IDX_KSDMB_SRM ON KSDMB(SRM) tablespace JZGLXT;
CREATE INDEX IDX_KSDMB_KSMC ON KSDMB(KSMC) tablespace JZGLXT;

insert into ksdmb(ksdm,ksmc,flksdm,srm,zfpb,mjpb)
select ksdm,ksmc,flksdm,srm1,zfpb,mjpb from gy_ksdm;

commit;
