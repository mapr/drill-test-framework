SELECT
  m.employee_id,
  (
    SELECT
      MAX(sub.full_name) as max_full_name
    FROM
      cp.`employee.json` as sub
    WHERE
      sub.employee_id = m.employee_id
  ) as max_full_name
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F'
LIMIT 5;
