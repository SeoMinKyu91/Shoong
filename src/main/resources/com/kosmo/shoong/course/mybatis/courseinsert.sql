/*==============================================course category 추가===========================================*/
INSERT INTO course_cate VALUES (101,'감성코스','course_cate_mood.jpg');
INSERT INTO course_cate VALUES (102,'맛집코스','course_cate_restaurant.jpg');
INSERT INTO course_cate VALUES (103,'숨겨진코스','course_cate_hidden.jpg');
INSERT INTO course_cate VALUES (104,'도전코스','course_cate_challenge.jpg');

/*코스 임시 데이터*/
/*==============================================course 추가====================================================*/
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (101,'한강 라이딩',101,'shoong1000@naver.com','120','58',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample1.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (102,'소양강 라이딩',104,'shoong1000@naver.com','93','80',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample2.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (103,'막국수가 있는 라이딩',102,'shoong1000@naver.com','12','3',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample3.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (104,'단풍길 라이딩',104,'shoong1000@naver.com','100','180',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample4.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (105,'팔당댐 라이딩',101,'shoong1000@naver.com','91','71',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample5.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (106,'동해바다 라이딩',104,'shoong1000@naver.com','60','45',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample6.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (107,'제주도 한바퀴 라이딩',103,'shoong1000@naver.com','180','210',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample7.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (108,'북한강 라이딩',104,'shoong1000@naver.com','45','30',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample8.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (109,'해운대 라이딩',102,'shoong1000@naver.com','30','15',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample9.json');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID,COURSE_TIME,COURSE_LENGTH,COURSE_DATE,COURSE_FILE_NAME) 
values (110,'벛꽃풍경 라이딩',103,'shoong1000@naver.com','50','55',TO_DATE('21-01-31 20:41:00','YY-MM-DD HH24:MI:SS'),'recordsample10.json');