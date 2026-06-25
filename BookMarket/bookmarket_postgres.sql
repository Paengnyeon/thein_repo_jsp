CREATE TABLE IF NOT EXISTS member (
    id VARCHAR(20) PRIMARY KEY,
    passwd VARCHAR(20),
    name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS book (
    b_id VARCHAR(20) PRIMARY KEY,
    b_name VARCHAR(100),
    b_unitPrice INTEGER,
    b_author VARCHAR(50),
    b_description TEXT,
    b_publisher VARCHAR(50),
    b_category VARCHAR(50),
    b_unitsInStock BIGINT,
    b_releaseDate VARCHAR(30),
    b_condition VARCHAR(20),
    b_filename VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS board (
    num INTEGER PRIMARY KEY,
    id VARCHAR(20),
    name VARCHAR(30),
    subject VARCHAR(100),
    content TEXT,
    regist_day VARCHAR(30),
    hit INTEGER,
    ip VARCHAR(30)
);

INSERT INTO member (id, passwd, name)
VALUES
('admin', '1234', '관리자'),
('hong', '1234', '홍길동'),
('kim', '1234', '김철수')
ON CONFLICT (id) DO UPDATE SET
    passwd = EXCLUDED.passwd,
    name = EXCLUDED.name;

INSERT INTO book
    (b_id, b_name, b_unitPrice, b_author, b_description, b_publisher,
     b_category, b_unitsInStock, b_releaseDate, b_condition, b_filename)
VALUES
('ISBN1234', 'C# 프로그래밍', 27000, '우재남',
 'C#을 처음 접하는 독자를 대상으로 자세히 설명한 책입니다. 꼭 알아야 할 핵심 개념은 기본 예제로 쉽게 설명합니다.',
 '한빛아카데미', 'IT모바일', 1000, '2022/10/06', 'New', 'ISBN1234.jpg'),
('ISBN1235', '자바마스터', 30000, '송미영',
 '자바를 처음 배우는 학생을 위해 자바의 기본 개념과 실습 예제를 쉽게 설명하는 책입니다.',
 '한빛아카데미', 'IT모바일', 1000, '2023/01/01', 'New', 'ISBN1235.jpg'),
('ISBN1236', '파이썬 프로그래밍', 30000, '최성철',
 '파이썬으로 프로그래밍을 시작하는 입문자가 쉽게 이해할 수 있도록 기본 개념을 상세하게 설명합니다.',
 '한빛아카데미', 'IT모바일', 1000, '2023/01/01', 'New', 'ISBN1236.jpg')
ON CONFLICT (b_id) DO UPDATE SET
    b_name = EXCLUDED.b_name,
    b_unitPrice = EXCLUDED.b_unitPrice,
    b_author = EXCLUDED.b_author,
    b_description = EXCLUDED.b_description,
    b_publisher = EXCLUDED.b_publisher,
    b_category = EXCLUDED.b_category,
    b_unitsInStock = EXCLUDED.b_unitsInStock,
    b_releaseDate = EXCLUDED.b_releaseDate,
    b_condition = EXCLUDED.b_condition,
    b_filename = EXCLUDED.b_filename;
