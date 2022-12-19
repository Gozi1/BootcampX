const { Pool } = require('pg');
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const queryString = `
SELECT DISTINCT teachers.name as teacher ,cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohorts.id = cohort_id 
WHERE cohorts.name = $1
ORDER BY teachers.name;
  `;
const cohortName = process.argv[2];
// Store all potentially malicious values in an array.
const values = [`${cohortName|| 'JUL02'}`];
pool.query(queryString,values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));