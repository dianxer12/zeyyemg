alter table jz_jzyjbrdjb add bah varchar2(10);
alter table jz_jzyjbrdjb_temp add bah varchar2(10);


alter table jz_jzlqxxdjb0 add bqdm varchar2(10);
alter table jz_jzlqxxdjb0_temp add bqdm varchar2(10);
alter table jz_jzlqxxdjb0 add ksdm varchar2(10);
alter table jz_jzlqxxdjb0_temp add ksdm varchar2(10);
alter table jz_jzlqxxdjb0 add ysgh varchar2(20);
alter table jz_jzlqxxdjb0_temp add ysgh varchar2(20);

--�ؽ�zjhis�û�����ͼ��zjhis.jzs_v_jz_inpatient
--�ؽ�jzs�û�����ͼ��jzs.jz_inpatient

--��zjhis�û�����ͼ��zjhis.jzs_v_jz_ksmc
--��jzs�û�����ͼ��jzs.jz_ksmc


alter table xtcsb modify csz1 varchar2(1000);
alter table xtcsb modify bz varchar2(1000);
alter table xtcsb modify csz2 NUMBER(10,2);
alter table xtcsb add pxxh number(10);

insert into xtcsb (XTXH, CSFL, CSMC, CSZ1, CSZ2, BZ, ISUPDATE, CSRQ, CSZ3, JLXH, PXXH)
values (5, 'YWCS', 'ϵͳ����', '', 30.00, '�������ƣ�ϵͳ�������������ã���ֵ�Ͳ�������λ�����ӣ���˵�����������ָ��ʱ����δ������ϵͳ�������������������¼�˿���󷽿ɽ�����', 1, null, null, 1158, 40);
commit;

--�ؽ�jzs�û��º�����uf_get_yjfj.plb

--20130219
--VERSION 1.0.198
--�ؽ�jzs�û��º�����uf_get_yjfj.plb
--�ؽ�zjhis�û�����ͼ��zjhis.jzs_v_jz_brjbxxk.sql
--�ؽ�zjhis�û��´洢���̣�zjhis.up_jzyygh2.plb  //δִ�� 

--20130409
--�ؽ�jzs�û�����ͼ��jzs.zjhis_v_jz_jzbrxx

--20130628
--version:1.0.208
���Ӳ�����
�������ƣ�Ψһ�ſ��ƣ��������ã��ַ��Ͳ�����˵�������û����á�����ʱ����Ψһ�ţ���������Ψһ�š�
�������ƣ�Ψһ�����ƣ��������ã��ַ��Ͳ�����˵����������Ϊ��ʱ�������Դ˲�����ʾΨһ�����ơ�
�������ƣ����������ӿ����ͣ��������ã��ַ��Ͳ�����˵����������Ϊ��ʱ��ϵͳͨ���ýӿ������Զ���������������Ϣ��
�������ƣ����������ļ�·�����������ã��ַ��Ͳ�����˵����������Ϊ��ʱ��ϵͳ�Ӹ�·���������������ӿ��ļ���
�������ƣ�����ʷ���������ã��ַ��Ͳ�����˵�������û����á�����ʱ�ɲ鿴�༭���˹���ʷ��
�������ƣ�LMP���������ã��ַ��Ͳ�����˵�������û����á�����ʱ�ɲ鿴�༭LMP��
�������ƣ�ת��ʱ�䣻�������ã��ַ��Ͳ�����˵�������û����á�����ʱ�ɲ鿴�༭ת��ʱ�䡣

���ӹ��ô��룺
�໤���豸(JHYSB)
����(ZSMC)
����Դ(GMY)


alter table jz_jzyjbrdjb add smtz_sbdm varchar2(100);
alter table jz_jzyjbrdjb_temp add smtz_sbdm varchar2(100);
alter table jz_jzyjbrdjb add smtz_sjsj date;
create index idx_jz_jzyjbrdjb_smtz_sjsj on jz_jzyjbrdjb(smtz_sjsj) nologging;
alter table jz_jzyjbrdjb_temp add smtz_sjsj date;
alter table jz_jzyjbrdjb add zsdm varchar2(20);
alter table jz_jzyjbrdjb_temp add zsdm varchar2(20);
alter table jz_jzyjbrdjb add zsmc varchar2(50);
alter table jz_jzyjbrdjb_temp add zsmc varchar2(50);
alter table jz_jzyjbrdjb add zgsj date;
alter table jz_jzyjbrdjb_temp add zgsj date;
alter table jz_jzyjbrdjb add lmp date;
alter table jz_jzyjbrdjb_temp add lmp date;
alter table jz_jzlqxxdjb modify lqzd varchar2(500);
alter table jz_jzlqxxdjb_temp modify lqzd varchar2(500);
alter table jz_jzlqxxdjb0 add lqzd varchar2(500);
alter table jz_jzlqxxdjb0_temp add lqzd varchar2(500);

