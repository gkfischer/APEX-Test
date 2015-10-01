SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mil_materialinliste] (
		[UNID]                           [varchar](12) COLLATE Latin1_General_CI_AS NOT NULL,
		[mil_preisliste]                 [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
		[atl_artikel_UNID]               [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[mil_listpreis]                  [decimal](19, 2) NULL,
		[mil_listenpreiseinheit]         [char](3) COLLATE Latin1_General_CI_AS NULL,
		[mil_gueltigVon]                 [datetime] NULL,
		[mil_gueltigBis]                 [datetime] NULL,
		[updatedBy]                      [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[mil_preislistenbezeichnung]     AS ((('gültig von '+CONVERT([varchar],[mil_gueltigVon],(104)))+' bis ')+CONVERT([varchar],[mil_gueltigBis],(104))),
		CONSTRAINT [mil_materialinliste_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[mil_materialinliste]
	WITH CHECK
	ADD CONSTRAINT [mil_materialinliste_atl_artikel_FK]
	FOREIGN KEY ([atl_artikel_UNID]) REFERENCES [dbo].[atl_artikel] ([UNID])
ALTER TABLE [dbo].[mil_materialinliste]
	CHECK CONSTRAINT [mil_materialinliste_atl_artikel_FK]

GO
ALTER TABLE [dbo].[mil_materialinliste] SET (LOCK_ESCALATION = TABLE)
GO
