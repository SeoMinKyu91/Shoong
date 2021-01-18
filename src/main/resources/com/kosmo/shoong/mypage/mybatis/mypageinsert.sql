--insert into COURSE(COURSE_ID,COURSE_NAME)
insert into COURSE(COURSE_ID,COURSE_NAME,USER_ID) values (101,'라이딩 코스 이름 1','kim');
insert into COURSE(COURSE_ID,COURSE_NAME,USER_ID) values (102,'라이딩 코스 이름 2','kim');
insert into COURSE(COURSE_ID,COURSE_NAME,USER_ID) values (103,'라이딩 코스 이름 3','kim');
insert into COURSE(COURSE_ID,COURSE_NAME,USER_ID) values (104,'라이딩 코스 이름 4','kim');
insert into COURSE(COURSE_ID,COURSE_NAME,USER_ID) values (105,'라이딩 코스 이름 5','kim');
insert into COURSE(COURSE_ID,COURSE_NAME,USER_ID) values (106,'라이딩 코스 이름 6','kim');

--레코드 임시 데이터 
--insert into RECORD_ values(RECORD_ID,USER_ID,COURSE_ID,RECORD_TIME,RECORD_LENGTH,RECORD_DATE);
--이러면 됨
insert into RECORD_(RECORD_ID,USER_ID,COURSE_ID,RECORD_TIME,RECORD_LENGTH,RECORD_DATE) values (201,'wkungh93@gmail.com',101,'11시간 30분','52km',TO_DATE('2020-12-28','YYYY-MM-DD'));
insert into RECORD_ values (202,'kim',102,'7시간 30분','22km','2021-1-2');
insert into RECORD_ values (203,'kim',103,'6시간 00분','12km','2021-1-3');
insert into RECORD_ values (204,'kim',104,'9시간 00분','8km','2021-1-4');
insert into RECORD_ values (205,'kim',105,'12시간 00분','3km','2021-1-8');
insert into RECORD_ values (206,'kim',106,'3시간 00분','7km','2021-1-13');

--insert into DIARY values(DIARY_CODE,RECORD_ID,USER_ID,DIARY_TITLE,DIARY_MAIN_CONTENT,DIARY_DATE,DIARY_THUMBNAIN);
insert into DIARY values(302,202,'kim','제목1','제목1_메인_내용','2021-1-10','diary_th_sample1.jpg');
insert into DIARY values(302,202,'kim','제목2','제목2_메인_내용','2021-1-11','diary_th_sample2.jpg');
insert into DIARY values(302,203,'kim','제목3','제목3_메인_내용','2021-1-12','diary_th_sample3.jpg');
insert into DIARY values(303,204,'kim','제목4','제목4_메인_내용','2021-1-13','diary_th_sample4.jpg');
insert into DIARY values(304,205,'kim','제목5','제목5_메인_내용','2021-1-14','diary_th_sample5.jpg');
insert into DIARY values(305,206,'kim','제목6','제목6_메인_내용','2021-1-15','diary_th_sample6.jpg');

--insert into DIARY_IMG values(DIARY_IMG_CODE,DIARY_CODE,DIARY_IMG_NAME,DIARY_IMG_TITLE,DIARY_IMG_CONTENT)
insert into DIARY_IMG values(401,301,'diaryImg_sample1_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(402,301,'diaryImg_sample1_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(403,301,'diaryImg_sample1_3.jpg','소제목3','소제목3 내용');
insert into DIARY_IMG values(404,301,'diaryImg_sample1_4.jpg','소제목4','소제목4 내용');
insert into DIARY_IMG values(405,302,'diaryImg_sample2_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(406,302,'diaryImg_sample2_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(407,302,'diaryImg_sample2_3.jpg','소제목3','소제목3 내용');
insert into DIARY_IMG values(408,303,'diaryImg_sample3_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(409,303,'diaryImg_sample3_2.jpg','소제목2','소제목3 내용');
insert into DIARY_IMG values(410,304,'diaryImg_sample4_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(411,304,'diaryImg_sample4_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(412,305,'diaryImg_sample5_1.jpg','소제목1','소제목1 내용');
