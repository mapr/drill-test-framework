--/* q4 tpcds */

SELECT A.SS_CUSTOMER_SK,
       B.D_DATE_SK,
       B.D_YEAR,
       B.D_MOY,
       max(A.price) as price,
       max(A.cost) as cost
FROM
        ( SELECT
          S.SS_CUSTOMER_SK,
          S.SS_SOLD_DATE_SK,
          max(S.SS_LIST_PRICE) as price,
          max(S.SS_WHOLESALE_COST) as cost
        FROM store_sales S
        WHERE S.SS_QUANTITY  > 2
        GROUP BY S.SS_CUSTOMER_SK,
                 S.SS_SOLD_DATE_SK

        ) a
        JOIN
          date_dim b
        ON a.SS_SOLD_DATE_SK = b.D_DATE_SK
        WHERE b.d_qoy = 2
          AND b.d_dow = 1
          and b.d_year IN (1990, 1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909,
                         1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919,
                         1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929,
                         1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939,
                         1940, 1941, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1960,
                         1970, 1980, 2001, 2002, 2011, 2012, 2013, 2014)
GROUP BY A.SS_CUSTOMER_SK,
                B.D_DATE_SK,
                B.D_YEAR,
                B.D_MOY
ORDER BY B.D_DATE_SK, A.SS_CUSTOMER_SK, B.D_YEAR, B.D_MOY;
