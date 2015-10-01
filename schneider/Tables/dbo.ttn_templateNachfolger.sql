SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ttn_templateNachfolger] (
		[tt_todotemplate_UNID]      [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[tt_todotemplate_UNID1]     [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[updatedBy]                 [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [ttn_templateNachfolger_PK]
		PRIMARY KEY
		CLUSTERED
		([tt_todotemplate_UNID1], [tt_todotemplate_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ttn_templateNachfolger]
	WITH CHECK
	ADD CONSTRAINT [ttn_templateNachfolger_tt_todotemplate_FK]
	FOREIGN KEY ([tt_todotemplate_UNID]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[ttn_templateNachfolger]
	CHECK CONSTRAINT [ttn_templateNachfolger_tt_todotemplate_FK]

GO
ALTER TABLE [dbo].[ttn_templateNachfolger]
	WITH CHECK
	ADD CONSTRAINT [ttn_templateNachfolger_tt_todotemplate_FKv2]
	FOREIGN KEY ([tt_todotemplate_UNID1]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[ttn_templateNachfolger]
	CHECK CONSTRAINT [ttn_templateNachfolger_tt_todotemplate_FKv2]

GO
ALTER TABLE [dbo].[ttn_templateNachfolger] SET (LOCK_ESCALATION = TABLE)
GO
