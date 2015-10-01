SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ti_ticket] (
		[UNID]                                [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[ku_Kunde_UNID]                       [int] NULL,
		[ku_sapnr]                            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ku_bfonr]                            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ku_L1Kunde_UNID]                     [int] NULL,
		[ku_L2Kunde_UNID]                     [int] NULL,
		[ti_kundenname]                       [varchar](80) COLLATE Latin1_General_CI_AS NULL,
		[ti_kundenemail]                      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[ti_vertriebsingenieur]               [varchar](80) COLLATE Latin1_General_CI_AS NULL,
		[ti_hinterlegtezahlungskondition]     [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[ti_hinterlegtermaximalskonto]        [decimal](5, 2) NULL,
		[ti_hinterlegterbonus]                [decimal](5, 2) NULL,
		[ti_hinterlegterRabatt]               [decimal](9, 2) NULL,
		[ti_gewaehltezahlungskondition]       [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[ti_gewaehltemaximalskonto]           [decimal](5, 2) NULL,
		[ti_gewaehltebonus]                   [decimal](5, 2) NULL,
		[ti_gewaehlterRabatt]                 [decimal](9, 2) NULL,
		[ti_kundenklassifizierung]            [char](1) COLLATE Latin1_General_CI_AS NULL,
		[ti_umsatzletzte12monate]             [decimal](11, 2) NULL,
		[ti_potential]                        [decimal](11, 2) NULL,
		[ti_kommentarzupotenzial]             [varchar](255) COLLATE Latin1_General_CI_AS NULL,
		[ti_mitbewerber]                      [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[ti_Abschlussdatum]                   [date] NULL,
		[ti_standardagb]                      [char](1) COLLATE Latin1_General_CI_AS NULL,
		[ti_sonderagb_linkzuticket]           [int] NULL,
		[ti_antragsteller]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ti_gueltigab]                        [date] NULL,
		[ti_gueltigbis]                       [date] NULL,
		[ti_angebotsdatum]                    [date] NULL,
		[ti_projektname]                      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[ti_gh_marge_oder_zuschlag]           [char](8) COLLATE Latin1_General_CI_AS NULL,
		[ti_ghmarge_oder_zuschlag_wert]       [decimal](7, 2) NULL,
		[ti_formatangebotsnummer]             [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[ti_istbeendet]                       [bit] NULL,
		[ti_zusatzrabatt]                     [decimal](9, 2) NULL,
		[ti_bankgarantie]                     [bit] NULL,
		[ti_gewaehrleistung]                  [bit] NULL,
		[ti_typ]                              [char](20) COLLATE Latin1_General_CI_AS NULL,
		[ku_ansprechpartner]                  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ku_land]                             [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ku_plz]                              [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ku_ort]                              [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ku_strasse]                          [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ku_telefon]                          [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ku_preisliste_hinterlegt]            [char](2) COLLATE Latin1_General_CI_AS NULL,
		[ku_preisliste_gewaehlt]              [char](2) COLLATE Latin1_General_CI_AS NULL,
		[ku_businessunit]                     [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ku_kundenklasse]                     [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ku_grosshaendler]                    [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_grosshaendler_unid]               [int] NULL,
		[ku_kunde_typeahead]                  [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_preisbindungAb]                   [date] NULL,
		[ti_preisbindungBis]                  [date] NULL,
		[ti_l1_kundenname]                    [nchar](10) COLLATE Latin1_General_CI_AS NULL,
		[ti_l2_kundenname]                    [nchar](10) COLLATE Latin1_General_CI_AS NULL,
		[ti_schneidergarantie]                [decimal](11, 2) NULL,
		[ti_version]                          [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_bfo_opportunity]                  [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_frage1]                           [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_frage2]                           [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_frage3]                           [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_antwort1]                         [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_antwort2]                         [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ti_antwort3]                         [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ddk_zweiteslogo]                     [char](33) COLLATE Latin1_General_CI_AS NULL,
		[ti_HeaderZusatztext]                 [nchar](10) COLLATE Latin1_General_CI_AS NULL,
		[ti_AuswahlVorlageHeaderText]         [nchar](10) COLLATE Latin1_General_CI_AS NULL,
		[ti_volumeeinmaloderjaehrlich]        [char](1) COLLATE Latin1_General_CI_AS NULL,
		[ti_footertext]                       [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ti_AuswahlVorlageFooterText]         [char](1) COLLATE Latin1_General_CI_AS NULL,
		[ti_projekt_helios]                   [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]                           [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [td_ticket_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ti_ticket]
	WITH CHECK
	ADD CONSTRAINT [td_ticket_ku_kunde_FKv1]
	FOREIGN KEY ([ku_Kunde_UNID]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[ti_ticket]
	CHECK CONSTRAINT [td_ticket_ku_kunde_FKv1]

GO
ALTER TABLE [dbo].[ti_ticket]
	WITH CHECK
	ADD CONSTRAINT [td_ticket_ku_kunde_FKv3]
	FOREIGN KEY ([ku_L1Kunde_UNID]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[ti_ticket]
	CHECK CONSTRAINT [td_ticket_ku_kunde_FKv3]

GO
ALTER TABLE [dbo].[ti_ticket]
	WITH CHECK
	ADD CONSTRAINT [td_ticket_ku_kunde_FKv4]
	FOREIGN KEY ([ku_L2Kunde_UNID]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[ti_ticket]
	CHECK CONSTRAINT [td_ticket_ku_kunde_FKv4]

GO
ALTER TABLE [dbo].[ti_ticket] SET (LOCK_ESCALATION = TABLE)
GO
