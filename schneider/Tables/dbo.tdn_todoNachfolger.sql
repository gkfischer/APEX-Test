SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tdn_todoNachfolger] (
		[td_todo_UNID]      [int] NOT NULL,
		[td_todo_UNID1]     [int] NOT NULL,
		[updatedBy]         [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [tdn_todoNachfolger_PK]
		PRIMARY KEY
		CLUSTERED
		([td_todo_UNID], [td_todo_UNID1])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tdn_todoNachfolger]
	WITH CHECK
	ADD CONSTRAINT [tdn_todoNachfolger_td_todo_FK]
	FOREIGN KEY ([td_todo_UNID]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[tdn_todoNachfolger]
	CHECK CONSTRAINT [tdn_todoNachfolger_td_todo_FK]

GO
ALTER TABLE [dbo].[tdn_todoNachfolger]
	WITH CHECK
	ADD CONSTRAINT [tdn_todoNachfolger_td_todo_FKv2]
	FOREIGN KEY ([td_todo_UNID1]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[tdn_todoNachfolger]
	CHECK CONSTRAINT [tdn_todoNachfolger_td_todo_FKv2]

GO
ALTER TABLE [dbo].[tdn_todoNachfolger] SET (LOCK_ESCALATION = TABLE)
GO
