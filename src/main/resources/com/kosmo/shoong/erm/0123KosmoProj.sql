
/* Drop Tables */

DROP TABLE ADMIN_ CASCADE CONSTRAINTS;
DROP TABLE PACK_BADGE_GET CASCADE CONSTRAINTS;
DROP TABLE USER_BADGE_GET CASCADE CONSTRAINTS;
DROP TABLE BADGE CASCADE CONSTRAINTS;
DROP TABLE COURSE_COMMENT CASCADE CONSTRAINTS;
DROP TABLE COURSE_IMAGE CASCADE CONSTRAINTS;
DROP TABLE COURSE_LIKECOUNT CASCADE CONSTRAINTS;
DROP TABLE DIARY_IMG CASCADE CONSTRAINTS;
DROP TABLE DIARY CASCADE CONSTRAINTS;
DROP TABLE RECORD_ CASCADE CONSTRAINTS;
DROP TABLE COURSE CASCADE CONSTRAINTS;
DROP TABLE USER_INTERCOURSE_CATE CASCADE CONSTRAINTS;
DROP TABLE COURSE_CATE CASCADE CONSTRAINTS;
DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE PACK_CREATE CASCADE CONSTRAINTS;
DROP TABLE PACK_COMMENT_IMG CASCADE CONSTRAINTS;
DROP TABLE PACK_COMMENT_LIKE CASCADE CONSTRAINTS;
DROP TABLE PACK_COMMENT_REPLY CASCADE CONSTRAINTS;
DROP TABLE PACK_COMMENT CASCADE CONSTRAINTS;
DROP TABLE PACK_GALLERY CASCADE CONSTRAINTS;
DROP TABLE PACK_SCHEDULE_JOIN CASCADE CONSTRAINTS;
DROP TABLE PACK_JOIN CASCADE CONSTRAINTS;
DROP TABLE PACK_NOTICE CASCADE CONSTRAINTS;
DROP TABLE PACK_SCHEDULE CASCADE CONSTRAINTS;
DROP TABLE PACK_MANAGER CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE USERADDR CASCADE CONSTRAINTS;
DROP TABLE VERIFY CASCADE CONSTRAINTS;
DROP TABLE Member_ CASCADE CONSTRAINTS;
DROP TABLE PACK CASCADE CONSTRAINTS;
DROP TABLE PROHIBITED_WORD CASCADE CONSTRAINTS;
DROP TABLE PUSH_ALARM CASCADE CONSTRAINTS;
DROP TABLE CHAT_MESSAGE CASCADE CONSTRAINTS;
DROP TABLE CHAT_ROOM CASCADE CONSTRAINTS;
DROP TABLE CHAT_ROOM_JOIN CASCADE CONSTRAINTS;

/*Drop Sequence*/

DROP SEQUENCE SEQ_P;
DROP SEQUENCE SEQ_P_COMMENT;
DROP SEQUENCE SEQ_P_GALLERY;
DROP SEQUENCE SEQ_P_JOIN;
DROP SEQUENCE SEQ_P_NOTICE;
DROP SEQUENCE SEQ_P_SCHEDULE;

DROP SEQUENCE SEQ_DIARY;
DROP SEQUENCE SEQ_DIARY_IMG;

DROP SEQUENCE SEQ_C_CATE;


/*Create Sequence*/

CREATE SEQUENCE SEQ_P;
CREATE SEQUENCE SEQ_P_COMMENT;
CREATE SEQUENCE SEQ_P_GALLERY;
CREATE SEQUENCE SEQ_P_JOIN;
CREATE SEQUENCE SEQ_P_NOTICE;
CREATE SEQUENCE SEQ_P_SCHEDULE;

CREATE SEQUENCE SEQ_DIARY;
CREATE SEQUENCE SEQ_DIARY_IMG;

CREATE SEQUENCE SEQ_C_CATE;

/* Create Tables */

CREATE TABLE CHAT_ROOM
(
	CHAT_ROOM_NO number NOT NULL,
	CHAT_ROOM_TITLE varchar2(40),
	PRIMARY KEY (CHAT_ROOM_NO)
);

