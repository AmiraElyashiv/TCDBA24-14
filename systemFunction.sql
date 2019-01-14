

use Northwind

select db_name(), @@SERVERNAME, @@SERVICENAME

select * from Orders
order by orderdate 
offset 5 rows
fetch next 5 rows only 


--System Functions
--round:  0- 4 - floor , 5 -9 - ceiling
select floor(unitprice * 1.17),  
	ceiling(unitprice * 1.17),
	round(unitprice * 1.17 , 1) ,
	unitprice * 1.17,
	ProductName
from Products


--get two diff. parameter 
select round(263.865 ,-1), 
round(263.865 ,-2),
round(263.865 ,-3)

--string system function 
--substring 
--( string , start position , length)
--1 start position
select substring(firstname,1,2) ,
firstname
from Employees


select substring(firstname,3, len(firstname) ) ,
firstname
from Employees


--reverse
--replace - change substring with new string 
select reverse ('hello') , replace( 'Hello' , 'll' , 'xxx')


--charindex
--get char and return its first position
--0 if not found
select charindex('l' , 'hello') 

--select all employees which contains 
--the char 'a' in their firstname
select  firstname  , charindex ( 'a' , firstname ) 
from Employees
where charindex ( 'a' , firstname )  > 0 


--select all employees which contains 
-- 'a' or 'b' in their firstname
select  firstname   
from Employees
where charindex ( 'a' , firstname )  > 0 or 
      charindex ( 'b' , firstname )  > 0 
	  
--select employees start with letter A
select firstname 
from Employees
where CHARINDEX('a' , firstname ) = 1

--boolean condition

--1-5 - the voice distance between two string 
select firstname  ,  soundex('nansi'), difference(firstname ,'nns') 
from employees 
where difference(firstname ,'nns') >= 4

--null - not value
--ansi sql 
set ansi_nulls off
select  firstname , region 
 from Employees
where region = null 

--is null / is not null
select  firstname , region 
 from Employees
where region is not  null 


--like
--get template 
select * from employees 
where firstname = 'andreww'








