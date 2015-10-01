SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cs3_cos3] (
		[UNID]                 [char](8) COLLATE Latin1_General_CI_AS NOT NULL,
		[cs3_Beschreibung]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[cs2_cos2_UNID]        [char](5) COLLATE Latin1_General_CI_AS NOT NULL,
		[u_user_UNID]          [char](33) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [cs3_cos3_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cs3_cos3]
	WITH CHECK
	ADD CONSTRAINT [cs3_cos3_cs2_cos2_FK]
	FOREIGN KEY ([cs2_cos2_UNID]) REFERENCES [dbo].[cs2_cos2] ([UNID])
ALTER TABLE [dbo].[cs3_cos3]
	CHECK CONSTRAINT [cs3_cos3_cs2_cos2_FK]

GO
ALTER TABLE [dbo].[cs3_cos3]
	WITH CHECK
	ADD CONSTRAINT [cs3_cos3_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[cs3_cos3]
	CHECK CONSTRAINT [cs3_cos3_u_user_FK]

GO
ALTER TABLE [dbo].[cs3_cos3] SET (LOCK_ESCALATION = TABLE)
GO
