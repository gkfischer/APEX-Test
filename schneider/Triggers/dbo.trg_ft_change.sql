SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_ft_change] on [dbo].[ft_funktionstemplate] for insert,update,delete
as

begin
	declare cur_trg_ft_change cursor for (select tt_todotemplate_UNID from inserted union select tt_todotemplate_UNID from deleted)
	declare @unid varchar(33)
	open cur_trg_ft_change
	fetch next from cur_trg_ft_change into @unid
	while @@FETCH_STATUS = 0
	begin
		exec fuelldashboardanzeigeTemplate @unid
		fetch next from cur_trg_ft_change into @unid
	end
end
GO
