SELECT cohorts.name as cohort_name,  count(students.*) as student_count
FROM cohorts
JOIN students ON cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING count(students.*) >= 18
ORDER BY count(students.*),cohorts.name;