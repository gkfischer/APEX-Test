SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hm_heliosmarge] (
		[UNID]                     [int] NOT NULL,
		[hm_dvc_prozentwert]       [decimal](5, 2) NULL,
		[hm_targetmarge]           [decimal](7, 2) NULL,
		[hsc_helioscode_UNID]      [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[hm_thresholdmarge_CP]     [decimal](7, 2) NULL,
		[hm_thresholdmarge_VP]     [decimal](7, 2) NULL,
		[hm_thresholdmarge_PM]     [decimal](7, 2) NULL,
		[hm_ytd_cco_gm]            [decimal](10, 2) NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [hm_heliosmarge_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[hm_heliosmarge]
	WITH CHECK
	ADD CONSTRAINT [hm_heliosmarge_hsc_helioscode_FK]
	FOREIGN KEY ([hsc_helioscode_UNID]) REFERENCES [dbo].[hsc_helioscode] ([UNID])
ALTER TABLE [dbo].[hm_heliosmarge]
	CHECK CONSTRAINT [hm_heliosmarge_hsc_helioscode_FK]

GO
ALTER TABLE [dbo].[hm_heliosmarge] SET (LOCK_ESCALATION = TABLE)
GO
