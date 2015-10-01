SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zk_zahlungskondition] (
		[UNID]             [char](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[zk_kurztext]      [varchar](25) COLLATE Latin1_General_CI_AS NULL,
		[zk_langtext]      [varchar](80) COLLATE Latin1_General_CI_AS NULL,
		[zk_maxskonto]     [decimal](9, 2) NULL,
		CONSTRAINT [zk_zahlungskondition_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zk_zahlungskondition] SET (LOCK_ESCALATION = TABLE)
GO
