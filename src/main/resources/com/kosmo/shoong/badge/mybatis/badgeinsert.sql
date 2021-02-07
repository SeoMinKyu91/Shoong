/*
  BADGE_ID                                  NOT NULL NUMBER
 BADGE_NAME                                         NVARCHAR2(30)
 BADGE_REQUIREMENT                                  VARCHAR2(30)
 BEDGE_CATEGORY                                     VARCHAR2(30)
 BADGE_THUMBNAIL                                    NVARCHAR2(30)
 */
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'새싹','0','마일리지','shoongBadge1.png');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'비기너','1','마일리지','shoongBadge2.png');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'걸음마','5','마일리지','shoongBadge3.png');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'동네 산책','10','마일리지','shoongBadge4.png');
INSERT INTO BADGE VALUES(SEQ_BADGE.NEXTVAL,'동네 한바퀴','15','마일리지','shoongBadge5.png');
