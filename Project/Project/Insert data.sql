
/********* Insert Application data *****************/


USE [Casino]
GO

INSERT INTO [Admin].[utbl_Gender]
           ([Gender],
            [Description])
     VALUES
          (1,'Male') ,
		  (2,'Female')
         
GO
---------------------------------------

INSERT INTO [Games].[utbl_Games]
           ([GameId],
		    [GameName])
     VALUES
			(0,'NoBeat') ,
			(1,'Slotmachine') ,
			(2,'BlackJack')
GO
---------------------------------------

INSERT INTO [Games].[utbl_Games]
           ([GameId],
		    [GameName])
     VALUES
			(0,'NoBeat') ,
			(1,'Slotmachine') ,
			(2,'BlackJack')
GO

PRINT ' Insert data in Games and Gender tables'
---------------------------------------
INSERT INTO [Admin].[utbl_GameManagger]
           ([ManagerID],
			[ManagerName],
			[GameId])
     VALUES
			(20,'Elyahu Nissim',100) ,
			(21,'Gil Reich',101) ,
			(22,'Daniella Sapir',102)
GO

PRINT ' Insert data in GameManagger table'
---------------------------------------




