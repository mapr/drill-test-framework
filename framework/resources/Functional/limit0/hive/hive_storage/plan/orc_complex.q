explain plan for select * from (
SELECT id, first_name, last_name, address
  FROM orc_create_people WHERE id > 90) t limit 0;