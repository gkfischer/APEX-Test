SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ttv_templateVorgaenger] (
		[tt_todotemplate_UNID]      [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[tt_todotemplate_UNID1]     [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[updatedBy]                 [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [ttv_templateVorgaenger_PK]
		PRIMARY KEY
		CLUSTERED
		([tt_todotemplate_UNID], [tt_todotemplate_UNID1])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ttv_templateVorgaenger]
	WITH CHECK
	ADD CONSTRAINT [ttv_templateVorgaenger_tt_todotemplate_FK]
	FOREIGN KEY ([tt_todotemplate_UNID]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[ttv_templateVorgaenger]
	CHECK CONSTRAINT [ttv_templateVorgaenger_tt_todotemplate_FK]

GO
ALTER TABLE [dbo].[ttv_templateVorgaenger]
	WITH CHECK
	ADD CONSTRAINT [ttv_templateVorgaenger_tt_todotemplate_FKv2]
	FOREIGN KEY ([tt_todotemplate_UNID1]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[ttv_templateVorgaenger]
	CHECK CONSTRAINT [ttv_templateVorgaenger_tt_todotemplate_FKv2]

GO
ALTER TABLE [dbo].[ttv_templateVorgaenger] SET (LOCK_ESCALATION = TABLE)
GO
