SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tk_todokette] (
		[UNID]               [int] IDENTITY(1, 1) NOT NULL,
		[tk_status]          [char](1) COLLATE Latin1_General_CI_AS NULL,
		[tk_lastUpdated]     [datetime] NULL,
		[updatedBy]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [tk_todokette_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tk_todokette] SET (LOCK_ESCALATION = TABLE)
GO
