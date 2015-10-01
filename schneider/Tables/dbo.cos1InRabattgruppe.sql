SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cos1InRabattgruppe] (
		[cs1_cos1_UNID]            [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
		[rg_Rabattgruppe_UNID]     [int] NOT NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [cos1InRabattgruppe_PK]
		PRIMARY KEY
		CLUSTERED
		([cs1_cos1_UNID], [rg_Rabattgruppe_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cos1InRabattgruppe]
	WITH CHECK
	ADD CONSTRAINT [FK_ASS_59]
	FOREIGN KEY ([cs1_cos1_UNID]) REFERENCES [dbo].[cs1_cos1] ([UNID])
ALTER TABLE [dbo].[cos1InRabattgruppe]
	CHECK CONSTRAINT [FK_ASS_59]

GO
ALTER TABLE [dbo].[cos1InRabattgruppe] SET (LOCK_ESCALATION = TABLE)
GO
