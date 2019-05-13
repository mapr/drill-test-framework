SELECT
  m.employee_id,
  (
    SELECT
      COUNT(sub.position_id) as count_position_id
    FROM
      dfs.drilltestdir.`employee_json_for_subq` as sub
    GROUP BY sub.position_id
    ORDER BY count_position_id DESC
    LIMIT 1
  ) as count_position_id
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F'
LIMIT 5;
