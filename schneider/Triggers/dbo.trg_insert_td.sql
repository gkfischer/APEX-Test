SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_insert_td] on [dbo].[td_todo] for insert
as 
begin
	declare @unid int
	declare @rolle varchar(15)
	declare cur_td_insert cursor for select unid, rol_Rolle_UNID from inserted i join rol_tt_RolleZuTemplate rtt on rtt.tt_TodoTemplate_UNID = i.tt_TodoTemplate_UNID
	open cur_td_insert
	fetch next from cur_td_insert into @unid,@rolle
	while @@FETCH_STATUS = 0
	begin
		insert into rbt_RolleBerechtigtFuerTodo values (@rolle,@unid, 'system')
		fetch next from cur_td_insert into @unid,@rolle
	end
	update tk_TodoKette set tk_lastupdated = getdate() where unid in (select tk_TodoKette_unid from inserted)
	close cur_td_insert
	deallocate cur_td_insert
end
GO
