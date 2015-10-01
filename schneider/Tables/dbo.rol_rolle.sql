SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol_rolle] (
		[UNID]                 [varchar](15) COLLATE Latin1_General_CI_AS NOT NULL,
		[rol_Beschreibung]     [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [rol_rolle_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[rol_rolle] SET (LOCK_ESCALATION = TABLE)
GO
