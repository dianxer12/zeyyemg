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
       values(seq_czrzb_jlxh.nextval,'delete',sysdate,ls_jqm,ls_ipdz,'ksdmb',to_char(:old.ksdm),'KSDM:'||nvl(to_char(:old.ksdm),'Пе')||'|'||'KSMC:'||nvl(to_char(:old.ksmc),'Пе')||'|'||'FLKSDM:'||nvl(to_char(:old.flksdm),'Пе')||'|'||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'Пе')||'|'||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'Пе')||'|'||'KHFL:'||nvl(to_char(:old.khfl),'Пе')||'|'||'SRM:'||nvl(to_char(:old.srm),'Пе')||'|'||'XH:'||nvl(to_char(:old.xh),'Пе')||'|'||'ZFPB:'||nvl(to_char(:old.zfpb),'Пе')||'|'||'MJPB:'||nvl(to_char(:old.mjpb),'Пе')||'|'||'YCPB:'||nvl(to_char(:old.ycpb),'Пе')||'|'||'BZ:'||nvl(to_char(:old.bz),'Пе')||'|'||'DD:'||nvl(to_char(:old.dd),'Пе')||'|'||'BZCHB:'||nvl(to_char(:old.bzchb),'Пе')||'|'||'ISUPDATE:'||nvl(to_char(:old.isupdate),'Пе')||'|'||'GHKSDM:'||nvl(to_char(:old.ghksdm),'Пе')||'|');
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
       if (nvl(:old.qbflksdm,'Пе') <> nvl(:new.qbflksdm,'Пе')) then --4
          ls_zdrz := ls_zdrz||'QBFLKSDM:'||nvl(to_char(:old.qbflksdm),'Пе')||'|'||nvl(to_char(:new.qbflksdm),'Пе')||';';
       end if;
       if (nvl(:old.qbflksmc,'Пе') <> nvl(:new.qbflksmc,'Пе')) then --5
          ls_zdrz := ls_zdrz||'QBFLKSMC:'||nvl(to_char(:old.qbflksmc),'Пе')||'|'||nvl(to_char(:new.qbflksmc),'Пе')||';';
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
