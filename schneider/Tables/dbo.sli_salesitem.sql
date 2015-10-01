SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sli_salesitem] (
		[UNID]                          [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[sli_itempos]                   [int] NOT NULL,
		[atl_artikel_unid]              [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[sli_stueckzahl]                [decimal](9, 2) NULL,
		[sli_positionspreis]            [decimal](19, 2) NULL,
		[sli_positionspreiseinheit]     [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [PK_sli_salesitem]
		PRIMARY KEY
		CLUSTERED
		([UNID], [sli_itempos])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sli_salesitem]
	WITH CHECK
	ADD CONSTRAINT [FK_sli_salesitem_atl_artikel]
	FOREIGN KEY ([atl_artikel_unid]) REFERENCES [dbo].[atl_artikel] ([UNID])
ALTER TABLE [dbo].[sli_salesitem]
	CHECK CONSTRAINT [FK_sli_salesitem_atl_artikel]

GO
ALTER TABLE [dbo].[sli_salesitem]
	WITH CHECK
	ADD CONSTRAINT [FK_sli_salesitem_sl_sale]
	FOREIGN KEY ([UNID]) REFERENCES [dbo].[sl_sale] ([UNID])
ALTER TABLE [dbo].[sli_salesitem]
	CHECK CONSTRAINT [FK_sli_salesitem_sl_sale]

GO
ALTER TABLE [dbo].[sli_salesitem] SET (LOCK_ESCALATION = TABLE)
GO
