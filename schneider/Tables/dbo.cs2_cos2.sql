SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cs2_cos2] (
		[UNID]                 [char](5) COLLATE Latin1_General_CI_AS NOT NULL,
		[cs1_cos1_UNID]        [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
		[cs2_Beschreibung]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[u_user_UNID]          [char](33) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [cs2_cos2_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cs2_cos2]
	WITH CHECK
	ADD CONSTRAINT [cs2_cos2_cs1_cos1_FK]
	FOREIGN KEY ([cs1_cos1_UNID]) REFERENCES [dbo].[cs1_cos1] ([UNID])
ALTER TABLE [dbo].[cs2_cos2]
	CHECK CONSTRAINT [cs2_cos2_cs1_cos1_FK]

GO
ALTER TABLE [dbo].[cs2_cos2]
	WITH CHECK
	ADD CONSTRAINT [cs2_cos2_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[cs2_cos2]
	CHECK CONSTRAINT [cs2_cos2_u_user_FK]

GO
ALTER TABLE [dbo].[cs2_cos2] SET (LOCK_ESCALATION = TABLE)
GO
