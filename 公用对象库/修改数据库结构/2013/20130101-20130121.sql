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

--ЦєгУhzzdbзїЮЊККзжзжЕфБэ
--жДааhzzdb.sql

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
       values(seq_czrzb_jlxh.nextval,'delete',sysdate,ls_jqm,ls_ipdz,'ksdmb',to_char(:old.ksdm),'KSDM:'||nvl(to_char(:old.ksdm),'Пе')||'|'||'KSMC:'||nvl(to_char(:old.ksmc),'Пе')||'|'||'FLKSDM:'||nvl(to_char(:old.flksdm),'Пе')||'|'||'FLKSMC:'||nvl(to_char(:old.flksmc),'Пе')||'|'||'GLFLKSDM:'||nvl(to_char(:old.glflksdm),'Пе')||'|'||'GLFLKSMC:'||nvl(to_char(:old.glflksmc),'Пе')||'|'||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'Пе')||'|'||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'Пе')||'|'||'QBGLFLKSDM:'||nvl(to_char(:old.qbglflksdm),'Пе')||'|'||'QBGLFLKSMC:'||nvl(to_char(:old.qbglflksmc),'Пе')||'|'||'KHFL:'||nvl(to_char(:old.khfl),'Пе')||'|'||'SRM:'||nvl(to_char(:old.srm),'Пе')||'|'||'XH:'||nvl(to_char(:old.xh),'Пе')||'|'||'ZZPXXH:'||nvl(to_char(:old.zzpxxh),'Пе')||'|'||'ZFPB:'||nvl(to_char(:old.zfpb),'Пе')||'|'||'MJPB:'||nvl(to_char(:old.mjpb),'Пе')||'|'||'YCPB:'||nvl(to_char(:old.ycpb),'Пе')||'|'||'BZ:'||nvl(to_char(:old.bz),'Пе')||'|'||'DD:'||nvl(to_char(:old.dd),'Пе')||'|'||'BZCHB:'||nvl(to_char(:old.bzchb),'Пе')||'|'||'ISUPDATE:'||nvl(to_char(:old.isupdate),'Пе')||'|'||'GHKSDM:'||nvl(to_char(:old.ghksdm),'Пе')||'|');
    end if;
    if updating then
       if (nvl(:old.ksdm,'Пе') <> nvl(:new.ksdm,'Пе')) then --1
          ls_zdrz := ls_zdrz||'KSDM:'||nvl(to_char(:old.ksdm),'Пе')||'|'||nvl(to_char(:new.ksdm),'Пе')||';';
       end if;
       if (nvl(:old.ksmc,'Пе') <> nvl(:new.ksmc,'Пе')) then --2
          ls_zdrz := ls_zdrz||'KSMC:'||nvl(to_char(:old.ksmc),'Пе')||'|'||nvl(to_char(:new.ksmc),'Пе')||';';
       end if;
       if (nvl(:old.flksdm,'Пе') <> nvl(:new.flksdm,'Пе')) then --3
          ls_zdrz := ls_zdrz||'FLKSDM:'||nvl(to_char(:old.flksdm),'Пе')||'|'||nvl(to_char(:new.flksdm),'Пе')||';';
       end if;
       if (nvl(:old.flksmc,'Пе') <> nvl(:new.flksmc,'Пе')) then --3
          ls_zdrz := ls_zdrz||'FLKSMC:'||nvl(to_char(:old.flksmc),'Пе')||'|'||nvl(to_char(:new.flksmc),'Пе')||';';
       end if;
       if (nvl(:old.glflksdm,'Пе') <> nvl(:new.glflksdm,'Пе')) then --3
          ls_zdrz := ls_zdrz||'GLFLKSDM:'||nvl(to_char(:old.glflksdm),'Пе')||'|'||nvl(to_char(:new.glflksdm),'Пе')||';';
       end if;
       if (nvl(:old.glflksmc,'Пе') <> nvl(:new.glflksmc,'Пе')) then --3
          ls_zdrz := ls_zdrz||'GLFLKSMC:'||nvl(to_char(:old.glflksmc),'Пе')||'|'||nvl(to_char(:new.glflksmc),'Пе')||';';
       end if;
       if (nvl(:old.qbflksdm,'Пе') <> nvl(:new.qbflksdm,'Пе')) then --4
          ls_zdrz := ls_zdrz||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'Пе')||'|'||nvl(to_char(:new.qbflksdm),'Пе')||';';
       end if;
       if (nvl(:old.qbflksmc,'Пе') <> nvl(:new.qbflksmc,'Пе')) then --5
          ls_zdrz := ls_zdrz||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'Пе')||'|'||nvl(to_char(:new.qbflksmc),'Пе')||';';
       end if;
       if (nvl(:old.qbglflksdm,'Пе') <> nvl(:new.qbglflksdm,'Пе')) then --4
          ls_zdrz := ls_zdrz||'QBGLFLKSDM:'||nvl(to_char(:old.qbglflksdm),'Пе')||'|'||nvl(to_char(:new.qbglflksdm),'Пе')||';';
       end if;
       if (nvl(:old.qbglflksmc,'Пе') <> nvl(:new.qbglflksmc,'Пе')) then --5
          ls_zdrz := ls_zdrz||'QBGLFLKSMC:'||nvl(to_char(:old.qbglflksmc),'Пе')||'|'||nvl(to_char(:new.qbglflksmc),'Пе')||';';
       end if;
       if (nvl(:old.khfl,'Пе') <> nvl(:new.khfl,'Пе')) then --6
          ls_zdrz := ls_zdrz||'KHFL:'||nvl(to_char(:old.khfl),'Пе')||'|'||nvl(to_char(:new.khfl),'Пе')||';';
       end if;
       if (nvl(:old.srm,'Пе') <> nvl(:new.srm,'Пе')) then --7
          ls_zdrz := ls_zdrz||'SRM:'||nvl(to_char(:old.srm),'Пе')||'|'||nvl(to_char(:new.srm),'Пе')||';';
       end if;
       if (nvl(to_char(:old.xh),'Пе') <> nvl(to_char(:new.xh),'Пе')) then --8
          ls_zdrz := ls_zdrz||'XH:'||nvl(to_char(:old.xh),'Пе')||'|'||nvl(to_char(:new.xh),'Пе')||';';
       end if;
       if (nvl(to_char(:old.zzpxxh),'Пе') <> nvl(to_char(:new.zzpxxh),'Пе')) then --8
          ls_zdrz := ls_zdrz||'ZZPXXH:'||nvl(to_char(:old.zzpxxh),'Пе')||'|'||nvl(to_char(:new.zzpxxh),'Пе')||';';
       end if;
       if (nvl(to_char(:old.zfpb),'Пе') <> nvl(to_char(:new.zfpb),'Пе')) then --9
          ls_zdrz := ls_zdrz||'ZFPB:'||nvl(to_char(:old.zfpb),'Пе')||'|'||nvl(to_char(:new.zfpb),'Пе')||';';
       end if;
       if (nvl(to_char(:old.mjpb),'Пе') <> nvl(to_char(:new.mjpb),'Пе')) then --10
          ls_zdrz := ls_zdrz||'MJPB:'||nvl(to_char(:old.mjpb),'Пе')||'|'||nvl(to_char(:new.mjpb),'Пе')||';';
       end if;
       if (nvl(to_char(:old.ycpb),'Пе') <> nvl(to_char(:new.ycpb),'Пе')) then --11
          ls_zdrz := ls_zdrz||'YCPB:'||nvl(to_char(:old.ycpb),'Пе')||'|'||nvl(to_char(:new.ycpb),'Пе')||';';
       end if;
       if (nvl(:old.bz,'Пе') <> nvl(:new.bz,'Пе')) then --12
          ls_zdrz := ls_zdrz||'BZ:'||nvl(to_char(:old.bz),'Пе')||'|'||nvl(to_char(:new.bz),'Пе')||';';
       end if;
       if (nvl(:old.dd,'Пе') <> nvl(:new.dd,'Пе')) then --13
          ls_zdrz := ls_zdrz||'DD:'||nvl(to_char(:old.dd),'Пе')||'|'||nvl(to_char(:new.dd),'Пе')||';';
       end if;
       if (nvl(to_char(:old.bzchb),'Пе') <> nvl(to_char(:new.bzchb),'Пе')) then --14
          ls_zdrz := ls_zdrz||'BZCHB:'||nvl(to_char(:old.bzchb),'Пе')||'|'||nvl(to_char(:new.bzchb),'Пе')||';';
       end if;
       if (nvl(to_char(:old.isupdate),'Пе') <> nvl(to_char(:new.isupdate),'Пе')) then --15
          ls_zdrz := ls_zdrz||'ISUPDATE:'||nvl(to_char(:old.isupdate),'Пе')||'|'||nvl(to_char(:new.isupdate),'Пе')||';';
       end if;
       if (nvl(:old.ghksdm,'Пе') <> nvl(:new.ghksdm,'Пе')) then --16
          ls_zdrz := ls_zdrz||'GHKSDM:'||nvl(to_char(:old.ghksdm),'Пе')||'|'||nvl(to_char(:new.ghksdm),'Пе')||';';
       end if;
       
       if (length(ls_zdrz) > 0) then
          insert into czrzb(jlxh,czmc,czsj,jqm,ipdz,bm,gjz,zdrz)
          values(seq_czrzb_jlxh.nextval,'update',sysdate,ls_jqm,ls_ipdz,'ksdmb',to_char(:new.ksdm),ls_zdrz);
       end if;
    end if;
end TRI_KSDMB;
/
