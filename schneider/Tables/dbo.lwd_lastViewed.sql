SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lwd_lastViewed] (
		[lwd_ztpkt]        [datetime] NULL,
		[td_todo_UNID]     [int] NOT NULL,
		[u_user_UNID]      [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[updatedBy]        [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [lwd_lastViewed_PK]
		PRIMARY KEY
		CLUSTERED
		([td_todo_UNID], [u_user_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[lwd_lastViewed]
	WITH CHECK
	ADD CONSTRAINT [lwd_lastViewed_td_todo_FK]
	FOREIGN KEY ([td_todo_UNID]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[lwd_lastViewed]
	CHECK CONSTRAINT [lwd_lastViewed_td_todo_FK]

GO
ALTER TABLE [dbo].[lwd_lastViewed]
	WITH CHECK
	ADD CONSTRAINT [lwd_lastViewed_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[lwd_lastViewed]
	CHECK CONSTRAINT [lwd_lastViewed_u_user_FK]

GO
ALTER TABLE [dbo].[lwd_lastViewed] SET (LOCK_ESCALATION = TABLE)
GO
