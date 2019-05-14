SELECT
  m.employee_id,
  (
    SELECT
      COUNT(sub.position_id) as count_position_id
    FROM
      dfs.drilltestdir.`employee_json_for_subq` as sub
    WHERE sub.position_id > 7
    GROUP BY sub.position_id
    LIMIT 1
  ) as count_position_id
FROM
  cp.`employee.json` as m
WHERE
  m.gender LIKE 'F'
LIMIT 5;
