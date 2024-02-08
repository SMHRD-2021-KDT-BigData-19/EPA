use epa;
show tables;

select*from MEM_TB;

/*컬럼 추가*/
alter table MEM_TB add google_ID VARCHAR(100);

/*컬럼명 변경 및 타입 변경 */
alter table MEM_TB change GOOGlE_ID Google_ID varchar(100);

commit