SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sl_sale] (
		[UNID]                  [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[sl_datum]              [date] NULL,
		[ku_kunde_UNID]         [int] NOT NULL,
		[ot_ordertype_UNID]     [char](1) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]             [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [sl_sale_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[sl_sale]
	WITH CHECK
	ADD CONSTRAINT [sl_sale_ku_kunde_FK]
	FOREIGN KEY ([ku_kunde_UNID]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[sl_sale]
	CHECK CONSTRAINT [sl_sale_ku_kunde_FK]

GO
ALTER TABLE [dbo].[sl_sale]
	WITH CHECK
	ADD CONSTRAINT [sl_sale_ot_ordertype_FK]
	FOREIGN KEY ([ot_ordertype_UNID]) REFERENCES [dbo].[ot_ordertype] ([UNID])
ALTER TABLE [dbo].[sl_sale]
	CHECK CONSTRAINT [sl_sale_ot_ordertype_FK]

GO
ALTER TABLE [dbo].[sl_sale] SET (LOCK_ESCALATION = TABLE)
GO