CREATE TABLE CHAT_MESSAGE
(
	CHAT_MESSAGE_NO number NOT NULL,
	CHAT_MESSAGE_CONTENT varchar2(400),
	CHAT_MESSAGE_DATE date,
	CHAT_ROOM_NO number,
	USER_ID varchar2(30),
	PRIMARY KEY (CHAT_MESSAGE_NO)
);

CREATE TABLE CHAT_ROOM_JOIN
(
	CHAT_ROOM_JOIN_NO number NOT NULL,
	CHAT_ROOM_NO number,
	USER_ID varchar2(30),
	PRIMARY KEY (CHAT_ROOM_JOIN_NO)
);


CREATE TABLE ADMIN_
(
	ID varchar2(30) NOT NULL,
	PWD varchar2(20),
	NAME nvarchar2(10),
	JOBCODE nvarchar2(50),
	PRIMARY KEY (ID)
);


CREATE TABLE BADGE
(
	BADGE_ID  NOT NULL,
	BADGE_NAME ,
	BADGE_REQUIREMENT ,
	BEDGE_CATEGORY ,
	BADGE_THUMBNAIL ,
	PRIMARY KEY (BADGE_ID)
);


CREATE TABLE COURSE
(
	COURSE_ID nvarchar2(50) NOT NULL,
	COURSE_CATE_ID nvarchar2(10) NOT NULL,
	USER_ID varchar2(30) NOT NULL,
	COURSE_NAME nvarchar2(50),
	COURSE_INTRO nvarchar2(50),
	COURSE_THUMBNAIL varchar2(500),
	-- course_time은 자전거 평속을 기준으로 계산해서 입력
	COURSE_TIME nvarchar2(10),
	COURSE_LENGTH nvarchar2(50),
	COURSE_DATE date,
	-- 식별자#
	COURSE_TAG nvarchar2(50),
	COURSE_REGION nvarchar2(50),
	PRIMARY KEY (COURSE_ID)
);


CREATE TABLE COURSE_CATE
(
	COURSE_CATE_ID nvarchar2(10) NOT NULL,
	COURSE_CATE_NAME nvarchar2(50) NOT NULL,
	COURSE_CATE_THUMBNAIL varchar2(500),
	PRIMARY KEY (COURSE_CATE_ID)
);


CREATE TABLE COURSE_COMMENT
(
	COURSE_COMMENT_NO number NOT NULL,
	COURSE_ID nvarchar2(50) NOT NULL,
	USER_ID varchar2(30) NOT NULL,
	COURSE_COMMENT_CONTENT nvarchar2(2000) NOT NULL,
	PRIMARY KEY (COURSE_COMMENT_NO)
);


CREATE TABLE COURSE_IMAGE
(
	IMG_NAME nvarchar2(30),
	COURSE_ID nvarchar2(50) NOT NULL
);


CREATE TABLE COURSE_LIKECOUNT
(
	COURSE_ID nvarchar2(50) NOT NULL,
	USER_ID varchar2(30) NOT NULL
);


CREATE TABLE DIARY
(
	DIARY_CODE number NOT NULL,
	RECORD_ID number NOT NULL,
	USER_ID varchar2(30),
	DIARY_TITLE nvarchar2(50),
	DIARY_MAIN_CONTENT nvarchar2(500),
	DIARY_DATE date DEFAULT SYSDATE,
	DIARY_THUMBNAIL varchar2(100),
	PRIMARY KEY (DIARY_CODE)
);


CREATE TABLE DIARY_IMG
(
	DIARY_IMG_CODE number NOT NULL,
	DIARY_CODE number NOT NULL,
	DIARY_IMG_NAME varchar2(50),
	DIARY_IMG_TITLE nvarchar2(50),
	DIARY_IMG_CONTENT nvarchar2(500),
	PRIMARY KEY (DIARY_IMG_CODE)
);


CREATE TABLE EVENT
(
	EVENT_ID  NOT NULL,
	EVENT_CONTENT ,
	EVENT_POSTDATE ,
	EVENT_TITLE ,
	PRIMARY KEY (EVENT_ID)
);


