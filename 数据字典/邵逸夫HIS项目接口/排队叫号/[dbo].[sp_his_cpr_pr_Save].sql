CREATE PROCEDURE [dbo].[sp_his_cpr_pr_Save]
	(
		@mrn0		int,   --������ not null
		@series0	int,   --������� not null
		@pname0		varchar(30), --���� not null
		@psex0		char(4),   --�Ա�[F(Ů),M(��)] not null
		@age		char(4),	-- ����
		@precode0	varchar(250),  -- ��������  (��������ƴ���ַ�����
		@remark0    varchar(250),  -- ��ע
		@dr0		varchar(10),   -- ҽ������	��ͬ�����˹��ţ�
		@deptid0    varchar(10),   -- ���ź� 80
		@operjp0	varchar(10),   -- �����˹���	
		@sreturn0	varchar(100) output,
		@ireturn0	int output  --  ��=0���ɹ�
	)


��������   - ����������Ϣƴ��һ���ַ���
SELECT series from pmain where mrn=:������
ҽ�����źͲ����˹���ͬΪ��ʿ����
���ź�=80