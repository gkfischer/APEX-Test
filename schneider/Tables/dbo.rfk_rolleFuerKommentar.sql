SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rfk_rolleFuerKommentar] (
		[rol_rolle_UNID]         [varchar](15) COLLATE Latin1_General_CI_AS NOT NULL,
		[kmt_kommentar_unid]     [int] NOT NULL,
		[updatedBy]              [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [rfk_rolleFuerKommentar_PK]
		PRIMARY KEY
		CLUSTERED
		([rol_rolle_UNID], [kmt_kommentar_unid])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[rfk_rolleFuerKommentar]
	WITH CHECK
	ADD CONSTRAINT [rfk_rolleFuerKommentar_rol_rolle_FK]
	FOREIGN KEY ([rol_rolle_UNID]) REFERENCES [dbo].[rol_rolle] ([UNID])
ALTER TABLE [dbo].[rfk_rolleFuerKommentar]
	CHECK CONSTRAINT [rfk_rolleFuerKommentar_rol_rolle_FK]

GO
ALTER TABLE [dbo].[rfk_rolleFuerKommentar] SET (LOCK_ESCALATION = TABLE)
GO
