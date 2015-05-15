/*==============================================================*/
/* DBMS name:      ORACLE Version 9i                            */
/* Created on:     2010-5-21 21:03:16                           */
/*==============================================================*/


drop index IDX_CZRZB_CZSJ;

drop table CZRZB cascade constraints;

drop table DWDMB cascade constraints;

drop index IDX_FILETABLE_XTMC;

drop table FILETABLE cascade constraints;

drop index IDX_FILETRANSLOG_CZSJ;

drop table FILETRANSLOG cascade constraints;

drop index IDX_GYDMB_BZ;

drop index IDX_GYDMB_SRM;

drop index IDX_GYDMB_DMMC;

drop table GYDMB cascade constraints;

drop index IDX_KSDMB_KSMC;

drop index IDX_KSDMB_SRM;

drop table KSDMB cascade constraints;

drop table OPERATELOCK cascade constraints;

drop table TABLEINFO cascade constraints;

drop index IDX_TJTJB_XTXH_DATAOBJECT;

drop table TJTJB cascade constraints;

drop table TJTJMXB cascade constraints;

drop table XHB cascade constraints;

drop table XTCSB cascade constraints;

drop index IDX_XTRZB_TCSJ;

drop index IDX_XTRZB_DLSJ;

drop table XTRZB cascade constraints;

drop table XTXXB cascade constraints;

drop index IDX_YHB_SRM;

drop index IDX_YHB_YHDM;

drop table YHB cascade constraints;

drop table YHZ cascade constraints;

drop table YHZQX cascade constraints;

drop sequence SEQ_CZRZB_JLXH;

drop sequence SEQ_FILETRANSLOG_JLXH;

drop sequence SEQ_GYDMB_DMXH;

drop sequence SEQ_TJTJB_JLXH;

drop sequence SEQ_XTRZB_JLXH;

create sequence SEQ_CZRZB_JLXH
start with 1;

create sequence SEQ_FILETRANSLOG_JLXH
START WITH 1;

create sequence SEQ_GYDMB_DMXH
START WITH 1;

create sequence SEQ_TJTJB_JLXH
START WITH 1;

create sequence SEQ_XTRZB_JLXH
START WITH 1;

/*==============================================================*/
/* Table: CZRZB                                                 */
/*==============================================================*/
create table CZRZB  (
   JLXH                 NUMBER(10)                      not null,
   CZMC                 VARCHAR2(20)                    not null,
   CZSJ                 DATE,
   JQM                  VARCHAR2(50),
   IPDZ                 VARCHAR2(15),
   BM                   VARCHAR2(50),
   GJZ                  VARCHAR2(20),
   ZDRZ                 VARCHAR2(500),
   constraint PK_CZRZB primary key (JLXH)
);

/*==============================================================*/
/* Index: IDX_CZRZB_CZSJ                                        */
/*==============================================================*/
create index IDX_CZRZB_CZSJ on CZRZB (
   CZSJ ASC
);

/*==============================================================*/
/* Table: DWDMB                                                 */
/*==============================================================*/
create table DWDMB  (
   DWDM                 VARCHAR2(4)                     not null,
   DWLB                 NUMBER(1),
   DWMC                 VARCHAR(50),
   DWJC                 VARCHAR2(50),
   BZDM                 VARCHAR2(10),
   DWPYM                VARCHAR2(6),
   ZFPB                 NUMBER(1),
   LXR                  VARCHAR2(10),
   LXDH                 VARCHAR2(50),
   CZ                   VARCHAR2(50),
   YB                   VARCHAR2(8),
   DZ                   VARCHAR2(100),
   ZFFS                 VARCHAR2(8),
   KHYH                 VARCHAR2(30),
   YHZH                 VARCHAR2(15),
   EMAIL                VARCHAR2(50),
   WZ                   VARCHAR2(50),
   DQDM                 VARCHAR2(5),
   XYED                 NUMBER(10,2),
   BZ                   VARCHAR2(100),
   constraint PK_DWDMB primary key (DWDM)
);

/*==============================================================*/
/* Table: FILETABLE                                             */
/*==============================================================*/
create table FILETABLE  (
   XTMC                 VARCHAR2(50)                    not null,
   FILEGROUPID          VARCHAR2(10)                    not null,
   FILENAME             VARCHAR2(50)                    not null,
   VERSION              VARCHAR2(20)                    not null,
   FILESIZE             NUMBER(10),
   SOURCE               LONG RAW                       default EMPTY_BLOB(),
   REMARK               VARCHAR2(200),
   SCRQ                 DATE                            not null,
   constraint PK_FILETABLE primary key (XTMC, FILEGROUPID, FILENAME, VERSION)
);

/*==============================================================*/
/* Index: IDX_FILETABLE_XTMC                                    */
/*==============================================================*/
create index IDX_FILETABLE_XTMC on FILETABLE (
   XTMC ASC
);

