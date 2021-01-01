<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->

<!-- ※colorlib-main으로 일단 감싸고 안에다가 작업해야 왼쪽 탑에 안먹히고 작업할 수 있어요 -->
<!-- 설명이 이해가 잘 안되시면  따로 연락주세요...-->
<style>
input {
	border: #ced4da 1.5px solid;
	font-size: .8em;
}
</style>
<div id="colorlib-main" style="padding-top: 100px">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->
	<div class="container">
		<div class="col-xs-12 col-md-12">
			<div class="page-header" style="text-align: center">
				<img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>"
					style="width: 100px">
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
		<form class="form-horizontal" method="post" name="join"
			action="<c:url value='/Member/Join.do'/>">
			<div class="form-group">
				<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4"></div>
				<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<!-- 이메일 입력란 -->
					<label for="userId">이메일 </label>
					<Button type="button" id="emailDuplCheck" class="btn btn-sm"
						style="float: right; background-color: white;">
						<span id="duplCheck" role="button"
							style="color: #a39bbd; text-decoration: underline;">중복체크</span>
					</Button>
					<input type="text" class="form-control input-sm" id="userId"
						name="userId" style="font-size: .8em" placeholder="이메일을 입력하세요">
					<span id="emailCheck" style="font-size: .8em; color: gray"></span>
					<select class="form-control" name="emailStr" id="emailStr" style="font-size: .8em">
						<option value="">==선택하세요==</option>
						<option value="@naver.com">naver.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@nate.com">daum.net</option>
						<option value="직접입력">직접입력</option>
					</select>
						<input type="text"
						class="form-control input-sm" id="emailStrinput"
						name="emailStrinput" style="font-size: .8em" placeholder="직접 입력">
				</div>
				<h1></h1>
			</div>
			<h1></h1>
			<!-- 비밀번호 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userPWD">비밀번호</label> <input type="password"
					class="form-control input-sm" id="userPWD" name="userPWD"
					style="font-size: .8em" placeholder="비밀번호를 입력하세요">
			</div>
			<!-- 비밀번호 확인 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userPWDOk">비밀번호 확인</label> <input type="password"
					class="form-control input-sm" id="userPWDOk" name="userPWDOk"
					style="font-size: .8em" placeholder="위와 같은 비밀번호를 입력하세요"> <span
					id="passwordCheck" style="font-size: .8em; color: gray"></span>
			</div>
			<!-- 이름 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userName">이름</label> <input type="text"
					class="form-control input-sm" id="userName" name="userName"
					style="font-size: .8em" placeholder="이름을 입력하세요">
			</div>
			<!-- 생년월일 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userRRN">생년월일</label> <br /> <input name="userRRN1"
					type="text" size="25" maxlength="6" OnKeyUp="check();"
					onChange="inputbirth()" style="height: 50px"
					onBlur="checknum(document.join.userRRN1.value)"
					placeholder="    생년월일(6자리)">&nbsp; &nbsp; ㅡ &nbsp; &nbsp; <input
					name="userRRN2" type="text" size="5" maxlength="1" onchange="inputGender()"
					style="height: 50px"
					onBlur="checknum(document.join.userRRN2.value)">&nbsp;xxxxxx
				<br />  <input name="userrrn1" type="text" size="5"
					maxlength="4" disabled="disabled"
					onBlur="checknum(document.join.userrrn1.value)">년&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="userrrn2" type="text" size="3" maxlength="2"
					disabled="disabled"
					onBlur="checknum(document.join.userrrn2.value)">월&nbsp;&nbsp;&nbsp;
				<input name="userrrn3" type="text" size="3" maxlength="2"
					disabled="disabled"
					onBlur="checknum(document.join.userrrn3.value)">일
			</div>
			<!-- 성별 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userGender">성별</label> <br />
				<input name="userGender" type="text" size="20" maxlength="2"
					disabled="disabled" onBlur="checknum(document.join.userGender.value)">
			</div>
			<!-- 활동지역 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userAddr">활동지역</label> <input type="text"
					class="form-control input-sm" id="userAddr" name="userAddr">
			</div>
			<!-- 연락처 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<label for="userTel">연락처</label><br />
				&nbsp;<input name="userTel1" type="text" size="12" maxlength="3"
				style="height: 50px" OnKeyUp="checkTel();">&nbsp; ㅡ &nbsp;
				<input name="userTel2" type="text" size="12" maxlength="4"
				style="height: 50px" OnKeyUp="checkTel();">&nbsp; ㅡ &nbsp;
				<input name="userTel3" type="text" size="12" maxlength="4"
				style="height: 50px" OnKeyUp="checkTel();">
			</div>
			<br />
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<button type="submit" class="btn btn-primary btn-lg btn-block">가입하기</button>
			</div>
		</form>
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
				"userId" : $('#userId').val() + $('#emailStr').val()
			},
			success : function(data) {
				console.log('서버로부터 받는 데이타 : ', data);
				$('#duplCheck').html(data.duplCheck);
			}
		});
	});
	//생년월일 입력하면 생년월일과 성별 자동으로 입력
	function checknum(num) {
		var val = "0123456789";
		var string = num;
		var len = string.length;
		for (i = 0; i < len; i++) {
			if (val.indexOf(string.substring(i, i + 1)) < 0) {
				alert("숫자만 허용됩니다.");
				return;
			}
		}
	}

	function check() {
		var str = document.join.userRRN1.value.length;
		if (str == 6)
			document.join.userRRN2.focus();
	}

	function inputbirth() {
		var temp1, temp2, temp3;
		temp1 = document.join.userRRN1.value.substring(0, 2);
		temp2 = document.join.userRRN1.value.substring(2, 4);
		temp3 = document.join.userRRN1.value.substring(4, 6);
		if (temp1 < 30) {
			document.join.userrrn1.value = "20" + temp1;
		} else {
			document.join.userrrn1.value = "19" + temp1;
		}
		if (temp2 < 13){
			document.join.userrrn2.value = temp2;
		}
		if (temp3 < 32){
			document.join.userrrn3.value = temp3;
		}
	}
	function inputGender(){
		var gen;
		gen = document.join.userRRN2.value.substring(0);
		if(gen == 1 || gen == 3){
			document.join.userGender.value = "남성";
		}
		else if(gen == 2 || gen == 4){
			document.join.userGender.value = "여성";
		}
	}
	//핸드폰번호 입력 후
	function checkTel() {
		var str1 = document.join.userTel1.value.length;
		var str2 = document.join.userTel2.value.length;
		if (str1 == 3){
			document.join.userTel2.focus();
		}
		if(str2 == 4){
			document.join.userTel3.focus();
		}
			
	}
</script>