-- 숫자로만 이루어지지 않은 sh_code 찾기

-- 정규 X
SELECT *
FROM Stock_info
WHERE sh_code NOT LIKE '0%'
  OR sh_code LIKE '%[^0-9]%'
     truncate of $n
     
-- 정규 O
SELECT *
FROM Stock_info
WHERE sh_code REGEXP '[^0-9]';
