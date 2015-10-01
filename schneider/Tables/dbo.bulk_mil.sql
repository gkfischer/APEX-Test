SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bulk_mil] (
		[UNID]                       [varchar](12) COLLATE Latin1_General_CI_AS NULL,
		[mil_preisliste]             [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_artikel_UNID]           [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[mil_listpreis]              [decimal](19, 2) NULL,
		[mil_listenpreiseinheit]     [char](3) COLLATE Latin1_General_CI_AS NULL,
		[mil_gueltigVon]             [datetime] NULL,
		[mil_gueltigBis]             [datetime] NULL,
		[updatedBy]                  [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[insertID]                   [int] IDENTITY(1, 1) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bulk_mil]
	ADD
	CONSTRAINT [DF__bulk_mil__update__5E94F66B]
	DEFAULT ('IMPORT') FOR [updatedBy]
GO
ALTER TABLE [dbo].[bulk_mil] SET (LOCK_ESCALATION = TABLE)
GO
