USE [Casino]
GO
-- Play send Feedback proc --
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[usr_sendFeedback]	
	 @userID int ,
	 @message nvarchar(50) 	 
AS
/*** test ***/
-- exec [dbo].[usr_sendFeedback] @userID  = '3', @message ='Best Game'
-- select  * from [Admin].[utbl_Feedback]

BEGIN	
	SET NOCOUNT ON;
	INSERT INTO [Admin].[utbl_Feedback]
			   ([UserId],[Message],[Time])
		 VALUES 
			   (@userID ,@Message,  getdate() )
	PRINT 'Inserted new feedback  in Feedback table' 
END
GO


-------------------------------------------------------------

-- Deposit can't be more than 1000$ proc
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[usp_BeatMorethan1000]

AS
/*** test ***/
-- exec [dbo].[usp_BeatMorethan1000]
-- select  * from [Security].[utbl_BankRollStatus]


BEGIN
	SELECT  userid ,
			sum (beat) AS TotalBeat
	FROM [Security].[utbl_BankRollStatus]
    WHERE [TIME] BETWEEN  (SELECT DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0))  AND      
                          (SELECT DATEADD(day, DATEDIFF(day, -1, GETDATE()), 0))
    GROUP BY UserId
	HAVING sum (beat)> 1000

	
END
GO


---------------------------------------------------------

-- InsertBonus 10$ for new player --
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE OR ALTER PROCEDURE [dbo].[usp_InsertBonus] 
	 @Username nvarchar (50)
 AS

 /*** test ***/
-- exec [dbo].[usp_InsertBonus] @Username = 'Sem'
-- select  * from [Security].[utbl_BankRollStatus]
-- select  * from [Admin].[utbl_Users] 


 BEGIN
	  SET IDENTITY_INSERT [Security].[utbl_BankRollStatus]OFF
	  DECLARE @DEPOSIT  FLOAT
	  SET @DEPOSIT = 10
	  INSERT INTO [Security].[utbl_BankRollStatus]  
							([UserId],[Deposit],[Time])
							 SELECT UserID ,10,getdate() 
							 FROM [Admin].[utbl_Users] 
							 WHERE Username = @Username

	   PRINT N'You Receive' +'  ' + cast(@DEPOSIT as nvarchar(30))+ '  ' + ' bonus to play'
   END
GO
--------------------------------------
  
 -- Logout proc
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[usp_Logout]
						@UserName nvarchar (50)
AS
/*** test ***/
--exec [dbo].[usp_Logout] @Username = 'SuperMen'
--select * from [Admin].[Utbl_Login]
BEGIN

	SET NOCOUNT ON;
	if (select [LoggedIn] from [Admin].[Utbl_Login] where username = @Username  ) =0
		begin
			PRINT N'you are  already logedd out '
			return
		end
	else
		update [Admin].[Utbl_Login]
		set [LoggedIn] = 0
	    where username = @UserName
   
END
GO
---------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  OR ALTER PROCEDURE [dbo].[usp_GenPass]
						 @pass VARCHAR(8) = NULL OUTPUT,
						 @reqID INT = 0 OUTPUT
AS
/*** test ***/
-- exec [dbo].[usp_GenPass] @pass = '1234Sad', @reqID = 0

BEGIN
   SET NOCOUNT ON;
   SET @pass = dbo.udf_genPass();
   INSERT INTO [Admin].[utbl_Passwords]
       VALUES 
	         (getDate(), @pass);
   SELECT @reqID = IDENT_CURRENT('GenPasswords');
   SET NOCOUNT OFF;
END
GO





















-----------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--[USP_unlockUser]
CREATE OR ALTER PROCEDURE [dbo].[usp_unlockUser]
						@userId  int 
	
AS
/*** test ***/
--EXEC msdb.dbo.usp_unlockUser	@UserId = 1

BEGIN 
	SET NOCOUNT ON;
	DECLARE  @newPass VARCHAR(8)
    SELECT @newPass = dbo.udf_genPass()
     
	UPDATE [Admin].[utbl_Users]
	   SET [IsLock] = 0  ,
		   [password] = @newPass 
	 WHERE @userId =userid 

     EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'DBA',
				@recipients = 'recipients@company.com',
				@subject = ' Reset Password',
				@body='Please change your password on next login',
				@query_attachment_filename='@newPass'
END
GO


