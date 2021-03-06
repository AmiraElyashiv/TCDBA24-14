USE [Casino]
GO

/******   Procedure to validate registration of new player  ******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[usp_registerAndValidation]
CREATE OR ALTER PROCEDURE [dbo].[usp_registerAndValidation]
				@userName	 nvarchar(50),
				@password	 nvarchar(50),
				@firstName	 nvarchar (50),
				@lastName	 nvarchar (50),
				@address	 nvarchar(50),
				@country	 nvarchar(50),
				@emailAddres     nvarchar(50),
				@gender	         nvarchar(50),
				@birthDate	 datetime ,
				@isLock		 int 
AS

/*** test ***/
--exec [dbo].[usp_registerAndValidation]
--		@Username = 'SuperMen',@Password ='1Ln456',@FirstName ='Amira',
--		@LastName ='Ely',@Address ='BY',@Country ='Israel',
--		@EmailAddres ='super@gmail.com',@gender ='1',@BirthDate ='15.10.1947',@isLock= 0 

BEGIN
    SET NOCOUNT ON;

    --- check if @userName is legal 
    IF (@userName IS NULL) 
		BEGIN
			PRINT 'The Username is empty. Please try again'
			RETURN
		END	
	 ELSE  -- if not empty
		IF  EXISTS(SELECT Username FROM [Admin].[utbl_Users] WHERE Username =@userName)
			BEGIN
				DECLARE @p  INT
				SET @P = (SELECT  CAST (ABS(RAND()* 9 +1 ) AS INT ));
					
				PRINT 'The Username already exist. Please try again ' + @userName +  CAST(@p AS VARCHAR)
				RETURN
			END	
	
	
	
	-- check if password is legal : over 5 characters, combin small, big chars and  digit,
	-- and not equal to existing password in password table, not 'password' in any combination

	IF EXISTS(SELECT [Password] FROM [Admin].[utbl_Users] WHERE [Password] = @password)
		BEGIN
			PRINT N'The Password already exist. Please try again '
			RETURN
		END	
	 ELSE -- if Password not exist
		IF @userName =@password
			BEGIN
				PRINT N'The Password Could not be equal to Usernamwe'
				RETURN
			END	
					
	
	DECLARE @Valid int		      
        SET @Valid =
		CASE WHEN
         	@password COLLATE Latin1_General_BIN   LIKE '%[a-z]%' AND
			@password COLLATE Latin1_General_BIN   LIKE '%[A-Z]%' AND
			@password   LIKE '%[0-9]%' AND
			@password  NOT LIKE '%password%' AND 
			@password  NOT LIKE '%p%assword%' AND 
			@password  NOT LIKE '%pa%ssword%' AND 
			@password  NOT LIKE '%pas%sword%' AND 
			@password  NOT LIKE '%pass%word%' AND 
			@password  NOT LIKE '%passw%ord%' AND 
			@password  NOT LIKE '%passwo%rd%' AND 
			@password  NOT LIKE '%passwor%d%'AND 
		    LEN(@password) > 5
				THEN  1 
					ELSE  0
				END 
		
			IF @Valid = 0
				BEGIN
					PRINT N'The Password does not match the security policy'
					RETURN
				END


        -- check if email is unique , legal format with @ and doesn't already exist
	    IF EXISTS(SELECT EmailAddres FROM [Admin].[utbl_Users] WHERE EmailAddres =@emailAddres)
			BEGIN
				PRINT N'The Email already exist'
				RETURN
			END	 
		ELSE
			IF @emailAddres NOT LIKE '%_@__%.__%' AND
			   PATINDEX('%[^a-z,0-9,@,.,_]%', REPLACE(@emailAddres, '-', 'a')) = 0
	                  BEGIN
				PRINT N'The Email is not a valid'
				RETURN
			  END  
	
	

	    --- check if player over 18 year age
		DECLARE @AGE int
		SET @AGE = (SELECT DATEDIFF(yy,@birthDate,GETDATE()))
		IF @AGE< 18
			BEGIN
				PRINT N'You must be 18 years old to play'
				RETURN
			END
  -------------------------------------------------------------
  --  insert new user to Users table       
   BEGIN
	   SET IDENTITY_INSERT [Admin].[utbl_Users] OFF
	   INSERT into [Admin].[utbl_Users] 
			   ([UserName], 
				[Password], 
				[FirstName],
				[LastName] ,
				[Address] ,
				[Country] ,
				[EmailAddres] , 
				[gender] ,
				[BirthDate] ,
				[IsLock] )  
			values
		       (@userName,
				@password,
				@firstName,
				@lastName,
				@address,
				@country,
				@emailAddres,
				@gender,
				@birthDate,
				@isLock)
   END

   PRINT 'Inserted new Player in Users tab  ' + @Username
---------------------------------------------------------------
	 
   BEGIN
	   SET IDENTITY_INSERT [Security].[utbl_BankRollStatus]OFF
	   INSERT into [Security].[utbl_BankRollStatus]  
				([UserId],
				 [Deposit],
				 [Time])

			   SELECT UserID ,10,getdate()  
			   FROM [Admin].[utbl_Users]
			   WHERE Username = @userName

		PRINT 'Player receive $10 bonus to play'
   END
-----------------------------------------------------------------

   BEGIN
		--SET IDENTITY_INSERT [dbo].[utbl_PasswordHistory] OFF
		INSERT INTO [Admin].[utbl_PasswordHistory] 
				([UserId],[Password])

			  SELECT [UserID],Password 
			  FROM [Admin].[utbl_Users]
			  WHERE [UserName] = @userName
   END

   ------------------------------------------------------------
   
   	BEGIN
		INSERT INTO [Admin].[utbl_Login] 
				([UserName],[LoggedIn],[time])
			VALUES
				(@userName ,1 ,GETDATE())
	END

    PRINT 'Inserted new row in PasswordHistory and  tab Login tables' 

END
GO

-- select  * from [Admin].[utbl_Users]


 exec [dbo].[usp_registerAndValidation]
		@Username = 'Semo',@Password ='semO123',@FirstName ='Sem',
		@LastName ='Richards',@Address ='TA',@Country ='Israel',
		@EmailAddres ='semo@gmail.com',@gender ='1',@BirthDate ='11.11.1955',@isLock= 0 
		

 exec [dbo].[usp_registerAndValidation]
		@Username = 'Winner',@Password ='12345jWN',@FirstName ='Keren',
		@LastName ='Laser',@Address ='Krayout',@Country ='Israel',
		@EmailAddres ='keren@gmail.com',@gender ='2',@BirthDate ='11.11.1978',@isLock= 0 
		

 exec [dbo].[usp_registerAndValidation]
		@Username = 'Mosh',@Password ='15Abc15',@FirstName ='Moshe',
		@LastName ='Gil',@Address ='Haifa',@Country ='Israel',
		@EmailAddres ='mosh@ergmail.com',@gender ='1',@BirthDate ='11.11.1971',@isLock= 0 
