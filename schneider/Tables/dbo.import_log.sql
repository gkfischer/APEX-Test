SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[import_log] (
		[UNID]          [int] IDENTITY(1, 1) NOT NULL,
		[timestamp]     [datetime] NULL,
		[message]       [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [PK_import_log]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[import_log]
	ADD
	CONSTRAINT [DF_import_log_timestamp]
	DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[import_log] SET (LOCK_ESCALATION = TABLE)
GO
