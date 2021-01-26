/*==============================================course category 추가===========================================*/
INSERT INTO course_cate VALUES (SEQ_C_CATE.NEXTVAL,'감성코스','course_cate_mood.jpg');
INSERT INTO course_cate VALUES (SEQ_C_CATE.NEXTVAL,'맛집코스','course_cate_restaurant.jpg');
INSERT INTO course_cate VALUES (SEQ_C_CATE.NEXTVAL,'숨겨진코스','course_cate_hidden.jpg');
INSERT INTO course_cate VALUES (SEQ_C_CATE.NEXTVAL,'도전코스','course_cate_challenge.jpg');

/*코스 임시 데이터*/
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (101,'한강 라이딩',2,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (102,'소양강 라이딩',3,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (103,'막국수가 있는 라이딩',4,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (104,'단풍길 라이딩',5,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (105,'팔당댐 라이딩',2,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (106,'동해바다 라이딩',3,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (107,'제주도 한바퀴 라이딩',4,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (108,'북한강 라이딩',5,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (109,'해운대 라이딩',2,'shoong1000@naver.com');
insert into COURSE(COURSE_ID,COURSE_NAME,COURSE_CATE_ID,USER_ID) values (110,'벛꽃풍경 라이딩',3,'shoong1000@naver.com');


/*==============================================course 추가====================================================*/

