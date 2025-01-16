-- 총 주식 발행주가 200,000 이상인 주식 중, 거래한 우선주 영문명 내림차순으로 출력하기

-- 정규 X
SELECT eng_name
FROM Stock_info Si
WHERE Si.num_of_stock >= 200000
AND Si.stock_type LIKE '%우선주';

-- 정규 O
SELECT eng_name
FROM Stock_info Si
WHERE Si.num_of_stock >= 200000
AND Si.stock_type REGEXP '우선주$';

/* 정답 출력
eng_name                               |
---------------------------------------+
YuyuPharma(2PB)                        |
YuyuPharma(1P)                         |
YuhwaSecurities(1P)                    |
Yuhan(1P)                              |
Yuanta Securities Korea(1P)            |
TS(1P)                                 |
TONGYANG(2PB)                          |
TONGYANG(1P)                           |
TAEYOUNG ENGINEERING & CONSTRUCTION(1P)|
TaeyangMetalIndustrial(1P)             |
SungshinCement(1P)                     |
SungmoonElectronics(1P)                |
.....
*/