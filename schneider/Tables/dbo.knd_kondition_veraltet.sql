SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[knd_kondition_veraltet] (
		[UNID]                 [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[knd_wert]             [decimal](9, 2) NULL,
		[knd_istprozent]       [char](1) COLLATE Latin1_General_CI_AS NULL,
		[knd_art]              [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[knd_gueltigab]        [date] NULL,
		[knd_gueltigbis]       [date] NULL,
		[atl_artikel_UNID]     [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ku_kunde_UNID]        [int] NULL,
		[cs1_cos1_UNID]        [char](2) COLLATE Latin1_General_CI_AS NULL,
		[cs2_cos2_UNID]        [char](5) COLLATE Latin1_General_CI_AS NULL,
		[cs3_cos3_UNID]        [char](8) COLLATE Latin1_General_CI_AS NULL,
		[knd_SAPNr]            [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [knd_kondition_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[knd_kondition_veraltet]
	WITH CHECK
	ADD CONSTRAINT [knd_kondition_atl_artikel_FK]
	FOREIGN KEY ([atl_artikel_UNID]) REFERENCES [dbo].[atl_artikel] ([UNID])
ALTER TABLE [dbo].[knd_kondition_veraltet]
	CHECK CONSTRAINT [knd_kondition_atl_artikel_FK]

GO
ALTER TABLE [dbo].[knd_kondition_veraltet]
	WITH CHECK
	ADD CONSTRAINT [knd_kondition_cs1_cos1_FK]
	FOREIGN KEY ([cs1_cos1_UNID]) REFERENCES [dbo].[cs1_cos1] ([UNID])
ALTER TABLE [dbo].[knd_kondition_veraltet]
	CHECK CONSTRAINT [knd_kondition_cs1_cos1_FK]

GO
ALTER TABLE [dbo].[knd_kondition_veraltet]
	WITH CHECK
	ADD CONSTRAINT [knd_kondition_cs2_cos2_FK]
	FOREIGN KEY ([cs2_cos2_UNID]) REFERENCES [dbo].[cs2_cos2] ([UNID])
ALTER TABLE [dbo].[knd_kondition_veraltet]
	CHECK CONSTRAINT [knd_kondition_cs2_cos2_FK]

GO
ALTER TABLE [dbo].[knd_kondition_veraltet]
	WITH CHECK
	ADD CONSTRAINT [knd_kondition_cs3_cos3_FK]
	FOREIGN KEY ([cs3_cos3_UNID]) REFERENCES [dbo].[cs3_cos3] ([UNID])
ALTER TABLE [dbo].[knd_kondition_veraltet]
	CHECK CONSTRAINT [knd_kondition_cs3_cos3_FK]

GO
ALTER TABLE [dbo].[knd_kondition_veraltet]
	WITH CHECK
	ADD CONSTRAINT [knd_kondition_ku_kunde_FK]
	FOREIGN KEY ([ku_kunde_UNID]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[knd_kondition_veraltet]
	CHECK CONSTRAINT [knd_kondition_ku_kunde_FK]

GO
ALTER TABLE [dbo].[knd_kondition_veraltet] SET (LOCK_ESCALATION = TABLE)
GO
