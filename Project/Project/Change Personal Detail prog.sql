USE [Casino]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR  ALTER PROCEDURE [dbo].[usp_ChangePersonalDetails]
						@FirstName nvarchar (50),	
						@Userid int,
						@LastName nvarchar (50),
						@Address nvarchar(50),
						@Country nvarchar(50),
						@EmailAddres nvarchar(50),
						@gender nvarchar(50)

AS
 
	IF  @EmailAddres NOT LIKE '%_@__%.__%' 
                   AND 
				   PATINDEX('%[^a-z,0-9,@,.,_]%', REPLACE(@EmailAddres, '-', 'a')) = 0
		 BEGIN
			PRINT N'THE Email is not Valid'
			RETURN
		 END  
	ELSE
		                        	   
	   BEGIN    
		   update [Admin].[utbl_Users]
			set FirstName= @FirstName , 
				LastName= @lastname  ,
				[Address]=@address ,
				Country= @country ,
				EmailAddres= @EmailAddres,
				gender=@gender 
		  where userid = @userId
		END
	   
GO


