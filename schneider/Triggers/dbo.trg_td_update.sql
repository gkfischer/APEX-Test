SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_td_update] on [dbo].[td_todo] for update
as
begin
	update tk_TodoKette set tk_lastupdated = getdate() where unid in (select tk_TodoKette_unid from inserted)
end
GO
