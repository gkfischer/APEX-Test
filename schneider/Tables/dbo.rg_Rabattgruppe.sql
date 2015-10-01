SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rg_Rabattgruppe] (
		[UNID]                     [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
		[rg_name]                  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[cs3_cos3_UNID]            [char](8) COLLATE Latin1_General_CI_AS NOT NULL,
		[cs3_leadingcos3_unid]     [char](8) COLLATE Latin1_General_CI_AS NULL,
		[hsc_helioscode_UNID]      [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[rg_details]               [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [rg_Rabattgruppe_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID], [cs3_cos3_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[rg_Rabattgruppe]
	WITH CHECK
	ADD CONSTRAINT [FK_rg_Rabattgruppe_cs3_cos3]
	FOREIGN KEY ([cs3_leadingcos3_unid]) REFERENCES [dbo].[cs3_cos3] ([UNID])
ALTER TABLE [dbo].[rg_Rabattgruppe]
	CHECK CONSTRAINT [FK_rg_Rabattgruppe_cs3_cos3]

GO
ALTER TABLE [dbo].[rg_Rabattgruppe]
	WITH CHECK
	ADD CONSTRAINT [rg_Rabattgruppe_cs3_cos3_FK]
	FOREIGN KEY ([cs3_cos3_UNID]) REFERENCES [dbo].[cs3_cos3] ([UNID])
ALTER TABLE [dbo].[rg_Rabattgruppe]
	CHECK CONSTRAINT [rg_Rabattgruppe_cs3_cos3_FK]

GO
ALTER TABLE [dbo].[rg_Rabattgruppe]
	WITH CHECK
	ADD CONSTRAINT [rg_Rabattgruppe_hsc_helioscode_FK]
	FOREIGN KEY ([hsc_helioscode_UNID]) REFERENCES [dbo].[hsc_helioscode] ([UNID])
ALTER TABLE [dbo].[rg_Rabattgruppe]
	CHECK CONSTRAINT [rg_Rabattgruppe_hsc_helioscode_FK]

GO
ALTER TABLE [dbo].[rg_Rabattgruppe] SET (LOCK_ESCALATION = TABLE)
GO
