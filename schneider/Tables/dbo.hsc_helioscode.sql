SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hsc_helioscode] (
		[UNID]             [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[hsc_longtext]     [varchar](80) COLLATE Latin1_General_CI_AS NULL,
		[u_user_UNID]      [char](33) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]        [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [hsc_helioscode_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[hsc_helioscode]
	WITH CHECK
	ADD CONSTRAINT [hsc_helioscode_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[hsc_helioscode]
	CHECK CONSTRAINT [hsc_helioscode_u_user_FK]

GO
ALTER TABLE [dbo].[hsc_helioscode] SET (LOCK_ESCALATION = TABLE)
GO
