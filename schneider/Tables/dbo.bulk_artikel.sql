SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bulk_artikel] (
		[UNID]                               [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_artikeltext]                    [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[atl_transferpreis]                  [decimal](20, 4) NULL,
		[atl_transferpreis_einheit]          [int] NULL,
		[atl_sprache]                        [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[hsc_helioscode_UNID]                [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[cs3_cos3_UNID]                      [char](8) COLLATE Latin1_General_CI_AS NULL,
		[atl_mindestbestellmenge]            [decimal](12, 4) NULL,
		[atl_mindestliefermenge]             [decimal](12, 4) NULL,
		[atl_basismengeneinheit]             [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[atl_liefereinheit]                  [decimal](12, 4) NULL,
		[atl_ean_Code]                       [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_warennummerstatisch]            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_herkunftsland]                  [varchar](3) COLLATE Latin1_General_CI_AS NULL,
		[atl_status]                         [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_standardcosts]                  [decimal](20, 4) NULL,
		[atl_planlieferzeit]                 [int] NULL,
		[u_user_UNID]                        [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[ms_materialstatus_UNID]             [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_ccv]                            [decimal](7, 2) NULL,
		[atl_ccv_einheit]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_bruttogewicht]                  [decimal](20, 4) NULL,
		[atl_bruttogewicht_einheit]          [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_nettogewicht]                   [decimal](20, 4) NULL,
		[atl_nettogewicht_einheit]           [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_laenge]                         [decimal](20, 4) NULL,
		[atl_laenge_einheit]                 [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_breite]                         [decimal](20, 4) NULL,
		[atl_breite_einheit]                 [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_hoehe]                          [decimal](20, 4) NULL,
		[atl_hoehe_einheit]                  [char](2) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]                          [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[insertID]                           [int] IDENTITY(1, 1) NOT NULL,
		[atl_mindestliefermenge_einheit]     [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_mindestbestellt_einheit]        [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_standardcosts_einheit]          [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bulk_artikel]
	ADD
	CONSTRAINT [DF_bulk_artikel_updatedBy]
	DEFAULT ('IMPORT') FOR [updatedBy]
GO
ALTER TABLE [dbo].[bulk_artikel] SET (LOCK_ESCALATION = TABLE)
GO
