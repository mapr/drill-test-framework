select user_id, flatten(friends) as `friends`, `type` from `user` order by `user_id`, `friends`, `type` limit 20;
