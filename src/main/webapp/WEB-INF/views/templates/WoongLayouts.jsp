<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>슝-shooong.</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--------------------------- new Template link ----------------------------->
<link rel="stylesheet" href="<c:url value="/change/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/slicknav.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/flaticon.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/animate.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/magnific-popup.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/fontawesome-all.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/themify-icons.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/slick.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/nice-select.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/change/slidingText.css"/>">
<!----------------------------------------------------------------------------->

<!----------------------------전 템플릿에서 필요한 link------------------------------>
<link rel="stylesheet" href="<c:url value="/css/ionicons.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/flaticon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/icomoon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/css/open-iconic-bootstrap.min.css"/>">
<!--  
<link rel="stylesheet" href="<c:url value="/css/bootstrap-datepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.timepicker.css"/>">
-->

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
<link rel="stylesheet" href="<c:url value="/css/chat.css?aaqsxdc"/>">

<script src="https://kit.fontawesome.com/4f2219bca6.js" crossorigin="anonymous"></script>

<!----------------------------------------------------------------------------->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script 
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaa4b242f112a823dd2ef5541569589&libraries=services,clusterer"></script>
<style>
#query{
  width: 400px;
  border-radius: 5px;
  height: 40px;
  margin: 20px 15%;
}.responesDiv{
  background-color: #dddddd;
  padding: 2px;
}
</style>
</head>

