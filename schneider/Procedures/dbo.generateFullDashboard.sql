SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[generateFullDashboard]
AS
BEGIN
	SET NOCOUNT ON;

	declare @unid int
    declare cur cursor for select unid from td_todo;
	open cur
	fetch next from cur into @unid
	while @@FETCH_STATUS = 0
	begin
		exec fuelldashboardanzeige @unid
		fetch next from cur into @unid
	end
	close cur
	deallocate cur
END

GO
