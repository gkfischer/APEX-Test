SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kk_kundenklasse] (
		[UNID]            [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[kk_sap_desc]     [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]       [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [kk_kundenklasse_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[kk_kundenklasse] SET (LOCK_ESCALATION = TABLE)
GO
