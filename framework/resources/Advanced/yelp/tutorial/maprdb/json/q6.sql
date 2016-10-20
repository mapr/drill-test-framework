select b.name, b.hours.Saturday.`open`, b.hours.Saturday.`close`
from business b order by b.name, b.hours.Saturday.`open`, b.hours.Saturday.`close` limit 10;
