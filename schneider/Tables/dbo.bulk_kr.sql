SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bulk_kr] (
		[UNID]                 [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[ku_kunde_unid]        [int] NULL,
		[cs1_cos1_unid]        [char](2) COLLATE Latin1_General_CI_AS NULL,
		[cs2_cos2_unid]        [char](5) COLLATE Latin1_General_CI_AS NULL,
		[cs3_cos3_unid]        [char](8) COLLATE Latin1_General_CI_AS NULL,
		[atl_artikel_unid]     [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[kr_validFrom]         [datetime] NULL,
		[kr_validTo]           [datetime] NULL,
		[kr_rabatt]            [decimal](9, 2) NULL,
		[kr_typ]               [char](1) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[insertID]             [int] IDENTITY(1, 1) NOT NULL,
		[bulk_typ]             [varchar](30) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bulk_kr] SET (LOCK_ESCALATION = TABLE)
GO
