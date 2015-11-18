create sequence seq_hzzdb_jlxh start with 1;

drop index IDX_HZZDB_MC;

drop table HZZDB cascade constraints;

/*==============================================================*/
/* Table: HZZDB                                                 */
/*==============================================================*/
create table HZZDB  (
   JLXH                 NUMBER(10)                      not null,
   MC                   VARCHAR2(50)                    not null,
   SRM1                 VARCHAR2(50),
   SRM2                 VARCHAR2(50),
   SRM3                 VARCHAR2(50),
   SD                   NUMBER(1),
   PXXH                 NUMBER(4),
   constraint PK_HZZDB primary key (JLXH)
);

/*==============================================================*/
/* Index: IDX_HZZDB_MC                                          */
/*==============================================================*/
create index IDX_HZZDB_MC on HZZDB (
   MC ASC
);

--����hzzdb��Ϊ�����ֵ��
--ִ��hzzdb.sql

--20130420
alter table tjtjmxb modify code4 VARCHAR2(100);
alter table tjtjmxb modify code4_name VARCHAR2(100);

create table CZRZB_TP  (
   JLXH                 NUMBER(10)                      not null,
   TP                   LONG RAW,
   constraint PK_CZRZB_TP primary key (JLXH)
);

--20130523
alter table ksdmb modify xh number(10);
alter table ksdmb add zzpxxh number(10);
update ksdmb set zzpxxh = xh;
commit;
alter table ksdmb modify srm varchar2(20);
alter table ksdmb modify ksmc varchar2(50);
alter table ksdmb add ghksdm varchar2(20);
alter table yhqx add yhdj number(1);
update yhqx set yhdj = 0 where yhdj is null;
commit;

--20131026
alter table ksdmb add flksmc varchar2(50);
alter table ksdmb modify flksmc varchar2(50);
alter table ksdmb add glflksdm varchar2(20);
alter table ksdmb add glflksmc varchar2(50);
alter table ksdmb add qbglflksdm varchar2(200);
alter table ksdmb add qbglflksmc varchar2(200);

create or replace trigger TRI_KSDMB 
before insert or delete or update on ksdmb 
for each row
declare
    ll_jlxh number(10);
    ls_jqm  varchar2(50);
    ls_ipdz varchar2(15);
    ls_zdrz varchar2(4000);
