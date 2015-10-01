SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bulk_sl] (
		[unid]            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[sdate]           [date] NULL,
		[position]        [int] NULL,
		[material]        [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[netval]          [decimal](19, 2) NULL,
		[stueck]          [decimal](19, 2) NULL,
		[per]             [int] NULL,
		[auftragstyp]     [char](1) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bulk_sl] SET (LOCK_ESCALATION = TABLE)
GO
