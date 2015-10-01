SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prc_prozedur] (
		[prc_prozedurname]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_1]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_2]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_3]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_4]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_5]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_6]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_7]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_8]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[prc_param_9]          [varchar](max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[prc_prozedur] SET (LOCK_ESCALATION = TABLE)
GO
