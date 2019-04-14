
/****** Object:  User [SlotMachine]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [SlotMachine] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SalesUser2]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [SalesUser2] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mdw_check_operator_admin]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [mdw_check_operator_admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DDMUser]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [DDMUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DDMMUser]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [DDMMUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BlackJackM]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [BlackJackM] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_datareader]
GO
/****** Object:  User [BlackJack]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [BlackJack] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AnyUser]    Script Date: 08/04/2019 15:36:54 ******/
CREATE USER [AnyUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [UtilityMDWWriter]    Script Date: 08/04/2019 15:36:54 ******/
CREATE ROLE [UtilityMDWWriter]
GO
/****** Object:  DatabaseRole [UtilityMDWCacheReader]    Script Date: 08/04/2019 15:36:54 ******/
CREATE ROLE [UtilityMDWCacheReader]
GO
/****** Object:  DatabaseRole [mdw_writer]    Script Date: 08/04/2019 15:36:54 ******/
CREATE ROLE [mdw_writer]
GO
/****** Object:  DatabaseRole [mdw_reader]    Script Date: 08/04/2019 15:36:54 ******/
CREATE ROLE [mdw_reader]
GO
/****** Object:  DatabaseRole [mdw_admin]    Script Date: 08/04/2019 15:36:54 ******/
CREATE ROLE [mdw_admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SlotMachine]
GO
ALTER ROLE [mdw_admin] ADD MEMBER [mdw_check_operator_admin]
GO
ALTER ROLE [mdw_writer] ADD MEMBER [mdw_check_operator_admin]
GO
ALTER ROLE [mdw_reader] ADD MEMBER [mdw_check_operator_admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BlackJack]
GO
ALTER ROLE [mdw_writer] ADD MEMBER [UtilityMDWWriter]
GO
ALTER ROLE [mdw_writer] ADD MEMBER [mdw_admin]
GO
ALTER ROLE [mdw_reader] ADD MEMBER [mdw_admin]
GO
/****** Object:  Schema [CasinoDDudi]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [CasinoDDudi]
GO
/****** Object:  Schema [CasinoDB221]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [CasinoDB221]
GO
/****** Object:  Schema [core]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [core]
GO
/****** Object:  Schema [custom_snapshots]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [custom_snapshots]
GO
/****** Object:  Schema [sec]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [sec]
GO
/****** Object:  Schema [snapshots]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [snapshots]
GO
/****** Object:  Schema [sysutility_ucp_core]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [sysutility_ucp_core]
GO
/****** Object:  Schema [sysutility_ucp_misc]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [sysutility_ucp_misc]
GO
/****** Object:  Schema [sysutility_ucp_staging]    Script Date: 08/04/2019 15:36:55 ******/
CREATE SCHEMA [sysutility_ucp_staging]
GO
/****** Object:  UserDefinedDataType [sysutility_ucp_core].[AggregationType]    Script Date: 08/04/2019 15:36:55 ******/
CREATE TYPE [sysutility_ucp_core].[AggregationType] FROM [tinyint] NULL
GO
/****** Object:  UserDefinedDataType [sysutility_ucp_core].[ObjectType]    Script Date: 08/04/2019 15:36:55 ******/
CREATE TYPE [sysutility_ucp_core].[ObjectType] FROM [tinyint] NULL
GO
/****** Object:  UserDefinedFunction [core].[fn_check_operator]    Script Date: 08/04/2019 15:36:55 ******/
--**************
--**************
--******************
/****** Object:  UserDefinedFunction [snapshots].[fn_get_query_text]    Script Date: 08/04/2019 15:36:55 ******/

/****** Object:  View [core].[snapshots]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
GO
/****** Object:  View [snapshots].[performance_counters]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  UserDefinedFunction [snapshots].[fn_get_performance_counters]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  UserDefinedFunction [snapshots].[fn_get_performance_counter_statistics]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_databases]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_filegroups]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_datafiles]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_logfiles]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
/****** Object:  UserDefinedFunction [sec].[fn_securitypredicate]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the predicate function

GO
/****** Object:  UserDefinedFunction [snapshots].[fn_trace_gettable]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [core].[supported_collector_types]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [core].[wait_types_categorized]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [dbo].[vRandom]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [snapshots].[distinct_query_stats]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[cpu_utilization]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_computers]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_dacs]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_smo_servers]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_core].[latest_volumes]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
/****** Object:  View [sysutility_ucp_core].[space_utilization]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
/****** Object:  View [sysutility_ucp_misc].[utility_objects_internal]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [sysutility_ucp_staging].[latest_computer_cpu_memory_configuration]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  View [sysutility_ucp_staging].[latest_dac_cpu_utilization]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
GO
/****** Object:  View [sysutility_ucp_staging].[latest_instance_cpu_utilization]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

GO
/****** Object:  Table [dbo].[utbl_GameManagger]    Script Date: 08/04/2019 15:36:55 ******/

/****** Object:  StoredProcedure [dbo].[USP_BeatMorethan1000]    Script Date: 08/04/2019 15:36:55 ******/

/****** Object:  StoredProcedure [dbo].[USP_BlackJack21]    Script Date: 08/04/2019 15:36:55 ******/

/****** Object:  StoredProcedure [dbo].[USP_CashOutMoney]    Script Date: 08/04/2019 15:36:55 ******/

/****** Object:  StoredProcedure [dbo].[USP_changepassword]    Script Date: 08/04/2019 15:36:55 ******/

/****** Object:  StoredProcedure [dbo].[USP_ChangePersonalDetails]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ChangePersonalDetails]
@FirstName nvarchar (50),@Userid int,
@LastName nvarchar (50),@Address nvarchar(50),@Country nvarchar(50),
@EmailAddres nvarchar(50),@gender nvarchar(50)

AS
 
	IF
	  @EmailAddres NOT LIKE '%_@__%.__%' 
    AND PATINDEX('%[^a-z,0-9,@,.,_]%', REPLACE(@EmailAddres, '-', 'a')) = 0
	 BEGIN
	   PRINT N'THE Email is not Valid'
		RETURN
	END  
	else
		                        	   
   BEGIN    
	  update [dbo].[utbl_Users]
	  set FirstName= @FirstName , LastName= @lastname  ,[Address]=@address ,Country= @country ,EmailAddres= @EmailAddres,gender=@gender 
	  where userid = @userId
	   END
	   
GO
/****** Object:  StoredProcedure [dbo].[USP_DepositMoney]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DepositMoney]
	
	@CreditCardNUM numeric, @DepositAmount float, @UserId int ,@ExpireDate date
	AS	
    BEGIN
	SET IDENTITY_INSERT [dbo].[utbl_BankRollStatus] off	
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
   else
   begin
   insert into [dbo].[utbl_BankRollStatus] (UserId, Deposit, CreditCardNum, [ExpireDate],[Time])
   values ( @UserId , @DepositAmount , @CreditCardNUM, CAST (@ExpireDate as DATE) ,getdate())
END  	
END



--exec [dbo].[USP_DepositMoney] @UserId=1033,@DepositAmount = 800 , @CreditCardNUM= 1234567812345678, @ExpireDate= '20190103'
GO
/****** Object:  StoredProcedure [dbo].[usp_GenPass]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GenPass] @pass VARCHAR(8) = NULL OUTPUT,
   @reqID INT = 0 OUTPUT
AS
BEGIN
   SET NOCOUNT ON;
   SET @pass = dbo.GenPass();
   INSERT INTO dbo.GenPasswords
   VALUES (
      getDate(),
      @pass
      );
   SELECT @reqID = IDENT_CURRENT('GenPasswords');
   SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBonus]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE PROCEDURE [dbo].[USP_InsertBonus]
   @Username nvarchar (50)
 as
 BEGIN
	  SET IDENTITY_INSERT [dbo].[utbl_BankRollStatus]OFF
	  DECLARE @DEPOSIT  FLOAT
	  SET @DEPOSIT = 10
   INSERT into [dbo].[utbl_BankRollStatus]  ([UserId],[Deposit],[Time])
   SELECT UserID ,10,getdate()  FROM [dbo].[utbl_Users]
   WHERE Username = @Username
   PRINT N'You Receive' +'  ' + cast(@DEPOSIT as nvarchar(30))+ '  ' + ' bonus to play'
   END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoginToAPP]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LoginToAPP]
@Username nvarchar(50),@Password nvarchar(50)--,@Login int

AS
 SET NOCOUNT ON;
 DECLARE @Counters int
  set @Counters = (select islock from [dbo].[utbl_Users]
  where username = @Username ) 
  if @Counters>4
  BEGIN
  PRINT N'you are Locked'
  REturn
  END
  ELSE
  IF  (SELECT [LoggedIn] FROM [dbo].[Utbl_Login] WHERE @Username = UserName) =1
  BEGIN
  PRINT N'YOU ARE ALREADY LOGEDD IN'
  RETURN
  END
  
  IF   EXISTS(SELECT Username ,[Password] FROM utbl_Users WHERE Username =@Username
  AND [Password] = @Password)
  BEGIN
  
  update [dbo].[Utbl_Login] 
  set [LoggedIn] = 1 where    @Username = UserName

  PRINT N'you are logedd in succefully'
  begin
  declare @Amonut float
  set @Amonut = 
 
 ( select (sum (deposit) - sum (beat)) from [dbo].[utbl_BankRollStatus] B
  inner join [dbo].[utbl_Users] U on  u.UserID  = b.UserId
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
  ELSE IF NOT EXISTS(SELECT [Password] FROM utbl_Users WHERE  [Password] = @Password)
   BEGIN
  PRINT N'WRONG PASSWORD'
  UPDATE [dbo].[utbl_Users]
  SET [IsLock] = [IsLock] +1 
  WHERE Username =@Username
  REturn
  END

  








GO
/****** Object:  StoredProcedure [dbo].[USP_Logout]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[USP_Logout]
	@UserName nvarchar (50)
AS
BEGIN

	SET NOCOUNT ON;
if (select [LoggedIn] from [dbo].[Utbl_Login] where username = @Username  ) =0
  begin
  PRINT N'you are  already logedd out '
  return
  end
  else
update [dbo].[Utbl_Login]
set [LoggedIn] = 0 where username = @UserName
   
END
GO
/****** Object:  StoredProcedure [dbo].[USP_REGISTERAND_VALIDATION]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_REGISTERAND_VALIDATION]
@Username nvarchar(50),@Password nvarchar(50),@FirstName nvarchar (50),
@LastName nvarchar (50),@Address nvarchar(50),@Country nvarchar(50),
@EmailAddres nvarchar(50),@gender nvarchar(50),@BirthDate datetime ,@isLock int 

AS

      SET NOCOUNT ON;
            IF (@Username IS NULL) 
			BEGIN
			PRINT 'THE USERNAME CANT BE EMPTY'
			RETURN
		END	
	ELSE
          if  EXISTS(SELECT Username FROM utbl_Users WHERE Username =@Username)
	BEGIN
	        DECLARE @p  INT
			SET @P = (SELECT  CAST (ABS(RAND()* 9 +1 ) AS INT ));
			PRINT 'THE USERNAME ALREADY EXIST PLEASE TRY  ' +@Username +  CAST(@p AS VARCHAR)

			RETURN
		END	
	ELSE
	    
	  if   EXISTS(SELECT [Password] FROM utbl_Users WHERE [Password] =@Password)
		BEGIN
			PRINT N'THE Password ALREADY EXIST'
			RETURN
		END	
	ELSE
		  
	    IF   @Username =@Password
		BEGIN
			PRINT N'THE Password Could not be equal to Usernamwe'
			RETURN
		END	
		declare @Valid int		      
        SET @Valid =
			CASE WHEN
        
        @Password COLLATE Latin1_General_BIN   LIKE '%[a-z]%' AND
        @Password COLLATE Latin1_General_BIN   LIKE '%[A-Z]%' AND
        @Password   LIKE '%[0-9]%' AND
		@Password  NOT LIKE '%Password%'  AND
        --@Password LIKE '%[~!@#$%^&]%' AND
        LEN(@Password) > 5
		 THEN  1 
		 ELSE  0
		 END 
		
			IF @Valid = 0
		BEGIN
        PRINT N'THE Password does not match the security policy'
		RETURN
		END
	ELSE
	 
	    IF EXISTS(SELECT EmailAddres FROM utbl_Users WHERE EmailAddres =@EmailAddres)
	 BEGIN
            PRINT N'THE EMAIL ALREADY EXIST'
			RETURN
			END	 
    ELSE
    
	IF
	  @EmailAddres NOT LIKE '%_@__%.__%' 
    AND PATINDEX('%[^a-z,0-9,@,.,_]%', REPLACE(@EmailAddres, '-', 'a')) = 0
	 BEGIN
	   PRINT N'THE Email is not Valid'
		RETURN
	END  
	
	    IF EXISTS(SELECT EmailAddres FROM utbl_Users WHERE EmailAddres =@EmailAddres)
	 BEGIN
            PRINT N'THE EMAIL ALREADY EXIST'
			RETURN
			END	

			ELSE
   DECLARE @AGE int
  set @AGE = (SELECT DATEDIFF(yy,@BirthDate,GETDATE()))
    if @AGE< 18
     BEGIN
     PRINT N'You must be 18 years old to play'
     REturn
     END
     ELSE                            
		   
   BEGIN
   SET IDENTITY_INSERT [dbo].[utbl_Users] OFF
   INSERT into [dbo].[utbl_Users]  (  [UserName], [Password], [FirstName],[LastName] ,[Address] ,[Country] ,[EmailAddres] , [gender] ,[BirthDate] ,[IsLock] )  values
   (@Username,@Password,@FirstName,@LastName,@Address,@Country,@EmailAddres,@gender,@BirthDate,@isLock)

      END
	 
	  BEGIN
	  exec [dbo].[USP_InsertBonus] @Username
	  --SET IDENTITY_INSERT [dbo].[utbl_BankRollStatus]OFF
	  --DECLARE @DEPOSIT  FLOAT
	  --SET @DEPOSIT = 10
   --INSERT into [dbo].[utbl_BankRollStatus]  ([UserId],[Deposit],[Time])
   --SELECT UserID ,10,getdate()  FROM [dbo].[utbl_Users]
   --WHERE Username = @Username
   -- PRINT N'You Receive $10 bonus to play'
   END

   BEGIN
    --SET IDENTITY_INSERT [dbo].[utbl_PasswordHistory] OFF
	INSERT INTO [dbo].[utbl_PasswordHistory] ([UserId],[Password])
	SELECT [UserID],Password FROM [dbo].[utbl_Users]
	WHERE [UserName] = @Username
	END

	BEGIN
	INSERT INTO [dbo].[Utbl_Login] ([UserId],[UserName],[LoggedIn],[time])
    select   [UserId],[UserName] ,1,GETDATE()
	from [dbo].[utbl_Users] where @Username = UserName
	END

--	INSERT INTO  [dbo].[utbl_BankRollStatus](userid, Deposit,[time]) 
--SELECT userid ,50,GETDATE()
--  FROM [dbo].[utbl_BankRollStatus]
--  WHERE [TIME] BETWEEN   DATEADD(DAY, DATEDIFF(DAY, 1, GETDATE()), 0)  AND  DATEADD(DAY, DATEDIFF(DAY, -1, GETDATE()), 0)
--  GROUP BY UserId
--  HAVING SUM (beat)> 10



	

	

	

	  --SELECT DATEDIFF(yy,'11.11.1995',GETDATE()) AS AgeYearsIntTrunc
	 
	  
	 
	  
	  

GO

/****** Object:  StoredProcedure [dbo].[USP_SLOT_MACHINE]    Script Date: 08/04/2019 15:36:55 ******/
/****** Object:  DdlTrigger [add_operator_check]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [add_operator_check]
ON DATABASE
WITH EXECUTE AS 'mdw_check_operator_admin'
FOR CREATE_TABLE 
AS 
BEGIN
    DECLARE @schema_name sysname;
    DECLARE @table_name sysname;

    -- Set options required by the rest of the code in this SP.
    SET ANSI_NULLS ON
    SET ANSI_PADDING ON
    SET ANSI_WARNINGS ON
    SET ARITHABORT ON
    SET CONCAT_NULL_YIELDS_NULL ON
    SET NUMERIC_ROUNDABORT OFF
    SET QUOTED_IDENTIFIER ON 


    SELECT @schema_name = EVENTDATA().value('(/EVENT_INSTANCE/SchemaName)[1]', 'sysname')
    IF (@schema_name = N'custom_snapshots')
    BEGIN
        SELECT @table_name = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname')

        -- Dynamically add a constraint on the newly created table
        -- Table must have the snapshot_id column
        DECLARE @check_name sysname;
        SELECT @check_name = N'CHK_check_operator_' + CONVERT(nvarchar(36), NEWID());
        DECLARE @sql nvarchar(2000);
        SELECT @sql = N'ALTER TABLE ' + QUOTENAME(@schema_name) + N'.' + QUOTENAME(@table_name) +
                      N' ADD CONSTRAINT ' + QUOTENAME(@check_name) + ' CHECK (core.fn_check_operator(snapshot_id) = 1);';

        -- We dont expect any result set returned while executing ALTER TABLE statement in Dynamic SQL
        EXEC(@sql)
        WITH RESULT SETS NONE
        
        -- Dynamically revoke the CONTROL right on the table for mdw_writer
        -- That way mdw_writer creates the table but cannot remove it or alter it
        SELECT @sql = N'DENY ALTER ON ' + QUOTENAME(@schema_name) + N'.' + QUOTENAME(@table_name) +
                      N'TO [mdw_writer]';

        -- We dont expect any result set returned while executing DENY statement in Dynamic SQL
        EXEC(@sql)
        WITH RESULT SETS NONE
    END
END;
GO
DISABLE TRIGGER [add_operator_check] ON DATABASE
GO
/****** Object:  DdlTrigger [deny_drop_table]    Script Date: 08/04/2019 15:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [deny_drop_table]
ON DATABASE
FOR DROP_TABLE 
AS 
BEGIN
    -- Security check (role membership)
    IF (NOT (ISNULL(IS_MEMBER(N'mdw_admin'), 0) = 1) AND NOT (ISNULL(IS_SRVROLEMEMBER(N'sysadmin'), 0) = 1))
    BEGIN
        RAISERROR(14677, 16, -1, 'mdw_admin');
    END;
END;
GO
DISABLE TRIGGER [deny_drop_table] ON DATABASE
GO
ENABLE TRIGGER [add_operator_check] ON DATABASE
GO
ENABLE TRIGGER [deny_drop_table] ON DATABASE
GO

USE [master]
GO
ALTER DATABASE [CasinoDDudi] SET  READ_WRITE 
GO
