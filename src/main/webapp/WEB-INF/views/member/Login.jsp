<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	window.onload = function(){
		Kakao.init('616834812e97e8f82a462cd2cc2e5e4e');
	};
</script>
<style>
#loginCheck {
	background-color : #f32a48;
	color: white;
	border : none;
}
#loginCheck:hover {
	background-color: #f2f2f7;
}
#guestId {
	background-color : #f32a48;
	color: white;
	border : none;
}
#guestId:hover {
	background-color: #f2f2f7;
}
#join {
	color: #f32a48;
	background-color: #f2f2f7;
	text-decoration: underline;
}
#join:hover {
	color: white;
	
}
#idpwdCheck {
	color: #f32a48;
	background-color: #f2f2f7;
	text-decoration: underline;
}
#idpwdCheck:hover {
	color: white;
}
.animated-text{
	display:none;
}
.slider-area{
	display:none;
}
#bg {
  position: fixed; 
  top: 0; 
  left: 0; 
  opacity: 0.5;
  /* Preserve aspet ratio */
  min-width: 100%;
  min-height: 100%;
}
.form-horizontal{
	padding-top: 30px;
	background-color: #f2f2f7;
	background-color: rgba( 255, 255, 255, 0.5 );
	border-radius: 30px;
}
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->
	<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2"
		style="padding-bottom: 30px">
		<form class="form-horizontal" method="post" name="join"
			action="<c:url value='/Member/Login.do'/>">
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2"
					style="padding-bottom: 30px; text-align: center">
					<h3 style="font-weight: bold">로그인</h3>
				</div>
			</div>
			<div class="form-group">
				<div class=" col-xs-10 offset-xs-1 col-md-6 offset-md-3"
					style="padding-bottom: 5px;">
					<input type="text" class="form-control" name="userId" id="userId"
						style="font-size: .8em;" placeholder="이메일">
				</div>
				<div class=" col-xs-10 offset-xs-1 col-md-6 offset-md-3"
					style="padding-bottom: 10px;">
					<input type="password" class="form-control" name="userPWD"
						style="font-size: .8em;" id="userPWD" placeholder="비밀번호">
				</div>
				<h1></h1>
				<h1></h1>
				<div class="col-xs-10 offset-xs-1 col-md-6 offset-md-3"
					style="padding-bottom: 10px;">
					<button type="submit" id="loginCheck" style="font-size: 1em"
						class="btn btn-primary btn-lg btn-block">로그인</button>
				</div>
				<div class="col-xs-10 offset-xs-1 col-md-6 offset-md-3 text-center"
					style="padding-bottom: 10px;">
					<a href=<c:url value='/Member/GuestLogin.do'/>
						class="btn btn-block" id="guestId" name="guestId"
						style="font-size: 1em; margine-bottom: 20px;">비회원 로그인</a>
				</div>
				<div class="col-xs-10 offset-xs-1 col-md-6 offset-md-3 text-center"
					style="padding-bottom: 5px;">
					<a href="<c:url value="/Member/Join.do"/>" class="btn" id="join"
						name="join">회원이 아닌가요?</a> <a
						href="<c:url value="/Member/IDCheck.do"/>" class="btn"
						id="idpwdCheck" name="idpwdCheck">ID찾기</a> <a
						href="<c:url value="/Member/PWDCheck1.do"/>" class="btn"
						id="idpwdCheck" name="idpwdCheck">PW찾기</a>
					<hr class="line" style="width: 100%;" />
				</div>
				<div style="text-align: center; padding-bottom: 50px">
					<a
						href="https://kauth.kakao.com/oauth/authorize?response_type=code
						&client_id=616834812e97e8f82a462cd2cc2e5e4e
						&redirect_uri=http://localhost:8080/shoong/kakao/login"
						style="margin-top: 20px"><img
						src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
						width="200" /></a>
					<!-- 
						<a href="logout" style="margin-top: 20px">로그아웃
 					-->
					<p id="token-result"></p>
				</div>
			</div>
		</form>
	</div>
<!-- 카카오 회원가입 -->
<script type="text/javascript">
	//게스트 로그인
$(function() {
	$('#guestId').click(function(){
		 $.ajax({
			 url : "<c:url value='/Member/GuestLogin.do'/>",
			 type : 'post',
			 dataType : 'json',
			 data : {
				 "guestId" : $('#guestId').val()
			 },
			 success : function(data){
				 $('#guestId').html(data.guestLogin);
			 }
		 });
	});
	
	//카카오 api
  function loginWithKakao() {
    Kakao.Auth.authorize({
    	redirectUri: 'http://localhost:8080/shoong/kakao/login'
	});
  }
  displayToken()
  function displayToken() {
    const token = getCookie('authorize-access-token')
    if(token) {
      Kakao.Auth.setAccessToken(token)
      Kakao.Auth.getStatusInfo(({ status }) => {
        if(status === 'connected') {
          document.getElementById('token-result').innerText = 'login success. token: ' + bS5LqtwQR07ScH1h3DiwpVx8vhsSmZJ8
        } else {
          Kakao.Auth.setAccessToken(null)
        }
      })
    }
  }
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
  
  //로그인 (아이디/비밀번호) 입력 관련
  $('#loginCheck').click(function() {
	  	if($('#userId').val().length==0 && $('#userPWD').val().length==0){
	  		alert('아이디와 비밀번호를 입력하세요.');
	  		location.reload();
	  	}
 });
});
</script>
