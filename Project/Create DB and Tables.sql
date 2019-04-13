USE [master]
GO


IF EXISTS(select * from sys.databases where name='Casino')
DROP DATABASE [Casino]


/****** Database [Casino] ***************************************/

CREATE DATABASE [Casino]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fgMaster', FILENAME = N'C:\CasinoProj\Data\Casino_mdf.mdf' , 
	SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 7168KB )
 LOG ON 
( NAME = N'Fg_log_Log', FILENAME = N'C:\CasinoProj\Log\Casino_log.ldf' , 
	SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 3072KB )
GO

ALTER DATABASE [Casino] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Casino].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
PRINT ' CREATE DATABASE [Casino]'



/********* schema *************************************/


USE [Casino]
GO

--IF EXISTS (SELECT name FROM sys.schemas WHERE name = N'App')
--   BEGIN
--      PRINT 'Dropping the DB schema'
--      DROP SCHEMA App
--END
--GO
--PRINT ' Creating the App schema'
--GO
--CREATE SCHEMA App AUTHORIZATION [dbo]
--GO

-------------------

IF EXISTS (SELECT name FROM sys.schemas WHERE name = N'Games')
   BEGIN
      PRINT 'Dropping the Games schema'
      DROP SCHEMA [Games]
END
GO
PRINT ' Creating the Games schema'
GO
CREATE SCHEMA [Games] AUTHORIZATION [dbo]
GO
-----------------------

IF EXISTS (SELECT name FROM sys.schemas WHERE name = N'Admin')
   BEGIN
      PRINT 'Dropping the Admin schema'
      DROP SCHEMA [Admin]
END
GO
PRINT ' Creating the Admin schema'
GO
CREATE SCHEMA [Admin] AUTHORIZATION [dbo]
GO

-----------------------

IF EXISTS (SELECT name FROM sys.schemas WHERE name = N'Security')
   BEGIN
      PRINT 'Dropping the Security schema'
      DROP SCHEMA [Admin]
END
GO
PRINT ' Creating the Security schema'
GO
CREATE SCHEMA [Security] AUTHORIZATION [dbo]
GO




