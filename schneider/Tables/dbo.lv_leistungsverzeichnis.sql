SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lv_leistungsverzeichnis] (
		[UNID]            [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[lv_variante]     [varchar](200) COLLATE Latin1_General_CI_AS NOT NULL,
		[lv_name]         [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[lv_kurz]         [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]       [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [lv_leistungsverzeichnis_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID], [lv_variante])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[lv_leistungsverzeichnis] SET (LOCK_ESCALATION = TABLE)
GO