/*==============================================================*/
/* Table: FILETRANSLOG                                          */
/*==============================================================*/
create table FILETRANSLOG  (
   JLXH                 NUMBER(10)                      not null,
   XTXH                 NUMBER(2)                       not null,
   XTMC                 VARCHAR2(50),
   YHDM                 VARCHAR2(10)                    not null,
   OPERATION            VARCHAR2(20)                    not null,
   CZSJ                 DATE,
   JQM                  VARCHAR2(50),
   IPADDRESS            VARCHAR2(15),
   NICADDRESS           VARCHAR2(12),
   FILEGROUPID          VARCHAR2(10)                    not null,
   FILEPATH             VARCHAR2(200)                   not null,
   FILENAME             VARCHAR2(200),
   FILESIZE             NUMBER(10),
   VERSION              VARCHAR2(20),
   constraint PK_FILETRANSLOG primary key (JLXH)
);

/*==============================================================*/
/* Index: IDX_FILETRANSLOG_CZSJ                                 */
/*==============================================================*/
create index IDX_FILETRANSLOG_CZSJ on FILETRANSLOG (
   CZSJ ASC
);

/*==============================================================*/
/* Table: GYDMB                                                 */
/*==============================================================*/
create table GYDMB  (
   DMLB                 VARCHAR2(10)                    not null,
   DMXH                 NUMBER(10)                      not null,
   DMMC                 VARCHAR2(50),
   SRM                  VARCHAR2(25)                    not null,
   BZ                   VARCHAR2(30),
   TS                   VARCHAR2(30),
   SYCS                 NUMBER(10)                     default 0,
   PXXH                 NUMBER(10),
   constraint PK_GYDMB primary key (DMLB, DMXH)
);

/*==============================================================*/
/* Index: IDX_GYDMB_DMMC                                        */
/*==============================================================*/
create index IDX_GYDMB_DMMC on GYDMB (
   DMMC ASC
);

/*==============================================================*/
/* Index: IDX_GYDMB_SRM                                         */
/*==============================================================*/
create index IDX_GYDMB_SRM on GYDMB (
   SRM ASC
);

/*==============================================================*/
/* Index: IDX_GYDMB_BZ                                          */
/*==============================================================*/
create index IDX_GYDMB_BZ on GYDMB (
   BZ ASC
);

/*==============================================================*/
/* Table: KSDMB                                                 */
/*==============================================================*/
create table KSDMB  (
   KSDM                 VARCHAR2(10)                    not null,
   KSMC                 VARCHAR2(30)                    not null,
   FLKSDM               VARCHAR2(10)                    not null,
   FLKSMC               VARCHAR2(30),
   SRM                  VARCHAR2(10)                    not null,
   XH                   NUMBER(4),
   ZFPB                 NUMBER(1),
   MJPB                 NUMBER(1),
   BZ                   VARCHAR2(10),
   constraint PK_KSDMB primary key (KSDM)
);

/*==============================================================*/
/* Index: IDX_KSDMB_SRM                                         */
/*==============================================================*/
create index IDX_KSDMB_SRM on KSDMB (
   SRM ASC
);

/*==============================================================*/
/* Index: IDX_KSDMB_KSMC                                        */
/*==============================================================*/
create index IDX_KSDMB_KSMC on KSDMB (
   KSMC ASC
);

/*==============================================================*/
/* Table: OPERATELOCK                                           */
/*==============================================================*/
create table OPERATELOCK  (
   LOCKNAME             VARCHAR2(10)                    not null,
   LOCKVALUE            VARCHAR2(20)                    not null,
   LOCKUSER             VARCHAR2(10)                    not null,
   constraint PK_OPERATELOCK primary key (LOCKNAME, LOCKVALUE)
);

/*==============================================================*/
/* Table: TABLEINFO                                             */
/*==============================================================*/
create table TABLEINFO  (
   TABLE_ID             VARCHAR2(30)                    not null,
   TABLE_NAME           VARCHAR2(30),
   TABLESPACE_NAME      VARCHAR2(30)                    not null,
   COMMENTS             VARCHAR2(100),
   LAST_ANALYZED        DATE,
   COUNT                NUMBER(10),
   COUNT_DATE           DATE,
   XTXH                 NUMBER(2)                       not null,
   constraint PK_TABLEINFO primary key (TABLE_ID)
);

/*==============================================================*/
/* Table: TJTJB                                                 */
/*==============================================================*/
create table TJTJB  (
   JLXH                 NUMBER(10)                      not null,
   XTXH                 NUMBER(2)                       not null,
   DATAOBJECT           VARCHAR2(20)                    not null,
   TJTJMC               VARCHAR2(100)                   not null,
   TJTJ                 VARCHAR2(500),
   TJTJ_SQL             VARCHAR2(500),
   YHDM                 VARCHAR2(5),
   constraint PK_TJTJB primary key (JLXH)
);

