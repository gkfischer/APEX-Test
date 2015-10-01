SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[at_atom] (
		[UNID]              [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[at_schluessel]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[at_wert]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[at_kategorie]      [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[at_sprache]        [char](3) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]         [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[at_sort]           [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[at_atom] SET (LOCK_ESCALATION = TABLE)
GO
