SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ot_ordertype] (
		[UNID]          [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[ot_bez]        [varchar](100) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [ot_ordertype_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ot_ordertype] SET (LOCK_ESCALATION = TABLE)
GO
