SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[abk_artikelnummerBeiKunde] (
		[atl_artikel_unid]     [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[ku_kunde_unid]        [int] NOT NULL,
		[abk_nummer]           [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [PK_abk_artikelnummerBeiKunde]
		PRIMARY KEY
		CLUSTERED
		([atl_artikel_unid], [ku_kunde_unid])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[abk_artikelnummerBeiKunde]
	WITH NOCHECK
	ADD CONSTRAINT [FK_abk_artikelnummerBeiKunde_atl_artikel]
	FOREIGN KEY ([atl_artikel_unid]) REFERENCES [dbo].[atl_artikel] ([UNID])
ALTER TABLE [dbo].[abk_artikelnummerBeiKunde]
	CHECK CONSTRAINT [FK_abk_artikelnummerBeiKunde_atl_artikel]

GO
ALTER TABLE [dbo].[abk_artikelnummerBeiKunde]
	WITH NOCHECK
	ADD CONSTRAINT [FK_abk_artikelnummerBeiKunde_ku_kunde]
	FOREIGN KEY ([ku_kunde_unid]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[abk_artikelnummerBeiKunde]
	CHECK CONSTRAINT [FK_abk_artikelnummerBeiKunde_ku_kunde]

GO
ALTER TABLE [dbo].[abk_artikelnummerBeiKunde] SET (LOCK_ESCALATION = TABLE)
GO
