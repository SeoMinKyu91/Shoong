/*
 RECORD_ID                                 NOT NULL NVARCHAR2(50)
 USER_ID                                   NOT NULL VARCHAR2(30)
 COURSE_ID                                          NVARCHAR2(50)
 RECORD_LENGTH                                      FLOAT(126)
 RECORD_DATE                                        DATE
 RECORD_DURATION                                    NVARCHAR2(10)
 */
/*레코드 임시 데이터*/ 

/*레코드 임시 데이터  __ 수정했어요!!!_DURATION 추가해서요~  _별*/ 
insert into RECORD_(record_id,user_id,course_id,record_file_name,record_length,record_date,DURATION) values (201,'shoong1000@naver.com',101,'recordsample1.json',52.4,'2020-11-14','6000');
insert into RECORD_(record_id,user_id,course_id,record_file_name,record_length,record_date,DURATION) values (202,'shoong1000@naver.com',102,'recordsample2.json',22,'2021-11-22','7500');
insert into RECORD_(record_id,user_id,course_id,record_file_name,record_length,record_date,DURATION) values (203,'shoong1000@naver.com',103,'recordsample3.json',5.6,'2021-12-3','8500');
insert into RECORD_(record_id,user_id,course_id,record_file_name,record_length,record_date,DURATION) values (204,'shoong1000@naver.com',104,'recordsample4.json',24.3,'2021-12-14','7800');
insert into RECORD_(record_id,user_id,record_file_name,record_length,record_date,DURATION) values (205,'shoong1000@naver.com','recordsample5.json',32.4,'2021-1-1','12500');
insert into RECORD_(record_id,user_id,course_id,record_file_name,record_length,record_date,DURATION) values (206,'shoong1000@naver.com',106,'recordsample6.json',34,'2021-1-3','13500');
insert into RECORD_(record_id,user_id,record_file_name,record_length,record_date,DURATION) values (207,'shoong1000@naver.com','recordsample7.json',32.4,'2021-1-8','7400');
insert into RECORD_(record_id,user_id,course_id,record_file_name,record_length,record_date,DURATION) values (208,'shoong1000@naver.com',108,'recordsample8.json',51,'2021-2-1','17500');
insert into RECORD_(record_id,user_id,course_id,record_file_name,record_length,record_date,DURATION) values (209,'shoong1000@naver.com',109,'recordsample9.json',32.4,'2021-2-3','27500');
insert into RECORD_(record_id,user_id,record_file_name,record_length,record_date,DURATION) values (210,'shoong1000@naver.com','recordsample10.json',42,'2021-2-5','21310');
