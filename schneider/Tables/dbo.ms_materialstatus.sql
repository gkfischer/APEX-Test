SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ms_materialstatus] (
		[UNID]                [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
		[ms_beschreibung]     [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [ms_materialstatus_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ms_materialstatus] SET (LOCK_ESCALATION = TABLE)
GO
