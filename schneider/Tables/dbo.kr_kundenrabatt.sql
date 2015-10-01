SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kr_kundenrabatt] (
		[UNID]                 [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
		[ku_kunde_unid]        [int] NULL,
		[cs1_cos1_unid]        [char](2) COLLATE Latin1_General_CI_AS NULL,
		[cs2_cos2_unid]        [char](5) COLLATE Latin1_General_CI_AS NULL,
		[cs3_cos3_unid]        [char](8) COLLATE Latin1_General_CI_AS NULL,
		[atl_artikel_unid]     [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[kr_validFrom]         [datetime] NULL,
		[kr_validTo]           [datetime] NULL,
		[kr_rabatt]            [decimal](9, 2) NULL,
		[kr_typ]               [char](1) COLLATE Latin1_General_CI_AS NULL,
		[kr_ebenerabatt]       [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[updatedBy]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [PK_kr_kundenrabatt]
		PRIMARY KEY
		CLUSTERED
		([UNID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[kr_kundenrabatt]
	WITH NOCHECK
	ADD CONSTRAINT [FK_kr_kundenrabatt_atl_artikel]
	FOREIGN KEY ([atl_artikel_unid]) REFERENCES [dbo].[atl_artikel] ([UNID])
ALTER TABLE [dbo].[kr_kundenrabatt]
	CHECK CONSTRAINT [FK_kr_kundenrabatt_atl_artikel]

GO
ALTER TABLE [dbo].[kr_kundenrabatt]
	WITH NOCHECK
	ADD CONSTRAINT [FK_kr_kundenrabatt_ku_kunde]
	FOREIGN KEY ([ku_kunde_unid]) REFERENCES [dbo].[ku_kunde] ([UNID])
ALTER TABLE [dbo].[kr_kundenrabatt]
	CHECK CONSTRAINT [FK_kr_kundenrabatt_ku_kunde]

GO
ALTER TABLE [dbo].[kr_kundenrabatt] SET (LOCK_ESCALATION = TABLE)
GO
