SELECT
  m.employee_id,
  (
    SELECT
      sub.full_name
    FROM
      cp.`employee.json` as sub
    WHERE
      sub.full_name < 'Maya Gutierrez'
    LIMIT 1
  ) as full_name
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F' LIMIT 5;
