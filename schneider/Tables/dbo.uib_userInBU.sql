SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[uib_userInBU] (
		[u_user_unid]              [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[bu_businessunit_unid]     [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
		CONSTRAINT [PK_uib_userInBUI]
		PRIMARY KEY
		CLUSTERED
		([u_user_unid], [bu_businessunit_unid])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[uib_userInBU]
	WITH CHECK
	ADD CONSTRAINT [FK_uib_userInBUI_bu_businessunit]
	FOREIGN KEY ([bu_businessunit_unid]) REFERENCES [dbo].[bu_businessunit] ([UNID])
ALTER TABLE [dbo].[uib_userInBU]
	CHECK CONSTRAINT [FK_uib_userInBUI_bu_businessunit]

GO
ALTER TABLE [dbo].[uib_userInBU]
	WITH CHECK
	ADD CONSTRAINT [FK_uib_userInBUI_u_user]
	FOREIGN KEY ([u_user_unid]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[uib_userInBU]
	CHECK CONSTRAINT [FK_uib_userInBUI_u_user]

GO
ALTER TABLE [dbo].[uib_userInBU] SET (LOCK_ESCALATION = TABLE)
GO
