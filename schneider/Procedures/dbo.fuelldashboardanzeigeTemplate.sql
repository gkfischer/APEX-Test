SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[fuelldashboardanzeigeTemplate]
	@ttunid varchar(33)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare cur_fdbat cursor for (select unid from td_Todo where tt_TodoTemplate_UNID = @ttunid)
	declare @unid int
	open cur_fdbat
	fetch next from cur_fdbat into @unid
	while @@FETCH_STATUS = 0
	begin
		exec fuelldashboardanzeige @unid
		fetch next from cur_fdbat into @unid
	end
	close cur_fdbat
	deallocate cur_fdbat
    
END

GO
