SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[fuelldashboardanzeigeKette]
	@kettenID int
as
begin
	declare cur_dbakette cursor for(select unid from td_todo where tk_TodoKette_UNID = @kettenID)
	declare @u int
	open cur_dbakette
	fetch next from cur_dbakette into @u
	while @@FETCH_STATUS = 0
	begin
		exec fuelldashboardanzeige @u
		fetch next from cur_dbakette into @u
	end
	close cur_dbakette
	deallocate cur_dbakette
end

GO