/*==============================================================*/
/* Index: IDX_TJTJB_XTXH_DATAOBJECT                             */
/*==============================================================*/
create index IDX_TJTJB_XTXH_DATAOBJECT on TJTJB (
   XTXH ASC,
   DATAOBJECT ASC
);

/*==============================================================*/
/* Table: TJTJMXB                                               */
/*==============================================================*/
create table TJTJMXB  (
   JLXH                 NUMBER(10)                      not null,
   XH                   NUMBER(2)                       not null,
   CODE1                VARCHAR2(20),
   CODE1_NAME           VARCHAR2(50),
   CODE2                NUMBER(2),
   CODE2_NAME           VARCHAR2(50),
   CODE3                VARCHAR2(20),
   CODE3_NAME           VARCHAR2(50),
   CODE4                VARCHAR2(20),
   CODE4_NAME           VARCHAR2(100),
   CODE5                VARCHAR2(20),
   CODE5_NAME           VARCHAR2(50),
   constraint PK_TJTJMXB primary key (JLXH, XH)
);

/*==============================================================*/
/* Table: XHB                                                   */
/*==============================================================*/
create table XHB  (
   NAME                 VARCHAR2(20)                    not null,
   DQZ                  VARCHAR2(20),
   ZZ                   VARCHAR2(2),
   BZ                   VARCHAR2(50),
   constraint PK_XHB_BM primary key (NAME)
);

/*==============================================================*/
/* Table: XTCSB                                                 */
/*==============================================================*/
create table XTCSB  (
   XTXH                 NUMBER(1)                       not null,
   CSFL                 VARCHAR2(10)                    not null,
   CSMC                 VARCHAR2(20)                    not null,
   CSZ1                 VARCHAR2(100),
   CSZ2                 NUMBER(1),
   BZ                   VARCHAR2(200),
   ISUPDATE             NUMBER(1),
   constraint PK_XTCSB_XTXHCSMC primary key (XTXH, CSFL, CSMC)
);

/*==============================================================*/
/* Table: XTRZB                                                 */
/*==============================================================*/
create table XTRZB  (
   JLXH                 NUMBER(10)                      not null,
   YHDM                 VARCHAR2(10)                    not null,
   DLSJ                 DATE,
   TCSJ                 DATE,
   JQM                  VARCHAR2(100),
   IPDZ                 VARCHAR2(50),
   WKDZ                 VARCHAR2(30),
   BBH                  VARCHAR2(30),
   constraint PK_XTRZB primary key (JLXH)
);

/*==============================================================*/
/* Index: IDX_XTRZB_DLSJ                                        */
/*==============================================================*/
create index IDX_XTRZB_DLSJ on XTRZB (
   DLSJ ASC
);

/*==============================================================*/
/* Index: IDX_XTRZB_TCSJ                                        */
/*==============================================================*/
create index IDX_XTRZB_TCSJ on XTRZB (
   TCSJ ASC
);

/*==============================================================*/
/* Table: XTXXB                                                 */
/*==============================================================*/
create table XTXXB  (
   XTXH                 NUMBER(1)                       not null,
   XTMC                 VARCHAR2(50)                    not null,
   VERSION              VARCHAR2(10)                    not null,
   constraint PK_XTXXB primary key (XTXH)
);

/*==============================================================*/
/* Table: YHB                                                   */
/*==============================================================*/
create table YHB  (
   XTXH                 NUMBER(2)                       not null,
   YHDM                 VARCHAR2(5)                     not null,
   YHM                  VARCHAR2(10)                    not null,
   YHMM                 VARCHAR2(15),
   SRM                  VARCHAR2(10),
   YHZXH                NUMBER(1)                       not null,
   constraint PK_YHB primary key (XTXH, YHDM)
);

/*==============================================================*/
/* Index: IDX_YHB_YHDM                                          */
/*==============================================================*/
create index IDX_YHB_YHDM on YHB (
   YHDM ASC
);

/*==============================================================*/
/* Index: IDX_YHB_SRM                                           */
/*==============================================================*/
create index IDX_YHB_SRM on YHB (
   SRM ASC
);

/*==============================================================*/
/* Table: YHZ                                                   */
/*==============================================================*/
create table YHZ  (
   XTXH                 NUMBER(2)                       not null,
   YHZXH                NUMBER(2)                       not null,
   YHZMC                VARCHAR2(20)                    not null,
   YHZDJ                NUMBER(1),
   constraint PK_YHZ primary key (XTXH, YHZXH)
);

/*==============================================================*/
/* Table: YHZQX                                                 */
/*==============================================================*/
create table YHZQX  (
   XTXH                 NUMBER(2)                       not null,
   YHZXH                NUMBER(2)                       not null,
   CDX                  VARCHAR2(20)                    not null,
   constraint PK_YHZQX primary key (XTXH, YHZXH, CDX)
);

