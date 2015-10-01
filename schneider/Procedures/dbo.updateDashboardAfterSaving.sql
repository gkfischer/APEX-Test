SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateDashboardAfterSaving] @key varchar(33)
as
begin
	declare curudas cursor for 
	(select distinct tk_TodoKette_UNID from td_Todo where td_status not in (2,3) and unid in (select unid from key_key where key_wert = @key))
	declare @tk int
	open curudas
	fetch next from curudas into @tk
	while @@FETCH_STATUS = 0
	begin
		exec fuelldashboardanzeigeKette @tk
		fetch next from curudas into @tk
	end
	close curudas
	deallocate curudas
end
GO
