-- 비활성화 계정을 가진 서울시 사는 사람들 중, 15시에 거래한 User_order 테이블 내용만 출력하기

-- 정규 X
SELECT uo.*
FROM user_info ui 
	INNER JOIN User_Order uo
	ON ui.user_id = uo.user_id
WHERE ui.is_active = 0
AND ui.address LIKE '서울시%'
AND SUBSTR(DATE_FORMAT(uo.order_date, '%Y%m%d%H%i%s'), 9, 2) = 15;

-- 정규 O
SELECT uo.*
FROM user_info ui
    INNER JOIN User_Order uo
    ON ui.user_id = uo.user_id
WHERE ui.is_active = 0
AND ui.address REGEXP '^서울시'
AND uo.order_date REGEXP '[0-9]{8}15[0-9]{4}';

/*
힌트 : 날짜 YYYYMMDD는 정규표현식으로 [0-9]{8}으로 나타낼 수 있습니다.
*/

/* 정답 출력
order_id|user_id|sh_code|order_type|order_quantity|order_price|order_date         |total_value|
--------+-------+-------+----------+--------------+-----------+-------------------+-----------+
      99|      2|00104K |SELL      |             5|      97182|2022-10-26 15:41:08|     485910|
      41|      3|093050 |SELL      |            99|      23642|2024-02-09 15:45:07|    2340558|
      40|      4|035420 |SELL      |            20|      47344|2021-10-15 15:27:40|     946880|
      79|      4|001065 |SELL      |            13|      68551|2021-12-07 15:17:09|     891163|
*/