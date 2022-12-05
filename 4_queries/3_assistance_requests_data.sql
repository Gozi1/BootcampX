SELECT teachers.name as teacher,students.name as student, 
assignments.name as assignment, (completed_at-started_at) as duration
FROM students
JOIN assistance_requests ON student_id = students.id
JOIN teachers ON teacher_id = teachers.id
JOIN assignments ON assignment_id = assignments.id
ORDER BY duration;