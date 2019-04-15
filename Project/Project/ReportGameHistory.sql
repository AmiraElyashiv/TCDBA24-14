DECLARE @uSERID INT
DECLARE @TIME1 DATETIME
DECLARE @TIME2 DATETIME
set @userid = 2033
SET @TIME1 ='2019-04-01 10:33:57'
set @TIME2 = '2019-04-01 10:36:40'
select t.FirstName ,
		GameName,[TrnId],[Beat],[Win],[Loose],B.[Time]
from [Security].[utbl_BankRollStatus] B inner join [Games].[utbl_Games] G
	   on b.GameId = b.GameId  INNER JOIN [Admin].[utbl_Users] T
	   on b.UserId = t.UserID
WHERE t.UserID =@USERID AND [TIME] BETWEEN @TIME1 AND @TIME2
order by GameName ,b.[Time]
	