# 목차
1. [Project Overview (프로젝트 개요)](#1-project-overview-프로젝트-개요)
2. [DB TABLE 상세](#3-db-table-상세)
3. [아이디어](#4-아이디어)
4. [Team Members (팀원 및 팀 소개)](#2-팀원-및-팀-소개)

# 1. Project Overview (프로젝트 개요)

> 💌 **목표** <br/>
정규식(Regular Expression, RegEx) 학습을 위한 주식 거래 시스템 데이터베이스 설계하기<br/><br/>
💡 **주제 및 개요** <br/>
주제 : 주식 가격, 이용자, 거래 내역 간의 상호 관계 탐색 <br/>
개요 : 일상에서 접할 수 있는 방대한 주식 데이터를 정규표현식을 활용하여, 트랜잭션을 통해 유의미한 정보를 추출하는 방법을 탐구합니다.


<br/>


# 2. DB TABLE 상세
![다운로드1](https://github.com/user-attachments/assets/108da9f8-1e33-4844-a053-44aecf126cab)

<details>
<summary><b>Stock_info</b></summary>

```sql
CREATE TABLE Stock_info (
    sh_code VARCHAR(10) NOT NULL, -- 단축코드 (Primary Key)
    kf_name VARCHAR(50) NOT NULL, -- 한글 종목약명
    eng_name VARCHAR(50),         -- 영문 종목명
    listing_date DATETIME,        -- 상장일
    market_type VARCHAR(20),      -- 시장구분
    finance_type VARCHAR(20),     -- 증권구분
    stock_group VARCHAR(20),      -- 소속부
    stock_type VARCHAR(10),       -- 주식종류
    face_value VARCHAR(10),       -- 액면가
    num_of_stock BIGINT,          -- 상장주식수
    PRIMARY KEY (sh_code)         -- Primary Key 정의
);
```

</details> 

<details>
<summary><b>Users_info</b></summary>

```sql
CREATE TABLE Users_info (
    user_id INT PRIMARY KEY,                       -- 고유 사용자 ID
    username VARCHAR(50) NOT NULL,                 -- 사용자 이름 (닉네임 등)
    password VARCHAR(255) NOT NULL,                -- 비밀번호 (암호화된 상태로 저장)
    email VARCHAR(100) NOT NULL UNIQUE,            -- 이메일 (유일성 보장)
    phone_number VARCHAR(20),                      -- 전화번호
    account_id VARCHAR(100),                       -- 계좌 정보 ID
    date_of_birth DATE,                            -- 생년월일
    address TEXT,                                  -- 주소
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 계정 생성일
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 최근 수정일
    is_active BOOLEAN DEFAULT TRUE                 -- 계정 활성화 여부
);
```

</details> 

<details>
<summary><b>User_Order</b></summary>

```sql
CREATE TABLE User_Order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,         -- 고유 주문 ID
    user_id INT NOT NULL,                            -- 사용자 ID (Users 테이블과 연관)
    sh_code VARCHAR(20) NOT NULL,                   -- 주식 단축코드 (주식 데이터와 연관)
    order_type ENUM('BUY', 'SELL') NOT NULL,         -- 주문 유형 (매수/매도)
    order_quantity INT NOT NULL,                    -- 주문 수량
    order_price INT NOT NULL,                       -- 주문 단가
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 주문 일시
    total_value AS (order_quantity * order_price),  -- 총 주문 금액 (계산 필드)
    FOREIGN KEY (user_id) REFERENCES Users(user_id), -- 사용자 테이블과 연관
    FOREIGN KEY (standard_code) REFERENCES Stocks(standard_code) -- 주식 데이터와 연관
);
```

</details>


<br/>

# 3. 💡 Idea (아이디어)

1. 2020년에 거래한 횟수를 market_type에서 'KOS'단어를 포함하는 데이터만 출력

2. 상장일이 2021년인 데이터중에서 액면가가 2000원 이상인 것

3. 총 주식 발행주가 200,000 이상인 주식 중, 거래한 우선주 영문명 내림차순으로 출력하기

4. 보통주가 아닌 stock_type 고르기 (단, not 사용 불가)

5. 비활성화 계정을 가진 서울시 사는 사람들 중, 15시에 거래한 User_order 테이블 내용만 출력하기

6. 숫자로만 이루어지지 않은 sh_code 찾기

7. 특정 가격 범위와 정규식 조합 (주문 단가 x원 이상, sh_code가 ‘A’로 시작하는 경우 찾기)

<br/>

# 4. 👫 Team Members (팀원 및 팀 소개)

|<img src="https://avatars.githubusercontent.com/u/74342019?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/55776421?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/127267532?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/71498489?v=4" width="150" height="150"/>|
|:-:|:-:|:-:|:-:|
|Ryan Na<br/>[@CooolRyan](https://github.com/CooolRyan)|SeulGi_LEE<br/>[@seulg2027](https://github.com/seulg2027)|[@HyeJinSeok](https://github.com/HyeJinSeok)|HanJH<br/>[@letsgojh0810](https://github.com/letsgojh0810)|


<br/>