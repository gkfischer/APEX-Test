SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[neuesstarttodo]
	@templateid varchar(33),
	@key1 varchar(100) = '',
	@key2 varchar(100) = '',
	@key3 varchar(100) = '',
	@key4 varchar(100) = '',
	@key5 varchar(100) = '',
	@key6 varchar(100) = '',
	@key7 varchar(100) = '',
	@key8 varchar(100) = ''
as
begin
	print @templateid
	if exists(select * from tt_todotemplate where unid = @templateid)
	begin
		declare @todoid int
		declare @newKey1 varchar(97) = ''
		declare @newKey2 varchar(97) = ''
		declare @newKey3 varchar(97) = ''
		declare @newKey4 varchar(97) = ''
		declare @newKey5 varchar(97) = ''
		declare @newKey6 varchar(97) = ''
		declare @newKey7 varchar(97) = ''
		declare @newKey8 varchar(97) = ''
		declare @nr1 int = 0
		declare @nr2 int = 0
		declare @nr3 int = 0
		declare @nr4 int = 0
		declare @nr5 int = 0
		declare @nr6 int = 0
		declare @nr7 int = 0
		declare @nr8 int = 0
		begin tran t1
			insert into tk_todokette (tk_status, updatedBy) values ('0', 'sys');
			insert into td_todo (tk_todokette_unid, td_status, td_aktiviertam, tt_todotemplate_unid, updatedBy)
			values((select max(unid) from tk_todokette), '0', getdate(), @templateid, 'sys');

			select @todoid = max(unid) from td_todo

			if(@key1 <> '')
			begin
				select @nr1 = (select top 1 splitdata from dbo.fnSplitString(@key1,'|'));
				select @newKey1 = (select splitdata from dbo.fnSplitString(@key1,'|') except select top 1 * from dbo.fnSplitString(@key1,'|'));
				insert into key_key values(@todoid, @nr1, @newKey1);
			end
			if(@key2 <> '') 
			begin
				select @nr2 = (select top 1 splitdata from dbo.fnSplitString(@key2,'|'));
				select @newKey2 = (select splitdata from dbo.fnSplitString(@key2,'|') except select top 1 * from dbo.fnSplitString(@key2,'|'));
				insert into key_key values(@todoid, @nr2, @newKey2);
			end
			if(@key3 <> '') 
			begin
				select @nr3 = (select top 1 splitdata from dbo.fnSplitString(@key3,'|'));
				select @newKey3 = (select splitdata from dbo.fnSplitString(@key3,'|') except select top 1 * from dbo.fnSplitString(@key3,'|'));
				insert into key_key values(@todoid, @nr3, @newKey3);
			end
			if(@key4 <> '') 
			begin
				select @nr4 = (select top 1 splitdata from dbo.fnSplitString(@key4,'|'));
				select @newKey4 = (select splitdata from dbo.fnSplitString(@key4,'|') except select top 1 * from dbo.fnSplitString(@key4,'|'));
				insert into key_key values(@todoid, @nr4, @newKey4);
			end
			if(@key5 <> '') 
			begin
				select @nr5 = (select top 1 splitdata from dbo.fnSplitString(@key5,'|'));
				select @newKey5 = (select splitdata from dbo.fnSplitString(@key5,'|') except select top 1 * from dbo.fnSplitString(@key5,'|'));
				insert into key_key values(@todoid, @nr5, @newKey5);
			end
			if(@key6 <> '') 
			begin
				select @nr6 = (select top 1 splitdata from dbo.fnSplitString(@key6,'|'));
				select @newKey6 = (select splitdata from dbo.fnSplitString(@key6,'|') except select top 1 * from dbo.fnSplitString(@key6,'|'));
				insert into key_key values(@todoid, @nr6, @newKey6);
			end
			if(@key7 <> '')
			begin
				select @nr7 = (select top 1 splitdata from dbo.fnSplitString(@key7,'|'));
				select @newKey7 = (select splitdata from dbo.fnSplitString(@key7,'|') except select top 1 * from dbo.fnSplitString(@key7,'|'));
				insert into key_key values(@todoid, @nr7, @newKey7);
			end
			if(@key8 <> '') 
			begin
				select @nr8 = (select top 1 splitdata from dbo.fnSplitString(@key8,'|'));
				select @newKey8 = (select splitdata from dbo.fnSplitString(@key8,'|') except select top 1 * from dbo.fnSplitString(@key8,'|'));
				insert into key_key values(@todoid, @nr8, @newKey8);
			end

			
			select @todoid
			exec fuelldashboardanzeige @todoid
		commit tran t1
	end
	else
	begin
		raiserror ('konnte todo nicht erzeugen! kein template mit dieser unid vorhanden!',16,1)
	end
end






GO
