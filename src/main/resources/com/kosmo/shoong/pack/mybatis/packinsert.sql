/* =================================================팩 생성 ===========================================================*/
insert into pack values(1000,'전국일주','#전국일주#맛집탐방','서울특별시 구로구','주 1회','20대','다같이화목한분위기로자전거탑시다~','packLogo1.png',37.488004666666676,126.85213716666668);
insert into PACK values(1100,'동네 한바퀴','#맛집투어#오솔길','경기도 용인시','주 1회','30대','다같이 돌자 동네 한바퀴~','packLogo1.png',37.324501882069015,127.25959003827327);
insert into PACK values(1200,'호잇호잇','#공원#오솔길','경기도 성남시','주 4회 이상','40대','자전거를 좋아하시는분 같이 탑시다','packLogo5.png',37.40953083324051,127.07590473712015);
insert into PACK values(1300,'페달의 민족','#맛집투어#여행','경기도 용인시','주 2~3회','30대','30대 회사원들이 많습니다~','packLogo3.png',37.25030499290375,127.14752182834968);
insert into PACK values(1400,'먼저가욧','#동네#맛집투어','경기도 광주시','주 4회 이상','40대','다 같이 취미 생활 즐기실 분 모집해요~','packLogo4.png',37.31789377151831,127.36065024001839);
insert into PACK values(1500,'네발자전거 단','#캠핑#감성','경기도 광주시','주 2~3회','30대','잘부탁드립니다~','packLogo5.png',37.32904468961533,127.28993505327924);
insert into PACK values(1600,'레알 마드리드','#장거리#전국일주','경기도 성남시','주 1회','20대','흥 많은 20대들의 모임','packLogo6.png',37.45073082410645,127.11391951067414);
insert into PACK values(1700,'자전거라이더','#공원#자연','경기도 성남시','주 1회','20대','대박나세요~','packLogo7.png',37.43073658170476,127.19126149235792);
insert into PACK values(1800,'자 가보자~','#전국#맛집','경기도 성남시','주 2~3회','30대','장거리 자전거를 많이 즐깁니다','packLogo6.png',37.399067052411404,127.16010054234708);
insert into PACK values(1900,'따르릉 따르릉','#취미#산악자전거','경기도 용인시','주 1회','40대','용인사는 사람 모여~~라~','packLogo2.png',37.289404999999995,127.1252265);

insert into pack_manager values('shoong1000@naver.com','1000','master');
insert into pack_manager values('shoong1100@naver.com','1100','master');
insert into pack_manager values('shoong1200@naver.com','1200','master');
insert into pack_manager values('shoong1300@naver.com','1300','master');
insert into pack_manager values('shoong1400@naver.com','1400','master');
insert into pack_manager values('shoong1500@naver.com','1500','master');
insert into pack_manager values('shoong1600@naver.com','1600','master');
insert into pack_manager values('shoong1700@naver.com','1700','master');
insert into pack_manager values('shoong1800@naver.com','1800','master');
insert into pack_manager values('shoong1900@naver.com','1900','master');

insert into pack_create values('shoong1000@naver.com','1000',sysdate);
insert into pack_create values('shoong1100@naver.com','1100',sysdate);
insert into pack_create values('shoong1200@naver.com','1200',sysdate);
insert into pack_create values('shoong1300@naver.com','1300',sysdate);
insert into pack_create values('shoong1400@naver.com','1400',sysdate);
insert into pack_create values('shoong1500@naver.com','1500',sysdate);
insert into pack_create values('shoong1600@naver.com','1600',sysdate);
insert into pack_create values('shoong1700@naver.com','1700',sysdate);
insert into pack_create values('shoong1800@naver.com','1800',sysdate);
insert into pack_create values('shoong1900@naver.com','1900',sysdate);

