<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	window.onload = function(){
		Kakao.init('616834812e97e8f82a462cd2cc2e5e4e');
	};
</script>

<!-- ※colorlib-main으로 일단 감싸고 안에다가 작업해야 왼쪽 탑에 안먹히고 작업할 수 있어요 -->
<!-- 설명이 이해가 잘 안되시면  따로 연락주세요...-->

<div id="colorlib-main" style="padding-top: 100px">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->

	<div class="container">
		<div class="col-xs-12 col-md-12">
			<div class="page-header" style="text-align: center">
				<a href="<c:url value="/"/>"><img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>" style="width:100px"></a>
			</div>
		</div>
	</div>
	<!-- 실제 내용 시작 -->
	<form class="form-horizontal" method="post"
		action="<c:url value='/Member/Login.do'/>">
		<div class="form-group">
			<div class=" col-xs-12 col-md-12">
			<h1></h1>
			</div>
			<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<input type="text" class="form-control" name="userId" id="userId"
					placeholder="이메일">
			</div>
			<h1></h1>
			<h1></h1>
			<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<input type="password" class="form-control" name="userPWD"
					id="userPWD" placeholder="비밀번호">
			</div>
			<h1></h1>
			<h1></h1>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<button type="submit" id="loginCheck" class="btn btn-primary btn-lg btn-block">로그인</button>
			</div>
			<div class="form-group text-center">
				<a href=<c:url value='/Member/GuestLogin.do'/> 
					class="btn btn-block" id="guestId" name="guestId">비회원 로그인</a>
				<a href="<c:url value="/Member/Join.do"/>"
						class="btn" id="join" name="join"><span style="color:grey;">회원이 아닌가요?</span></a>
						<span style="color:grey;">/</span>
				<a href="<c:url value="/Member/IDCheck.do"/>"
					class="btn" id="idpwdCheck" name="idpwdCheck"><span style="color:grey">ID찾기</span></a>
				<a href="<c:url value="/Member/PWDCheck1.do"/>"
					class="btn" id="idpwdCheck" name="idpwdCheck"><span style="color:grey">PW찾기</span></a>
			</div>
			<h1></h1>
			<hr class="line"/>
			<h1></h1>
			<div class="form-group " style="text-align: center">
				<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
					src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
					width="200" />
				</a>
				<p id="token-result"></p>
			</div>
		</div>
	</form>
</div>
<!-- END COLORLIB-PAGE -->
<!-- 카카오 회원가입 -->
<script type="text/javascript">
	//게스트 로그인
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
	    	redirectUri: 'http://localhost:8080/shoong/Member/Login.do'
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
</script>
