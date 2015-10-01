SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KommentarZuTodo] (
		[kmt_kommentar_UNID]     [int] NOT NULL,
		[td_todo_UNID]           [int] NOT NULL,
		[tk_todokette_UNID]      [int] NOT NULL,
		[updatedBy]              [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [KommentarZuTodo_PK]
		PRIMARY KEY
		CLUSTERED
		([kmt_kommentar_UNID], [td_todo_UNID], [tk_todokette_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[KommentarZuTodo]
	WITH CHECK
	ADD CONSTRAINT [KommentarZuTodo_kmt_kommentar_FK]
	FOREIGN KEY ([kmt_kommentar_UNID]) REFERENCES [dbo].[kmt_kommentar] ([UNID])
ALTER TABLE [dbo].[KommentarZuTodo]
	CHECK CONSTRAINT [KommentarZuTodo_kmt_kommentar_FK]

GO
ALTER TABLE [dbo].[KommentarZuTodo]
	WITH CHECK
	ADD CONSTRAINT [KommentarZuTodo_td_todo_FK]
	FOREIGN KEY ([td_todo_UNID]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[KommentarZuTodo]
	CHECK CONSTRAINT [KommentarZuTodo_td_todo_FK]

GO
ALTER TABLE [dbo].[KommentarZuTodo]
	WITH CHECK
	ADD CONSTRAINT [KommentarZuTodo_tk_todokette_FK]
	FOREIGN KEY ([tk_todokette_UNID]) REFERENCES [dbo].[tk_todokette] ([UNID])
ALTER TABLE [dbo].[KommentarZuTodo]
	CHECK CONSTRAINT [KommentarZuTodo_tk_todokette_FK]

GO
ALTER TABLE [dbo].[KommentarZuTodo] SET (LOCK_ESCALATION = TABLE)
GO
