WITH LastLesson AS (
    SELECT MAX(date_of) AS last_lesson_date
    FROM disciplines d
    LEFT JOIN grades g ON d.id = g.discipline_id
    WHERE d.id = 5
)
SELECT s.fullname AS student_name, g.grade
FROM students s
LEFT JOIN [groups] gr ON s.group_id = gr.id
LEFT JOIN grades g ON s.id = g.student_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
WHERE gr.id = 2
  AND g.date_of = (SELECT last_lesson_date FROM LastLesson);
