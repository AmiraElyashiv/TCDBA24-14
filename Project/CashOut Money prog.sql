-- Cash Out Money proc --
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER  PROCEDURE [dbo].[USP_CashOutMoney]
					@Address nvarchar(50),
					@CashAmount float, 
					@UserId int 
	 AS	
	 /*** test ***/

    -- exec [dbo].[USP_CashOutMoney] @UserId=6,@CashAmount = 1 ,@Address='ewered12'
	-- select  * from [Security].[utbl_BankRollStatus]	
	 BEGIN
		 SET QUOTED_IDENTIFIER ON
		 declare @Check float =0
		 set @Check = (select  (sum ([Deposit]) - sum ([cashwithrawal])) 
					   from [Security].[utbl_BankRollStatus]
		               where userid = @UserId )
  
		   BEGIN 
			 IF  @Check < @CashAmount
				 begin
					PRINT N'Not Enough Money to cash out'
					return
				end
			ELSE
				begin
				   insert into [Security].[utbl_BankRollStatus]
								 (UserId,[cashwithrawal],[Address] ,[Time])
						values 
								 (@UserId , @CashAmount ,@Address, getdate())
				   PRINT N'THE CHECK WILL BE SENT SOON TO YOUR ADDRESS'
				END  	
            END
END
GO