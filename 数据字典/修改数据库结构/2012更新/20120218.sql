alter table ksdmb modify ksdm varchar2(20);
alter table ksdmb modify flksdm varchar2(20);
alter table ksdmb add ghksdm varchar2(20);
alter table jz_jzyjbrdjb add ghyyxh number(10);
alter table jz_jzyjbrdjb add ghsj date;
alter table jz_jzyjbrdjb_temp add ghyyxh number(10);
alter table jz_jzyjbrdjb_temp add ghsj date;
/

create index IDX_JZ_JZYJBRDJB_GHJLXH on JZ_JZYJBRDJB (
   GHJLXH ASC
);

/*==============================================================*/
/* Index: IDX_JZ_JZYJBRDJB_GHYYXH                               */
/*==============================================================*/
create index IDX_JZ_JZYJBRDJB_GHYYXH on JZ_JZYJBRDJB (
   GHYYXH ASC
);

/

alter table jz_jzyjbrdjb modify brxm null;
alter table jz_jzyjbrdjb modify xb null;
alter table jz_jzyjbrdjb modify lxdz null;
alter table jz_jzyjbrdjb_temp modify brxm null;
alter table jz_jzyjbrdjb_temp modify xb null;
alter table jz_jzyjbrdjb_temp modify lxdz null;
/


create or replace trigger TRI_KSDMB 
before insert or delete or update on ksdmb 
for each row
declare
    ll_jlxh number(10);
    ls_jqm  varchar2(50);
    ls_ipdz varchar2(15);
    ls_zdrz varchar2(500);
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
       values(seq_czrzb_jlxh.nextval,'delete',sysdate,ls_jqm,ls_ipdz,'ksdmb',to_char(:old.ksdm),'KSDM:'||nvl(to_char(:old.ksdm),'��')||'|'||'KSMC:'||nvl(to_char(:old.ksmc),'��')||'|'||'FLKSDM:'||nvl(to_char(:old.flksdm),'��')||'|'||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'��')||'|'||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'��')||'|'||'KHFL:'||nvl(to_char(:old.khfl),'��')||'|'||'SRM:'||nvl(to_char(:old.srm),'��')||'|'||'XH:'||nvl(to_char(:old.xh),'��')||'|'||'ZFPB:'||nvl(to_char(:old.zfpb),'��')||'|'||'MJPB:'||nvl(to_char(:old.mjpb),'��')||'|'||'YCPB:'||nvl(to_char(:old.ycpb),'��')||'|'||'BZ:'||nvl(to_char(:old.bz),'��')||'|'||'DD:'||nvl(to_char(:old.dd),'��')||'|'||'BZCHB:'||nvl(to_char(:old.bzchb),'��')||'|'||'ISUPDATE:'||nvl(to_char(:old.isupdate),'��')||'|'||'GHKSDM:'||nvl(to_char(:old.ghksdm),'��')||'|');
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
       if (nvl(:old.qbflksdm,'��') <> nvl(:new.qbflksdm,'��')) then --4
          ls_zdrz := ls_zdrz||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'��')||'|'||nvl(to_char(:new.qbflksdm),'��')||';';
       end if;
       if (nvl(:old.qbflksmc,'��') <> nvl(:new.qbflksmc,'��')) then --5
          ls_zdrz := ls_zdrz||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'��')||'|'||nvl(to_char(:new.qbflksmc),'��')||';';
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

create or replace view jzs_v_gh_mzyyk as
select * from gh_mzyyk where mzlbxh = 2
with read only;

create or replace view jzs_v_gh_ghks as
select a.ksdm,b.ksmc
  from gh_yzpbk a,gy_ksdm b 
 where a.ksdm = b.ksdm
   and mzlbxh = 2 
   and xq = to_char(sysdate,'D')
with read only;

grant select on jzs_v_gh_mzyyk to jzs;
grant insert on jzs_v_gh_mzyyk to jzs;
grant select on jzs_v_gh_ghks to jzs;

create or replace view jz_mzyyk as
select * from zjhis.jzs_v_gh_mzyyk;

create or replace view jz_ghks as
select * from zjhis.jzs_v_gh_ghks;
