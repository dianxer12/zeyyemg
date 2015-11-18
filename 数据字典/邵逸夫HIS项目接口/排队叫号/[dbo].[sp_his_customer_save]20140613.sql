存储过程定义
ALTER PROCEDURE [dbo].[sp_his_customer_save]
	(
		@al_mrn int,   --病历号 not null
		@al_series int,   --就诊次数 not null
		@as_pname varchar(100), --姓名 not null		
		@as_psex varchar(1),   --性别[F(女),M(男)] not null		
		@as_registerid varchar(10),   --序号：格式000 not null
		@as_pcid varchar(100), --诊室 not null
		@adt_rdate datetime,	--分诊时间 not null
		@as_return0 varchar(100) output,
		@ai_ireturn0 int output  --  》=0：成功
	)
AS

1. 增加了参数 @as_pcid varchar(100), --诊室 not null
2  as_pcid 应填值为EM01,EM02,EM03,EM04,EM05,EM06,EM07,EM08,EM09,EM10,对应诊室 1-10.