SELECT d.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM disciplines d
LEFT JOIN grades g ON d.id = g.discipline_id
WHERE d.teacher_id = 2
GROUP BY d.name;