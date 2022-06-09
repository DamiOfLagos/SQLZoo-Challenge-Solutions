--This is a solution to SQLZoo's SQL from Nobel Challenge. 
--The challenge can be found at 'https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial'.



--Change the query shown so that it displays Nobel prizes for 1950.
SELECT * FROM nobel
WHERE yr = 1950

--Show who won the 1962 prize for literature.
SELECT winner FROM nobel
WHERE yr = 1962 AND subject = 'literature'

--Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel 
WHERE winner = 'Albert Einstein'

--Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel
WHERE yr >= 2000 AND subject = 'peace'

--Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT * FROM nobel
WHERE (yr >= 1980 AND yr <=1989) AND subject = 'literature'

--Show all details of the presidential winners:
--Theodore Roosevelt
--Thomas Woodrow Wilson
--Jimmy Carter
--Barack Obama
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

--Show the winners with first name John
SELECT winner FROM nobel 
WHERE winner LIKE CONCAT('John ', '%')

--Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT * FROM nobel 
WHERE (yr = 1980 AND subject = 'physics') OR (yr = 1984 AND subject = 'chemistry')

--Show the year, subject, and name of winners for 1980 excluding chemistry and medicine 
SELECT * FROM nobel 
WHERE yr = 1980 AND subject NOT LIKE 'chemistry' 
--This question is wrong however. The correct question should exclude chemistry alone (according to expected answer on the website)
--See correct answer to stated question below
SELECT * FROM nobel 
WHERE yr = 1980 AND subject NOT LIKE 'chemistry' AND subject NOT LIKE 'medicine'


--Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) 
OR (subject = 'literature' AND yr >= 2004)

--Find all details of the prize won by PETER GRÜNBERG
--Non-ASCII characters
SELECT * FROM nobel 
WHERE winner LIKE '%GR_NBERG'


--Find all details of the prize won by EUGENE O'NEILL
SELECT * FROM nobel
WHERE winner = 'eugene o''neill'
--use 2 single quotes to escape the quotation mark problems.


--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel 
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner


--Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject
FROM nobel
WHERE yr=1984 
ORDER BY
 CASE
    WHEN subject IN ('chemistry','physics') THEN 1
    ELSE 0
 END ASC,
 subject,
 winner;