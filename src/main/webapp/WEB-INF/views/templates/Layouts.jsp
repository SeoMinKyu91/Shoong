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
<link rel="stylesheet" href="<c:url value="/css/chat.css?asdff"/>">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/4f2219bca6.js" crossorigin="anonymous"></script>
</head>
<body>

<div id="colorlib-page">	
	<!-- top 시작 -->
	<tiles:insertAttribute name="top"/>
	<!-- top끝 -->
	
	<!-- body 시작 -->
	<tiles:insertAttribute name="body"/>
	<!-- 채팅창 관련 UI -->
	<c:if test="${not empty sessionScope.userId }">
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
							<img class="" src="<c:url value="/images/person_1.jpg"/>">
							<div class="msgBodyMyProflieName">홍길동</div>
						</div>
						<!-- 팩 구성원들 리스트 뿌려주는 div -->
						<div class="msgBodyPackUserList">
							<div class="msgBodyPackUser">
								<img class="" src="<c:url value="/images/person_1.jpg"/>">
								<div class="msgBodyPacUserName">가길동</div>
							</div>
						</div>
					</div>
					<div class="msgBodyChatForm">
						<div class="chatList">
							<img class="" src="<c:url value="/images/person_1.jpg"/>">
							<div class="chatListInfo">
								<div class="chatListPackUserNames">홍길동,가길동,나길동</div>
								<div class="chatListChatContent">잘되용!!</div>
							</div>
						</div>
					</div>
				</div>
		
			</div>
			<!-- 채팅방 -->
			<div class="chatRoom">
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
				<div class="chatRoomBody">
					<div class="crbOthersMessage">
						<div class="crbOthersProfileImg">
							<img class="" src="<c:url value="/images/person_1.jpg"/>">
						</div>
						<div class="crbOthersNameAndContent">
							<div class="crbOthersProfileName">가길동</div>
							<div class="crbOthersMessageContent">가나다라마바사</div>
						</div>
		
					</div>
					<div class="crbMyMessage">
						<div class="crbMyMessageContent">잘됩니깝?</div>
					</div>
				</div>
				<div class="chatRoomFooter">
					<div class="chatRoomMessageWrite" contenteditable="true"></div>
					<div class="chatRoomMessageWriteBtnDiv">
						<button class="chatRoomMessageWriteBtn">전송</button>
					</div>
				</div>
			</div>
		
		</div>
	</c:if>
	
	
	
	<script>
	$(function(){
		//메시지 관련 기능들
		//메시지 btn 클릭시
		$('.messageImg').click(function(){
			console.log('메시지 버튼 클릭');
			var userId = ${sessionScope.userId};
			
			/*
				1. 팩구성원 정보(프로필사진,이름,총원,hidden타입으로 user_id)
				2. 내 정보(프로필 사진, 이름, user_id)
				3. 채팅방(채팅방 id(hidden), 채팅방 참가자 이름, 가장 최근 글 1개 )
			*/
			$.ajax({
				url:"<c:url value="/pack/chat/listAll.do"/>",
				dataType: 'json',
				data: "userId="+userId,
				type:'post',
				success:function(data){
					console.log('메시지 버튼 클릭');
					console.log(data);
				},
				error:function(error){
					console.log('에러:'+error.responseText);
				}
				
			});
			
			
			
			var messageDiv = $('.msgTab');
			console.log(messageDiv.css('display'));
			if(messageDiv.css('display') == 'none'){
				console.log('메시지 버튼 Div안보였음');
				messageDiv.css('display','flex');
			}
			else{
				console.log('메시지 버튼 Div 보였음');
				messageDiv.css('display','none');
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
			$('.chatRoom').css('display','block');
		})
		
		//채팅방 닫기 클릭
		$('.chatRoomExitBtn').click(function(){
			$('.chatRoom').css('display','none');
		})
		
		//메시지 닫기 클릭
		$('.messageExitBtn').click(function(){
			console.log('메시지 나가기 클릭 버튼 클릭');
			$('.msgTab').css('display','none');
		})
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