SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerald Fischer
-- Create date: 2015-08-19
-- Description:	Calculation and update of tii_zielnettopreis , tii_gesamtpreisnetto_vi,tii_rabatt_VI, 
--              tii_gesamtrabatt_VI, tii_Gesamtrabatt, tii_gesamtpreisnetto
-- Input:       tii_zielnettopreis, tii_rabatt_VI, oder tii_gesamtrabatt
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTiiRabattDirekterKundeVI]
	-- Add the parameters for the stored procedure here
	@unid int = 0, 
	@fieldname varchar(100) = '',
	@fieldvalue decimal(11,2)

AS
BEGIN
	declare @listenpreis decimal(11,2), 
		@hinterlegterRabatt decimal(5,4), 
		@zielnettopreis decimal(11,2), 
		@gesamtpreisnetto decimal(11,2), 
		@zusatzrabatt decimal(5,4), 
		@gesamtrabatt_vi decimal(5,4),
		@gesamtrabatt decimal(5,4),
		@angebotsrabatt decimal(5,4),
		@errormsg varchar(200)


	-- check parameters passed
	IF @unid IS NULL
		BEGIN
			RAISERROR('Fehler. UNID muss angegeben werden.', 18, 0)
			RETURN
		END

	IF @fieldname is null  
		BEGIN
			SET @errormsg = 'Fehler. Feldname muss "tii_zielnettopreis", "tii_rabatt_VI", oder "tii_gesamtrabatt" sein. "NULL" ist ungültig.'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END
		
	IF CHARINDEX(@fieldname, 'tii_zielnettopreis,tii_rabatt_VI,tii_gesamtrabatt') = 0 
		BEGIN
			SET @errormsg = concat('Fehler. Feldname muss "tii_zielnettopreis", "tii_rabatt_VI", oder "tii_gesamtrabatt" sein. "', COALESCE( @fieldname,''), '" ist ungültig.')
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END
		
	IF @fieldvalue IS NULL
		BEGIN
			RAISERROR('Fehler. Feldwert muss angegeben werden.', 18, 0)
			RETURN
		END

	IF CHARINDEX(@fieldname, 'tii_rabatt_VI,tii_gesamtrabatt') > 0 AND (@fieldvalue < 0 OR @fieldvalue > 1)
		BEGIN
			SET @errormsg = 'Fehler. Feldwert muss als Prozentsatz zwischen 0 und 1 liegen. ' + rtrim(cast(@fieldvalue AS varchar(20))) + ' ist ungültig'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END

	IF CHARINDEX(@fieldname, 'tii_zielnettopreis') > 0 AND (@fieldvalue <= 0 )
		BEGIN
			SET @errormsg = 'Fehler. Feldwert muss als Preis größer 0 sein. ' + rtrim(cast(@fieldvalue AS varchar(20))) + ' ist ungültig'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END

	-- 'Listenpreis', 'hinterlegter Rabatt', 'angebotsrabatt' aus datenbank lesen 
	select @listenpreis = [tii_artikellistenpreis], @hinterlegterRabatt = [tii_hinterlegterrabatt], @angebotsrabatt = [ti_zusatzrabatt]
		from [SCHNEIDER].[dbo].[tii_ticketInfo] as tii, [SCHNEIDER].[dbo].[ti_ticket] as ti
		where tii.ti_ticket_UNID = ti.UNID AND tii.unid = @unid

	IF @fieldname = 'tii_zielnettopreis' 
		BEGIN
			SET @zielnettopreis = @fieldvalue
			SET @gesamtpreisnetto = @fieldvalue
			SET @gesamtrabatt_vi = 1 - (@zielnettopreis / @listenpreis)
			SET @zusatzrabatt = @gesamtrabatt_vi - @hinterlegterRabatt
		END
	IF @fieldname = 'tii_rabatt_VI' 
		BEGIN
			SET @zusatzrabatt = @fieldvalue
			SET @gesamtrabatt_vi = @hinterlegterRabatt + @zusatzrabatt
			SET @gesamtpreisnetto = @listenpreis * (1 - @gesamtrabatt_vi)
			SET @zielnettopreis = NULL
		END

	IF @fieldname = 'tii_gesamtrabatt' 
		BEGIN
			SET @gesamtrabatt_vi = @fieldvalue
			SET @zusatzrabatt = @gesamtrabatt_vi - @hinterlegterRabatt
			SET @gesamtpreisnetto = @listenpreis * (1 - @gesamtrabatt_vi)
			SET @zielnettopreis = NULL
		END

	SET @gesamtrabatt = @gesamtrabatt_vi + COALESCE(@angebotsrabatt, 0) - (@gesamtrabatt_vi * COALESCE(@angebotsrabatt, 0))

	UPDATE [SCHNEIDER].[dbo].[tii_ticketInfo] 
		SET tii_zielnettopreis = @zielnettopreis, 
			tii_gesamtpreisnetto_vi = @gesamtpreisnetto,
			tii_rabatt_VI = @zusatzrabatt, 
			tii_gesamtrabatt_VI = @gesamtrabatt_vi,
			tii_Gesamtrabatt = @gesamtrabatt,
			tii_gesamtpreisnetto = tii_artikellistenpreis * (1.0 - @gesamtrabatt)
		WHERE unid = @unid
END
GO
