--单位代码表
DROP TABLE dwdmb;
CREATE TABLE dwdmb
(
    DWDM      VARCHAR2(4)            NOT NULL,  --单位代码
    DWLB      NUMBER(1)              NULL,  --单位类别
    DWMC      VARCHAR(50)            NULL,  --单位名称
    DWJC      VARCHAR2(50)           NULL,  --单位简称
    BZDM      VARCHAR2(10)           NULL,  --标准代码
    DWPYM     VARCHAR2(6)            NULL,  --单位拼音码
    ZFPB      NUMBER(1)              NULL,  --作废判别
    LXR       VARCHAR2(10)           NULL,  --联系人
    LXDH      VARCHAR2(50)           NULL,  --联系电话
    CZ        VARCHAR2(50)           NULL,  --传真
    YB        VARCHAR2(8)            NULL,  --邮编
    DZ        VARCHAR2(100)          NULL,  --地址
    ZFFS      VARCHAR2(8)            NULL,  --支付方式
    KHYH      VARCHAR2(30)           NULL,  --开户银行
    YHZH      VARCHAR2(15)           NULL,  --银行帐号
    EMAIL     VARCHAR2(50)           NULL,  --EMAIL
    WZ        VARCHAR2(50)           NULL,  --网址
    DQDM      VARCHAR2(5)            NULL,  --地区代码
    XYED      NUMBER(10,2) 	     NULL,  --信誉额度
    BZ        VARCHAR2(100)          NULL,  --备注
    CONSTRAINT PK_DWDMB PRIMARY KEY(DWDM)
);