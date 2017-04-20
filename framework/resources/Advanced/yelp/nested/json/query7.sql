select u.name, b.name , flatten(b.categories) as cat from `user` u, `business` b where u.average_stars = b.stars and b.state = 'CA' order by u.name, b.name, cat limit 20; 
