SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ubt_userberechtigtfuertodo] (
		[u_user_unid]      [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[td_todo_unid]     [int] NOT NULL,
		CONSTRAINT [PK__ubt_user__859CC34C11975981]
		PRIMARY KEY
		CLUSTERED
		([u_user_unid], [td_todo_unid])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ubt_userberechtigtfuertodo]
	WITH CHECK
	ADD CONSTRAINT [FK__ubt_userb__td_to__1D1C38C9]
	FOREIGN KEY ([td_todo_unid]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[ubt_userberechtigtfuertodo]
	CHECK CONSTRAINT [FK__ubt_userb__td_to__1D1C38C9]

GO
ALTER TABLE [dbo].[ubt_userberechtigtfuertodo]
	WITH CHECK
	ADD CONSTRAINT [FK__ubt_userb__u_use__1C281490]
	FOREIGN KEY ([u_user_unid]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[ubt_userberechtigtfuertodo]
	CHECK CONSTRAINT [FK__ubt_userb__u_use__1C281490]

GO
ALTER TABLE [dbo].[ubt_userberechtigtfuertodo] SET (LOCK_ESCALATION = TABLE)
GO