CREATE TABLE Member_
(
	USER_ID varchar2(30) NOT NULL,
	PWD varchar2(2000),
	NAME nvarchar2(10),
	GENDER nvarchar2(10),
	AGE number,
	USERTEL varchar2(20),
	LASTCONNECT date DEFAULT SYSDATE,
	USERJOINDATE date DEFAULT SYSDATE,
	FREQUENCY nvarchar2(100),
	PRIMARY KEY (USER_ID)
);


CREATE TABLE PACK
(
	PACK_ID varchar2(50) NOT NULL,
	PACK_NAME nvarchar2(50),
	PACK_TAG nvarchar2(100),
	PACK_ACT_REGION nvarchar2(50),
	PACK_ACT_TIME nvarchar2(50),
	PACK_ACT_AGE nvarchar2(50),
	PACK_INTRO nvarchar2(2000),
	PACK_THUMBNAIL varchar2(50),
	PACK_LAT float,
	PACK_LNG float,
	PRIMARY KEY (PACK_ID)
);


CREATE TABLE PACK_BADGE_GET
(
	BADGE_ID  NOT NULL,
	TARGET_ID ,
	GET_DATE 
);


CREATE TABLE PACK_COMMENT
(
	PACK_COMMENT_NO number NOT NULL,
	PACK_JOIN_NO number NOT NULL,
	PACK_COMMENT_CONTENT nvarchar2(1000),
	PACK_COMMENT_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (PACK_COMMENT_NO)
);


CREATE TABLE PACK_COMMENT_IMG
(
	PACK_COMMENT_NO number NOT NULL,
	PACK_COMMENT_IMG_NAME varchar2(200)
);


CREATE TABLE PACK_COMMENT_LIKE
(
	USER_ID varchar2(30),
	PACK_COMMENT_NO number NOT NULL
);


CREATE TABLE PACK_COMMENT_REPLY
(
	PACK_COMMENT_REPLY_NO number NOT NULL,
	USER_ID varchar2(30),
	PACK_COMMENT_REPLY_CONTENT varchar2(1000),
	PACK_COMMENT_REPLY_DATE date DEFAULT SYSDATE,
	PACK_COMMENT_NO number NOT NULL,
	PRIMARY KEY (PACK_COMMENT_REPLY_NO)
);


CREATE TABLE PACK_CREATE
(
	USER_ID varchar2(30) NOT NULL,
	PACK_ID varchar2(50) NOT NULL,
	PACK_REGIDATE date DEFAULT SYSDATE
);


CREATE TABLE PACK_GALLERY
(
	PICTURE_NO number NOT NULL,
	PICTURE_NAME varchar2(100),
	PACK_JOIN_NO number NOT NULL,
	PRIMARY KEY (PICTURE_NO)
);


CREATE TABLE PACK_JOIN
(
	PACK_JOIN_NO number NOT NULL,
	USER_ID varchar2(30) NOT NULL,
	PACK_ID varchar2(50) NOT NULL,
	PACK_JOIN_DATE date DEFAULT SYSDATE,
	PACK_JOIN_ACCEPT varchar2(50),
	PACK_LASTACCESS date DEFAULT SYSDATE,
	PRIMARY KEY (PACK_JOIN_NO),
	UNIQUE (USER_ID, PACK_ID)
);


CREATE TABLE PACK_MANAGER
(
	USER_ID varchar2(30) NOT NULL,
	PACK_ID varchar2(50) NOT NULL,
	AUTHORITY nvarchar2(50),
	UNIQUE (USER_ID, PACK_ID)
);


CREATE TABLE PACK_NOTICE
(
	PACK_NOTICE_NO number NOT NULL,
	USER_ID varchar2(30) NOT NULL,
	PACK_ID varchar2(50) NOT NULL,
	PACK_NOTICE_TITLE nvarchar2(100),
	PACK_NOTICE_DATE date,
	PACK_NOTICE_CONTENT nvarchar2(2000),
	PRIMARY KEY (PACK_NOTICE_NO)
);


