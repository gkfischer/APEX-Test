SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kmt_kommentar] (
		[UNID]               [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[kmt_text]           [varchar](255) COLLATE Latin1_General_CI_AS NULL,
		[u_user_UNID]        [char](33) COLLATE Latin1_General_CI_AS NOT NULL,
		[kmt_erstelltAm]     [datetime] NULL,
		[updatedBy]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [kmt_kommentar_PK]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[kmt_kommentar]
	WITH CHECK
	ADD CONSTRAINT [kmt_kommentar_u_user_FK]
	FOREIGN KEY ([u_user_UNID]) REFERENCES [dbo].[u_user] ([UNID])
ALTER TABLE [dbo].[kmt_kommentar]
	CHECK CONSTRAINT [kmt_kommentar_u_user_FK]

GO
ALTER TABLE [dbo].[kmt_kommentar] SET (LOCK_ESCALATION = TABLE)
GO
