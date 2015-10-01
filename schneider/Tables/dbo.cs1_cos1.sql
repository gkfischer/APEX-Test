SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cs1_cos1] (
		[UNID]                 [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
		[cs1_Beschreibung]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[u_user_UNID]          [char](33) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [cs1_cos1_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cs1_cos1]
	WITH CHECK
	ADD CONSTRAINT [cs1_cos1_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[cs1_cos1]
	CHECK CONSTRAINT [cs1_cos1_u_user_FK]

GO
ALTER TABLE [dbo].[cs1_cos1] SET (LOCK_ESCALATION = TABLE)
GO