insert into pack_join values(1000,'shoong1000@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1100,'shoong1100@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1200,'shoong1200@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1300,'shoong1300@naver.com',1300,sysdate,'yes',sysdate); 
insert into pack_join values(1400,'shoong1400@naver.com',1400,sysdate,'yes',sysdate); 
insert into pack_join values(1500,'shoong1500@naver.com',1500,sysdate,'yes',sysdate);
insert into pack_join values(1600,'shoong1600@naver.com',1600,sysdate,'yes',sysdate);
insert into pack_join values(1700,'shoong1700@naver.com',1700,sysdate,'yes',sysdate); 
insert into pack_join values(1800,'shoong1800@naver.com',1800,sysdate,'yes',sysdate); 
insert into pack_join values(1900,'shoong1900@naver.com',1900,sysdate,'yes',sysdate);

/* =================================================팩 가입 승인완료 ===========================================================*/
insert into pack_join values(1001,'shoong1001@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1002,'shoong1002@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1003,'shoong1003@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1004,'shoong1004@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1005,'shoong1005@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1006,'shoong1006@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1007,'shoong1007@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1008,'shoong1008@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1009,'shoong1009@naver.com',1000,sysdate,'yes',sysdate);
insert into pack_join values(1010,'shoong1010@naver.com',1000,sysdate,'yes',sysdate);

insert into pack_join values(1101,'shoong1101@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1102,'shoong1102@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1103,'shoong1103@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1104,'shoong1104@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1105,'shoong1105@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1106,'shoong1106@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1107,'shoong1107@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1108,'shoong1108@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1109,'shoong1109@naver.com',1100,sysdate,'yes',sysdate);
insert into pack_join values(1110,'shoong1110@naver.com',1100,sysdate,'yes',sysdate);

insert into pack_join values(1201,'shoong1201@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1202,'shoong1202@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1203,'shoong1203@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1204,'shoong1204@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1205,'shoong1205@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1206,'shoong1206@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1207,'shoong1207@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1208,'shoong1208@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1209,'shoong1209@naver.com',1200,sysdate,'yes',sysdate);
insert into pack_join values(1210,'shoong1210@naver.com',1200,sysdate,'yes',sysdate);

/* =================================================팩 가입 미 승인 ===========================================================*/
insert into pack_join values(1011,'shoong1011@naver.com',1000,sysdate,'no',sysdate);
insert into pack_join values(1012,'shoong1012@naver.com',1000,sysdate,'no',sysdate);
insert into pack_join values(1013,'shoong1013@naver.com',1000,sysdate,'no',sysdate);
insert into pack_join values(1014,'shoong1014@naver.com',1000,sysdate,'no',sysdate);
insert into pack_join values(1015,'shoong1015@naver.com',1000,sysdate,'no',sysdate);

insert into pack_join values(1111,'shoong1111@naver.com',1100,sysdate,'no',sysdate);
insert into pack_join values(1112,'shoong1112@naver.com',1100,sysdate,'no',sysdate);
insert into pack_join values(1113,'shoong1113@naver.com',1100,sysdate,'no',sysdate);
insert into pack_join values(1114,'shoong1114@naver.com',1100,sysdate,'no',sysdate);
insert into pack_join values(1115,'shoong1115@naver.com',1100,sysdate,'no',sysdate);

insert into pack_join values(1211,'shoong1211@naver.com',1200,sysdate,'no',sysdate);
insert into pack_join values(1212,'shoong1212@naver.com',1200,sysdate,'no',sysdate);
insert into pack_join values(1213,'shoong1213@naver.com',1200,sysdate,'no',sysdate);
insert into pack_join values(1214,'shoong1214@naver.com',1200,sysdate,'no',sysdate);
insert into pack_join values(1215,'shoong1215@naver.com',1200,sysdate,'no',sysdate);

/* =================================================팩 공지사항 ===========================================================*/
insert into pack_notice values(1000,'shoong1000@naver.com','1000','연초 회식 공지',sysdate,'코로나로 인해 회식을 연기하기로 했습니다');
insert into pack_notice values(1001,'shoong1000@naver.com','1000','코로나 사항 공지',sysdate,'코로나로 인해 5인 이상 집합을 하면 안됩니다 잘 지켜주세요');
insert into pack_notice values(1002,'shoong1000@naver.com','1000','라이딩시 지참할 물건들',sysdate,'헬멧, 무선 이어폰, 여벌 옷, 회비 꼭 지참해주세요');
insert into pack_notice values(1003,'shoong1000@naver.com','1000','팩 활동이 적으신 분들 제명하겠습니다',sysdate,'팩 활동에 참여 부탁드립니다');
insert into pack_notice values(1004,'shoong1000@naver.com','1000','팩 규칙',sysdate,'서로 욕하면서 싸우지 않습니다');
insert into pack_notice values(1005,'shoong1000@naver.com','1000','팩 장 위임 연기 공지',sysdate,'사정으로 인해 팩 장 위임이 연기 되었습니다');
insert into pack_notice values(1006,'shoong1000@naver.com','1000','팩 장 위임 공지',sysdate,'팩 장이 변경 되었습니다');
insert into pack_notice values(1007,'shoong1000@naver.com','1000','팩 로고 변경 공지',sysdate,'팩 로고가 변경 되었습니다');
insert into pack_notice values(1008,'shoong1000@naver.com','1000','팩 스케줄 등록 공지',sysdate,'무분별한 등록은 자제 부탁드립니다');
insert into pack_notice values(1009,'shoong1000@naver.com','1000','단체 톡방 공지',sysdate,'나이 이름 형식에 맞춰주세요');
insert into pack_notice values(1010,'shoong1000@naver.com','1000','팩 이름 변경 공지',sysdate,'여러분과 의논 후 팩 이름이 변경을 변경하였습니다');
insert into pack_notice values(1011,'shoong1000@naver.com','1000','부팩장 선출 공지',sysdate,'부팩장을 2명 뽑으려고 합니다 많은 지원 부탁드립니다');
insert into pack_notice values(1012,'shoong1000@naver.com','1000','부팩장 공지',sysdate,'부팩장 선임이 완료 되었습니다');
insert into pack_notice values(1013,'shoong1000@naver.com','1000','설날 공지',sysdate,'설날 코로나 조심하시고 즐겁게 보내세요');
insert into pack_notice values(1014,'shoong1000@naver.com','1000','설날 이후 모임 공지',sysdate,'설날 이후 같이 라이딩을 자제 부탁드립니다');

insert into pack_notice values(1100,'shoong1100@naver.com','1100','연초 회식 공지',sysdate,'코로나로 인해 회식을 연기하기로 했습니다');
insert into pack_notice values(1101,'shoong1100@naver.com','1100','코로나 사항 공지',sysdate,'코로나로 인해 5인 이상 집합을 하면 안됩니다 잘 지켜주세요');
insert into pack_notice values(1102,'shoong1100@naver.com','1100','라이딩시 지참할 물건들',sysdate,'헬멧, 무선 이어폰, 여벌 옷, 회비 꼭 지참해주세요');
insert into pack_notice values(1103,'shoong1100@naver.com','1100','팩 활동이 적으신 분들 제명하겠습니다',sysdate,'팩 활동에 참여 부탁드립니다');
insert into pack_notice values(1104,'shoong1100@naver.com','1100','팩 규칙',sysdate,'서로 욕하면서 싸우지 않습니다');
insert into pack_notice values(1105,'shoong1100@naver.com','1100','팩 장 위임 연기 공지',sysdate,'사정으로 인해 팩 장 위임이 연기 되었습니다');
insert into pack_notice values(1106,'shoong1100@naver.com','1100','팩 장 위임 공지',sysdate,'팩 장이 변경 되었습니다');
insert into pack_notice values(1107,'shoong1100@naver.com','1100','팩 로고 변경 공지',sysdate,'팩 로고가 변경 되었습니다');
insert into pack_notice values(1108,'shoong1100@naver.com','1100','팩 스케줄 등록 공지',sysdate,'무분별한 등록은 자제 부탁드립니다');
insert into pack_notice values(1109,'shoong1100@naver.com','1100','단체 톡방 공지',sysdate,'나이 이름 형식에 맞춰주세요');
insert into pack_notice values(1110,'shoong1100@naver.com','1100','팩 이름 변경 공지',sysdate,'여러분과 의논 후 팩 이름이 변경을 변경하였습니다');
insert into pack_notice values(1111,'shoong1100@naver.com','1100','부팩장 선출 공지',sysdate,'부팩장을 2명 뽑으려고 합니다 많은 지원 부탁드립니다');
insert into pack_notice values(1112,'shoong1100@naver.com','1100','부팩장 공지',sysdate,'부팩장 선임이 완료 되었습니다');
insert into pack_notice values(1113,'shoong1100@naver.com','1100','설날 공지',sysdate,'설날 코로나 조심하시고 즐겁게 보내세요');
insert into pack_notice values(1114,'shoong1100@naver.com','1100','설날 이후 모임 공지',sysdate,'설날 이후 같이 라이딩을 자제 부탁드립니다');

insert into pack_notice values(1200,'shoong1200@naver.com','1200','연초 회식 공지',sysdate,'코로나로 인해 회식을 연기하기로 했습니다');
insert into pack_notice values(1201,'shoong1200@naver.com','1200','코로나 사항 공지',sysdate,'코로나로 인해 5인 이상 집합을 하면 안됩니다 잘 지켜주세요');
insert into pack_notice values(1202,'shoong1200@naver.com','1200','라이딩시 지참할 물건들',sysdate,'헬멧, 무선 이어폰, 여벌 옷, 회비 꼭 지참해주세요');
insert into pack_notice values(1203,'shoong1200@naver.com','1200','팩 활동이 적으신 분들 제명하겠습니다',sysdate,'팩 활동에 참여 부탁드립니다');
insert into pack_notice values(1204,'shoong1200@naver.com','1200','팩 규칙',sysdate,'서로 욕하면서 싸우지 않습니다');
insert into pack_notice values(1205,'shoong1200@naver.com','1200','팩 장 위임 연기 공지',sysdate,'사정으로 인해 팩 장 위임이 연기 되었습니다');
insert into pack_notice values(1206,'shoong1200@naver.com','1200','팩 장 위임 공지',sysdate,'팩 장이 변경 되었습니다');
insert into pack_notice values(1207,'shoong1200@naver.com','1200','팩 로고 변경 공지',sysdate,'팩 로고가 변경 되었습니다');
insert into pack_notice values(1208,'shoong1200@naver.com','1200','팩 스케줄 등록 공지',sysdate,'무분별한 등록은 자제 부탁드립니다');
insert into pack_notice values(1209,'shoong1200@naver.com','1200','단체 톡방 공지',sysdate,'나이 이름 형식에 맞춰주세요');
insert into pack_notice values(1210,'shoong1200@naver.com','1200','팩 이름 변경 공지',sysdate,'여러분과 의논 후 팩 이름이 변경을 변경하였습니다');
insert into pack_notice values(1211,'shoong1200@naver.com','1200','부팩장 선출 공지',sysdate,'부팩장을 2명 뽑으려고 합니다 많은 지원 부탁드립니다');
insert into pack_notice values(1212,'shoong1200@naver.com','1200','부팩장 공지',sysdate,'부팩장 선임이 완료 되었습니다');
insert into pack_notice values(1213,'shoong1200@naver.com','1200','설날 공지',sysdate,'설날 코로나 조심하시고 즐겁게 보내세요');
insert into pack_notice values(1214,'shoong1200@naver.com','1200','설날 이후 모임 공지',sysdate,'설날 이후 같이 라이딩을 자제 부탁드립니다');


