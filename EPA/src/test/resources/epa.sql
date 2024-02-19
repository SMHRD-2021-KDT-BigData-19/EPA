use epa;
show tables;

select*from MEM_TB;

/*컬럼 추가*/
alter table PLAN_TB add P_COLOR VARCHAR(40);

/*컬럼명 변경 및 타입 변경 */
alter table PLAN_TB change p_color P_COLOR varchar(20);

commit