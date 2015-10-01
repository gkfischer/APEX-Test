SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ft_td_funktionKlickbar] (
		[ft_td_klickbar]                [bit] NULL,
		[td_todo_UNID]                  [int] NOT NULL,
		[ft_funktionstemplate_UNID]     [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		CONSTRAINT [ft_td_funktionKlickbar_PK]
		PRIMARY KEY
		CLUSTERED
		([td_todo_UNID], [ft_funktionstemplate_UNID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ft_td_funktionKlickbar]
	WITH CHECK
	ADD CONSTRAINT [ft_td_funktionKlickbar_ft_funktionstemplate_FK]
	FOREIGN KEY ([ft_funktionstemplate_UNID]) REFERENCES [dbo].[ft_funktionstemplate] ([UNID])
ALTER TABLE [dbo].[ft_td_funktionKlickbar]
	CHECK CONSTRAINT [ft_td_funktionKlickbar_ft_funktionstemplate_FK]

GO
ALTER TABLE [dbo].[ft_td_funktionKlickbar]
	WITH CHECK
	ADD CONSTRAINT [ft_td_funktionKlickbar_td_todo_FK]
	FOREIGN KEY ([td_todo_UNID]) REFERENCES [dbo].[td_todo] ([UNID])
ALTER TABLE [dbo].[ft_td_funktionKlickbar]
	CHECK CONSTRAINT [ft_td_funktionKlickbar_td_todo_FK]

GO
ALTER TABLE [dbo].[ft_td_funktionKlickbar] SET (LOCK_ESCALATION = TABLE)
GO
