SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gerald Fischer
-- Create date: 2015-08-26
-- Description:	Calculation and update of tii_rabatt_ind, tii_zusatzrabatt_ind, tii_gesamtrabatt_ind, tii_gesamtpreisnetto_ind
-- Input:       tii_rabatt_ind UND tii_zusatzrabatt_ind, tii_gesamtrabatt_ind, oder tii_gesamtpreisnetto_ind
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTiiRabattIndirekterKundeVI]
	-- Add the parameters for the stored procedure here
	@unid int = 0, 
	@rabatt decimal(7, 6),
	@fieldname varchar(100) = '',
	@fieldvalue decimal(13, 6)

AS
BEGIN
	declare @listenpreis decimal(13,6), 
		@zusatzrabatt decimal(7, 6), 
		@hinterlegterRabatt decimal(7, 6), 
		@zielnettopreis decimal(13, 6), 
		@zusatzrabatt_ind decimal(7, 6), 
		@gesamtrabatt_ind decimal(7, 6),
		@gesamtrabatt_vi decimal(7, 6),
		@gesamtrabatt decimal(7, 6),
		@gesamtpreisnetto_ind decimal(13, 6), 
		@aufschlag decimal(13, 6) = 0.25, 
		@errormsg varchar(200)


	-- check parameters passed
	IF @unid IS NULL
		BEGIN
			RAISERROR('Fehler. UNID muss angegeben werden.', 18, 0)
			RETURN
		END

	IF @rabatt IS NULL
		BEGIN
			RAISERROR('Fehler. Rabatt muss angegeben werden.', 18, 0)
			RETURN
		END

	IF @fieldname is null  
		BEGIN
			SET @errormsg = 'Fehler. Feldname muss "tii_zusatzrabatt_ind", "tii_gesamtrabatt_ind" oder "tii_gesamtpreisnetto_ind" sein. "NULL" ist ungültig.'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END
		
	IF CHARINDEX(@fieldname, 'tii_zusatzrabatt_ind,tii_gesamtrabatt_ind,tii_gesamtpreisnetto_ind') = 0 
		BEGIN
			SET @errormsg = concat('Fehler. Feldname muss "tii_zusatzrabatt_ind", "tii_gesamtrabatt_ind" oder "tii_gesamtpreisnetto_ind" sein. "', COALESCE( @fieldname,''), '" ist ungültig.')
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END
		
	IF @fieldvalue IS NULL
		BEGIN
			RAISERROR('Fehler. Feldwert muss angegeben werden.', 18, 0)
			RETURN
		END

	IF CHARINDEX(@fieldname, 'tii_zusatzrabatt_ind,tii_gesamtrabatt_ind') > 0 AND (@fieldvalue < 0 OR @fieldvalue > 1)
		BEGIN
			SET @errormsg = 'Fehler. Feldwert muss als Prozentsatz zwischen 0 und 1 liegen. ' + rtrim(cast(@fieldvalue AS varchar(20))) + ' ist ungültig'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END

	IF CHARINDEX(@fieldname, 'tii_gesamtpreisnetto_ind') > 0 AND @fieldvalue < 0 
		BEGIN
			SET @errormsg = 'Fehler. Feldwert muss größer 0 sein. ' + rtrim(cast(@fieldvalue AS varchar(20))) + ' ist ungültig'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END

	IF @rabatt < 0  OR @rabatt > 1
		BEGIN
			SET @errormsg = 'Fehler. Rabatt muss als Prozentsatz zwischen 0 und 1 liegen. ' + rtrim(cast(@rabatt AS varchar(20))) + ' ist ungültig'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END

	-- 'Listenpreis', 'hinterlegter Rabatt', 'angebotsrabatt' aus datenbank lesen 
	select @listenpreis = [tii_artikellistenpreis], @hinterlegterRabatt = [tii_hinterlegterrabatt], @zusatzrabatt = ti.ti_zusatzrabatt
		from [SCHNEIDER].[dbo].[tii_ticketInfo] as tii, [SCHNEIDER].[dbo].[ti_ticket] as ti
		where tii.ti_ticket_UNID = ti.UNID AND tii.unid = @unid

	IF @fieldname = 'tii_zusatzrabatt_ind' 
		BEGIN
			SET @zusatzrabatt_ind = @fieldvalue
			SET @gesamtrabatt_ind = @zusatzrabatt_ind + @rabatt - (@zusatzrabatt_ind * @rabatt)
			SET @gesamtpreisnetto_ind = @listenpreis * (1.0 - @gesamtrabatt_ind)
		END
	IF @fieldname = 'tii_gesamtrabatt_ind' 
		BEGIN
			SET @gesamtrabatt_ind = @fieldvalue
			SET @zusatzrabatt_ind = 1.0 - (1.0 - @gesamtrabatt_ind) / (1.0 - @rabatt)
			SET @gesamtpreisnetto_ind = @listenpreis * (1.0 - @gesamtrabatt_ind)
		END

	IF @fieldname = 'tii_gesamtpreisnetto_ind' 
		BEGIN
			SET @gesamtpreisnetto_ind = @fieldvalue
			SET @gesamtrabatt_ind = 1.0 - (@gesamtpreisnetto_ind / @listenpreis)
			SET @zusatzrabatt_ind = 1.0 - (1.0 - @gesamtrabatt_ind) / (1.0 - @rabatt)
		END

	SET @gesamtrabatt_vi =  1 - ((1 - @gesamtrabatt_ind) / (1 + @aufschlag))
	IF @hinterlegterRabatt > @gesamtrabatt_vi
		SET @gesamtrabatt_vi = @hinterlegterRabatt

	SET @gesamtrabatt = @gesamtrabatt_vi + coalesce(@zusatzrabatt,0) - (@gesamtrabatt_vi * coalesce(@zusatzrabatt,0))
	UPDATE [SCHNEIDER].[dbo].[tii_ticketInfo] 
		SET tii_gesamtpreisnetto_ind = @gesamtpreisnetto_ind,
			tii_rabatt_ind = @rabatt, 
			tii_zusatzrabatt_ind = @zusatzrabatt_ind, 
			tii_gesamtrabatt_ind = @gesamtrabatt_ind,
			tii_gesamtrabatt_VI = @gesamtrabatt_vi, 
			tii_rabatt_VI = 1 - ((1 - @gesamtrabatt_vi) / (1 - @hinterlegterRabatt)),
			tii_gesamtpreisnetto_VI = @listenpreis * (1 - @gesamtrabatt_vi),
			tii_Gesamtrabatt = @gesamtrabatt,
			tii_gesamtpreisNetto = @listenpreis * (1 - @gesamtrabatt)
		WHERE unid = @unid
END

GO
