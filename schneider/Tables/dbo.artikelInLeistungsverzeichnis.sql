SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[artikelInLeistungsverzeichnis] (
		[atl_artikel_UNID]                 [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[lv_leistungsverzeichnis_UNID]     [int] NOT NULL,
		[lv_variante]                      [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]                        [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [artikelInLeistungsverzeichnis_PK]
		PRIMARY KEY
		CLUSTERED
		([atl_artikel_UNID], [lv_leistungsverzeichnis_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[artikelInLeistungsverzeichnis]
	WITH CHECK
	ADD CONSTRAINT [FK_ASS_57]
	FOREIGN KEY ([atl_artikel_UNID]) REFERENCES [dbo].[atl_artikel] ([UNID])
ALTER TABLE [dbo].[artikelInLeistungsverzeichnis]
	CHECK CONSTRAINT [FK_ASS_57]

GO
ALTER TABLE [dbo].[artikelInLeistungsverzeichnis] SET (LOCK_ESCALATION = TABLE)
GO
