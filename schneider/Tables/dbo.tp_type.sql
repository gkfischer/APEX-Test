SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tp_type] (
		[UNID]          [int] NOT NULL,
		[tp_desc]       [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [tp_type_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tp_type] SET (LOCK_ESCALATION = TABLE)
GO
