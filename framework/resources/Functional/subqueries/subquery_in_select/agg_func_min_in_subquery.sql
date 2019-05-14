SELECT
  m.employee_id,
  (
    SELECT
      MIN(sb.full_name) as min_concat
    FROM
      cp.`employee.json` as sb
  ) as min_f_name
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F' LIMIT 5;
