SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[fuelldashboardanzeige]
	@todoid int
as
begin
	--declare @todoid int = 90
	declare @kunid int
	declare @aktivierdatum datetime
	declare @lfndr int
	declare @pos int
	declare @user varchar(MAX)
	declare @erledigDatum datetime
	declare @erstelldatum datetime
	declare @kat varchar(max)
	declare @val1 varchar(max)
	declare @val2 varchar(max)
	declare @val3 varchar(max)
	declare @style1 varchar(max)
	declare @style2 varchar(max)
	declare @stat char(1)

	set @stat = '1'
	--declare @todoid int =109
	if not exists(select * from td_Todo td join tk_TodoKette tk on tk.unid = td.tk_TodoKette_UNID where td.unid = @todoid and (tk_status = 1 or td.td_Status = 3))
	begin
		set @stat = '0'
	end
	delete dba_dashboardanzeige where unid = @todoid
	if(@stat = '0')
	begin

		
		insert into dba_dashboardanzeige (UNID, dba_kettenid, dba_erstellungsdatum, dba_aktiviertam, dba_erledigtam, dba_erledigtDurchUser, dba_laufendenr, dba_position,  dba_typ, dba_value1, dba_value2, dba_value3, dba_style1, dba_style2)
		--declare @todoid int = 329
		select td.unid, tk_todokette_unid, td_erstelltAm, td_aktiviertAm, td_erledigtAm, u_anzeigename, ft_laufendenr, ft_position, ft_kategorie, ft_text, replace(ft_funktionsname,'|globUNID|',+''''+ft.unid+''''), ft_target_blank as 'v3', ft_class, ft_faclass 
		from td_todo td
			join tt_TodoTemplate tt on td.tt_TodoTemplate_UNID = tt.unid
			join ft_FunktionsTemplate ft on ft.tt_TodoTemplate_UNID = tt.unid
			left join u_user u on td.u_user_unid = u.unid
		where td.unid = @todoid and ft_amDashboard = '1' and td.td_Status <> '2' and ft_kategorie = 'BU' and ft_istOffline <> '0'
		--insert into dba_dashboardanzeige
		--		values (@todoid, @kunid, @erstelldatum, @aktivierdatum, @erledigDatum, @user, 4, 3, 'LI', 'xp_overview?docid=|UNID|', null, null, 'who hvr-float', 'fa fa-eye fa-2x',null);
		declare cur2 cursor for
		(

			--declare @todoid int = 125
			select td.tk_todokette_unid, td_erstelltAm, td_aktiviertAm, td_erledigtAm, u_anzeigename, vf_laufendenr, vf_position,vf_inputtyp, vf_schluesselfeld, vf_column, vf_table, coalesce(vf_anzeigename,'') from vf_visibleField vf
				join tt_todotemplate tt on vf.tt_todotemplate_unid = tt.unid
				join td_todo td on td.tt_todotemplate_unid = tt.unid
				left join u_user u on td.u_user_unid = u.unid
				where td.unid = @todoid and vf_istoffline <> '0'
		)
		open cur2
		declare @col varchar(MAX)
		declare @tab varchar(MAX)
		declare @key varchar(MAX)	
		DECLARE @SQLString nvarchar(500);
		DECLARE @ParmDefinition nvarchar(500);
		DECLARE @OUTPUT VARCHAR(MAX)
		DECLARE @anzeigename varchar(MAX)
		fetch next from cur2 into @kunid, @erstelldatum, @aktivierdatum, @erledigDatum, @user, @lfndr, @pos, @kat,  @key, @col, @tab, @anzeigename

		--insert into dba_dashboardanzeige
		--		values (@todoid, @kunid, convert(varchar,@erstelldatum,104) + ' '+convert(varchar,@erstelldatum,108), convert(varchar,@aktivierdatum,104) + ' '+convert(varchar,@aktivierdatum,108), convert(varchar,@erledigDatum,104) + ' '+convert(varchar,@erledigDatum,108), @user, 65, 1, 'LI', 'javascript:changeTodoUser(|UNID|)', 
		--		(select u_kuerzel from td_todo td left join u_user u on u.UNID = td.td_fk_u_zugewiesenAn where td.unid = @todoid), 
		--		(select u_anzeigename from td_todo td left join u_user u on u.UNID = td.td_fk_u_zugewiesenAn where td.unid = @todoid), 
		--		'who hvr-float', 'fa fa-plus fa-2x',null);
		while @@FETCH_STATUS = 0
		begin
			SET @OUTPUT = ''
		
			SET @SQLString = N'SELECT @COLUMN = '+ @col+' FROM '+@tab+' WHERE UNID = (SELECT key_wert FROM key_key WHERE UNID = '+ CONVERT(varchar,@todoid)+' and key_nr = (select at_sort from at_atom where at_kategorie = ''TABLEKEYS'' and at_schluessel = '''+@tab+'''))';
			--SET @SQLString = N'SELECT @COLUMN = '+ @col+' FROM '+@tab+' WHERE UNID = (SELECT '+@key+' FROM TD_TODO WHERE UNID = '+ CONVERT(varchar,@todoid)+')';
			SET @ParmDefinition = N'@COLUMN VARCHAR(MAX) OUTPUT';
			--print @SQLString
			EXECUTE sp_executesql @SQLString, @ParmDefinition, @COLUMN = @OUTPUT OUTPUT;
			if @col in (select column_name from INFORMATION_SCHEMA.columns where data_type like 'dat%')
				set @OUTPUT = convert(varchar(11),convert(date,@OUTPUT),104)
			set @OUTPUT = @anzeigename + ' ' +coalesce(@OUTPUT,'')
			print @SQLString
			insert into dba_dashboardanzeige 
					(UNID, dba_kettenid, dba_erstellungsdatum, dba_aktiviertam, dba_erledigtam, dba_erledigtDurchUser, dba_laufendenr, dba_position, dba_typ, dba_value1, dba_value2, dba_value3, dba_style1, dba_style2)
				values (@todoid, @kunid, convert(varchar,@erstelldatum,104) + ' '+convert(varchar,@erstelldatum,108), convert(varchar,@aktivierdatum,104) + ' '+convert(varchar,@aktivierdatum,108), convert(varchar,@erledigDatum,104) + ' '+convert(varchar,@erledigDatum,108), @user, @lfndr, @pos, @kat, @OUTPUT, null, null, null, null);
			fetch next from cur2 into @kunid, @erstelldatum, @aktivierdatum, @erledigDatum, @user, @lfndr, @pos, @kat, @key, @col, @tab, @anzeigename
		end
		close cur2
		deallocate cur2
		set @lfndr = (select ft_laufendenr from ft_FunktionsTemplate where ft_text = 'Kommentare' and tt_TodoTemplate_UNID = (select tt_TodoTemplate_UNID from td_Todo where unid = @todoid))
		set @pos = 1
		--exec fuellDashboardKommentare @todoid, @kunid, @aktivierdatum, @user, @erledigDatum, @erstelldatum
	end
end
GO
