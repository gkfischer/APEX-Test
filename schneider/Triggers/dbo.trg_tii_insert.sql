SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trg_tii_insert] on [dbo].[tii_ticketInfo] for insert
as
begin
	if TRIGGER_NESTLEVEL() = 0
	begin
		declare cur_trg_tii_insert cursor for (select unid, ti_ticket_UNID, atl_artikel_UNID, cs1_cos1_UNID, cs2_cos2_UNID, cs3_cos3_UNID, tii_bulkinsert from tii_ticketInfo)
		declare @u int
		declare @ti int
		declare @atl varchar(20)
		declare @cos1 char(2)
		declare @cos2 char(5)
		declare @cos3 char(8)
		declare @bulk varchar(50)
		declare @user int, @L1 int, @L2 int, @val decimal(19,2)
		select @user = ku_kunde_unid from ti_ticket where UNID = @ti
		select @L1 = ku_kunde_unid1 from kh_kundenhierarchie where ku_kunde_UNID = @user
		select @L2 = ku_kunde_unid1 from kh_kundenhierarchie where ku_kunde_UNID = @L2
		open cur_trg_tii_insert

		fetch next from cur_trg_tii_insert into @u, @ti, @atl, @cos1, @cos2, @cos3, @bulk
		while @@FETCH_STATUS = 0
		begin
			if @atl is null and @cos1 is null and @cos2 is null and @cos3 is null 
			begin
				if exists (select * from cs1_cos1 where UNID = @bulk)
				begin
					set @cos1 = @bulk
					update tii_ticketInfo set cs1_cos1_UNID = @bulk where UNID = @u and ti_ticket_UNID = @ti
				end
				else if exists(select * from cs2_cos2 where UNID = @bulk)
				begin
					set @cos2 = @bulk
					update tii_ticketInfo set cs2_cos2_UNID = @bulk where UNID = @u and ti_ticket_UNID = @ti
				end
				else if exists(select * from cs3_cos3 where UNID = @bulk)
				begin
					set @cos3 = @bulk
					update tii_ticketInfo set cs3_cos3_UNID = @bulk where UNID = @u and ti_ticket_UNID = @ti
				end
				else if exists(select * from atl_artikel where UNID = @bulk)
				begin
					set @atl = @bulk
					update tii_ticketInfo set atl_artikel_UNID = @bulk where UNID = @u and ti_ticket_UNID = @ti
				end
			end
			--@user   @cos1   @cos2   @cos3   @atl
			select @val = dbo.getKundenrabatt(@user,@cos1,@cos2,@cos3,@atl)
			if @val = -1
				select @val = dbo.getKundenrabatt(@L1,@cos1,@cos2,@cos3,@atl)
			if @val = -1
				select @val = dbo.getKundenrabatt(@L2,@cos1,@cos2,@cos3,@atl)
			if @val = -1
				set @val = 0
			update tii_ticketInfo set tii_hinterlegterrabatt = @val where UNID = @u and ti_ticket_UNID = @ti
			fetch next from cur_trg_tii_insert into @u, @ti, @atl, @cos1, @cos2, @cos3, @bulk
		end
		close cur_trg_tii_insert
		deallocate cur_trg_tii_insert
	end
end
GO
