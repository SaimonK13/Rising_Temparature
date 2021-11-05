/* 
    Name: Rising Temparature (LeetCode Problem #197) 
*/

#Soloution 1
SELECT id
    FROM (
    SELECT id, recordDate, (temperature - LAG(temperature) OVER (ORDER BY recordDate)) AS cng, LAG(recorddate) OVER(ORDER BY recorddate) AS prevDate
    FROM Weather)
AS t2
WHERE cng > 0 AND DATEDIFF(recordDate, prevDate) = 1;

#Solution 2
SELECT t2.id
FROM Weather t1
JOIN Weather t2
ON (DATEDIFF(t1.recordDate, t2.recordDate) = -1)
WHERE(t2.temperature > t1.temperature);
