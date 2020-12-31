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
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
				<h1></h1>
			</div>
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
				<h1></h1>
			</div>
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
				<h1></h1>
			</div>
		</div>
	</div>
	<!-- 실제 내용 시작 -->
	<div>
		<form class="form-horizontal" method="post"
			action="<c:url value='/Member/Join.do'/>">
			<div class="form-group">
				<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4"></div>
				<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
					<label for="userId">이메일 </label>
					<Button type="button" id="emailDuplCheck" class="btn btn-sm"
						style="float: right; background-color: white;">
						<span id="duplCheck" role="button"
							style="color: #a39bbd; text-decoration: underline;">중복체크</span>
					</Button>
					<input type="text" class="form-control input-sm" id="userId" name="userId">
					<span id="emailCheck" style="font-size: .8em; color: gray"></span>
					<select class="form-control" name="emailStr" id="emailStr">
						<option value="@naver.com">naver.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="직접입력">직접입력</option>
					</select>
				</div>

				<h1></h1>
			</div>
			<h1></h1>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userPWD">비밀번호</label> <input type="password"
					class="form-control input-sm" id="userPWD" name="userPWD">
			</div>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userPWDOk">비밀번호 확인</label> <input type="password"
					class="form-control input-sm" id="userPWDOk" name="userPWDOk"> <span
					id="passwordCheck" style="font-size: .8em; color: gray"></span>
			</div>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userName">이름</label> <input type="text" class="form-control input-sm"
					id="userName" name="userName">
			</div>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userRRN">생년월일</label> <br /> <input type="text"
					class="form-control input-sm" id="userRRN" name="userRRN">
			</div>

			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userAddr">활동지역</label> <input type="text"
					class="form-control input-sm" id="userAddr" name="userAddr">
			</div>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userTel">연락처</label> <input type="text"
					class="form-control input-sm" id="userTel" name="userTel">
			</div>
			<br />
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<button type="submit" class="btn btn-primary btn-lg btn-block">가입하기</button>
			</div>
		</form>
	</div>
	<!-- 간격때문에 작성 -->
	<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
		<h1></h1>
	</div>
	<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
		<h1></h1>
	</div>
	<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
		<h1></h1>
	</div>
</div>
<!-- END COLORLIB-PAGE -->
<script>
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
	$('#userId').keyup(function() {
		$.ajax({
			url : "<c:url value='/Member/EmailCheck.do'/>",
			type : 'post',
			dataType : 'json',
			data : {
				"userId" : $('#userId').val()
			},
			success : function(data) {
				console.log('서버로부터 받는 데이타 : ', data);
				$('#emailCheck').html(data.emailCheck);
			}
		});
	});
	$('#emailDuplCheck').click(function() {
		$.ajax({
			url : "<c:url value='/Member/EmailDuplCheck.do'/>",
			type : 'post',
			dataType : 'json',
			data : {
				"userId" : $('#userId').val()+$('#emailStr').val()
			},
			success : function(data) {
				console.log('서버로부터 받는 데이타 : ', data);
				$('#duplCheck').html(data.duplCheck);
			}
		});
	});
</script>