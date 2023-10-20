SELECT  d.name, s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s  ON s.id = g.discipline_id 
JOIN disciplines d  ON d.id =g.discipline_id 
WHERE d.id = 5
GROUP BY s.fullname
ORDER BY average_grade DESC
LIMIT 1;