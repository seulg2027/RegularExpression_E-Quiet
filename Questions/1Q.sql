-- 1.
-- 2020년에 거래한 횟수를 market_type에서 'KOS'단어를 포함하는 데이터만 출력 

-- 정규 X
SELECT s.market_type, COUNT(*) AS trade_count
FROM User_Order u
JOIN Stock_info s ON u.sh_code = s.sh_code
WHERE YEAR(u.order_date) = 2020
AND s.market_type LIKE '%KOS%'
GROUP BY s.market_type;

-- 정규 O
SELECT s.market_type, COUNT(*) AS trade_count
FROM User_Order u
JOIN Stock_info s ON u.sh_code = s.sh_code
WHERE DATE_FORMAT(u.order_date, '%Y-%m-%d') REGEXP '^2020-[0-1][0-9]-[0-3][0-9]'
AND s.market_type REGEXP 'KOS'
GROUP BY s.market_type;

/* 정답 출력
market_type  |trade_count|
-------------+-----------+
KOSPI        |         18|
KOSDAQ       |          1|
KOSDAQ GLOBAL|          1|
*/