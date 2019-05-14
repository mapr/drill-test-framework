SET `planner.enable_nljoin_for_scalar_only` = false;
SELECT
  m.employee_id,
  (
    SELECT
      SUM(sb.position_id) as sum_position
    FROM
      cp.`employee.json` as sb
    WHERE
      sb.employee_id < m.employee_id
  ) as sum_position
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F' LIMIT 5;
RESET `planner.enable_nljoin_for_scalar_only`;
