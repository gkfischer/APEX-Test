SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getKundenrabatt]
(
	@user int,
	@cos1 char(2),
	@cos2 char(5),
	@cos3 char(8),
	@atl varchar(20)
)
RETURNS decimal(19,2)
AS
BEGIN
	-- Declare the return variable here

	DECLARE @res decimal(19,2)
	if @cos1 is not null and exists(select * from kr_kundenrabatt where ku_kunde_unid = @user and cs1_cos1_unid = @cos1)
	begin
		select top 1 @res = kr_rabatt from kr_kundenrabatt where ku_kunde_unid = @user and cs1_cos1_unid = @cos1 order by kr_typ desc
	end
	if @cos2 is not null and exists(select * from kr_kundenrabatt where ku_kunde_unid = @user and cs2_cos2_unid = @cos2)
	begin
		select top 1 @res = kr_rabatt from kr_kundenrabatt where ku_kunde_unid = @user and cs2_cos2_unid = @cos2 order by kr_typ desc
	end
	if @cos3 is not null and exists(select * from kr_kundenrabatt where ku_kunde_unid = @user and cs3_cos3_unid = @cos3)
	begin
		select top 1 @res = kr_rabatt from kr_kundenrabatt where ku_kunde_unid = @user and cs3_cos3_unid = @cos3 order by kr_typ desc
	end
	if @atl is not null  and exists(select * from kr_kundenrabatt where ku_kunde_unid = @user and atl_artikel_unid = @atl)
	begin
		select top 1 @res = kr_rabatt from kr_kundenrabatt where ku_kunde_unid = @user and atl_artikel_unid = @atl order by kr_typ desc
	end

	-- Return the result of the function
	RETURN coalesce(@res,-1)

END
GO
