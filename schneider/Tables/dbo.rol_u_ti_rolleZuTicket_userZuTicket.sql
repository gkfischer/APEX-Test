SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket] (
		[rol_rolle_unid]     [varchar](15) COLLATE Latin1_General_CI_AS NOT NULL,
		[u_user_unid]        [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[ti_ticket_unid]     [int] NOT NULL,
		CONSTRAINT [PK__rol_u_ti__2247425B9437F928]
		PRIMARY KEY
		CLUSTERED
		([rol_rolle_unid], [u_user_unid], [ti_ticket_unid])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket]
	WITH CHECK
	ADD CONSTRAINT [FK__rol_u_ti___rol_r__7AC720C5]
	FOREIGN KEY ([rol_rolle_unid]) REFERENCES [dbo].[rol_rolle] ([UNID])
ALTER TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket]
	CHECK CONSTRAINT [FK__rol_u_ti___rol_r__7AC720C5]

GO
ALTER TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket]
	WITH CHECK
	ADD CONSTRAINT [FK__rol_u_ti___ti_ti__7CAF6937]
	FOREIGN KEY ([ti_ticket_unid]) REFERENCES [dbo].[ti_ticket] ([UNID])
ALTER TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket]
	CHECK CONSTRAINT [FK__rol_u_ti___ti_ti__7CAF6937]

GO
ALTER TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket]
	WITH CHECK
	ADD CONSTRAINT [FK__rol_u_ti___u_use__7BBB44FE]
	FOREIGN KEY ([u_user_unid]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket]
	CHECK CONSTRAINT [FK__rol_u_ti___u_use__7BBB44FE]

GO
ALTER TABLE [dbo].[rol_u_ti_rolleZuTicket_userZuTicket] SET (LOCK_ESCALATION = TABLE)
GO
