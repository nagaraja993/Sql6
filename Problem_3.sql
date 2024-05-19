# Write your MySQL query statement below
SELECT ROUND(SQRT(POW(P2.x - P1.x, 2) + POW(P2.y - P1.y, 2)), 2) AS shortest 
FROM Point2D P1 JOIN Point2D P2
WHERE P2.x != P1.x OR P2.y != P1.y
ORDER BY shortest
LIMIT 1;