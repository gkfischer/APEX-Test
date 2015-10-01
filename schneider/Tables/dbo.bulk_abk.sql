SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bulk_abk] (
		[atl_artikel_unid]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ku_kunde_unid]        [int] NULL,
		[abk_nummer]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[insertID]             [int] IDENTITY(1, 1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[bulk_abk]
	ADD
	CONSTRAINT [DF__bulk_abk__update__5BB889C0]
	DEFAULT ('IMPORT') FOR [updatedBy]
GO
ALTER TABLE [dbo].[bulk_abk] SET (LOCK_ESCALATION = TABLE)
GO
