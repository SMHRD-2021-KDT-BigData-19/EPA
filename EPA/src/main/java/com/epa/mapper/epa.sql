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
  TEAR VARCHAR(20),
  MEM_M VARCHAR(300);
);

ALTER TABLE MEM_TB
ADD MEM_IMG VARCHAR(300) NOT NULL; -- MEM_M 열 추가, 길이는 상황에 따라 조절


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

desc PLAN_TB;
-- 나만의루틴
CREATE TABLE PLAN_TB(
	PL_BUNHO INT NOT NULL PRIMARY KEY auto_increment,
	EX_ID VARCHAR(20) NOT NULL, 
	EXPL_ID   VARCHAR(20) NOT NULL,
	MEM_ID VARCHAR(20) NOT NULL,
	EX_SDATE DATETIME,   
	EX_FDATE DATETIME,  
	P_COLOR VARCHAR(40)
	EX_R INT,
	RT_D datetime NOT NULL default now()
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

SELECT *
FROM PROFILE
WHERE MEM_ID = 2
ORDER BY PROFILE_NO DESC
LIMIT 1;

desc MEM_TB;

select * from PROFILE;
select * from PROFILE where mem_id='2'

insert into PROFILE (PROFILEIMG,PROFILEPATH,MEM_ID)
        values (1,123,2);

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
DROP TABLE TEAR_TB;

CREATE TABLE TEAR_TB(
	MEM_ID VARCHAR(20) NOT NULL PRIMARY KEY, 
	TEAR VARCHAR(20) NOT NULL,
	ATTEND_COUNT INT,
	EX_RCOUNT INT,
	LASTDATE DATE
);

SELECT * FROM COMMENT_TB;

INSERT INTO TEAR_TB (MEM_ID, TEAR, ATTEND_COUNT, EX_RCOUNT)
VALUES ('1', '상급', 51, 0);

CREATE TABLE PROFILE(
	PROFILE_NO int PRIMARY KEY auto_increment,
	PROFILEIMG VARCHAR(150),
	PROFILEPATH VARCHAR(300),
	MEM_ID VARCHAR(20)

);

-- 등급-출석
CREATE TABLE LOGIN_TB(
BUNHO VARCHAR(20) NOT NULL PRIMARY KEY, 
MEM_ID VARCHAR(20) NOT NULL,
LOGIN DATETIME,
LOGOUT DATETIME,
LAST_ATTEND_DATE
);

SELECT * FROM MEM_TB
DROP TABLE TEAR_TB
-- 만들어진 테이블 보는 곳
SHOW TABLES;

ALTER TABLE PLAN_TB
CHANGE COLUMN P_COLOR PN_COLOR
VARCHAR(20);


-- 테이블 정보 보는 곳
SELECT * FROM PLAN_TB; -- 테이블명 바꾸면 됨

TRUNCATE TABLE PLAN_TB;