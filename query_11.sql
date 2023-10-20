SELECT t.fullname AS teacher_name, s.fullname AS student_name, ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t
LEFT JOIN disciplines d ON t.id = d.teacher_id
LEFT JOIN grades g ON d.id = g.discipline_id
LEFT JOIN students s ON s.id = g.student_id
WHERE t.id = 1 AND s.id = 1
GROUP BY t.fullname, s.fullname;

