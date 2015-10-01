SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tt_todotemplate] (
		[UNID]                [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[tt_bez]              [varchar](90) COLLATE Latin1_General_CI_AS NULL,
		[tt_statusnummer]     [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[tt_hilfetext]        [varchar](253) COLLATE Latin1_General_CI_AS NULL,
		[tt_laufendenr]       [int] NULL,
		[tt_TabelleKey1]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tt_TabelleKey2]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tt_TabelleKey3]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tt_TabelleKey4]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tt_TabelleKey5]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tt_TabelleKey6]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tt_TabelleKey7]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[tt_TabelleKey8]      [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [tt_todotemplate_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tt_todotemplate] SET (LOCK_ESCALATION = TABLE)
GO