begin
    select sys_context('USERENV','TERMINAL'),sys_context('USERENV','IP_ADDRESS')
      into ls_jqm,ls_ipdz 
      from dual;
    if inserting then
       insert into czrzb(jlxh,czmc,czsj,jqm,ipdz,bm,gjz,zdrz)
       values(seq_czrzb_jlxh.nextval,'insert',sysdate,ls_jqm,ls_ipdz,'ksdmb',to_char(:new.ksdm),null);
    end if;
    if deleting then
       insert into czrzb(jlxh,czmc,czsj,jqm,ipdz,bm,gjz,zdrz)
       values(seq_czrzb_jlxh.nextval,'delete',sysdate,ls_jqm,ls_ipdz,'ksdmb',to_char(:old.ksdm),'KSDM:'||nvl(to_char(:old.ksdm),'��')||'|'||'KSMC:'||nvl(to_char(:old.ksmc),'��')||'|'||'FLKSDM:'||nvl(to_char(:old.flksdm),'��')||'|'||'FLKSMC:'||nvl(to_char(:old.flksmc),'��')||'|'||'GLFLKSDM:'||nvl(to_char(:old.glflksdm),'��')||'|'||'GLFLKSMC:'||nvl(to_char(:old.glflksmc),'��')||'|'||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'��')||'|'||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'��')||'|'||'QBGLFLKSDM:'||nvl(to_char(:old.qbglflksdm),'��')||'|'||'QBGLFLKSMC:'||nvl(to_char(:old.qbglflksmc),'��')||'|'||'KHFL:'||nvl(to_char(:old.khfl),'��')||'|'||'SRM:'||nvl(to_char(:old.srm),'��')||'|'||'XH:'||nvl(to_char(:old.xh),'��')||'|'||'ZZPXXH:'||nvl(to_char(:old.zzpxxh),'��')||'|'||'ZFPB:'||nvl(to_char(:old.zfpb),'��')||'|'||'MJPB:'||nvl(to_char(:old.mjpb),'��')||'|'||'YCPB:'||nvl(to_char(:old.ycpb),'��')||'|'||'BZ:'||nvl(to_char(:old.bz),'��')||'|'||'DD:'||nvl(to_char(:old.dd),'��')||'|'||'BZCHB:'||nvl(to_char(:old.bzchb),'��')||'|'||'ISUPDATE:'||nvl(to_char(:old.isupdate),'��')||'|'||'GHKSDM:'||nvl(to_char(:old.ghksdm),'��')||'|');
    end if;
    if updating then
       if (nvl(:old.ksdm,'��') <> nvl(:new.ksdm,'��')) then --1
          ls_zdrz := ls_zdrz||'KSDM:'||nvl(to_char(:old.ksdm),'��')||'|'||nvl(to_char(:new.ksdm),'��')||';';
       end if;
       if (nvl(:old.ksmc,'��') <> nvl(:new.ksmc,'��')) then --2
          ls_zdrz := ls_zdrz||'KSMC:'||nvl(to_char(:old.ksmc),'��')||'|'||nvl(to_char(:new.ksmc),'��')||';';
       end if;
       if (nvl(:old.flksdm,'��') <> nvl(:new.flksdm,'��')) then --3
          ls_zdrz := ls_zdrz||'FLKSDM:'||nvl(to_char(:old.flksdm),'��')||'|'||nvl(to_char(:new.flksdm),'��')||';';
       end if;
       if (nvl(:old.flksmc,'��') <> nvl(:new.flksmc,'��')) then --3
          ls_zdrz := ls_zdrz||'FLKSMC:'||nvl(to_char(:old.flksmc),'��')||'|'||nvl(to_char(:new.flksmc),'��')||';';
       end if;
       if (nvl(:old.glflksdm,'��') <> nvl(:new.glflksdm,'��')) then --3
          ls_zdrz := ls_zdrz||'GLFLKSDM:'||nvl(to_char(:old.glflksdm),'��')||'|'||nvl(to_char(:new.glflksdm),'��')||';';
       end if;
       if (nvl(:old.glflksmc,'��') <> nvl(:new.glflksmc,'��')) then --3
          ls_zdrz := ls_zdrz||'GLFLKSMC:'||nvl(to_char(:old.glflksmc),'��')||'|'||nvl(to_char(:new.glflksmc),'��')||';';
       end if;
       if (nvl(:old.qbflksdm,'��') <> nvl(:new.qbflksdm,'��')) then --4
          ls_zdrz := ls_zdrz||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'��')||'|'||nvl(to_char(:new.qbflksdm),'��')||';';
       end if;
       if (nvl(:old.qbflksmc,'��') <> nvl(:new.qbflksmc,'��')) then --5
          ls_zdrz := ls_zdrz||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'��')||'|'||nvl(to_char(:new.qbflksmc),'��')||';';
       end if;
       if (nvl(:old.qbglflksdm,'��') <> nvl(:new.qbglflksdm,'��')) then --4
          ls_zdrz := ls_zdrz||'QBGLFLKSDM:'||nvl(to_char(:old.qbglflksdm),'��')||'|'||nvl(to_char(:new.qbglflksdm),'��')||';';
       end if;
       if (nvl(:old.qbglflksmc,'��') <> nvl(:new.qbglflksmc,'��')) then --5
          ls_zdrz := ls_zdrz||'QBGLFLKSMC:'||nvl(to_char(:old.qbglflksmc),'��')||'|'||nvl(to_char(:new.qbglflksmc),'��')||';';
       end if;
       if (nvl(:old.khfl,'��') <> nvl(:new.khfl,'��')) then --6
          ls_zdrz := ls_zdrz||'KHFL:'||nvl(to_char(:old.khfl),'��')||'|'||nvl(to_char(:new.khfl),'��')||';';
       end if;
       if (nvl(:old.srm,'��') <> nvl(:new.srm,'��')) then --7
          ls_zdrz := ls_zdrz||'SRM:'||nvl(to_char(:old.srm),'��')||'|'||nvl(to_char(:new.srm),'��')||';';
       end if;
       if (nvl(to_char(:old.xh),'��') <> nvl(to_char(:new.xh),'��')) then --8
          ls_zdrz := ls_zdrz||'XH:'||nvl(to_char(:old.xh),'��')||'|'||nvl(to_char(:new.xh),'��')||';';
       end if;
       if (nvl(to_char(:old.zzpxxh),'��') <> nvl(to_char(:new.zzpxxh),'��')) then --8
          ls_zdrz := ls_zdrz||'ZZPXXH:'||nvl(to_char(:old.zzpxxh),'��')||'|'||nvl(to_char(:new.zzpxxh),'��')||';';
       end if;
       if (nvl(to_char(:old.zfpb),'��') <> nvl(to_char(:new.zfpb),'��')) then --9
          ls_zdrz := ls_zdrz||'ZFPB:'||nvl(to_char(:old.zfpb),'��')||'|'||nvl(to_char(:new.zfpb),'��')||';';
       end if;
       if (nvl(to_char(:old.mjpb),'��') <> nvl(to_char(:new.mjpb),'��')) then --10
          ls_zdrz := ls_zdrz||'MJPB:'||nvl(to_char(:old.mjpb),'��')||'|'||nvl(to_char(:new.mjpb),'��')||';';
       end if;
       if (nvl(to_char(:old.ycpb),'��') <> nvl(to_char(:new.ycpb),'��')) then --11
          ls_zdrz := ls_zdrz||'YCPB:'||nvl(to_char(:old.ycpb),'��')||'|'||nvl(to_char(:new.ycpb),'��')||';';
       end if;
       if (nvl(:old.bz,'��') <> nvl(:new.bz,'��')) then --12
          ls_zdrz := ls_zdrz||'BZ:'||nvl(to_char(:old.bz),'��')||'|'||nvl(to_char(:new.bz),'��')||';';
       end if;
       if (nvl(:old.dd,'��') <> nvl(:new.dd,'��')) then --13
          ls_zdrz := ls_zdrz||'DD:'||nvl(to_char(:old.dd),'��')||'|'||nvl(to_char(:new.dd),'��')||';';
       end if;
       if (nvl(to_char(:old.bzchb),'��') <> nvl(to_char(:new.bzchb),'��')) then --14
          ls_zdrz := ls_zdrz||'BZCHB:'||nvl(to_char(:old.bzchb),'��')||'|'||nvl(to_char(:new.bzchb),'��')||';';
       end if;
       if (nvl(to_char(:old.isupdate),'��') <> nvl(to_char(:new.isupdate),'��')) then --15
          ls_zdrz := ls_zdrz||'ISUPDATE:'||nvl(to_char(:old.isupdate),'��')||'|'||nvl(to_char(:new.isupdate),'��')||';';
       end if;
       if (nvl(:old.ghksdm,'��') <> nvl(:new.ghksdm,'��')) then --16
          ls_zdrz := ls_zdrz||'GHKSDM:'||nvl(to_char(:old.ghksdm),'��')||'|'||nvl(to_char(:new.ghksdm),'��')||';';
       end if;
       
       if (length(ls_zdrz) > 0) then
          insert into czrzb(jlxh,czmc,czsj,jqm,ipdz,bm,gjz,zdrz)
          values(seq_czrzb_jlxh.nextval,'update',sysdate,ls_jqm,ls_ipdz,'ksdmb',to_char(:new.ksdm),ls_zdrz);
       end if;
    end if;
end TRI_KSDMB;
/
