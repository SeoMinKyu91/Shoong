INSERT INTO MEMBER values('kim','1234','김길동',9411191,'가산동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('lee','1234','이길동',9411191,'논현동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('park','1234','박길동',9411191,'청담동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('lim','1234','림길동',9411191,'신사동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('ko','1234','고길동',9411191,'신사동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('no','1234','노길동',9411191,'신사동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('do','1234','도길동',9411191,'신사동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('lo','1234','로길동',9411191,'신사동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('mo','1234','모길동',9411191,'신사동',sysdate,sysdate,'주2~3회');

INSERT INTO MEMBER values('bo','1234','보길동',9411191,'신사동',sysdate,sysdate,'주2~3회');

insert into PACK_MANAGER values('kim','1','master');

insert into PACK_MANAGER values('lee','1','member');

insert into PACK_MANAGER values('park','2','master');

insert into PACK_JOIN values(SEQ_P_JOIN.nextval,'kim','1',sysdate,'yes',sysdate);

insert into PACK_JOIN values(SEQ_P_JOIN.nextval,'lee','1',sysdate,'yes',sysdate);

insert into PACK_JOIN values(SEQ_P_JOIN.nextval,'park','2',sysdate,'yes',sysdate);

insert into PACK_JOIN values(SEQ_P_JOIN.nextval,'lim','2',sysdate,'no',sysdate);

insert into PACK_NOTICE values(SEQ_P_NOTICE.nextval,'kim','1','제목1',sysdate,'내용1');

insert into PACK_NOTICE values(SEQ_P_NOTICE.nextval,'kim','1','제목2',sysdate,'내용2');

insert into PACK_NOTICE values(SEQ_P_NOTICE.nextval,'kim','1','제목3',sysdate,'내용3');

insert into PACK_NOTICE values(SEQ_P_NOTICE.nextval,'park','2','park제목1',sysdate,'park내용1');

insert into PACK_NOTICE values(SEQ_P_NOTICE.nextval,'park','2','park제목2',sysdate,'park내용2');