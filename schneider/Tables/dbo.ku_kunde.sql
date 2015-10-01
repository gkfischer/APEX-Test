SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ku_kunde] (
		[UNID]                           [int] IDENTITY(1, 1) NOT NULL,
		[ku_name1]                       [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[ku_name2]                       [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[ku_land]                        [char](3) COLLATE Latin1_General_CI_AS NULL,
		[ku_plz]                         [varchar](15) COLLATE Latin1_General_CI_AS NULL,
		[ku_ort]                         [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[ku_strasse]                     [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[ku_kundeab]                     [char](1) COLLATE Latin1_General_CI_AS NULL,
		[ku_poboxnumber]                 [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[ku_poboxplz]                    [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[zk_zahlungskondition_UNID]      [char](10) COLLATE Latin1_General_CI_AS NULL,
		[u_user_UNID]                    [char](33) COLLATE Latin1_General_CI_AS NULL,
		[pl_preisliste_UNID]             [char](2) COLLATE Latin1_General_CI_AS NULL,
		[ku_email]                       [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[ku_telefon]                     [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[ku_incoterm]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ku_incotermPlace]               [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[kut_kundentyp_UNID]             [int] NULL,
		[bu_businessunit_UNID]           [varchar](5) COLLATE Latin1_General_CI_AS NULL,
		[kk_kundenklasse_UNID]           [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[ku_sapnr]                       [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ku_bfonr]                       [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ku_istindirekt]                 [bit] NULL,
		[ku_kreditlimit]                 [decimal](19, 2) NULL,
		[ku_gesperrt]                    [bit] NULL,
		[ku_totalreceivable]             [decimal](19, 2) NULL,
		[ku_totalsales]                  [decimal](19, 2) NULL,
		[ku_totalspecialliabilities]     [decimal](19, 2) NULL,
		[ku_exposure]                    [decimal](19, 2) NULL,
		[ku_rahmenueberschritten]        [bit] NULL,
		[ku_markedForDeletion]           [bit] NULL,
		[ku_bonus]                       [decimal](19, 2) NULL,
		[ku_defaultmarge]                [decimal](19, 2) NULL,
		[ku_ansprechpartner]             [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ku_sales12]                     [decimal](19, 2) NULL,
		[updatedBy]                      [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [ku_kunde_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ku_kunde]
	ADD
	CONSTRAINT [DF_ku_kunde_ku_sales12]
	DEFAULT ((0)) FOR [ku_sales12]
GO
ALTER TABLE [dbo].[ku_kunde]
	ADD
	CONSTRAINT [DF_ku_kunde_ku_totalsales]
	DEFAULT ((0)) FOR [ku_totalsales]
GO
ALTER TABLE [dbo].[ku_kunde]
	WITH NOCHECK
	ADD CONSTRAINT [ku_kunde_kk_kundenklasse_FK]
	FOREIGN KEY ([kk_kundenklasse_UNID]) REFERENCES [dbo].[kk_kundenklasse] ([UNID])
ALTER TABLE [dbo].[ku_kunde]
	CHECK CONSTRAINT [ku_kunde_kk_kundenklasse_FK]

GO
ALTER TABLE [dbo].[ku_kunde]
	WITH NOCHECK
	ADD CONSTRAINT [ku_kunde_kut_kundentyp_FK]
	FOREIGN KEY ([kut_kundentyp_UNID]) REFERENCES [dbo].[kut_kundentyp] ([UNID])
ALTER TABLE [dbo].[ku_kunde]
	CHECK CONSTRAINT [ku_kunde_kut_kundentyp_FK]

GO
ALTER TABLE [dbo].[ku_kunde]
	WITH NOCHECK
	ADD CONSTRAINT [ku_kunde_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[ku_kunde]
	CHECK CONSTRAINT [ku_kunde_u_user_FK]

GO
ALTER TABLE [dbo].[ku_kunde]
	WITH NOCHECK
	ADD CONSTRAINT [ku_kunde_zk_zahlungskondition_FK]
	FOREIGN KEY ([zk_zahlungskondition_UNID]) REFERENCES [dbo].[zk_zahlungskondition] ([UNID])
ALTER TABLE [dbo].[ku_kunde]
	CHECK CONSTRAINT [ku_kunde_zk_zahlungskondition_FK]

GO
ALTER TABLE [dbo].[ku_kunde] SET (LOCK_ESCALATION = TABLE)
GO
