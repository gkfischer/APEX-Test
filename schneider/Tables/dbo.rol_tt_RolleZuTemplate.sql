SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol_tt_RolleZuTemplate] (
		[rol_rolle_UNID]           [varchar](15) COLLATE Latin1_General_CI_AS NOT NULL,
		[tt_todotemplate_UNID]     [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [rol_tt_RolleZuTemplate_PK]
		PRIMARY KEY
		CLUSTERED
		([rol_rolle_UNID], [tt_todotemplate_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[rol_tt_RolleZuTemplate]
	WITH CHECK
	ADD CONSTRAINT [rol_tt_RolleZuTemplate_rol_rolle_FK]
	FOREIGN KEY ([rol_rolle_UNID]) REFERENCES [dbo].[rol_rolle] ([UNID])
ALTER TABLE [dbo].[rol_tt_RolleZuTemplate]
	CHECK CONSTRAINT [rol_tt_RolleZuTemplate_rol_rolle_FK]

GO
ALTER TABLE [dbo].[rol_tt_RolleZuTemplate]
	WITH CHECK
	ADD CONSTRAINT [rol_tt_RolleZuTemplate_tt_todotemplate_FK]
	FOREIGN KEY ([tt_todotemplate_UNID]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[rol_tt_RolleZuTemplate]
	CHECK CONSTRAINT [rol_tt_RolleZuTemplate_tt_todotemplate_FK]

GO
ALTER TABLE [dbo].[rol_tt_RolleZuTemplate] SET (LOCK_ESCALATION = TABLE)
GO
