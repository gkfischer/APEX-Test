SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[uhr_userhatrolle] (
		[rol_rolle_UNID]     [varchar](15) COLLATE Latin1_General_CI_AS NOT NULL,
		[u_user_UNID]        [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		CONSTRAINT [uhr_userhatrolle_PK]
		PRIMARY KEY
		CLUSTERED
		([rol_rolle_UNID], [u_user_UNID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[uhr_userhatrolle]
	WITH CHECK
	ADD CONSTRAINT [FK_ASS_70]
	FOREIGN KEY ([rol_rolle_UNID]) REFERENCES [dbo].[rol_rolle] ([UNID])
ALTER TABLE [dbo].[uhr_userhatrolle]
	CHECK CONSTRAINT [FK_ASS_70]

GO
ALTER TABLE [dbo].[uhr_userhatrolle]
	WITH CHECK
	ADD CONSTRAINT [FK_ASS_71]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[uhr_userhatrolle]
	CHECK CONSTRAINT [FK_ASS_71]

GO
ALTER TABLE [dbo].[uhr_userhatrolle] SET (LOCK_ESCALATION = TABLE)
GO
