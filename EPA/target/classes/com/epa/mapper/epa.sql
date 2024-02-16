-- 회원 정보
CREATE TABLE MEM_TB (
  MEM_ID VARCHAR(20) NOT NULL PRIMARY KEY,
  MEM_PW VARCHAR(20) NOT NULL,
  MEM_NM VARCHAR(20) NOT NULL,
  MEM_AGE DATE, -- DATE는 길이를 가질 필요가 없습니다.
  MEM_H INT, -- INT 형으로 변경
  MEM_W INT, -- INT 형으로 변경
  MEM_G VARCHAR(40),
  MEM_IMG VARCHAR(200),
  MEM_EMAIL VARCHAR(80),
  JOIN_DATE DATE NOT NULL, -- DATE는 길이를 가질 필요가 없습니다.
  TEAR VARCHAR(20)
  MEM_M VARCHAR(300);
);

ALTER TABLE MEM_TB
ADD MEM_M VARCHAR(300) NOT NULL; -- MEM_M 열 추가, 길이는 상황에 따라 조절


ALTER TABLE MEM_TB
MODIFY MEM_M VARCHAR(300) NOT NULL;

-- 운동기본정보
CREATE TABLE EX_TB(
	EX_ID VARCHAR(20) NOT NULL PRIMARY KEY,
	EX_NAME VARCHAR(50) NOT NULL
);

-- 운동실행
CREATE TABLE START_TB(
  EX_ID VARCHAR(20) NOT NULL PRIMARY KEY,
  EXPL_ID VARCHAR(20) NOT NULL,
  MEM_ID VARCHAR(20) NOT NULL,
  EX_SDATE DATETIME NOT NULL,
  EX_FDATE DATETIME NOT NULL,
  EX_R INT,
  EX_A DECIMAL(3,2) 
);

DROP TABLE COMMENT_TB;

-- 나만의루틴
CREATE TABLE PLAN_TB(
	PL_BUNHO INT NOT NULL PRIMARY KEY,
	EX_ID VARCHAR(20) NOT NULL, 
	EXPL_ID   VARCHAR(20) NOT NULL,
	MEM_ID VARCHAR(20) NOT NULL,
	EX_SDATE DATE,   
	EX_FDATE DATE,   
	EX_R INT,
	RT_D DATE NOT NULL
);

-- 커뮤니티
CREATE TABLE BOARD_TB (
  BD_NO INT NOT NULL PRIMARY KEY,
  MEM_ID VARCHAR(20) NOT NULL,
  BD_T VARCHAR(100) NOT NULL,
  BD_C VARCHAR(600) NOT NULL,
  BD_DATE DATE NOT NULL,
  BD_HEAD INT NOT NULL
);

use epa;
show tables;
desc COMMENT_TB;

-- 커뮤니티 댓글
CREATE TABLE COMMENT_TB(
	COM_NO INT NOT NULL PRIMARY KEY auto_increment,
	BD_NO INT NOT NULL,
	MEM_ID VARCHAR(20) NOT NULL,
	COM_RE INT,
	COM_C VARCHAR(600) NOT NULL,
	D_DATE datetime NOT NULL default now()
);

-- 등급 정보
CREATE TABLE TEAR_TB(
	MEM_ID VARCHAR(20) NOT NULL PRIMARY KEY, 
	TEAR VARCHAR(20) NOT NULL,
	ATTEND_COUNT INT,
	EX_RCOUNT INT
);

-- 등급-출석
CREATE TABLE LOGIN_TB(
BUNHO VARCHAR(20) NOT NULL PRIMARY KEY, 
MEM_ID VARCHAR(20) NOT NULL,
LOGIN DATETIME,
LOGOUT DATETIME
);

-- 만들어진 테이블 보는 곳
SHOW TABLES;

-- 테이블 정보 보는 곳
SELECT * FROM MEM_TB; -- 테이블명 바꾸면 됨

TRUNCATE TABLE BOARD_TB;