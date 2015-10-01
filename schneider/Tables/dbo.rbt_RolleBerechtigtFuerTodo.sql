SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rbt_RolleBerechtigtFuerTodo] (
		[rol_rolle_UNID]     [varchar](15) COLLATE Latin1_General_CI_AS NOT NULL,
		[td_todo_UNID]       [int] NOT NULL,
		[updatedBy]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [rbt_RolleBerechtigtFuerTodo_PK]
		PRIMARY KEY
		CLUSTERED
		([rol_rolle_UNID], [td_todo_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[rbt_RolleBerechtigtFuerTodo]
	WITH CHECK
	ADD CONSTRAINT [rbt_RolleBerechtigtFuerTodo_rol_rolle_FK]
	FOREIGN KEY ([rol_rolle_UNID]) REFERENCES [dbo].[rol_rolle] ([UNID])
ALTER TABLE [dbo].[rbt_RolleBerechtigtFuerTodo]
	CHECK CONSTRAINT [rbt_RolleBerechtigtFuerTodo_rol_rolle_FK]

GO
ALTER TABLE [dbo].[rbt_RolleBerechtigtFuerTodo]
	WITH CHECK
	ADD CONSTRAINT [rbt_RolleBerechtigtFuerTodo_td_todo_FK]
	FOREIGN KEY ([td_todo_UNID]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[rbt_RolleBerechtigtFuerTodo]
	CHECK CONSTRAINT [rbt_RolleBerechtigtFuerTodo_td_todo_FK]

GO
ALTER TABLE [dbo].[rbt_RolleBerechtigtFuerTodo] SET (LOCK_ESCALATION = TABLE)
GO
