drop index PBSYSCATCOLDICT_IDX;

drop table PBCATCOL cascade constraints;

/*==============================================================*/
/* Table: PBCATCOL                                              */
/*==============================================================*/
create table PBCATCOL  (
   PBC_TNAM             VARCHAR2(30)                     not null,
   PBC_TID              NUMBER,
   PBC_OWNR             VARCHAR2(30)                     not null,
   PBC_CNAM             VARCHAR2(30)                     not null,
   PBC_CID              NUMBER,
   PBC_LABL             VARCHAR2(254),
   PBC_LPOS             NUMBER,
   PBC_HDR              VARCHAR2(254),
   PBC_HPOS             NUMBER,
   PBC_JTFY             NUMBER,
   PBC_MASK             VARCHAR2(31),
   PBC_CASE             NUMBER,
   PBC_HGHT             NUMBER,
   PBC_WDTH             NUMBER,
   PBC_PTRN             VARCHAR2(31),
   PBC_BMAP             CHAR,
   PBC_INIT             VARCHAR2(254),
   PBC_CMNT             VARCHAR2(254),
   PBC_EDIT             VARCHAR2(31),
   PBC_TAG              VARCHAR2(254)
);

/*==============================================================*/
/* Index: PBSYSCATCOLDICT_IDX                                   */
/*==============================================================*/
create unique index PBSYSCATCOLDICT_IDX on PBCATCOL (
   PBC_TNAM ASC,
   PBC_OWNR ASC,
   PBC_CNAM ASC
);


/*********************************************************************************/

drop index PBSYSPBE_IDX;

drop table PBCATEDT cascade constraints;

/*==============================================================*/
/* Table: PBCATEDT                                              */
/*==============================================================*/
create table PBCATEDT  (
   PBE_NAME             VARCHAR2(30),
   PBE_EDIT             VARCHAR2(254),
   PBE_TYPE             NUMBER,
   PBE_CNTR             NUMBER,
   PBE_SEQN             NUMBER,
   PBE_FLAG             NUMBER,
   PBE_WORK             VARCHAR2(32)
);

/*==============================================================*/
/* Index: PBSYSPBE_IDX                                          */
/*==============================================================*/
create unique index PBSYSPBE_IDX on PBCATEDT (
   PBE_NAME ASC,
   PBE_SEQN ASC
);


/*********************************************************************************/

drop index PBSYSCATFRMTS_IDX;

drop table PBCATFMT cascade constraints;

/*==============================================================*/
/* Table: PBCATFMT                                              */
/*==============================================================*/
create table PBCATFMT  (
   PBF_NAME             VARCHAR2(30),
   PBF_FRMT             VARCHAR2(254),
   PBF_TYPE             NUMBER                           not null,
   PBF_CNTR             NUMBER
);

/*==============================================================*/
/* Index: PBSYSCATFRMTS_IDX                                     */
/*==============================================================*/
create unique index PBSYSCATFRMTS_IDX on PBCATFMT (
   PBF_NAME ASC
);

/*********************************************************************************/

drop index PBSYSCATPBT_IDX;

drop table PBCATTBL cascade constraints;

/*==============================================================*/
/* Table: PBCATTBL                                              */
/*==============================================================*/
create table PBCATTBL  (
   PBT_TNAM             VARCHAR2(30)                     not null,
   PBT_TID              NUMBER,
   PBT_OWNR             VARCHAR2(30)                     not null,
   PBD_FHGT             NUMBER,
   PBD_FWGT             NUMBER,
   PBD_FITL             CHAR,
   PBD_FUNL             CHAR,
   PBD_FCHR             NUMBER,
   PBD_FPTC             NUMBER,
   PBD_FFCE             VARCHAR2(18),
   PBH_FHGT             NUMBER,
   PBH_FWGT             NUMBER,
   PBH_FITL             CHAR,
   PBH_FUNL             CHAR,
   PBH_FCHR             NUMBER,
   PBH_FPTC             NUMBER,
   PBH_FFCE             VARCHAR2(18),
   PBL_FHGT             NUMBER,
   PBL_FWGT             NUMBER,
   PBL_FITL             CHAR,
   PBL_FUNL             CHAR,
   PBL_FCHR             NUMBER,
   PBL_FPTC             NUMBER,
   PBL_FFCE             VARCHAR2(18),
   PBT_CMNT             VARCHAR2(254)
);

/*==============================================================*/
/* Index: PBSYSCATPBT_IDX                                       */
/*==============================================================*/
create unique index PBSYSCATPBT_IDX on PBCATTBL (
   PBT_TNAM ASC,
   PBT_OWNR ASC
);

/*********************************************************************************/

drop index PBSYSCATVLDS_IDX;

drop table PBCATVLD cascade constraints;

/*==============================================================*/
/* Table: PBCATVLD                                              */
/*==============================================================*/
create table PBCATVLD  (
   PBV_NAME             VARCHAR2(30),
   PBV_VALD             VARCHAR2(254),
   PBV_TYPE             NUMBER,
   PBV_CNTR             NUMBER,
   PBV_MSG              VARCHAR2(254)
);

/*==============================================================*/
/* Index: PBSYSCATVLDS_IDX                                      */
/*==============================================================*/
create unique index PBSYSCATVLDS_IDX on PBCATVLD (
   PBV_NAME ASC
);
