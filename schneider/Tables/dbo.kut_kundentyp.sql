SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kut_kundentyp] (
		[UNID]                [int] NOT NULL,
		[kut_bezeichnung]     [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [kut_kundentyp_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[kut_kundentyp] SET (LOCK_ESCALATION = TABLE)
GO
