SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trg_artikel_delete] on [dbo].[atl_artikel] for delete
as
begin
	declare cur_artikel_delete cursor for (select unid, updatedBy from deleted d);
	open cur_artikel_delete
	declare @u varchar(20)
	declare @ud varchar(MAX)
	declare @d datetime = getdate()
	fetch next from cur_artikel_delete into @u, @ud
	while @@FETCH_STATUS = 0
	begin
		if @ud = 'IMPORT'
			insert into import_log values (@d, 'Artikel #'+@u+' geloescht. Grund: Nicht alle erforderlichen Felder enthielten Daten. (Preis, PlanPrice, StandardCosts)')
		fetch next from cur_artikel_delete into @u, @ud
	end
	close cur_artikel_delete
	deallocate cur_artikel_delete
end
GO
