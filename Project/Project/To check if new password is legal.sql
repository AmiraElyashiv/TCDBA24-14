


-- Password func 

-- check if password is legal : over 5 characters, combin small, big chars and  digit,
-- and not equal to existing password in password table, not 'password' in any combination

CREATE OR ALTER FUNCTION udf_passwordValid 
					   (@password nvarchar(50), 
					    @userName nvarchar(50)) returns char	

as
/*** test ***/
 --select dbo.udf_passwordValid('123Sem', 'Sem')


begin
	
	IF (EXISTS(SELECT [Password] FROM [Admin].[utbl_Users] WHERE [Password] = @password)) OR
	   (EXISTS(SELECT [Password] FROM [Admin].[utbl_PasswordHistory] WHERE [Password] = @Password))
			BEGIN
				--PRINT N'THE Password Already used in the past'
				RETURN('N')
			END	
	  ELSE -- if Password not exist
			IF @userName =@password
				BEGIN
					--PRINT N'The Password Could not be equal to Usernamwe'
					RETURN('N')
				END	
	  ELSE
	  	BEGIN
			declare @Valid int			      
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
					--PRINT N'The Password does not match the security policy'
					RETURN('N')
				END
end			
	return ('Y')
end