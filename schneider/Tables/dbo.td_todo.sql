SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[td_todo] (
		[UNID]                     [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[td_status]                [char](1) COLLATE Latin1_General_CI_AS NULL,
		[td_erstelltAm]            [datetime] NULL,
		[td_aktiviertAm]           [datetime] NULL,
		[td_erledigtAm]            [datetime] NULL,
		[tk_todokette_UNID]        [int] NULL,
		[u_user_UNID]              [char](33) COLLATE Latin1_General_CI_AS NULL,
		[tt_todotemplate_UNID]     [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[td_fk_u_zugewiesenAn]     [char](33) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [td_todo_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[td_todo]
	ADD
	CONSTRAINT [DF_td_todo_td_erstelltAm]
	DEFAULT (getdate()) FOR [td_erstelltAm]
GO
ALTER TABLE [dbo].[td_todo]
	WITH CHECK
	ADD CONSTRAINT [FK_td_todo_u_user]
	FOREIGN KEY ([td_fk_u_zugewiesenAn]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[td_todo]
	CHECK CONSTRAINT [FK_td_todo_u_user]

GO
ALTER TABLE [dbo].[td_todo]
	WITH CHECK
	ADD CONSTRAINT [td_todo_tk_todokette_FK]
	FOREIGN KEY ([tk_todokette_UNID]) REFERENCES [dbo].[tk_todokette] ([UNID])
ALTER TABLE [dbo].[td_todo]
	CHECK CONSTRAINT [td_todo_tk_todokette_FK]

GO
ALTER TABLE [dbo].[td_todo]
	WITH CHECK
	ADD CONSTRAINT [td_todo_tt_todotemplate_FK]
	FOREIGN KEY ([tt_todotemplate_UNID]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[td_todo]
	CHECK CONSTRAINT [td_todo_tt_todotemplate_FK]

GO
ALTER TABLE [dbo].[td_todo]
	WITH CHECK
	ADD CONSTRAINT [td_todo_u_user_FKv2]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[td_todo]
	CHECK CONSTRAINT [td_todo_u_user_FKv2]

GO
ALTER TABLE [dbo].[td_todo] SET (LOCK_ESCALATION = TABLE)
GO
