SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[setzrollenfuertemplate]
	@templateid varchar(33),
	@rollen varchar(MAX)
AS
BEGIN
	DECLARE @rolle varchar(max)
	declare @rollsinserted int
	declare @totalnminserts int
	declare cur cursor for select * from dbo.fnSplitString(@rollen,';')
	open cur
	
	fetch next from cur into @rolle
	while @@fetch_status = 0 
	begin
		if not exists (select * from rol_rolle where UNID = @rolle)
		BEGIN
			insert into rol_rolle (UNID) values (@rolle)
			set @rollsinserted = @rollsinserted + 1
		END
		if(not exists(select * from rol_tt_rollezutemplate where tt_todotemplate_unid = @templateid and rol_rolle_unid = @rolle))
		begin
			insert into rol_tt_RolleZuTemplate values(@templateid,@rolle,'sys')
			set @totalnminserts = @totalnminserts + 1
		end
		fetch next from cur into @rolle
	END
	close cur
	deallocate cur
END

GO
