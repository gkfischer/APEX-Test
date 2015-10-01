SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fgh_freigabe_history] (
		[u_user_UNID]             [varchar](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[u_user_UNID2]            [varchar](33) COLLATE Latin1_General_CI_AS NULL,
		[fgh_Zeitpunkt]           [datetime2](3) NULL,
		[fgh_bezeichnung]         [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[tii_ticketInfo_UNID]     [int] NOT NULL,
		[fgh_bemerkung]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[fbh_freigegeben]         [char](1) COLLATE Latin1_General_CI_AS NULL,
		[fgh_freigabeart]         [char](1) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[fgh_freigabe_history] SET (LOCK_ESCALATION = TABLE)
GO
