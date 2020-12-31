<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- ※colorlib-main으로 일단 감싸고 안에다가 작업해야 왼쪽 탑에 안먹히고 작업할 수 있어요 -->
<!-- 설명이 이해가 잘 안되시면  따로 연락주세요...-->
<div id="colorlib-main" style="padding-top: 100px">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->

	<div class="container">
		<div class="col-xs-12 col-md-12">
			<div class="page-header" style="text-align: center">
				<img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>" style="width:100px">
			</div>
		</div>
	</div>
	<!-- 실제 내용 시작 -->
	<form class="form-horizontal" method="post"
		action="<c:url value='/Member/Login.do'/>">
		<div class="form-group">
			<h1></h1>
			<div class=" col-xs-12 col-md-12">
			<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<input type="hidden" class="form-control" name="userId" id="userId"
					value="" placeholder="이메일">
			</div>
			<h1></h1>
			<h1></h1>
			</div>
			<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<input type="password" class="form-control" name="userPWD"
					id="userPWD" placeholder="비밀번호">
			</div>
			<h1></h1>
			<h1></h1>
			<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<input type="password" class="form-control" name="userPWDOk"
					id="userPWDOK" placeholder="비밀번호 확인">
			</div>
			<h1></h1>
			<h1></h1>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<button type="submit" id="loginCheck" class="btn btn-primary btn-lg btn-block">비밀번호 수정</button>
			</div>
			<h1></h1>
			<hr class="line"/>
			<h1></h1>
		</div>
	</form>
</div>
<!-- END COLORLIB-PAGE -->
<!-- 카카오 회원가입 -->
<script type="text/javascript">
	 //로그인 (아이디/비밀번호) 입력 관련
	 $('#loginCheck').click(function() {
	  	if($('#userId').val().length==0 && $('#userPWD').val().length==0){
	  		alert('아이디와 비밀번호를 입력하세요.');
	  		location.reload();
	  	}
	 });
	 //
	 $('#userPWDOk').keyup(function() {
			console.log("userPWDOk:", $('#userPWDOk').val());
			$.ajax({
				url : "<c:url value='/Member/PWDCheck.do'/>",
				type : 'post',
				dataType : 'json',
				data : {
					"userPWDOk" : $('#userPWDOk').val(),
					"userPWD" : $('#userPWD').val()
				},
				success : function(data) {
					console.log('서버로부터 받는 데이타 : ', data);
					$('#passwordCheck').html(data.passwordCheck);
				}
			});
		});
</script>
