SELECT
  m.employee_id,
  (
    SELECT
      MIN(sub.full_name) as min_full_name
    FROM
      cp.`employee.json` as sub
    WHERE
      sub.employee_id > 10
  ) as min_full_name
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F' LIMIT 5;
