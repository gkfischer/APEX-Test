SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cos2InRabattgruppe] (
		[cs2_cos2_UNID]            [char](5) COLLATE Latin1_General_CI_AS NOT NULL,
		[rg_Rabattgruppe_UNID]     [int] NOT NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [cos2InRabattgruppe_PK]
		PRIMARY KEY
		CLUSTERED
		([cs2_cos2_UNID], [rg_Rabattgruppe_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cos2InRabattgruppe]
	WITH CHECK
	ADD CONSTRAINT [FK_ASS_61]
	FOREIGN KEY ([cs2_cos2_UNID]) REFERENCES [dbo].[cs2_cos2] ([UNID])
ALTER TABLE [dbo].[cos2InRabattgruppe]
	CHECK CONSTRAINT [FK_ASS_61]

GO
ALTER TABLE [dbo].[cos2InRabattgruppe] SET (LOCK_ESCALATION = TABLE)
GO
