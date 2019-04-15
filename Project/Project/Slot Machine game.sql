USE [Casino]
GO

SET ANSI_NULLS ON
GO

/***** Script for SelectTopNRows command from SSMS  ***/

SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[usp_SLOT_MACHINE]
							@BEAT FLOAT, 
							@UserId int
AS
/*** test ***/
-- exec [dbo].[usp_SLOT_MACHINE] @BEAT=1150 ,@UserId=6

BEGIN
  SET NOCOUNT ON;  
  declare @Check float =0
  set @Check = (select  (sum ([Deposit]) - sum ([cashwithrawal])) 
				from [Security].[utbl_BankRollStatus]
				where userid = @UserId )
  
  begin 
  if  @Check < @BEAT --and @Check < 0
	  begin
		   print  @Check 
		   PRINT N'YOU HAVE NOT ENOUGH MONEY TO PLAY,PLEASE DEPOSIT'
		   RETURN
	   END
  ELSE  
   BEGIN
	 DECLARE @Symbol1 int ,@Symbol2 int, @Symbol3 int 
	 set @Symbol1= (SELECT  CAST (ABS(RAND()* 6 +1 ) AS INT))
	 set @Symbol2= (SELECT  CAST (ABS(RAND()* 6 +1 ) AS INT))
	 set @Symbol3= (SELECT  CAST (ABS(RAND()* 6 +1 ) AS INT))
	 IF  @Symbol1 = @Symbol2 AND  @Symbol1 =  @Symbol3
		  BEGIN
			PRINT @Symbol1
			PRINT @Symbol2
			PRINT @Symbol3
			PRINT N'YOU WIN'
			BEGIN
	    		DECLARE @Deposit INT
				SET @Deposit=@BEAT
				insert into [Security].[utbl_BankRollStatus] 
							(UserId, Deposit,[Beat],[Win], [Loose],[Time],[GameId])
					 values 
							(CAST (@UserId as int) ,@Deposit, @BEAT ,1,0, getdate(),1)
			END  		
		  RETURN
		  END

	ELSE
		BEGIN
			PRINT @Symbol1
			PRINT @Symbol2
			PRINT @Symbol3
			PRINT N'YOU LOOSE'

			BEGIN
   				DECLARE @cashwithrawal INT
				SET  @cashwithrawal=@BEAT
				insert into [Security].[utbl_BankRollStatus]
							(UserId,[cashwithrawal] ,[Beat],[Win], [Loose],[Time],[GameId])
					 values
						   (CAST (@UserId as int) , @cashwithrawal, @BEAT ,0,1, getdate(),1)
			END 
		    RETURN 	
		END
    END
   END
END 
   

 GO


