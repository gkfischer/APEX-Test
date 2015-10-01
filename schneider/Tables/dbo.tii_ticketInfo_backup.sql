SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tii_ticketInfo_backup] (
		[UNID]                               [int] NOT NULL,
		[tii_fk_ti_ticket]                   [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[tii_fk_atl_artikel]                 [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[tii_fk_lv_leistungsverzeichnis]     [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[tii_fk_cs1_cos1]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[tii_fk_cs2_cos2]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[tii_fk_cs3_cos3]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ti_fk_rg_rabattgruppe]              [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[tii_cos]                            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[tii_name_cos_rg]                    [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tii_hinterlegterrabatt]             [decimal](5, 2) NULL,
		[tii_rabatt_TO]                      [decimal](5, 2) NULL,
		[tii_rabatt_VI]                      [decimal](5, 2) NULL,
		[tii_rabatt_PM]                      [decimal](5, 2) NULL,
		[tii_gesamtrabatt]                   [decimal](5, 2) NULL,
		[tii_maxrabattausrabattstruktur]     [decimal](5, 2) NULL,
		[tii_ghmarge_oder_aufschlag]         [decimal](5, 2) NULL,
		[tii_produktmanager]                 [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tii_pmfreigabe]                     [char](1) COLLATE Latin1_General_CI_AS NULL,
		[tii_ccomarge]                       [decimal](11, 2) NULL,
		[tii_localmarge]                     [decimal](11, 2) NULL,
		[tii_deltaae]                        [decimal](11, 2) NULL,
		[tii_delta_mitzielmarge]             [decimal](11, 2) NULL,
		[tii_ccmarge_helios_ytd]             [decimal](11, 2) NULL,
		[tii_artikelname]                    [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tii_zielnettopreis]                 [decimal](11, 2) NULL,
		[tii_artikellistenpreis]             [decimal](11, 2) NULL,
		[tii_preiseinheit]                   [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[tii_hinterlegternettopreis]         [decimal](11, 2) NULL,
		[tii_theoretischernettopreis]        [decimal](11, 2) NULL,
		[tii_gesamtumsatz]                   [decimal](11, 2) NULL,
		[tii_csc_stueck]                     [decimal](11, 2) NULL,
		[tii_csc_einheit]                    [decimal](11, 2) NULL,
		[tii_csc_marge]                      [decimal](11, 2) NULL,
		[tii_allgemeinedvcs]                 [decimal](11, 2) NULL,
		[tii_tp_stueck]                      [decimal](11, 2) NULL,
		[tii_tp_einheit]                     [decimal](11, 2) NULL,
		[updatedBy]                          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [tii_ticketInfo_backup_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tii_ticketInfo_backup] SET (LOCK_ESCALATION = TABLE)
GO
