-- 테이블(엔터티) 생성
-- 성적 정보 저장 테이블

CREATE TABLE tbl_score (
	name varchar2(4) NOT NULL,
	kor number(3) NOT NULL check(kor > 0 AND kor<=100),
	eng number(3) NOT NULL check(eng > 0 AND eng<=100),
	math number(3) NOT NULL check(math > 0 AND math<=100),
	total NUMBER (3) NULL,
	average NUMBER (5,2),
	grade char(1),
	stu_num NUMBER (6),
	--pk거는 법
	CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num)
);

-- 테이블 생성후 pk적용하기
ALTER TABLE TBL_SCORE 
ADD CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num)

--컬럼 추가하기
ALTER TABLE TBL_SCORE 
ADD (sci NUMBER(3) NOT null);

--컬럼 제거하기
ALTER TABLE TBL_SCORE 
DROP COLUMN sci;

-- 테이블 복사 (tb_emp)
-- CTAS
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

--복사 테이블 조회
SELECT * FROM tb_emp_copy;
SELECT * FROM tb_emp;

-- drop table 
-- 복구절대안됌 로그남지않음 매우 주의
DROP TABLE	TB_EMP_COPY;
--truncate table
-- 테이블 구조는 유지 내부 데이터 전체삭제 (매우주의)
TRUNCATE TABLE TB_EMP_COPY;


-- 예시테이블
CREATE TABLE goods(
	id NUMBER(6) PRIMARY KEY,
	g_name varchar2(10) NOT NULL,
	price number(10) DEFAULT 1000,
	reg_date DATE 
);


SELECT * FROM goods;

--insert
INSERT INTO GOODS 
	(id,G_NAME,PRICE,REG_DATE)
	VALUES (1,'선풍기','120000',sysdate);


INSERT INTO GOODS 
	(id,G_NAME ,REG_DATE)
	VALUES (2,'달고나',sysdate);


INSERT INTO GOODS 
	(G_NAME,id,PRICE)
	VALUES ('후리',3,500);

--컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야함
INSERT INTO GOODS 
	VALUES (4,'세탁기',10000,sysdate);

--INSERT INTO GOODS 
--	VALUES (5,'청소기',120000,sysdate),
--			(6,'건조기',150000,sysdate),
--			(7,'컴퓨터',180000,sysdate);

-- 수정 UPDATE 
UPDATE goods
SET g_name = '콜라', PRICE = 3000
WHERE id = 2;


--행을 삭제 DELETE 
DELETE FROM goods
WHERE id = 3;

-- 모든 행 삭제(주의)
DELETE FROM goods

-- select 조회
SELECT 
CERTI_CD ,CERTI_NM ,ISSUE_INSTI_NM 
FROM TB_CERTI;

SELECT ALL --all은 생략가능
CERTI_NM,CERTI_CD,ISSUE_INSTI_NM 
FROM TB_CERTI;

SELECT 
CERTI_NM,CERTI_CD,ISSUE_INSTI_NM 
FROM TB_CERTI;

-- 중복제거 distinct
SELECT DISTINCT 
 ISSUE_INSTI_NM 
FROM TB_CERTI;

-- 모든 컬럼조회
-- 실무에서는 사용하지 마세요
SELECT DISTINCT 
*
FROM TB_CERTI;


-- 열 별칭 부여(alias)
SELECT 
	EMP_NM AS "사원이름",
	ADDR AS "거주지 주소"
FROM TB_EMP te;

-- 문자열 연결하기
SELECT 
	CERTI_NM || '('  ||ISSUE_INSTI_NM || ')' AS "자격증 정보"
FROM TB_CERTI;


