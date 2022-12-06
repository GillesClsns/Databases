/*

 Exercises on ordinary selects

 */

-- OEF. 1
SELECT DISTINCT clientno
FROM reservations;

-- OEF. 2
SELECT clientno, 'travelled on' text, current_date date, 'to park' text, park_code
FROM reservations
WHERE date_part('year', start_date) >= '2021'
ORDER BY start_date desc
    FETCH FIRST 5 ROWS ONLY;

-- OEF. 3
SELECT current_date "Today it's";

-- OEF. 4
SELECT resno, tano, clientno, end_date + 2 "extension by 2 days"
FROM reservations
WHERE park_code LIKE 'MD';

-- OEF. 5
SELECT tano, clientno, start_date, end_date
FROM reservations
WHERE tano = '3'
  AND date_part('year', start_date) >= '2020'
ORDER BY start_date;

-- OEF. 6
SELECT clientno, status
FROM reservations
WHERE status = 'OPEN'
ORDER BY clientno desc
LIMIT (SELECT (COUNT(*) / 4) FROM reservations WHERE status = 'OPEN');

-- OEF. 7
SELECT clientno, status paid
FROM reservations
WHERE start_date >= '2020-07-01'
  AND status = 'PAID';

-- OEF. 8
SELECT *
FROM cottages
WHERE houseno < 12
  AND (playground = 'Y' OR corner = 'Y')
ORDER BY park_code;

-- OEF. 9
SELECT park_code, typeno, price_weekend weekend, price_midweek midweek
FROM cottype_prices
WHERE price_weekend * 1.20 < price_midweek;

-- OEF. 10
SELECT park_name parkcode, country_code
FROM parks
WHERE country_code IN ('1', '2');

-- OEF. 11
SELECT resno, park_code, typeno, houseno, status
FROM reservations
WHERE typeno IS NULL
   OR houseno IS NULL AND status IN ('OPEN', 'PAID');

-- OEF. 12
SELECT *
FROM clients
WHERE postcode IN ('2060', '2100', '2640');

-- OEF. 13
SELECT *
FROM clients
WHERE (houseno = '106' AND postcode = '2640')
   OR city ~ '^[A-D]';

-- OEF. 14
SELECT *
FROM cottype_prices
WHERE price_midweek < 250
  AND (price_extra_day IS NULL OR price_extra_day < 30);

-- OEF. 15
SELECT *
FROM payments
WHERE payment_method NOT LIKE 'O'
  AND payment_date < '2020-02-01';

-- OEF. 16
SELECT DISTINCT last_name
FROM clients
WHERE postcode = '2640'
ORDER BY clientno;
-- Clientno must be in the select clause to be executed.

-- OEF. 17
SELECT *
FROM cottages
WHERE park_code = 'BF'
  AND pet = 'N'
  AND (beach = 'Y' OR NULL);

-- OEF. 18
SELECT upper(country_name) country
FROM countries
WHERE country_name ~ ('^N')
ORDER BY country_name;

-- OEF. 19
SELECT last_name, first_name, street
FROM clients
WHERE upper(street) SIMILAR TO ('%LAAN%');
