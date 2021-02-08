/*
  BADGE_ID                                  NOT NULL NUMBER
 BADGE_NAME                                         NVARCHAR2(30)
 BADGE_REQUIREMENT                                  VARCHAR2(30)
 BEDGE_CATEGORY                                     VARCHAR2(30)
 BADGE_THUMBNAIL                                    NVARCHAR2(30)
 */
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'새싹','0','마일리지','starter_badge.jpg');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'비기너','1','마일리지','beginner_badge.jpg');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'걸음마','5','마일리지','first_step_badge.jpg');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'동네 산책','10','마일리지','walk_badge.jpg');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'동네 한바퀴','15','마일리지','circle_badge.jpg');
