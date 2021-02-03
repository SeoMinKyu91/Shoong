<%@ page language="java" 
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>슝-shooong.</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">

<link rel="stylesheet" href="<c:url value="/css/open-iconic-bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">

<link rel="stylesheet" href="<c:url value="/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/owl.theme.default.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/magnific-popup.css"/>">

<link rel="stylesheet" href="<c:url value="/css/aos.css"/>">

<link rel="stylesheet" href="<c:url value="/css/ionicons.min.css"/>">

<link rel="stylesheet" href="<c:url value="/css/bootstrap-datepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.timepicker.css"/>">

<link rel="stylesheet" href="<c:url value="/css/flaticon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/icomoon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/style.css"/>">

<!-- 달력 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.5.0/main.min.css,npm/fullcalendar@5.5.0/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css">

<!-- 모달 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- 제이쿼리 UI용 CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

<!-- mapbox core-->
<link href="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.css" rel="stylesheet" />
<!-- mapbox geocoder -->
<link
   rel="stylesheet"
   href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.css"
   type="text/css" />
<!-- mapbox directions -->
<link rel="stylesheet"
   href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.css"
   type="text/css" />
<!-- mapbox draw -->
<link 
   rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.css' type='text/css' />

<!-- mapbox core-->
<link href="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.css" rel="stylesheet" />

<!-- 채팅  -->
<link rel="stylesheet" href="<c:url value="/css/chat.css?dddzc"/>">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/4f2219bca6.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>

