SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteTodo]
	@todoid int
AS
BEGIN
	SET NOCOUNT ON;
	print 1
	delete rbt_RolleBerechtigtFuerTodo where td_Todo_UNID = @todoid
	print 2
	delete tdn_todoNachfolger where td_Todo_UNID1 = @todoid
	print 3
	delete tdv_todoVorgaenger where td_Todo_UNID1 = @todoid
	print 4
	delete dba_dashboardanzeige where unid = @todoid
	print 5
	delete key_key where unid = @todoid
	print 6
	delete td_Todo where unid = @todoid
END

GO
