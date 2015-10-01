SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kh_kundenhierarchie] (
		[ku_kunde_UNID]      [int] NOT NULL,
		[ku_kunde_UNID1]     [int] NULL,
		[ku_kunde_UNID2]     [int] NULL,
		[updatedBy]          [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [kh_kundenhierarchie_PK]
		PRIMARY KEY
		CLUSTERED
		([ku_kunde_UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[kh_kundenhierarchie]
	WITH NOCHECK
	ADD CONSTRAINT [kh_kundenhierarchie_ku_kunde_FK]
	FOREIGN KEY ([ku_kunde_UNID]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[kh_kundenhierarchie]
	CHECK CONSTRAINT [kh_kundenhierarchie_ku_kunde_FK]

GO
ALTER TABLE [dbo].[kh_kundenhierarchie]
	WITH NOCHECK
	ADD CONSTRAINT [kh_kundenhierarchie_ku_kunde_FKv1]
	FOREIGN KEY ([ku_kunde_UNID1]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[kh_kundenhierarchie]
	CHECK CONSTRAINT [kh_kundenhierarchie_ku_kunde_FKv1]

GO
ALTER TABLE [dbo].[kh_kundenhierarchie]
	WITH NOCHECK
	ADD CONSTRAINT [kh_kundenhierarchie_ku_kunde_FKv2]
	FOREIGN KEY ([ku_kunde_UNID2]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[kh_kundenhierarchie]
	CHECK CONSTRAINT [kh_kundenhierarchie_ku_kunde_FKv2]

GO
ALTER TABLE [dbo].[kh_kundenhierarchie] SET (LOCK_ESCALATION = TABLE)
GO
