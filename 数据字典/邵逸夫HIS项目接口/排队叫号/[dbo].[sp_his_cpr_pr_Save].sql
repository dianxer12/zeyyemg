CREATE PROCEDURE [dbo].[sp_his_cpr_pr_Save]
	(
		@mrn0		int,   --病历号 not null
		@series0	int,   --就诊次数 not null
		@pname0		varchar(30), --姓名 not null
		@psex0		char(4),   --性别[F(女),M(男)] not null
		@age		char(4),	-- 年龄
		@precode0	varchar(250),  -- 病历内容  (生命体征拼接字符串）
		@remark0    varchar(250),  -- 备注
		@dr0		varchar(10),   -- 医生工号	（同操作人工号）
		@deptid0    varchar(10),   -- 部门号 80
		@operjp0	varchar(10),   -- 操作人工号	
		@sreturn0	varchar(100) output,
		@ireturn0	int output  --  》=0：成功
	)


病历内容   - 生命体征信息拼成一个字符串
SELECT series from pmain where mrn=:病历号
医生工号和操作人工号同为护士工号
部门号=80