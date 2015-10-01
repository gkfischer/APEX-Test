SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbs_rabattstruktur] (
		[UNID]                     [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
		[rbs_rabatt]               [decimal](9, 2) NULL,
		[kk_kundenklasse_unid]     [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[rbs_kundeab]              [char](1) COLLATE Latin1_General_CI_AS NULL,
		[cs3_cos3_UNID]            [char](8) COLLATE Latin1_General_CI_AS NULL,
		[cs2_cos2_UNID]            [char](5) COLLATE Latin1_General_CI_AS NULL,
		[cs1_cos1_UNID]            [char](2) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [rbs_rabattstruktur_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[rbs_rabattstruktur]
	WITH CHECK
	ADD CONSTRAINT [FK_rbs_rabattstruktur_kk_kundenklasse]
	FOREIGN KEY ([kk_kundenklasse_unid]) REFERENCES [dbo].[kk_kundenklasse] ([UNID])
ALTER TABLE [dbo].[rbs_rabattstruktur]
	CHECK CONSTRAINT [FK_rbs_rabattstruktur_kk_kundenklasse]

GO
ALTER TABLE [dbo].[rbs_rabattstruktur]
	WITH CHECK
	ADD CONSTRAINT [rbs_rabattstruktur_cs1_cos1_FK]
	FOREIGN KEY ([cs1_cos1_UNID]) REFERENCES [dbo].[cs1_cos1] ([UNID])
ALTER TABLE [dbo].[rbs_rabattstruktur]
	CHECK CONSTRAINT [rbs_rabattstruktur_cs1_cos1_FK]

GO
ALTER TABLE [dbo].[rbs_rabattstruktur]
	WITH CHECK
	ADD CONSTRAINT [rbs_rabattstruktur_cs2_cos2_FK]
	FOREIGN KEY ([cs2_cos2_UNID]) REFERENCES [dbo].[cs2_cos2] ([UNID])
ALTER TABLE [dbo].[rbs_rabattstruktur]
	CHECK CONSTRAINT [rbs_rabattstruktur_cs2_cos2_FK]

GO
ALTER TABLE [dbo].[rbs_rabattstruktur]
	WITH CHECK
	ADD CONSTRAINT [rbs_rabattstruktur_cs3_cos3_FK]
	FOREIGN KEY ([cs3_cos3_UNID]) REFERENCES [dbo].[cs3_cos3] ([UNID])
ALTER TABLE [dbo].[rbs_rabattstruktur]
	CHECK CONSTRAINT [rbs_rabattstruktur_cs3_cos3_FK]

GO
ALTER TABLE [dbo].[rbs_rabattstruktur] SET (LOCK_ESCALATION = TABLE)
GO
