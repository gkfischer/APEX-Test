SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ft_funktionstemplate] (
		[UNID]                     [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[ft_class]                 [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ft_text]                  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ft_faclass]               [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ft_funktionsname]         [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ft_amDashboard]           [bit] NULL,
		[ft_sqlstatement]          [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[ft_kategorie]             [char](2) COLLATE Latin1_General_CI_AS NULL,
		[ft_laufendenr]            [int] NULL,
		[ft_position]              [int] NULL,
		[ft_istoffline]            [bit] NULL,
		[ft_link]                  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[ft_target_blank]          [bit] NULL,
		[tt_todotemplate_UNID]     [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]                [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [ft_funktionstemplate_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ft_funktionstemplate]
	ADD
	CONSTRAINT [DF_ft_funktionstemplate_ft_target_blank]
	DEFAULT ((0)) FOR [ft_target_blank]
GO
ALTER TABLE [dbo].[ft_funktionstemplate]
	WITH CHECK
	ADD CONSTRAINT [ft_funktionstemplate_tt_todotemplate_FK]
	FOREIGN KEY ([tt_todotemplate_UNID]) REFERENCES [dbo].[tt_todotemplate] ([UNID])
ALTER TABLE [dbo].[ft_funktionstemplate]
	CHECK CONSTRAINT [ft_funktionstemplate_tt_todotemplate_FK]

GO
ALTER TABLE [dbo].[ft_funktionstemplate] SET (LOCK_ESCALATION = TABLE)
GO
