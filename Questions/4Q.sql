-- 보통주가 아닌 stock_type 고르기 (단, not 사용 불가)

-- 정규 X
select *
from Stock_info
where char_length(stock_type) != 3;

-- 정규 O
SELECT *
FROM Stock_info
WHERE stock_type REGEXP '^(?!보통주).*$';
