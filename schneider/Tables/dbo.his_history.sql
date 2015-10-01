SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[his_history] (
		[his_table]         [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[his_column]        [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[his_user]          [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[his_timestamp]     [datetime] NULL,
		[his_UNID]          [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[his_UNID2]         [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[his_UNID3]         [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[his_newvalue]      [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[his_oldvalue]      [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[his_action]        [char](6) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[his_history] SET (LOCK_ESCALATION = TABLE)
GO
