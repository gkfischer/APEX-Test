SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gerald Fischer
-- Create date: 2015-08-26
-- Description:	Calculation and update of tii_rabatt_pm, tii_gesamtrabatt_pm, tii_gesamtpresinetto_pm
-- Input:       tii_rabatt_pm, oder tii_gesamtrabatt_pm
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTiiRabattPM]
	-- Add the parameters for the stored procedure here
	@unid int = 0, 
	@fieldname varchar(100) = '',
	@fieldvalue decimal(11,2)

AS
BEGIN
	declare @listenpreis decimal(11,2), 
		@hinterlegterRabatt decimal(5,4), 
		@zusatzrabatt decimal(5,4), 
		@gesamtrabatt decimal(5,4),
		@errormsg varchar(200)


	-- check parameters passed
	IF @unid IS NULL
		BEGIN
			RAISERROR('Fehler. UNID muss angegeben werden.', 18, 0)
			RETURN
		END

	IF @fieldname is null  
		BEGIN
			SET @errormsg = 'Fehler. Feldname muss "tii_rabatt_pm", oder "tii_gesamtrabatt_pm" sein. "NULL" ist ungültig.'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END
		
	IF CHARINDEX(@fieldname, 'tii_rabatt_pm,tii_gesamtrabatt_pm') = 0 
		BEGIN
			SET @errormsg = concat('Fehler. Feldname muss "tii_rabatt_pm", oder "tii_gesamtrabatt_pm" sein. "', COALESCE( @fieldname,''), '" ist ungültig.')
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END
		
	IF @fieldvalue IS NULL
		BEGIN
			RAISERROR('Fehler. Feldwert muss angegeben werden.', 18, 0)
			RETURN
		END

	IF @fieldvalue < 0 OR @fieldvalue > 1
		BEGIN
			SET @errormsg = 'Fehler. Feldwert muss als Prozentsatz zwischen 0 und 1 liegen. ' + rtrim(cast(@fieldvalue AS varchar(20))) + ' ist ungültig'
			RAISERROR(@errormsg, 18, 0)
			RETURN
		END

	-- 'Listenpreis', 'hinterlegter Rabatt', aus datenbank lesen 
	select @listenpreis = [tii_artikellistenpreis], @hinterlegterRabatt = [tii_hinterlegterrabatt]
		from [SCHNEIDER].[dbo].[tii_ticketInfo] 
		where unid = @unid

	IF @fieldname = 'tii_rabatt_pm' 
		BEGIN
			SET @zusatzrabatt = @fieldvalue
			SET @gesamtrabatt = @zusatzrabatt + @hinterlegterRabatt - (@zusatzrabatt * @hinterlegterRabatt)
		END
	IF @fieldname = 'tii_gesamtrabatt_pm' 
		BEGIN
			SET @gesamtrabatt = @fieldvalue
			SET @zusatzrabatt = 1 - ((1 - @gesamtrabatt) / (1 - @hinterlegterRabatt))
		END

	UPDATE [SCHNEIDER].[dbo].[tii_ticketInfo] 
		SET tii_rabatt_PM = @zusatzrabatt, 
			tii_gesamtrabatt_PM = @gesamtrabatt,
			tii_gesamtpreisnetto_PM = tii_artikellistenpreis * (1.0 - @gesamtrabatt)
		WHERE unid = @unid
END

GO
