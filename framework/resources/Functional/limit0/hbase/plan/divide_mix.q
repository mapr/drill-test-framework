explain plan for select * from (
select(cast(twocf['age'] as integer)/cast(threecf['gpa'] as float)) from student where row_key=10) t limit 0;
