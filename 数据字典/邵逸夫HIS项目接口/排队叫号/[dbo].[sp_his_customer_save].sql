set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

-- =============================================
-- Author:		<yejm>
-- Create date: <20130906>
-- Description:	<急诊呼叫队列>
-- =============================================
ALTER PROCEDURE [dbo].[sp_his_customer_save]
	(
		@al_mrn int,   --病历号 not null
		@al_series int,   --就诊次数 not null
		@as_pname varchar(100), --姓名 not null
		@as_psex varchar(1),   --性别[F(女),M(男)] not null
		@as_registerid varchar(10),   --序号：格式000 not null
		@adt_rdate datetime,	--分诊时间 not null
		@as_return0 varchar(100) output,
		@ai_ireturn0 int output  --  》=0：成功
	)
AS
BEGIN
	declare @sys_ireturn int
	declare @sys_rows int
	declare @cTemp varchar(20)
	declare @al_interid int
	declare @as_ptype varchar(10)
	declare @as_sid varchar(10)
	declare @as_regno varchar(10)
	declare @as_deptid varchar(10)
	declare @as_ampm varchar(10)
	declare @as_qid varchar(10)
	declare @as_todaysid varchar(20)
	declare @al_intersid int

	SET NOCOUNT ON;
	set @as_deptid='80' --急诊科室号
	set @as_ptype='3' --急诊类型
	set @as_qid='881' --急诊队列号
	set @as_ampm='AP' --不区分上下午
	set @as_regno=right(@as_registerid,3)
	set @as_sid=right(@as_registerid,4)
	set @as_todaysid=convert(varchar(10),@adt_rdate,112)+@as_regno
	set @al_intersid=CAST(@as_registerid AS INT) * 10

	begin TRANSACTION abc1

	select @al_interid=sysp1 from hissys with (updlock,rowlock) where rdn = 4000
	if @al_interid=null or @@error<>0
	begin
		set @ai_ireturn0=-1
		set @as_return0='取最大值失败'		
		goto endsave
	end
	update hissys set sysp1 = sysp1 + 1  where rdn = 4000

	insert dbo.customer(interid,   pname,   psex,   mrn,   registerid,   
						deptid,   ptype,   qid,   sid,   active,   
						rdate,   statusflag,   showflag,   sub_flag,   bzflag,   
						ampm,   source,   series,   todaysid,   intersid,
						getdate  )
				values( @al_interid,@as_pname,@as_psex,@al_mrn,@as_regno,
						@as_deptid,@as_ptype,@as_qid,@as_sid,'1',
						@adt_rdate,'0','1','0','0',
						@as_ampm,'3',@al_series,@as_todaysid,@al_intersid,
						getdate())
	if @@error=0 and @@rowcount<>0
	begin
		set @ai_ireturn0=0
		set @as_return0='成功'
	end
	else
	begin
		set @ai_ireturn0=-1
		set @as_return0='失败'
	end

	endsave:
	if @ai_ireturn0=0
		commit transaction abc1
	else
		rollback transaction abc1
	return
END






