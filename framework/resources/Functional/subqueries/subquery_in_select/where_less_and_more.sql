SET `planner.enable_nljoin_for_scalar_only` = false;
SELECT
  m.employee_id,
  (
    SELECT
      MIN(sub.full_name) as min_full_name
    FROM
      cp.`employee.json` as sub
    WHERE
      sub.employee_id < 7
      AND sub.employee_id > m.employee_id
  ) as min_full_name
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F' LIMIT 5;
RESET `planner.enable_nljoin_for_scalar_only`;