CREATE TABLE PACK_SCHEDULE
(
	PACK_SCHEDULE_NO number NOT NULL,
	USER_ID varchar2(30) NOT NULL,
	PACK_ID varchar2(50) NOT NULL,
	PACK_SCHEDULE_START date DEFAULT SYSDATE,
	PACK_SCHEDULE_END date DEFAULT SYSDATE,
	PACK_SCHEDULE_TITLE nvarchar2(100),
	PACK_SCHEDULE_CONTENT nvarchar2(2000),
	PRIMARY KEY (PACK_SCHEDULE_NO)
);


CREATE TABLE PACK_SCHEDULE_JOIN
(
	PACK_SCHEDULE_NO number NOT NULL,
	PACK_JOIN_NO number NOT NULL
);


CREATE TABLE PROHIBITED_WORD
(
	WORD_ID  NOT NULL,
	PROHIBITED_WORD ,
	PRIMARY KEY (WORD_ID)
);


CREATE TABLE PUSH_ALARM
(
	PUSH_ID  NOT NULL,
	PUSH_TARGET ,
	PUSH_CONTENT ,
	PUSH_NAME ,
	PUSH_DATE ,
	PUSH_METHOD ,
	PRIMARY KEY (PUSH_ID)
);


CREATE TABLE RECORD_
(
	RECORD_ID number NOT NULL,
	USER_ID varchar2(30) NOT NULL,
	COURSE_ID nvarchar2(50) NOT NULL,
	RECORD_FILE_NAME varchar2(100),
	RECORD_LENGTH float,
	RECORD_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (RECORD_ID)
);


CREATE TABLE REPORT
(
	REPORT_ID varchar2(30) NOT NULL,
	USER_ID varchar2(30) NOT NULL,
	REPORT_TARGET_ID varchar2(30),
	REPORT_CATEGORY nvarchar2(30),
	REPORT_DATE date DEFAULT SYSDATE,
	REPORT_REASON nvarchar2(200),
	PRIMARY KEY (REPORT_ID)
);


CREATE TABLE USERADDR
(
	USER_ID varchar2(30) NOT NULL,
	ADDRESS nvarchar2(100) NOT NULL,
	USER_LAT float NOT NULL,
	USER_LNG float NOT NULL,
	PRIMARY KEY (USER_ID)
);


CREATE TABLE USER_BADGE_GET
(
	BADGE_ID  NOT NULL,
	RECORD_ID number NOT NULL,
	TARGET_ID ,
	GET_DATE 
);


CREATE TABLE USER_INTERCOURSE_CATE
(
	COURSE_CATE_CODE nvarchar2(10) NOT NULL,
	USER_ID varchar2(30) NOT NULL
);


CREATE TABLE VERIFY
(
	USER_ID varchar2(30) NOT NULL,
	VERIFY nvarchar2(2)
);



/* Create Foreign Keys */
ALTER TABLE CHAT_MESSAGE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES MEMBER_ (USER_ID)
;

ALTER TABLE CHAT_MESSAGE
	ADD FOREIGN KEY (CHAT_ROOM_NO)
	REFERENCES CHAT_ROOM (CHAT_ROOM_NO)
;

ALTER TABLE CHAT_ROOM_JOIN
	ADD FOREIGN KEY (USER_ID)
	REFERENCES MEMBER_ (USER_ID)
;

ALTER TABLE CHAT_ROOM_JOIN
	ADD FOREIGN KEY (CHAT_ROOM_NO)
	REFERENCES CHAT_ROOM (CHAT_ROOM_NO)
;	

ALTER TABLE PACK_BADGE_GET
	ADD FOREIGN KEY (BADGE_ID)
	REFERENCES BADGE (BADGE_ID)
;


ALTER TABLE USER_BADGE_GET
	ADD FOREIGN KEY (BADGE_ID)
	REFERENCES BADGE (BADGE_ID)
;


ALTER TABLE COURSE_COMMENT
	ADD FOREIGN KEY (COURSE_ID)
	REFERENCES COURSE (COURSE_ID)
;


