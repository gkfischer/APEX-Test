SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trg_tii_insert_update] on [dbo].[tii_ticketInfo] for insert, update
as
begin

	update tii_ticketInfo set tii_gesamtumsatz = (tii_stueckzahl * tii_artikellistenpreis) * (100 - tii_rabatt_VI) / 100 where atl_artikel_UNID is not null and tii_rabatt_PM is null
	update tii_ticketInfo set tii_gesamtumsatz = (tii_stueckzahl * tii_artikellistenpreis) * (100 - tii_rabatt_PM) / 100 where atl_artikel_UNID is not null and tii_rabatt_PM is not null

	if update(atl_artikel_unid)
	begin
		declare cur_trg_tii_insert_update cursor for (select unid, atl_artikel_unid from inserted)
		declare @unid int
		declare @atl_unid varchar(max)
		declare @listpreis decimal(19,2)
		open cur_trg_tii_insert_update
		fetch next from cur_trg_tii_insert_update into @unid, @atl_unid
		while @@FETCH_STATUS = 0
		begin
			update tii_ticketInfo set tii_artikellistenpreis = (select top 1 mil_listpreis from mil_materialinliste where atl_artikel_UNID = @atl_unid order by mil_gueltigVon desc) where unid = @unid
			fetch next from cur_trg_tii_insert_update into @unid, @atl_unid
		end
	end

	update tii_ticketInfo set tii_gesamtumsatz = (tii_stueckzahl * tii_artikellistenpreis) * (100 - tii_rabatt_VI) / 100 where atl_artikel_UNID is not null and tii_rabatt_PM is null
	update tii_ticketInfo set tii_gesamtumsatz = (tii_stueckzahl * tii_artikellistenpreis) * (100 - tii_rabatt_PM) / 100 where atl_artikel_UNID is not null and tii_rabatt_PM is not null
end
GO
