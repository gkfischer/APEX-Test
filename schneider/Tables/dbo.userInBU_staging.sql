SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userInBU_staging] (
		[u_user_unid]         [char](33) COLLATE Latin1_General_CI_AS NULL,
		[bu_businessunit]     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[rol_rolle]           [varchar](max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[userInBU_staging] SET (LOCK_ESCALATION = TABLE)
GO
