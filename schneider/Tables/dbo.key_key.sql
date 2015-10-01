SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[key_key] (
		[UNID]         [int] NOT NULL,
		[key_nr]       [int] NULL,
		[key_wert]     [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [PK__key_key__B620A025F4C194A6]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[key_key]
	WITH CHECK
	ADD CONSTRAINT [FK__key_key__UNID__4B180DA3]
	FOREIGN KEY ([UNID]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[key_key]
	CHECK CONSTRAINT [FK__key_key__UNID__4B180DA3]

GO
ALTER TABLE [dbo].[key_key] SET (LOCK_ESCALATION = TABLE)
GO
