SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bu_businessunit] (
		[UNID]            [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
		[bu_name]         [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[u_user_UNID]     [char](33) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]       [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [bu_businessunit_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[bu_businessunit]
	WITH CHECK
	ADD CONSTRAINT [bu_businessunit_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[bu_businessunit]
	CHECK CONSTRAINT [bu_businessunit_u_user_FK]

GO
ALTER TABLE [dbo].[bu_businessunit] SET (LOCK_ESCALATION = TABLE)
GO