/********* TABLE *************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [Security].[utbl_Audit]
CREATE TABLE [Security].[utbl_Audit](
	[whenChanged] [datetime] NOT NULL,
	[whoChanged] [nvarchar](64) NULL,
	[eventDDL] [nvarchar](max) NULL,
	[eventXML] [xml] NULL,
	[databaseName] [nvarchar](255) NULL,
	[schemaName] [nvarchar](255) NULL,
	[objectName] [nvarchar](255) NULL,
	[hostName] [varchar](64) NULL,
	[ipAddress] [varchar](48) NULL,
	[programName] [nvarchar](255) NULL,
	[loginName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

PRINT ' Creating the [utbl_Audit] table'

-----------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Security].[utbl_Events]
CREATE TABLE [Security].[utbl_Events](
	[EventDate] [datetime] NOT NULL,
	[EventType] [nvarchar](64) NULL,
	[EventDDL] [nvarchar](max) NULL,
	[EventXML] [xml] NULL,
	[DatabaseName] [nvarchar](255) NULL,
	[SchemaName] [nvarchar](255) NULL,
	[ObjectName] [nvarchar](255) NULL,
	[HostName] [varchar](64) NULL,
	[IPAddress] [varchar](48) NULL,
	[ProgramName] [nvarchar](255) NULL,
	[LoginName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

PRINT ' Creating the [utbl_Events] table'
-------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Admin].[utbl_Gender]
CREATE TABLE [Admin].[utbl_Gender](
	[Gender] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
 ON [PRIMARY]
) ON [PRIMARY]
GO

PRINT ' Creating the [utbl_Gender] table'
-------------------------------------------
-------------------------------------------



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Admin].[utbl_Passwords]
CREATE TABLE [Admin].[utbl_Passwords](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[TS] [datetime] NULL,
	[pass] [varchar](8) NULL
) ON [PRIMARY]
GO

PRINT ' Creating the [utbl_Passwords] table'
-------------------------------------------


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Security].[utbl_BankRollStatus]
CREATE TABLE [Security].[utbl_BankRollStatus](
	[TrnId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Deposit] [float] NOT NULL,
	[Beat] [float] NULL,
	[Cashwithrawal] [float] NULL,
	[Win] [nvarchar](20) NULL,
	[Loose] [nvarchar](20) NULL,
	[CreditCardNum] [varchar](16) NULL,
	[ExpireDate] [date] NULL,
	[Time] [datetime] NULL,
	[GameId] [int] NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_BankRollStatus] PRIMARY KEY CLUSTERED 
(
	[TrnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


PRINT ' Creating the [utbl_BankRollStatus] table'
-------------------------------------------


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Admin].[utbl_Feedback]
CREATE TABLE [Admin].[utbl_Feedback](
	[UserId] [int] NULL,
	[Message] [nvarchar](50) NULL,
	[Time] [date] NULL
) ON [PRIMARY]
GO

PRINT ' Creating the [utbl_Feedback] table'
-------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Games].[utbl_Games]
CREATE TABLE [Games].[utbl_Games](
	[GameId] [int] NOT NULL,
	[GameName] [varchar](50) NULL,
 CONSTRAINT [PK_GameInfo] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

PRINT ' Creating the [utbl_Games] table'
-------------------------------------------


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Admin].[utbl_GameManagger]
CREATE TABLE [Admin].[utbl_GameManagger](
	[ManagerID] [int] NOT NULL,
	[ManagerName] [nvarchar](50) NULL,
	[GameId] [int] NULL
) ON [PRIMARY]
GO

PRINT ' Creating the [utbl_GameManagger] table'
-------------------------------------------


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Admin].[utbl_Login]
CREATE TABLE [Admin].[utbl_Login](
	[UserId] [int] NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[LoggedIn] [int] NULL,
	[time] [datetime] NULL
) ON [PRIMARY]
GO

PRINT ' Creating the [utbl_Login] table'
-------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Admin].[utbl_PasswordHistory]
CREATE TABLE [Admin].[utbl_PasswordHistory](
	[UserId] [int] NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[ValidFrom] [datetime2](2) NULL,
	[ValidTo] [datetime2](2) NULL
) ON [PRIMARY]
GO

PRINT ' Creating the [utbl_PasswordHistory] table'
-------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [Admin].[utbl_Users]
CREATE TABLE [Admin].[utbl_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [varchar](250) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NOT NULL,
	[EmailAddres] [nvarchar](50) NULL,
	[gender] [int] NULL,
	[BirthDate] [datetime] NULL,
	[Age]  AS (datediff(year,[BirthDate],getdate())),
	[IsLock] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


PRINT ' Creating the [utbl_Users] table'
-------------------------------------------






ALTER TABLE [Security].[utbl_Audit] ADD  DEFAULT (getdate()) FOR [WhenChanged]
GO
ALTER TABLE [Security].[utbl_Events] ADD  DEFAULT (getdate()) FOR [EventDate]
GO
ALTER TABLE [Security].[utbl_BankRollStatus] ADD  CONSTRAINT [DF_BankRollStatus_Deposit]  DEFAULT ((0)) FOR [Deposit]
GO
ALTER TABLE [Security].[utbl_BankRollStatus] ADD  CONSTRAINT [DF_BankRollStatus_Beat]  DEFAULT ((0)) FOR [Beat]
GO
ALTER TABLE [Security].[utbl_BankRollStatus] ADD  CONSTRAINT [DF_BankRollStatus_cashwithrawal]  DEFAULT ((0)) FOR [Cashwithrawal]
GO
ALTER TABLE [Security].[utbl_BankRollStatus] ADD  CONSTRAINT [DF_BankRollStatus_GameId]  DEFAULT ((0)) FOR [GameId]
GO
ALTER TABLE [Games].[utbl_Games] ADD  CONSTRAINT [DF_GameInfo_GameId]  DEFAULT ((0)) FOR [GameId]
GO
ALTER TABLE [Security].[utbl_BankRollStatus]  WITH CHECK ADD  CONSTRAINT [FK_BankRollStatus_Users] FOREIGN KEY([UserId])
REFERENCES [Admin].[utbl_Users] ([UserID])
GO
ALTER TABLE [Security].[utbl_BankRollStatus] CHECK CONSTRAINT [FK_BankRollStatus_Users]
GO
ALTER TABLE [Admin].[utbl_Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Users] FOREIGN KEY([UserId])
REFERENCES [Admin].[utbl_Users] ([UserID])
GO
ALTER TABLE [Admin].[utbl_Feedback] CHECK CONSTRAINT [FK_Feedback_Users]
GO
ALTER TABLE [Admin].[utbl_GameManagger]  WITH CHECK ADD  CONSTRAINT [FK_GameManagger_Games] FOREIGN KEY([GameId])
REFERENCES [Games].[utbl_Games] ([GameId])
GO
ALTER TABLE [Admin].[utbl_GameManagger] CHECK CONSTRAINT [FK_GameManagger_Games]
GO
ALTER TABLE [Admin].[utbl_Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Users] FOREIGN KEY([UserId])
REFERENCES [Admin].[utbl_Users] ([UserID])
GO
ALTER TABLE [Admin].[utbl_Login] CHECK CONSTRAINT [FK_Login_Users]
GO
ALTER TABLE [Admin].[utbl_PasswordHistory]  WITH CHECK ADD  CONSTRAINT [FK_PasswordHistory_Users] FOREIGN KEY([UserId])
REFERENCES [Admin].[utbl_Users] ([UserID])
GO
ALTER TABLE [Admin].[utbl_PasswordHistory] CHECK CONSTRAINT [FK_PasswordHistory_Users]
GO
ALTER TABLE [Admin].[utbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Gender] FOREIGN KEY([gender])
REFERENCES [Admin].[utbl_Gender] ([Gender])
GO
ALTER TABLE [Admin].[utbl_Users] CHECK CONSTRAINT [FK_Users_Gender]
GO

PRINT ' Creating the Constraints '

PRINT ' ---- Finish create db ---- '

