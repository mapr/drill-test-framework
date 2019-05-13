SELECT
  m.employee_id,
  (
    SELECT
      sub.full_name
    FROM
      cp.`employee.json` as sub
    WHERE
      sub.employee_id IN (1, 7, 5, 8)
    LIMIT 1
  ) as full_name
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F' LIMIT 5;
