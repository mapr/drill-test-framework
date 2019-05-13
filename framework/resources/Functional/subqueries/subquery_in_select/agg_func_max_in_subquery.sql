SELECT
  m.employee_id,
  (
    SELECT
      MAX(sb.full_name) as max_concat
    FROM
      cp.`employee.json` as sb
  ) as max_f_name
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F' LIMIT 5;