<div id="colorlib-page">   
   <!-- top 시작 -->
   <tiles:insertAttribute name="top"/>
   <!-- top끝 -->
   
   <!-- body 시작 -->
   <tiles:insertAttribute name="body"/>
   <!-- 채팅창 관련 UI -->
   <c:if test="${not empty sessionScope.packId }">
      <div class="message">
         <img class="messageImg"
            src="<c:url value="/images/fa-icons/comment-regular.svg"/>">
         <div class="msgTab">
            <div class="msgTop">
               <div class="msgTopUser">
                  <img class="msgTopUserImg"
                     src="<c:url value="/images/fa-icons/user-solid.svg"/>">
               </div>
               <div class="msgTopChat">
                  <img class="msgTopChatImg"
                     src="<c:url value="/images/fa-icons/comment-regular.svg"/>">
               </div>
            </div>
            <div class="msgBody">
               <div class="messageExit">
                  <img class="messageExitBtn" src="<c:url value="/images/fa-icons/window-close-regular.svg"/>">
               </div>
      
               <div class="msgBodyPackUserListForm">
                  <!-- 자신의 정보 -->
                  <div class="msgBodyMyProfile">
                     <!--  
                     <img class="" src="<c:url value="/images/person_1.jpg"/>">
                     <div class="msgBodyMyProfileName">홍길동</div>
                     -->
                  </div>
                  <!-- 팩 구성원들 리스트 뿌려주는 div -->
                  <div class="msgBodyPackUserList">
                     <!--  
                     <div class="msgBodyPackUser">
                        <img class="" src="<c:url value="/images/person_1.jpg"/>">
                        <div class="msgBodyPackUserName">가길동</div>
                     </div>
                     -->
                  </div>
               </div>
               <div class="msgBodyChatForm">
                  <!--  
                  <div class="chatList">
                     <img class="" src="<c:url value="/images/person_1.jpg"/>">
                     <div class="chatListInfo">
                        <div class="chatListPackUserNames">홍길동,가길동,나길동</div>
                        <div class="chatListChatContent">잘되용!!</div>
                     </div>
                     <input type="hidden" value="">
                  </div>
                  -->
               </div>
            </div>
      
         </div>
         <!-- 채팅방 -->
         <div class="chatRoom">
             
            <div class="chatRoomTop">
               <!-- 
               <div class="chatRoomTopImgs">
                  <img class="" src="<c:url value="/images/person_1.jpg"/>">
               </div>
               <div class="chatRoomTopName">세계일주</div>
               -->
               <div class="chatRoomExit">
                  <img class="chatRoomExitBtn"
                     src="<c:url value="/images/fa-icons/window-close-regular.svg"/>">
               </div>
            </div>
            
            <div class="chatRoomBody">
               <!--  
               <div class="crbOthersMessage" style="margin-bottom: 10px;">
                  <div class="crbOthersProfileImg">
                     <img class="" src="<c:url value="/images/person_1.jpg"/>">
                  </div>
                  <div class="crbOthersNameAndContent" style="">
                     <div class="crbOthersProfileName">가길동</div>
                     <div style="display: flex;">
                        <div class="crbOthersMessageContent" style="max-width: 310px;">가나다라aaaaaaaaaaa마바</div>
                        <span style="margin-left:10px; font-size: 12px; margin-top: 12px;">오전 11:21</span>
                     </div>
                  </div>
                  
      
               </div>
               <div class="crbMyMessage" style="margin-bottom:10px;">
                  <span style="font-size:12px;margin-right: 5px;">오후12:12</span>
                  <div class="crbMyMessageContent" style="max-width: 310px;">잘됩니깝?</div>
               </div>
               -->
               
            </div>
            <div class="chatRoomFooter">
               <!--  
               <div class="chatRoomMessageWrite" contenteditable="true"></div>
               -->
               <input type="text" class="chatRoomMessageWrite" style="height: 98%;font-size:16px; max-width: 428px; overflow: auto;">
               <div class="chatRoomMessageWriteBtnDiv">
                  <button class="chatRoomMessageWriteBtn">전송</button>
               </div>
            </div>
         </div>
      </div>
   </c:if>
   
   

   <script>
   
   $(function(){
      var websocket;
      var nickname;
      //채팅방 css
      var msgBodyDiv = $('.msgBody');
      var msgTab = $('.msgTab');
      var packMemberListFormDiv = $('.msgBodyPackUserListForm');
      var chatListFormDiv = $('.msgBodyChatForm');
      var chatMessageListDiv = $('.msgBodyChatForm');//채팅방 목록 div
      var chatMyProfileDiv = $('.msgBodyMyProfile');//채팅방 목록 내정보 div
      var chatMemberListDiv = $('.msgBodyPackUserList');//팩 맴버 목록 div
      var chatMessageBodyDiv = $('.chatRoombody');//채팅방 메시지 뿌리는 div
      
      var chatRoom = $('.chatRoom');
      var count =0;
      var chatRoomTitleCount = 0;
      
      //메시지 관련 기능들
      //메시지 btn 클릭시
      $('.messageImg').click(function(){
         console.log('메시지 버튼 클릭');
         var userId = '${sessionScope.userId}';
         
         /*
            1. 팩구성원 정보(프로필사진,이름,총원,hidden타입으로 user_id)
            2. 내 정보(프로필 사진, 이름, user_id)
            3. 채팅방(채팅방 no(hidden), 채팅방 참가자 이름, 가장 최근 글 1개 )
         */
         var userId = '${sessionScope.userId}';
         var packId = '';
         if(${sessionScope.packId} != null){
            packId = '${sessionScope.packId}'   
         }
         console.log(msgTab.css('display'));
         
         //메시지창 닫혀있을때
         if(msgTab.css('display') == 'none'){
            console.log('메시지 버튼 Div안보였음');
            
            $.ajax({
               url:"<c:url value="/chat/listAll.do"/>",
               dataType: 'json',
               data: {'userId':userId,'packId':packId},
               type:'post',
               success:function(data){
                  console.log('메시지 버튼 클릭');
                  console.log(count);
                  //console.log(data);
                  if(count == 0){
                     chatMemberList(data[0]);
                     chatRoomList(data[1]);
                  }
                  
               },
               error:function(error){
                  console.log('에러:'+error.responseText);
               }
               
            });
            
            msgTab.css('display','flex');
         }
         //메시지창 열려있을때 
         else{
            console.log('메시지 버튼 Div 보였음');
            msgTab.css('display','none');
            deleteMemberList();
            deleteChatRoomList();
         }
      })
      
      //메시지 아이콘 클릭시 css속성 바꾸기
      $('.msgTopChatImg').click(function(){
         $('.msgBodyPackUserListForm').css('display','none');
         $('.msgBodyChatForm').css('display','block');
         $('.msgTopUserImg').prop('src','<c:url value="/images/fa-icons/user-regular.svg"/>');
         $('.msgTopChatImg').prop('src','<c:url value="/images/fa-icons/comment-solid.svg"/>');
      })
      
      //유저 아이콘 클릭시 css속성 바꾸기
      $('.msgTopUserImg').click(function(){
         $('.msgBodyPackUserListForm').css('display','block');
         $('.msgBodyChatForm').css('display','none');
         $('.msgTopUserImg').prop('src','<c:url value="/images/fa-icons/user-solid.svg"/>');
         $('.msgTopChatImg').prop('src','<c:url value="/images/fa-icons/comment-regular.svg"/>');
      })
      
      //채팅 클릭시 채팅방 열어주기
      $('.chatList').click(function(){
         console.log('채팅방 열어주기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
         $('.chatRoom').css('display','block');
      })
      
      //채팅방 닫기 클릭
      $('.chatRoomExitBtn').click(function(){
         $('.chatRoomTopImgs').remove();
         $('.chatRoomTopName').remove();
         $('.chatRoomBody div').remove();
         chatRoomTitleCount = 0;
         $('.chatRoom').css('display','none');
         websocket.close();
         /*
         <div class="chatRoomTopImgs">
            <img class="" src="<c:url value="/images/person_1.jpg"/>">
         </div>
         <div class="chatRoomTopName">세계일주</div>
         */
      })
      
      //메시지 닫기 클릭
      $('.messageExitBtn').click(function(){
         console.log('메시지 나가기 클릭 버튼 클릭');
         $('.msgTab').css('display','none');
      })
      
      //ajax요청후 데이터 처리
      //채팅방에 팩 맴버 목록 뿌려주기
      function chatMemberList(packMemberList){
         console.log('맴버 목록 정제')
         $.each(packMemberList,function(index,el){
            console.log(index+'번:'+el.NAME+"아이디:"+el.USER_ID);
            appendChatMemberList(el.NAME,el.USER_ID);
         })
      }
      
      function chatRoomList(chatList){
         console.log('채팅 목록 정제');
         $.each(chatList,function(index,el){
            appendChatRoomList(el.CHAT_ROOM_NO,el.CHAT_ROOM_TITLE,el.chatMessageContent,el.chatRoomJoinMember);
         });
      }
      
      function chatMessageSelectOne(messageInfos){
         console.log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
         //console.log(messageInfos)
         $.each(messageInfos,function(index,el){
            appendChatMessage(el.CHAT_MESSAGE_NO,el.CHAT_MESSAGE_CONTENT,el.CHAT_MESSAGE_DATE,el.CHAT_ROOM_NO,el.USER_ID,el.NAME);
         });
         /*
         CHAT_MESSAGE_CONTENT: "마"
            CHAT_MESSAGE_DATE: "오전 8:16"
            CHAT_MESSAGE_NO: 2004
            CHAT_ROOM_NO: 2000
            NAME: "장동건"
            USER_ID: "shoong1000@naver.com"
            */
      }
      
      //css append 함수
      function appendChatMemberList(name,userId){
         console.log('정제된 맴버 append하기')
         console.log(name)
         var str = '';
         
         if(userId == '${sessionScope.userId}'){
            str += '<img class="" src="<c:url value="/images/person_1.jpg"/>">'
            str += '<div class="msgBodyMyProfileName">'+name+'</div>'
            str += '<input type="hidden" value="'+userId+'">'
            chatMyProfileDiv.prepend(str);
            
            
         }
         else{
            str += '<div class="msgBodyPackUser" id="cu'+userId+'">';
            str += '<img class="" src="<c:url value="/images/person_1.jpg"/>">';
            str += '<div class="msgBodyPackUserName">'+name+'</div></div>';
            str += '<input type="hidden" value="'+userId+'">'
            chatMemberListDiv.append(str);
         }
         count = 1;
      }
      
      function appendChatRoomList(chatRoomNo,chatRoomTitle,chatMessageContent,chatRoomJoinMembers){
         console.log('채팅방 목록 append들어옴');
         console.log("정제한 채팅방 번호:"+chatRoomNo);
         var str = '';
         var membersName = [];
         console.log('룸 맴버들:'+chatRoomJoinMembers);
         $.each(chatRoomJoinMembers,function(index,el){
            membersName.push(el.NAME);
         })
         str += "<div class = 'chatList'>";
         str += "<img class='' src='<c:url value='/images/person_1.jpg'/>'>";
         str += "<div class='chatListInfo'>";
         str += "<div class='chatListPackuserNames' style='font-weight:bold;margin-bottom:5px;'>"+membersName+"</div>";
         str += "<div class='chatListChatContent'>"+chatMessageContent+"</div>";
         str += '<input type="hidden" class="hiddenChatRoomNo" id="" value="'+chatRoomNo+'"/>';
         str += '<input type="hidden" class ="hiddenChatRoomTitle" value="'+chatRoomTitle+'"/></div></div>';
         
         
         
         chatListFormDiv.append(str);
         
         $('.chatList').click(function(){
            var clickChatRoomNo = $(this).children().find('input.hiddenChatRoomNo').val();
            var clickChatRoomTitle = $(this).children().find('input.hiddenChatRoomTitle').val();
            console.log('채팅창 클릭');
            console.log('방번호:'+chatRoomNo);
            console.log('방 이름'+chatRoomTitle);
            
            $.ajax({
               url:"<c:url value="/chat/message/selectOne.do"/>",
               dataType: 'json',
               data: "chatRoomNo="+clickChatRoomNo,
               type:'post',
               success:function(data){
                  console.log('채팅창 목록 클릭: ajax갔다옴');
                  console.log(data);
                  if(chatRoomTitleCount == 0){
                     appendChatRoomTitle(clickChatRoomTitle,clickChatRoomNo);
                     chatMessageSelectOne(data[0]);   
                  }
                  
               },
               error:function(error){
                  console.log('에러:'+error.responseText);
               }
               
            });
            console.log('웹소켓작업 시작하는 곳');
            websocketConnect();

            
            $('.chatRoom').css('display','block');   
         })
         
      };
      
      function appendChatMessage(chatMessageNo,chatMessageContent,chatMessageDate,chatRoomNo,userId,name){
         console.log('채팅 글 append 하는 곳 들어옴');
         console.log(name)
         var chatroomMessages = $('.chatRoomBody');
         
         
         if(userId == '${sessionScope.userId}'){
            console.log('채팅글이 내글 append하는 곳');
            var str = '';
            str += '<div class="crbMyMessage" style="margin-bottom:10px;">';
            str += '<span style="font-size:12px;margin-right: 5px;">'+chatMessageDate+'</span>';
            str += '<div class="crbMyMessageContent">'+chatMessageContent+'</div></div>';
            chatroomMessages.append(str);
            
         }
         else{
            var str = '';
            str += '<div class="crbOthersMessage" style="margin-bottom:10px;">';
            str += '<div class="crbOthersProfileImg" style="margin-right:10px;">';
            str += '<img class="" src="<c:url value="/images/person_2.jpg"/>"></div>';
            str += '<div class="crbOhtersNameAndContent">';
            str += '<div class="crbOthersProfileName">'+name+'</div>';
            str += '<div style="display:flex;">'
            str += '<div class="crbOthersMessageContent" style="max-width:310px;">'+chatMessageContent+'</div>';
            str += '<span style="margin-left:10px; font-size:12px; margin-top:12px;">'+chatMessageDate+'</span></div></div></div>';
            
            chatroomMessages.append(str);
         }
         /*
         <div class="crbOthersMessage" style="margin-bottom: 10px;">
            <div class="crbOthersProfileImg">
               <img class="" src="<c:url value="/images/person_1.jpg"/>">
            </div>
            <div class="crbOthersNameAndContent">
               <div class="crbOthersProfileName">가길동</div>
               <div style="display: flex;">
                  <div class="crbOthersMessageContent" style="max-width: 310px;">가나다라aaaaaaaaaaa마바</div>
                  <span style="margin-left:10px; font-size: 12px; margin-top: 12px;">오전 11:21</span>
               </div>
            </div>
            

         </div>
         <div class="crbMyMessage" style="margin-bottom:10px;">
            <span style="font-size:12px;margin-right: 5px;">오후12:12</span>
            <div class="crbMyMessageContent" style="max-width: 310px;">잘됩니깝?</div>
         </div>
         */
         $(".chatRoomBody").scrollTop($(".chatRoomBody")[0].scrollHeight);
      }
      
      function appendChatRoomTitle(chatRoomTitle,clickChatRoomNo){
         console.log('채팅방 title append들어옴');
         console.log(chatRoomTitle);
         var chatRoomTop = $('.chatRoomTop');
         var str ="";
         
         str += "<div class='chatRoomTopImgs'>";
         str += "<img class='' src='<c:url value='/images/person_2.jpg'/>'></div>";
         str += "<div class='chatRoomTopName'>"+chatRoomTitle+"</div>"
         str += "<input type='hidden' class='chatRoomTopNo' value='"+clickChatRoomNo+"'>";
         
         chatRoomTop.prepend(str);
         chatRoomTitleCount = 1;
         /*
         <div class="chatRoomTop">
            <div class="chatRoomTopImgs">
               <img class="" src="<c:url value="/images/person_1.jpg"/>">
            </div>
            <div class="chatRoomTopName">세계일주</div>
            <div class="chatRoomExit">
               <img class="chatRoomExitBtn"
                  src="<c:url value="/images/fa-icons/window-close-regular.svg"/>">
            </div>
         </div>
         */
         
      }
      
      
      //팩 맴버들 삭제
      function deleteMemberList(){
         
      };
      //채팅목록 삭제
      function deleteChatRoomList(){
         
      };
      
      //채팅방 전송버튼 클릭
      $('.chatRoomMessageWriteBtn').click(function(){
         var chatContent = $('.chatRoomMessageWrite').val();
         
         console.log("채팅방 전송 버튼 클릭")
         if(chatContent != ''){
            ajaxChatMessageInsert();
         }
         
         sendMessage();
      })
      
      
      //웹소켓 작업
      function websocketConnect(){
         websocket = new WebSocket("ws://localhost:8080<c:url value='/chat-ws.do'/>");
         websocket.onclose = wsClose();
         websocket.addEventListener('message',receiveMessage);
         websocket.onclose = wsClose();
         websocket.onerror = wsError();
      }
      
      function wsClose(){
         console.log('웹소켓 연결 끊어짐 !');
      }
      
      function wsError(){
         console.log('웹소켓 에러');
      }
      
      var open = function(){
         //서버로 연결한 사람의 정보(닉네임) 전송
         //msg:kim가(이) 입장했어요
         //사용자가 입력한 닉네임 저장
         nickname = $('.msgBodyMyProfileName').html();
         wsocket.send('msg:'+nickname+"가(이) 입장했어요");
         appendMessage('연결되었어요');
      }
      
      var receiveMessage = function(e){//e는 message이벤트 객체
         //서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
         console.log('서버로부터 데이터 받을때 호출되는 콜백함수');
         var json = JSON.parse(e.data);
         console.log(json);
         var nickname = json.nickname;
         var msg = json.message;
         var date = json.messageTime;
         
         appendWebOthersMessage(nickname,msg,date);
         
      };
      
      $('.chatRoomMessageWrite').on('keypress',function(e){
         console.log('e.keycode:$s,e.which:%s',e.keyCode,e.which);
         var keyValue = e.keyCode? e.keyCode : e.which;
         var chatContent = $('.chatRoomMessageWrite').val();
         if(keyValue==13){
            if(chatContent !=''){
               ajaxChatMessageInsert();
               sendMessage();
            }   
         }
         
         
         
         
      })
      
      function sendMessage(){
         console.log('sendMessage함수');
         console.log($('.chatRoomMessageWrite').val());
         if($('.chatRoomMessageWrite').val().trim()!=""){
            var Time = moment();
            var nowTime = Time.format('a hh:mm')
            var replaceNowTime = '';
            if(nowTime.substring(0,2) == 'am'){
               replaceNowTime = nowTime.replace('am','오전');
            }
            else{
               replaceNowTime = nowTime.replace('pm','오후');
            }
            
            var userData = new Object();
            userData.nickname = $('.msgBodyMyProfileName').html();
            userData.message = $('.chatRoomMessageWrite').val();
            userData.messageTime = replaceNowTime;
            var json = JSON.stringify(userData);
            nickname = $('.msgBodyMyProfileName').html();
            console.log('sendMessage들어옴');
            
            console.log(replaceNowTime);
            websocket.send(json);
            appendWebMyMessage($('.chatRoomMessageWrite').val(),replaceNowTime);
            $('.chatRoomMessageWrite').val("");
            $('.chatRoomMessageWrite').focus();   
         }
         else{
            $('.chatRoomMessageWrite').val("");      
            $('.chatRoomMessageWrite').focus();
         }
         
         
      }
      
      function appendWebMyMessage(msg,date){
         var str ="";
         str += '<div class="crbMyMessage" style="margin-bottom:10px;">';
         str += '<span style="font-size:12px;margin-right: 5px;">'+date+'</span>';
         str += '<div class="crbMyMessageContent">'+msg+'</div></div>';
         $('.chatRoomBody').append(str);
         $(".chatRoomBody").scrollTop($(".chatRoomBody")[0].scrollHeight);
      };
      
      function appendWebOthersMessage(nickname,msg,date){
         var str = '';
         str += '<div class="crbOthersMessage" style="margin-bottom:10px;">';
         str += '<div class="crbOthersProfileImg" style="margin-right:10px;">';
         str += '<img class="" src="<c:url value="/images/person_2.jpg"/>"></div>';
         str += '<div class="crbOhtersNameAndContent">';
         str += '<div class="crbOthersProfileName">'+nickname+'</div>';
         str += '<div style="display:flex;">'
         str += '<div class="crbOthersMessageContent" style="max-width:310px;">'+msg+'</div>';
         str += '<span style="margin-left:10px; font-size:12px; margin-top:12px;">'+date+'</span></div></div></div>';
         $('.chatRoomBody').append(str);
         $(".chatRoomBody").scrollTop($(".chatRoomBody")[0].scrollHeight);
      }
      
      function ajaxChatMessageInsert(chatRoomNo,userId,chatContent){
         var chatRoomNo = $('.chatRoomTopNo').val();
         var userId ='${sessionScope.userId}';
         var chatContent = $('.chatRoomMessageWrite').val();
         $.ajax({
            url:'<c:url value="/chat/message/insert.do"/>',
            data:{'chatRoomNo':chatRoomNo,'userId':userId,"chatMessageContent":chatContent},
            dataType:'text',
            type:'post',
            success:function(data){
               console.log('chatInsert 성공')
            },
            error: function(error){
               console.log("에러:"+error.responseText);
            }
            
         })
      }
      
   })
      
   </script>
   
   
   <!-- body 끝 -->
   
   <!-- footer 시작 -->
   <tiles:insertAttribute name="footer"/>
   <!-- footer 끝 -->
   
</div><!-- END COLORLIB-PAGE -->
<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
   <svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
         stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none"
         stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>






<script src="<c:url value="/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/js/jquery.waypoints.min.js"/>"></script>
<script src="<c:url value="/js/jquery.stellar.min.js"/>"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/js/aos.js"/>"></script>
<script src="<c:url value="/js/jquery.animateNumber.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.timepicker.min.js"/>"></script>
<script src="<c:url value="/js/scrollax.min.js"/>"></script>
<!-- 달력 
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/locales-all.min.js"></script>
-->
<!-- 지도 -->
<script src="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.js"></script>
<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.min.js"></script>
<script
   src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.js"></script>
<script 
   src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.js'></script>
<script 
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaa4b242f112a823dd2ef5541569589&libraries=services,clusterer"></script>

<script src="<c:url value="/js/main.js"/>"></script>


</body>
</html>