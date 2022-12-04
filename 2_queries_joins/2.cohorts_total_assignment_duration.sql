SELECT SUM(duration) as total_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';