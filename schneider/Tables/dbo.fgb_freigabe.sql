SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fgb_freigabe] (
		[u_user_UNID]             [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[u_user_UNID2]            [char](33) COLLATE Latin1_General_CI_AS NULL,
		[fgb_Zeitpunkt]           [datetime2](3) NULL,
		[fgb_bezeichnung]         [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[tii_ticketInfo_UNID]     [int] NOT NULL,
		[fgb_bemerkung]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[fbg_freigegeben]         [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[fbg_freigabeart]         [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		CONSTRAINT [fgb_freigabe_PK]
		PRIMARY KEY
		CLUSTERED
		([u_user_UNID], [tii_ticketInfo_UNID], [fbg_freigabeart])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[fgb_freigabe]
	WITH CHECK
	ADD CONSTRAINT [fgb_freigabe_tii_ticketInfo_FK]
	FOREIGN KEY ([tii_ticketInfo_UNID]) REFERENCES [dbo].[tii_ticketInfo] ([UNID])
ALTER TABLE [dbo].[fgb_freigabe]
	CHECK CONSTRAINT [fgb_freigabe_tii_ticketInfo_FK]

GO
ALTER TABLE [dbo].[fgb_freigabe]
	WITH CHECK
	ADD CONSTRAINT [fgb_freigabe_u_user_FK]
	FOREIGN KEY ([u_user_UNID2]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[fgb_freigabe]
	CHECK CONSTRAINT [fgb_freigabe_u_user_FK]

GO
ALTER TABLE [dbo].[fgb_freigabe]
	WITH CHECK
	ADD CONSTRAINT [fgb_freigabe_u_user_FKv2]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[fgb_freigabe]
	CHECK CONSTRAINT [fgb_freigabe_u_user_FKv2]

GO
ALTER TABLE [dbo].[fgb_freigabe] SET (LOCK_ESCALATION = TABLE)
GO
