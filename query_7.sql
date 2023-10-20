SELECT students.fullname, [groups].name AS group_name, grades.grade, disciplines.name AS discipline_name
FROM grades
JOIN students ON grades.student_id = students.id
JOIN disciplines ON grades.discipline_id = disciplines.id
JOIN [groups] ON students.group_id = [groups].id
WHERE [groups].id = 1 AND disciplines.id = 1;
