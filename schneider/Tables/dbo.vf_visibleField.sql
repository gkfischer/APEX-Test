SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vf_visibleField] (
		[UNID]                     [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[vf_laufendenr]            [int] NULL,
		[vf_column]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[vf_table]                 [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[vf_schluesselfeld]        [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[vf_anzeigename]           [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[vf_bearbeitbar]           [bit] NULL,
		[vf_inputtyp]              [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[vf_position]              [int] NULL,
		[tt_todotemplate_UNID]     [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[vf_istoffline]            [bit] NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [vf_visibleField_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[vf_visibleField]
	WITH CHECK
	ADD CONSTRAINT [vf_visibleField_tt_todotemplate_FK]
	FOREIGN KEY ([tt_todotemplate_UNID]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[vf_visibleField]
	CHECK CONSTRAINT [vf_visibleField_tt_todotemplate_FK]

GO
ALTER TABLE [dbo].[vf_visibleField] SET (LOCK_ESCALATION = TABLE)
GO
