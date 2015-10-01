SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dba_dashboardanzeige] (
		[UNID]                      [int] NOT NULL,
		[dba_kettenid]              [int] NOT NULL,
		[dba_erstellungsdatum]      [char](19) COLLATE Latin1_General_CI_AS NULL,
		[dba_aktiviertam]           [char](19) COLLATE Latin1_General_CI_AS NULL,
		[dba_erledigtAm]            [char](19) COLLATE Latin1_General_CI_AS NULL,
		[dba_erledigtDurchUser]     [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[dba_laufendenr]            [int] NOT NULL,
		[dba_position]              [tinyint] NOT NULL,
		[dba_typ]                   [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[dba_value1]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[dba_value2]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[dba_value3]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[dba_style1]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[dba_style2]                [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[u_user_UNID]               [char](33) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [dba_dashboardanzeige_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID], [dba_kettenid], [dba_laufendenr], [dba_position])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[dba_dashboardanzeige]
	WITH CHECK
	ADD CONSTRAINT [dba_dashboardanzeige_td_todo_FK]
	FOREIGN KEY ([UNID]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[dba_dashboardanzeige]
	CHECK CONSTRAINT [dba_dashboardanzeige_td_todo_FK]

GO
ALTER TABLE [dbo].[dba_dashboardanzeige]
	WITH CHECK
	ADD CONSTRAINT [dba_dashboardanzeige_tk_todokette_FK]
	FOREIGN KEY ([dba_kettenid]) REFERENCES [dbo].[tk_todokette] ([UNID])
ALTER TABLE [dbo].[dba_dashboardanzeige]
	CHECK CONSTRAINT [dba_dashboardanzeige_tk_todokette_FK]

GO
ALTER TABLE [dbo].[dba_dashboardanzeige]
	WITH CHECK
	ADD CONSTRAINT [dba_dashboardanzeige_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[dba_dashboardanzeige]
	CHECK CONSTRAINT [dba_dashboardanzeige_u_user_FK]

GO
ALTER TABLE [dbo].[dba_dashboardanzeige] SET (LOCK_ESCALATION = TABLE)
GO
