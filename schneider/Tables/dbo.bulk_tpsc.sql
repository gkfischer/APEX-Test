SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bulk_tpsc] (
		[unid]              [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[transferpreis]     [decimal](9, 2) NULL,
		[sdc]               [decimal](9, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bulk_tpsc] SET (LOCK_ESCALATION = TABLE)
GO
