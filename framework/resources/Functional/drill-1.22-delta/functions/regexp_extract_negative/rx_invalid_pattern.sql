-- expected: java.util.regex rejects '(' -> PatternSyntaxException surfaced to the client
select regexp_extract('abc', '(', 1) g from (values(1))
