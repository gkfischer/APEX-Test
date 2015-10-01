SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[atl_artikel] (
		[UNID]                               [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[atl_artikeltext]                    [varchar](300) COLLATE Latin1_General_CI_AS NULL,
		[atl_transferpreis]                  [decimal](20, 4) NULL,
		[atl_transferpreis_einheit]          [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_sprache]                        [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[hsc_helioscode_UNID]                [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[cs3_cos3_UNID]                      [char](8) COLLATE Latin1_General_CI_AS NULL,
		[atl_mindestbestellmenge]            [int] NULL,
		[atl_mindestliefermenge]             [decimal](12, 4) NULL,
		[atl_basismengeneinheit]             [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[atl_liefereinheit]                  [decimal](12, 4) NULL,
		[atl_ean_Code]                       [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_warennummerstatisch]            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_herkunftsland]                  [varchar](3) COLLATE Latin1_General_CI_AS NULL,
		[atl_status]                         [char](2) COLLATE Latin1_General_CI_AS NULL,
		[atl_standardcosts]                  [decimal](20, 4) NULL,
		[atl_standardcosts_einheit]          [int] NULL,
		[atl_planlieferzeit]                 [int] NULL,
		[u_user_UNID]                        [char](33) COLLATE Latin1_General_CI_AS NULL,
		[ms_materialstatus_UNID]             [char](2) COLLATE Latin1_General_CI_AS NULL,
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
		[atl_ccv]                            [decimal](19, 2) NULL,
		[atl_ccv_einheit]                    [int] NULL,
		[updatedBy]                          [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[atl_mindestliefermenge_einheit]     [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[atl_mindestbestellt_einheit]        [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [atl_artikel_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[atl_artikel]
	WITH CHECK
	ADD CONSTRAINT [atl_artikel_cs3_cos3_FK]
	FOREIGN KEY ([cs3_cos3_UNID]) REFERENCES [dbo].[cs3_cos3] ([UNID])
ALTER TABLE [dbo].[atl_artikel]
	CHECK CONSTRAINT [atl_artikel_cs3_cos3_FK]

GO
ALTER TABLE [dbo].[atl_artikel]
	WITH CHECK
	ADD CONSTRAINT [atl_artikel_hsc_helioscode_FK]
	FOREIGN KEY ([hsc_helioscode_UNID]) REFERENCES [dbo].[hsc_helioscode] ([UNID])
ALTER TABLE [dbo].[atl_artikel]
	CHECK CONSTRAINT [atl_artikel_hsc_helioscode_FK]

GO
ALTER TABLE [dbo].[atl_artikel]
	WITH CHECK
	ADD CONSTRAINT [atl_artikel_ms_materialstatus_FK]
	FOREIGN KEY ([ms_materialstatus_UNID]) REFERENCES [dbo].[ms_materialstatus] ([UNID])
ALTER TABLE [dbo].[atl_artikel]
	CHECK CONSTRAINT [atl_artikel_ms_materialstatus_FK]

GO
ALTER TABLE [dbo].[atl_artikel]
	WITH CHECK
	ADD CONSTRAINT [atl_artikel_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[atl_artikel]
	CHECK CONSTRAINT [atl_artikel_u_user_FK]

GO
ALTER TABLE [dbo].[atl_artikel] SET (LOCK_ESCALATION = TABLE)
GO
