-- expected: people.csvh written by setup_sftp_user.sh (3 rows)
select id, name from md6687_sftp.root.`people.csvh`
