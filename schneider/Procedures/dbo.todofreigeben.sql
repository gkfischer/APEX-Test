SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[todofreigeben]
	@todoid int
as
begin
	declare @t_unid varchar(33)
	declare @t_unid_tmp varchar(33)
	declare @k_unid int
	declare @newtodoid int

	declare cur cursor for 
		select tt_todotemplate_unid1 from ttn_nachfolger where tt_todotemplate_unid = (select tk_todokette_unid from td_todo where unid = @todoid)

	if exists(select * from td_todo where unid = @todoid)
	begin
		select @k_unid = tk_todokette_unid from td_todo where unid = @todoid;
		open cur

		fetch next from cur into @t_unid_tmp
		while @@fetch_status = 0 begin
			insert into td_todo (tk_todokette_unid, td_status, td_aktiviertam, tt_todotemplate_unid)
				values(@k_unid, 'u', getdate(),@t_unid_tmp)
			fetch next from cur into @t_unid_tmp
		end
		close cur
		deallocate cur

		--select unid from td_todo where td_status = 'u' and tk_todokette_unid = @k_unid

		declare cur2 cursor for
			(select unid from td_todo where td_status = 'u' and tk_todokette_unid = @k_unid)
		open cur2
		fetch next from cur2 into @newtodoid

		while @@fetch_status = 0 begin
			insert into tdv_todovorgaenger values(@newtodoid, @todoid,'sys',null);
			insert into tdn_todonachfolger values(@todoid,@newtodoid,'sys');
			fetch next from cur2 into @newtodoid
		end
		close cur2
		deallocate cur2
		update td_todo set td_status = '0' where tk_todokette_unid = @k_unid and td_status = 'u'
		update td_todo set td_status = '1' where unid = @todoid
	end
	else
	begin
		raiserror ('konnte todo nicht freigeben! kein todo mit dieser unid vorhanden!',16,1)
	end
end


GO