ALTER TABLE COURSE_IMAGE
	ADD FOREIGN KEY (COURSE_ID)
	REFERENCES COURSE (COURSE_ID)
;


ALTER TABLE COURSE_LIKECOUNT
	ADD FOREIGN KEY (COURSE_ID)
	REFERENCES COURSE (COURSE_ID)
;


ALTER TABLE RECORD_
	ADD FOREIGN KEY (COURSE_ID)
	REFERENCES COURSE (COURSE_ID)
;


ALTER TABLE COURSE
	ADD FOREIGN KEY (COURSE_CATE_ID)
	REFERENCES COURSE_CATE (COURSE_CATE_ID)
;


ALTER TABLE USER_INTERCOURSE_CATE
	ADD FOREIGN KEY (COURSE_CATE_CODE)
	REFERENCES COURSE_CATE (COURSE_CATE_ID)
;


ALTER TABLE DIARY_IMG
	ADD FOREIGN KEY (DIARY_CODE)
	REFERENCES DIARY (DIARY_CODE)
;


ALTER TABLE COURSE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE COURSE_COMMENT
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE COURSE_LIKECOUNT
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE PACK_CREATE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE PACK_JOIN
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE PACK_MANAGER
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE RECORD_
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE REPORT
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE USERADDR
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE USER_INTERCOURSE_CATE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE VERIFY
	ADD FOREIGN KEY (USER_ID)
	REFERENCES Member_ (USER_ID)
;


ALTER TABLE PACK_CREATE
	ADD FOREIGN KEY (PACK_ID)
	REFERENCES PACK (PACK_ID)
;


ALTER TABLE PACK_JOIN
	ADD FOREIGN KEY (PACK_ID)
	REFERENCES PACK (PACK_ID)
;


ALTER TABLE PACK_MANAGER
	ADD FOREIGN KEY (PACK_ID)
	REFERENCES PACK (PACK_ID)
;


ALTER TABLE PACK_COMMENT_IMG
	ADD FOREIGN KEY (PACK_COMMENT_NO)
	REFERENCES PACK_COMMENT (PACK_COMMENT_NO)
;


ALTER TABLE PACK_COMMENT_LIKE
	ADD FOREIGN KEY (PACK_COMMENT_NO)
	REFERENCES PACK_COMMENT (PACK_COMMENT_NO)
;


ALTER TABLE PACK_COMMENT_REPLY
	ADD FOREIGN KEY (PACK_COMMENT_NO)
	REFERENCES PACK_COMMENT (PACK_COMMENT_NO)
;


ALTER TABLE PACK_COMMENT
	ADD FOREIGN KEY (PACK_JOIN_NO)
	REFERENCES PACK_JOIN (PACK_JOIN_NO)
;


ALTER TABLE PACK_GALLERY
	ADD FOREIGN KEY (PACK_JOIN_NO)
	REFERENCES PACK_JOIN (PACK_JOIN_NO)
;


ALTER TABLE PACK_SCHEDULE_JOIN
	ADD FOREIGN KEY (PACK_JOIN_NO)
	REFERENCES PACK_JOIN (PACK_JOIN_NO)
;


ALTER TABLE PACK_NOTICE
	ADD FOREIGN KEY (USER_ID, PACK_ID)
	REFERENCES PACK_MANAGER (USER_ID, PACK_ID)
;


ALTER TABLE PACK_SCHEDULE
	ADD FOREIGN KEY (USER_ID, PACK_ID)
	REFERENCES PACK_MANAGER (USER_ID, PACK_ID)
;


ALTER TABLE PACK_SCHEDULE_JOIN
	ADD FOREIGN KEY (PACK_SCHEDULE_NO)
	REFERENCES PACK_SCHEDULE (PACK_SCHEDULE_NO)
;


ALTER TABLE DIARY
	ADD FOREIGN KEY (RECORD_ID)
	REFERENCES RECORD_ (RECORD_ID)
;


ALTER TABLE USER_BADGE_GET
	ADD FOREIGN KEY (RECORD_ID)
	REFERENCES RECORD_ (RECORD_ID)
;



