
--레코드 임시 데이터 
--insert into RECORD_ values(RECORD_ID,USER_ID,COURSE_ID,RECORD_TIME,RECORD_LENGTH,RECORD_DATE);
insert into RECORD_ values (201,'shoong1000@naver.com',101,'recordsample1.json',52.4,'2020-11-14');
insert into RECORD_ values (202,'shoong1000@naver.com',102,'recordsample1.json',22,'2021-11-22');
insert into RECORD_ values (203,'shoong1000@naver.com',103,'recordsample1.json',5.6,'2021-12-3');
insert into RECORD_ values (204,'shoong1000@naver.com',104,'recordsample1.json',24.3,'2021-12-14');
insert into RECORD_ values (205,'shoong1000@naver.com',105,'recordsample1.json',32.4,'2021-1-1');
insert into RECORD_ values (206,'shoong1000@naver.com',106,'recordsample1.json',34,'2021-1-3');
insert into RECORD_ values (207,'shoong1000@naver.com',107,'recordsample1.json',32.4,'2021-1-8');
insert into RECORD_ values (208,'shoong1000@naver.com',108,'recordsample1.json',51,'2021-1-13');
insert into RECORD_ values (209,'shoong1000@naver.com',109,'recordsample1.json',32.4,'2021-1-16');
insert into RECORD_ values (210,'shoong1000@naver.com',110,'recordsample1.json',42,'2021-1-17');

--insert into DIARY values(DIARY_CODE,RECORD_ID,USER_ID,DIARY_TITLE,DIARY_MAIN_CONTENT,DIARY_DATE,DIARY_THUMBNAIN);
insert into DIARY values(301,201,'shoong1000@naver.com','친구랑 함께','제목1_메인_내용','2021-12-1','diary_th_sample1.jpg');
insert into DIARY values(302,202,'shoong1000@naver.com','아주 더운 날','제목2_메인_내용','2021-12-11','diary_th_sample2.jpg');
insert into DIARY values(303,203,'shoong1000@naver.com','언제봐도 아름다운 소양강','제목3_메인_내용','2021-12-12','diary_th_sample3.jpg');
insert into DIARY values(304,204,'shoong1000@naver.com','꽃길을 지나요','제목4_메인_내용','2021-12-13','diary_th_sample4.jpg');
insert into DIARY values(305,205,'shoong1000@naver.com','또 왔다 소양강','제목5_메인_내용','2021-1-4','diary_th_sample5.jpg');
insert into DIARY values(306,206,'shoong1000@naver.com','맑은 하늘이 이쁘다','제목6_메인_내용','2021-1-5','diary_th_sample6.jpg');
insert into DIARY values(307,207,'shoong1000@naver.com','인생 사진','제목7_메인_내용','2021-1-6','diary_th_sample7.jpg');
insert into DIARY values(308,208,'shoong1000@naver.com','꽃이 핀 날','제목8_메인_내용','2021-1-9','diary_th_sample8.jpg');
insert into DIARY values(309,209,'shoong1000@naver.com','인생 자전거 사진','제목9_메인_내용','2021-1-16','diary_th_sample9.jpg');
insert into DIARY values(310,210,'shoong1000@naver.com','어느 맑은 날','제목10_메인_내용','2021-1-17','diary_th_sample10.jpg');

--insert into DIARY_IMG values(DIARY_IMG_CODE,DIARY_CODE,DIARY_IMG_NAME,DIARY_IMG_TITLE,DIARY_IMG_CONTENT)
insert into DIARY_IMG values(401,301,'diaryImg_sample1_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(402,301,'diaryImg_sample1_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(403,301,'diaryImg_sample1_3.jpg','소제목3','소제목3 내용');
insert into DIARY_IMG values(404,301,'diaryImg_sample1_4.jpg','소제목4','소제목4 내용');
insert into DIARY_IMG values(405,302,'diaryImg_sample2_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(406,302,'diaryImg_sample2_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(407,302,'diaryImg_sample2_3.jpg','소제목3','소제목3 내용');
insert into DIARY_IMG values(408,303,'diaryImg_sample3_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(409,303,'diaryImg_sample3_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(410,304,'diaryImg_sample4_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(411,304,'diaryImg_sample4_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(412,305,'diaryImg_sample5_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(413,306,'diaryImg_sample1_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(414,307,'diaryImg_sample1_2.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(415,309,'diaryImg_sample1_3.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(416,309,'diaryImg_sample1_4.jpg','소제목1','소제목2 내용');
insert into DIARY_IMG values(417,310,'diaryImg_sample2_1.jpg','소제목1','소제목1 내용');
insert into DIARY_IMG values(418,310,'diaryImg_sample2_2.jpg','소제목2','소제목2 내용');
insert into DIARY_IMG values(419,310,'diaryImg_sample2_3.jpg','소제목3','소제목3 내용');
insert into DIARY_IMG values(420,310,'diaryImg_sample3_1.jpg','소제목4','소제목4 내용');--레코드 임시 데이터 
