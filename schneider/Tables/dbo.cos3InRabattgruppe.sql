SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cos3InRabattgruppe] (
		[cs3_cos3_UNID]            [char](8) COLLATE Latin1_General_CI_AS NOT NULL,
		[rg_Rabattgruppe_UNID]     [int] NOT NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [cos3InRabattgruppe_PK]
		PRIMARY KEY
		CLUSTERED
		([cs3_cos3_UNID], [rg_Rabattgruppe_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cos3InRabattgruppe]
	WITH CHECK
	ADD CONSTRAINT [FK_ASS_63]
	FOREIGN KEY ([cs3_cos3_UNID]) REFERENCES [dbo].[cs3_cos3] ([UNID])
ALTER TABLE [dbo].[cos3InRabattgruppe]
	CHECK CONSTRAINT [FK_ASS_63]

GO
ALTER TABLE [dbo].[cos3InRabattgruppe] SET (LOCK_ESCALATION = TABLE)
GO
