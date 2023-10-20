SELECT students.fullname
FROM students
JOIN [groups] ON students.group_id = [groups].id
WHERE [groups].id = 1
ORDER BY students.fullname;

