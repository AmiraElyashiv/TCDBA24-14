SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[usp_DepositMoney]	
							@CreditCardNUM numeric, 
							@DepositAmount float, 
							@UserId int ,
							@ExpireDate date
	AS	

	/*** test ***/
	--exec [dbo].[USP_DepositMoney] @UserId=6,@DepositAmount = 800 , @CreditCardNUM= 1234567812345678, @ExpireDate= '20190404'
  
  
    BEGIN
		SET IDENTITY_INSERT [Security].[utbl_BankRollStatus] off	
		SET QUOTED_IDENTIFIER ON
		SET NOCOUNT ON;

		  if (select (datediff (day,@ExpireDate,getdate()))) > 30 
			begin
				PRINT N'Please use a  Valid ExpDate'
				return
			end
		 
		  if (SELECT LEN(@CreditCardNUM))<16
			   begin
				   PRINT N'Please use a  Valid creditcard'
				   return
			   end
		   
		   IF (@DepositAmount > 1000)
			   BEGIN
				   PRINT N'You cant deposit more than $1000'
				   return
			   end
		   ELSE
			   begin
				insert into [Security].[utbl_BankRollStatus] 
							(UserId, Deposit, CreditCardNum, [ExpireDate],[Time])
				     values
						    (@UserId , @DepositAmount , @CreditCardNUM, CAST (@ExpireDate as DATE) ,getdate())
		   END  	
END

GO