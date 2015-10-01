SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_delete_rol_tt] on [dbo].[rol_tt_RolleZuTemplate]
for delete
as
begin
	declare cur_rol_tt cursor for (select rol_Rolle_UNID, tt_TodoTemplate_UNID from deleted);
	declare @r varchar(33)
	declare @t varchar(33)
	open cur_rol_tt
	fetch next from cur_rol_tt into @r,@t
	while @@FETCH_STATUS = 0
	begin
		declare sub_cur_rol_tt cursor for (select unid from td_Todo where tt_TodoTemplate_UNID = @t)
		declare @u int
		open sub_cur_rol_tt
		fetch next from sub_cur_rol_tt into @u
		while @@FETCH_STATUS = 0
		begin
			if exists(select * from rbt_RolleBerechtigtFuerTodo where td_Todo_UNID = @u and rol_Rolle_UNID = @r)
				delete rbt_RolleBerechtigtFuerTodo where rol_Rolle_UNID = @r and td_Todo_UNID = @u
			fetch next from sub_cur_rol_tt into @u
		end
		close sub_cur_rol_tt
		deallocate sub_cur_rol_tt
		fetch next from cur_rol_tt into @r,@t
	end
	close cur_rol_tt
	deallocate cur_rol_tt
end
GO
