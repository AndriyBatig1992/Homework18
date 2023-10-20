SELECT DISTINCT d.name AS course_name
FROM students s
LEFT JOIN grades g ON s.id = g.student_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
WHERE s.id = 3 AND d.teacher_id = 3
ORDER BY d.name;