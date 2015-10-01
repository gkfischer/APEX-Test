SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[fuellDashboardKommentare] 
	@todoid int,
	@kunid int,
	@aktivierdatum datetime,
	@user varchar(MAX),
	@erledigDatum datetime,
	@erstelldatum datetime
as
begin
	declare cur_x cursor for (select ft_laufendenr, ft_position, ft_class, ft_faclass from ft_FunktionsTemplate where ft_text = 'Kommentare' and tt_TodoTemplate_UNID = (select tt_TodoTemplate_UNID from td_Todo where unid = @todoid))	
	declare @lfndr int
	declare @pos int
	declare @ccount int
	declare @class varchar(MAX)
	declare @faclass varchar(MAX)
	declare @userID varchar(33)
	open cur_x
	fetch next from cur_x into @lfndr, @pos, @class, @faclass
	close cur_x
	deallocate cur_x
	if exists(select * from kmt_Kommentar kmt join KommentarZuTodo kzt on kmt.unid = kzt.kmt_Kommentar_UNID where kzt.td_Todo_UNID = @todoid)
	begin
		declare cur3 cursor for (

			--declare @todoId int = 1
			select lwd.u_user_UNID, count(*) as 'Anzahl' from kmt_kommentar kmt
				join KommentarZuTodo kzt on kmt.unid = kzt.kmt_Kommentar_UNID
				join lwd_lastviewed lwd on kzt.td_Todo_UNID = lwd.td_Todo_UNID
				join uhr_userHatRolle uhr on uhr.u_user_unid = lwd.u_user_unid
					where kmt.kmt_erstelltAm > lwd.lwd_ztpkt and kzt.td_todo_unid = @todoid
				group by lwd.u_user_UNID);
		open cur3
		fetch next from cur3 into @userID,@ccount
		if not exists(select * from dba_dashboardanzeige where unid = @todoid and dba_position = @pos and dba_laufendenr = @lfndr)
		begin
			insert into dba_dashboardanzeige
					values (@todoid, @kunid, convert(varchar,@erstelldatum,104) + ' '+convert(varchar,@erstelldatum,108)
						, convert(varchar,@aktivierdatum,104) + ' '+ convert(varchar,@aktivierdatum,108), convert(varchar,@erledigDatum,104)
						 + ' '+convert(varchar,@erledigDatum,108), @user, @lfndr, @pos, 'LI', '/|DB-Name|/xp_overview.xsp?docid=|UNID|#kommentare'
						, @ccount, null, @class, @faclass,@userID);
			print 'a'
		end
		--while @@FETCH_STATUS = 0
		--begin
			
		--	--fetch next from cur3 into @userID,@ccount
		--end
		close cur3
		deallocate cur3
	end
	else
	insert into dba_dashboardanzeige
					values (@todoid, @kunid, convert(varchar,@erstelldatum,104) + ' '+convert(varchar,@erstelldatum,108)
						, convert(varchar,@aktivierdatum,104) + ' '+ convert(varchar,@aktivierdatum,108), convert(varchar,@erledigDatum,104)
						 + ' '+convert(varchar,@erledigDatum,108), @user, @lfndr, @pos, 'LI', '/|DB-Name|/xp_overview.xsp?docid=|UNID|#kommentare'
						, '', null, @class, @faclass,@userID);
	
	/*
	else
	begin
		declare cur4 cursor for(
			select u_user_unid from uhr_userhatrolle uhr where uhr.rol_rolle_unid in(
				select rol_Rolle_UNID from rbt_RolleBerechtigtFuerTodo rbt)
		)
		open cur4
		fetch next from cur4 into @userID
		while @@FETCH_STATUS = 0
		begin
			insert into dba_dashboardanzeige
				values (@todoid, @kunid, convert(varchar,@erstelldatum,104) + ' '+convert(varchar,@erstelldatum,108), convert(varchar,@aktivierdatum,104) + ' '+convert(varchar,@aktivierdatum,108), convert(varchar,@erledigDatum,104) + ' '+convert(varchar,@erledigDatum,108), @user, @lfndr, @pos, 'LI', '/|DB-Name|/xp_overview.xsp?docid=|UNID|#kommentare', 0, null, 'who hvr-float', 'fa fa-comment-o fa-2x',@userID);
			fetch next from cur4 into @userID
		end
		close cur4
		deallocate cur4
	end*/
	
end



GO
