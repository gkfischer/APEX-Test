SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[trg_insert_prc] on [dbo].[prc_prozedur] for insert
as
begin
	declare cur_insert_prc cursor for (select * from prc_prozedur)
	open cur_insert_prc
	declare @sqlstring nvarchar(max)
	declare @prcName varchar(max)
	declare @p1 varchar(max)
	declare @p2 varchar(max)
	declare @p3 varchar(max)
	declare @p4 varchar(max)
	declare @p5 varchar(max)
	declare @p6 varchar(max)
	declare @p7 varchar(max)
	declare @p8 varchar(max)
	declare @p9 varchar(max)
	declare @sub varchar(max)
	fetch next from cur_insert_prc into @prcName, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9
	set @sqlstring = 'exec '+@prcName + ' '
	set @sub = ''
		
	if(@p1 is not null)
    begin
        set @sub = @sub+ ''''+@p1+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p2 is not null)
    begin
        set @sub = @sub+ ''''+@p2+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p3 is not null)
    begin
        set @sub = @sub+ ''''+@p3+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p4 is not null)
    begin
        set @sub = @sub+ ''''+@p4+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p5 is not null)
    begin
        set @sub = @sub+ ''''+@p5+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p6 is not null)
    begin
        set @sub = @sub+ ''''+@p6+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p7 is not null)
    begin
        set @sub = @sub+ ''''+@p7+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p8 is not null)
    begin
        set @sub = @sub+ ''''+@p8+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end
    if(@p9 is not null)
    begin
        set @sub = @sub+ ''''+@p9+''''
        if(len(@sub) != 0 and @sub is not null)
            set @sub = @sub + ','
    end


	set @sqlstring = @sqlstring + @sub
	set @sqlstring = SUBSTRING(@sqlstring, 0, len(@sqlstring))
	print @sqlstring
    exec(@sqlstring)
	close cur_insert_prc
	deallocate cur_insert_prc
	delete prc_prozedur
end

GO