create table jz_jzyjbrxx_gms
(
	jzkh	varchar2(20),
	bah 	varchar2(20),
	pxxh	number(4),
	brxm	varchar2(50),
	gmy 	varchar2(100),
	bz 	varchar2(200),
	djr 	varchar2(10),
	djrxm 	varchar2(20),
	djsj 	date,
	constraint pk_jz_jzyjbrxx_gms primary key(bah,pxxh)
);
create index idx_jz_jzyjbrxx_gms_1 on jz_jzyjbrxx_gms(jzkh);

--20130720
--version:1.0.209
���Ӳ�����
�������ƣ���ʶ���֣��������ã��ַ��Ͳ������ο�����ֵ��AVPU��GCS��˵������ʶ���ֲ���AVPU����GCS���ֱ�׼��

alter table jzs.jz_jzyjbrdjb add gcs_e number(1);
alter table jzs.jz_jzyjbrdjb add gcs_v number(1);
alter table jzs.jz_jzyjbrdjb add gcs_m number(1);

--�½�jzs�û��º�����uf_get_rts.plb
--�ؽ�jzs�û��º�����uf_get_yjfj.plb

create table sjckcsb
(
	dataobject	varchar2(50),
	columnname	varchar2(50),
	dbname			varchar2(50),
	constraint pk_sjckcsb primary key(dataobject,columnname)
)
/

--20131028
--version:1.0.214
���Ӳ�����
�������ƣ��ŶӽкŽӿ����񣻲������ã��ַ��Ͳ�����˵�������û����á�����ʱͨ�������ӿ������ȡ�ŶӽкŽӿ���Ϣ��
�������ƣ��ŶӽкŽӿ����ݿ����ͣ��������ã��ַ��Ͳ�����˵�������ݿ����ͣ�SQLSERVER��ORACLE�����ŶӽкŽӿ���������ʱͨ�������ӿ������ȡ�ŶӽкŽӿ���Ϣ��

--20131121
alter table jzs.jz_jzyjbrdjb modify jlxh VARCHAR2(18);
alter table jzs.jz_jzyjbrdjb modify cbzd VARCHAR2(200);
alter table jzs.jz_jzyjbrdjb add wddybz NUMBER(1);
alter table jzs.jz_jzyjbrdjb add jzzt NUMBER(1);
alter table jzs.jz_jzyjbrdjb modify jzzt default 0;
alter table jzs.jz_jzyjbrdjb add zlzt VARCHAR2(2);
alter table jzs.jz_jzyjbrdjb add szysgh VARCHAR2(10);

--jzs�û����½�ͬ���������zjhis�û��´洢���̣�zjhis.up_jzyygh2.plb
grant execute on ZJHIS.UP_JZYYGH2 to jzs;
create or replace synonym JZS.UP_JZYYGH2 for ZJHIS.UP_JZYYGH2;   //ORA-01031: insufficient privileges

--�½�zjhis�û��´洢���̣�zjhis.up_jzyygh.plb

--jzs�û����½�ͬ���������zjhis�û��´洢���̣�zjhis.up_jzyygh.plb
grant execute on ZJHIS.UP_JZYYGH to jzs;
create or replace synonym JZS.UP_JZYYGH for ZJHIS.UP_JZYYGH;  //ORA-01031: insufficient privileges

--20131220
--version:1.0.218
���Ӳ�����
�������ƣ�����Ԥ��Һţ��������ã��ַ��Ͳ������������ƣ�����Ԥ��Һţ��������ã��ַ��Ͳ�����˵�������û����á�����ʱԤ���Զ��Ҽ���ţ��շ�ʱͳһ��ȡ����Һ����Ʒѡ�


