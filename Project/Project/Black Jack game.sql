USE [Casino]
GO

/****** Object:  StoredProcedure [dbo].[usp_BlackJack21]    Script Date: 14/04/2019 10:40:18 ******/
-- BlackJack game

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


 CREATE OR ALTER PROCEDURE [dbo].[usp_BlackJack21]
									@Cards int , 
									@Beat float ,
									@UserId int
 
 AS
 /*** test ***/
 --exec [dbo].[usp_BlackJack21] @cards =3 , @beat=100 ,@userid=6
 BEGIN
   SET NOCOUNT ON; 
   DECLARE @Check float =0
   SET @Check = (select  (sum ([Deposit]) - sum ([cashwithrawal]))
				 from [Security].[utbl_BankRollStatus]
				 where userid = @UserId )
  
   begin 
    if  @Check < @Beat --and @Check < 0
	  begin
		print  @Check 
		PRINT N'YOU HAVE NOT ENOUGH MONEY TO PLAY,PLEASE DEPOSIT'
		RETURN
	   END
    else
	    DECLARE @Symbol1 int, @Symbol2 int ,@Symbol3 int,@Symbol4 int,@i int
		SET  @I = 1 
		SET  @Symbol2 = 0
		SET  @Symbol4 = 0
		WHILE @I <= @cards 
		BEGIN
			set @Symbol1= (SELECT  CAST (ABS(RAND()* 13 +1 ) AS INT));
			set @Symbol2 = @Symbol2+@Symbol1
			PRINT ' Your ' + cast (@I AS VARCHAR) +' '+  'Card Value is: '+ cast (@Symbol1 AS VARCHAR)
			SET @I = @I +1;
		END
	 
  IF(@Symbol2)>21
	  BEGIN
		PRINT ' Your Total score is:'  +' '+ cast (@Symbol2 AS VARCHAR)	
		PRINT N'YOU LOOSE'	
		BEGIN
	 		DECLARE @cashwithrawal INT
			SET  @cashwithrawal=@BEAT
			INSERT INTO [Security].[utbl_BankRollStatus] 
						(UserId,[cashwithrawal] ,[Beat],[Win], [Loose],[Time],[GameId])
			     VALUES 
				        (CAST (@UserId as int) , @cashwithrawal, @BEAT ,0,1, getdate(),2)
		END 
		RETURN 	
	  END
  ELSE
	 PRINT ' Your Total score is:'  +' '+ cast (@Symbol2 AS VARCHAR)
	
  while (@Symbol4) <21 AND (@Symbol4) <@Symbol2
	BEGIN 
     set @Symbol3= (SELECT  CAST (ABS(RAND()* 13 +1 ) AS INT));
	 PRINT ' Your Card Value is: '+ cast (@Symbol3 AS VARCHAR)
	 set @Symbol4 = @Symbol4+@Symbol3
    END
	  PRINT ' The Dealer score is:'  +' '+ cast (@Symbol4 AS VARCHAR)
	IF (@Symbol4 > @Symbol2) and (@Symbol4) <=21
	 BEGIN
       PRINT N'Casino  WIN'	
	   RETURN
	 END
	ELSE
       BEGIN
	   --PRINT ' Your  score is:' + cast (@Symbol2 AS VARCHAR)	
			PRINT N'YOU WIN'
			BEGIN
				DECLARE @Deposit INT
				SET @Deposit=@BEAT
				insert into [Security].[utbl_BankRollStatus] 
						   (UserId, Deposit, [Beat], [Win], [Loose], [Time], [GameId])
					 values 
					       (CAST (@UserId as int) ,@Deposit, @BEAT ,1,0, getdate(),2)
			END  		
			RETURN	
		END
	END
	END
GO


