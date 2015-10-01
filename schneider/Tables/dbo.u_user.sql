SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[u_user] (
		[UNID]               [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[u_user_UNID]        [char](33) COLLATE Latin1_General_CI_AS NULL,
		[u_benutzername]     [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[u_vorname]          [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[u_nachname]         [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[u_titel]            [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[u_telefonnr]        [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[u_email]            [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[u_schneiderNR]      [char](8) COLLATE Latin1_General_CI_AS NULL,
		[u_anzeigename]      [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[u_kuerzel]          [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [u_user_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[u_user]
	WITH CHECK
	ADD CONSTRAINT [u_user_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[u_user]
	CHECK CONSTRAINT [u_user_u_user_FK]

GO
ALTER TABLE [dbo].[u_user] SET (LOCK_ESCALATION = TABLE)
GO