<body>
	<!-- top 시작 -->
	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
			</div>
		</div>
	</div>
	<!-- Preloader eND -->
	<header>
		<tiles:insertAttribute name="top" />
	</header>
	<!-- top끝 -->

	<!-- body 시작 -->
	<main>
		<div class="slider-area hero-overly">
			<div
				class="single-slider hero-overly  slider-height d-flex align-items-center" style="margin-top: 80px;">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-9">
							<!-- Hero Caption -->
							<div class="hero__caption">
								<!-- h1 style="font-size: 8em">SHOOONG.</h1> -->
								<div class="animated-text">
									<div class="line">SHOOONG.</div>
									<div class="line">SHOOONG.</div>
									<div class="line">SHOOONG.</div>
									<div class="line">SHOOONG.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="popular-location" style="padding-top:200px; padding-bottom:100px;">
			<div class="container">
				<tiles:insertAttribute name="body" />
				<c:if test="${not empty sessionScope.packId }">
				<div class="message">
					<img class="messageImg" src="<c:url value="/images/fa-icons/comment-regular.svg"/>">
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
								<img class="chatRoomExitBtn" src="<c:url value="/images/fa-icons/window-close-regular.svg"/>">
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
							<input type="text" class="chatRoomMessageWrite">
							<div class="chatRoomMessageWriteBtnDiv">
								<button class="chatRoomMessageWriteBtn">전송</button>
							</div>
						</div>
					</div><!-- 채팅방 끝 -->
				    <!-- 챗봇 메시지 창 -->
					<!-- 토탈 heigth:600px이여서 별님이 원하는 크기만큼 설정하시면 될거같아요 -->
					<div class="chatBot">
						<div class="chatRoomTop">
							<div class="chatBotExit">
								<img class="chatBotExitBtn" src="<c:url value="/images/fa-icons/window-close-regular.svg"/>">
							</div>
						</div>
						
						<div class="chatRoomBody chat-container">
				        </div>
						
						<div class="chatRoomFooter">
							<input class="input" type="text"  placeholder="챗봇에게 질문하세요"  id="query"/>
						</div>
						<!-- 나가기 -->
					</div>
				</div>
			</c:if>
			</div>
		</div>
	</main>
	<script>
	
	//챗봇관련시작  
	function getMyRecordChatBot(){
		var messageDiv ="";
		$.ajax({
			url:"<c:url value="/chatbot/record"/>",				
			dataType:'text',
			success:function(data){
				console.log(data)
				chatBotMessage = '<div class="responesDiv">'+data+'</div><br>'+"더 궁금한게 있으신가요?";
			    chatBotMessageDiv = getChatBotMessageDiv(chatBotMessage);
				$('.chat-container').append(chatBotMessageDiv)
				$(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
			},
			error:function(request,error){
				console.log("상태코드:",request.status);
				console.log("에러:",error);
				messageDiv = "사용자 조회 실패 죄송합니다.";
			}		
		})

	}	
	
    function sendMessage(message) {
        $.ajax({
        	url:"http://localhost:5000/message?message="+message,
        	type:'get',
        	success:receiveResponse,
        	error:function(request,status,error){
	        		var chatBotmessageDiv = getChatBotMessageDiv("죄송합니다 연결 실패입니다.")
					$('.chat-container').append(chatBotmessageDiv)
			        $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
				}
        	})
        	    //flask서버로부터 응답을 받으면 receiveResponse콜백함수가 호출됨
		        function receiveResponse(data) {//data는 flask로부터 받은 응답 {'message':'다이얼로그플로우가 보내준값'}
		        	console.log('받은 메시지:',data)	
		        	var chatBotMessage = "";
		        	var chatBotMessageDiv ="";
		        	
		        	
		        	if(data.code=="3"){//자전거 가게_사용자 위치기반
		        		 chatBotMessage = '<div class="responesDiv"><a href="<c:url value='/chatbot/map'/>" class="btn">바로보기</a><br>'+data.msg+'</div><br>'+"더 궁금한게 있으신가요?";
				         chatBotMessageDiv = getChatBotMessageDiv(chatBotMessage)
						 $('.chat-container').append(chatBotMessageDiv)
				         $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
				    }else if(data.code=="2"){//날씨
				    	chatBotMessage = '<div class="responesDiv">'+data.msg+'</div><br>'+"더 궁금한게 있으신가요?";
				        chatBotMessageDiv = getChatBotMessageDiv(chatBotMessage)
						$('.chat-container').append(chatBotMessageDiv)
						$(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
				    }else if(data.code=="4"){//내기록
				    	getMyRecordChatBot();
				    }else if(data.code=="5"){//근처 자전거 보관소
				    	chatBotMessage = '<div class="responesDiv">'+data.msg+'</div><br>'+"더 궁금한게 있으신가요?";
				        chatBotMessageDiv = getChatBotMessageDiv(chatBotMessage)
						$('.chat-container').append(chatBotMessageDiv)
						$(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
				    }else{
				    	chatBotMessage = data.msg;
				        chatBotMessageDiv = getChatBotMessageDiv(chatBotMessage)
						$('.chat-container').append(chatBotMessageDiv)
						$(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
						
					}
             }
         
   }
 
      
	$("#query").on('keypress',function(e) {
	   
		if (e.keyCode == 13){
	        //고객이 입력한 값 
	        var query = $(this).val()
	        if (!query) {//텍스트를 입력하지 않는 경우
	          return
	        }
	        
	    	var date = getDate();
	    	var myMessageDiv = "";
	        	myMessageDiv += '<div class="crbMyMessage" style="margin-bottom:10px;">';
	        	myMessageDiv += '<span style="font-size:12px;margin-right: 5px;">'+date+'</span>';
	        	myMessageDiv += '<div class="crbMyMessageContent">'+query+'</div>';
	        //chat-container에 사용자의 응답 추가
	        $('.chat-container').append(myMessageDiv);
	        // 입력창 클리어
	        $('#query').val('');
	        //스크롤바 아래로
	        $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
	        //메시지 전송
	        sendMessage(query);
	    }
	
	});
	
	function getDate(){
		
		var sampleTimestamp = Date.now();
		var today = new Date(sampleTimestamp);
		 
		var hours = today.getHours();
		var minutes = ("0" + today.getMinutes()).slice(-2);
		var ampm = "오전";
		if(hours >= 12 ){
			hours = hours -12;
			ampm = "오후";
		}
		
		var date = ampm+" "+hours+":"+minutes;
		
		return date;
	}

	function getChatBotMessageDiv(chatBotMessage){
		
		var date = getDate();
		var chatBotMessageDiv = ""
    		chatBotMessageDiv += '<div class="crbOthersMessage" style="margin-bottom:10px;">';
			chatBotMessageDiv += '<div class="crbOthersProfileImg" style="margin-right:10px;">';
			chatBotMessageDiv += '<img class="" src="<c:url value="/change/img/shooongLogo.png"/>"></div>';
			chatBotMessageDiv += '<div class="crbOhtersNameAndContent">';
			chatBotMessageDiv += '<div class="crbOthersProfileName">슝챗봇</div>';
			chatBotMessageDiv  += '<div style="display:flex;">'
			chatBotMessageDiv  += '<div class="crbOthersMessageContent" style="max-width:310px;">'+chatBotMessage+'</div>';
			chatBotMessageDiv  += '<span style="margin-left:10px; font-size:12px; margin-top:12px;">'+date+'</span></div></div></div>';
			

		return chatBotMessageDiv;
	}
	
	$('.msgTopChatBotImg').click(function(){
		console.log('챗봇 오픈');
		$(".chat-container").html("");
		$('.chatBot').css('display','block');
		var chatBotmessageDiv = getChatBotMessageDiv("안녕하세요 챗봇 슝~ 입니다.")
		$('.chat-container').append(chatBotmessageDiv)
        $(".chat-container").scrollTop($(".chat-container")[0].scrollHeight);
	});
	
	$('.chatBotExitBtn').click(function(){
		console.log('챗봇 닫기 클릭');
		$(".chat-container").html("");
		$('.chatBot').css('display','none');
	})
	// 챗봇 관련 끝
	
	
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
			console.log('메시지클릭');
			var chatRoom =$('.chatRoom');
			if(chatRoom.css('display','none')){
				websocketConnect();
				chatRoom.css('display','block');
			}
			else{
				websocket.close();
			}
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
		
		
		
		//챗봇 관련 스크립트
		$('.msgTopChatBotImg').click(function(){
			console.log('챗봇 이미지 클릭');
			$('.chatBot').css('display','block');
		});
		
		$('.chatBotExitBtn').click(function(){
			console.log('챗봇 닫기 클릭');
			$('.chatBot').css('display','none');
		})
		
		
	})
		
	</script>
	<!-- body 끝 -->

	<!-- footer 시작 -->
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
	<!-- footer 끝 -->

	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>
 
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<!-- 
	<script src="<c:url value="/js/jquery-migrate-3.0.1.min.js"/>"></script> 
	-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  
	<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
	<script src="<c:url value="/js/jquery.timepicker.min.js"/>"></script>
	-->
	<!-- 지도 -->
	<script src="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.js"></script>
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.min.js"></script>
	<script
	   src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.js"></script>
	<script 
	   src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.js'></script>
	
	
	<!-- JS here -->
	<!-- All JS Custom Plugins Link Here here -->
	<script src="<c:url value="/change/js/vendor/modernizr-3.5.0.min.js"/>"></script>
	<!-- Jquery, Popper, Bootstrap 
	<script src="<c:url value="/change/js/vendor/jquery-1.12.4.min.js"/>"></script> -->
	<script src="<c:url value="/change/js/popper.min.js"/>"></script>
	
	<!-- 웅기 지운부분  
	<script src="<c:url value="/change/js/bootstrap.min.js"/>"></script>
	-->
	<!-- Jquery Mobile Menu -->
	<script src="<c:url value="/change/js/jquery.slicknav.min.js"/>"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="<c:url value="/change/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/change/js/slick.min.js"/>"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="<c:url value="/change/js/wow.min.js"/>"></script>
	<script src="<c:url value="/change/js/animated.headline.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.magnific-popup.js"/>"></script>

	<!-- Nice-select, sticky -->
	<script src="<c:url value="/change/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.sticky.js"/>"></script>

	<!-- contact js -->
	<script src="<c:url value="/change/js/contact.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.form.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.validate.min.js"/>"></script>
	<script src="<c:url value="/change/js/mail-script.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.ajaxchimp.min.js"/>"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="<c:url value="/change/js/plugins.js"/>"></script>
	<script src="<c:url value="/change/js/main.js"/>"></script>
</body>
</html>