SELECT avg(average) as average_total_duration
FROM(
  SELECT  sum(completed_at - started_at) as average
  FROM assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
)as totals ;
