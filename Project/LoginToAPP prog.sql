USE [Casino]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[USP_LoginToAPP]
							@Username nvarchar(50),
							@Password nvarchar(50)

AS
/*** TEST ***/
-- exec [dbo].[USP_LoginToAPP] @Username = 'Semo',@Password ='semO123'
-- select  * from [Admin].[utbl_Users]


BEGIN

 SET NOCOUNT ON;
 DECLARE @Counters int
     SET @Counters = (SELECT islock 
						FROM [Admin].[Utbl_Users]
						WHERE username = @Username ) 
  IF  @Counters>4
	  BEGIN
		  PRINT N'you are Locked'
		  REturn
	  END
  ELSE
	  IF  (SELECT [LoggedIn] FROM [Admin].[Utbl_Login] WHERE @Username = UserName) =1
		  BEGIN
			  PRINT N'YOU ARE ALREADY LOGEDD IN'
			  RETURN
		  END
  
	  IF   EXISTS(SELECT Username ,[Password] 
					FROM [Admin].[Utbl_Users] 
					WHERE Username =@Username AND 
						  [Password] = @Password)
	        BEGIN
  
			update [Admin].[Utbl_Login] 
			set [LoggedIn] = 1 
			where  @Username = UserName

			PRINT N'you are logedd in succefully'
 
			begin
				declare @Amonut float
				set @Amonut =  ( select (sum (deposit) - sum (beat)) 
									from [Security].[utbl_BankRollStatus] B
									inner join [Admin].[utbl_Users] U on  u.UserID  = b.UserId
									WHERE  u.UserName =@Username)
					print N'your  Bankroll amount is'+ ' ' + CAST(@Amonut AS varchar(10))
					return
				end
			REturn
           END
  ELSE
		  IF NOT EXISTS(SELECT Username FROM utbl_Users WHERE  Username =@Username)
			   BEGIN
				  PRINT N'YOU MUST TO REGISTER TO LOGIN'
				  REturn
			  END
		  ELSE 
			  IF NOT EXISTS(SELECT [Password] FROM utbl_Users WHERE  [Password] = @Password)
				   BEGIN
					  PRINT N'WRONG PASSWORD'
					  UPDATE [Admin].[utbl_Users]
					  SET [IsLock] = [IsLock] +1 
					  WHERE Username =@Username
				  REturn
				  END

 END 








