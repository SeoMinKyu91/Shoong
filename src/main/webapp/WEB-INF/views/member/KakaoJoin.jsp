<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->

<!-- ※colorlib-main으로 일단 감싸고 안에다가 작업해야 왼쪽 탑에 안먹히고 작업할 수 있어요 -->
<!-- 설명이 이해가 잘 안되시면  따로 연락주세요...-->
<style>
.slider-area {
	display: none;
}

input {
	border: #ced4da 1.5px solid;
	font-size: .8em;
	padding-left: 10px
}

.input {
	border: #ced4da 1.5px solid;
	font-size: .8em;
	padding-left: 10px;
}

#map {
	height: 300px;
	width: 100%;
	overflow: hidden;
	position: relative;
	margin-bottom: 50px;
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
	background-color: rgba( 255, 255, 255, 0.9 );
	border-radius: 30px;
	position: relative;
	z-index: 1;
	box-shadow: 0px 0px 5px #787878;
}
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div class="col-xs-10 offset-xs-1 col-md-10 offset-md-1"
	style="padding-bottom: 50px">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  
	<div class="container">
		<div class="col-xs-12 col-md-12">
			<div class="page-header" style="text-align: center">
				<a href="<c:url value="/"/>"><img alt="shoongLogo"
					src="<c:url value="/images/shooongLogo.png"/>"
					style="width: 100px; padding-bottom: 50px"></a>
			</div>
		</div>
	</div>-->
		<form class="form-horizontal" method="post" name="join"
			onsubmit="return checked()"
			action="<c:url value='/kakao/KakaoJoin.do'/>">
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2"
					style="padding-bottom: 30px; text-align: center">
					<h3 style="font-weight: bold">추가 정보 입력</h3>
				</div>
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
					<!-- 이메일 입력란 -->
					<input type="hidden" id="userId" name="userId"
						style="font-size: .8em; height: 50px;" value="${userInfo.email}"> <br />
				</div>
			</div>
			<!-- 비밀번호 입력란 -->
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userPWD">비밀번호(4~12자의 영문 대소문자와 숫자로만 입력)</label> <input
					type="password" class="form-control input-sm" id="userPWD"
					name="userPWD" minlength="4" maxlength="12" style="font-size: .8em"
					placeholder="비밀번호를 입력하세요"> <br />
				</div>
			</div>
			<!-- 비밀번호 확인 입력란 -->
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userPWDOk">비밀번호 확인</label> <input type="password"
					class="form-control input-sm" id="userPWDOk" name="userPWDOk"
					minlength="4" maxlength="12" style="font-size: .8em"
					placeholder="위와 같은 비밀번호를 입력하세요"> <span id="passwordCheck"
					style="font-size: .8em; color: gray"></span>
				</div>
			</div>
			<!-- 이름 입력란 -->
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userName">이름</label> <input type="text"
					class="form-control input-sm" id="userName" name="userName"
					style="font-size: .8em" placeholder="이름을 입력하세요"><br />
				</div>
			</div>
			<!-- 생년월일 입력란 -->
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userRRN">생년월일</label> <br /> <input name="userRRN1"
					id="userRRN1" type="text" size="25" maxlength="6"
					OnKeyUp="check();" onChange="inputbirthNage(); inputGender()"
					style="height: 50px"
					onBlur="checknum(document.join.userRRN1.value)"
					placeholder="생년월일(6자리)">&nbsp; ㅡ &nbsp; <input
					id="userRRN2" name="userRRN2" type="text" size="5" maxlength="1"
					onchange="inputGender()" style="height: 50px"
					onBlur="checknum(document.join.userRRN2.value)">&nbsp;xxxxxx
				<br />
				<!-- 주민번호 7자리 입력시 생년월일, 나이, 성별 자동 입력 -->
				<input name="userrrn1" type="text" size="4" maxlength="4"
					style="border: none; color: gray"
					onBlur="checknum(document.join.userrrn1.value)"><span
					style="font-size: .8em; color: gray">년&nbsp;&nbsp;</span> <input
					name="userrrn2" type="text" size="2" maxlength="2"
					style="border: none; color: gray"
					onBlur="checknum(document.join.userrrn2.value)"><span
					style="font-size: .8em; color: gray">월&nbsp;&nbsp;</span> <input
					name="userrrn3" type="text" size="2" maxlength="2"
					style="border: none; color: gray"
					onBlur="checknum(document.join.userrrn3.value)"><span
					style="font-size: .8em; color: gray">일&emsp;&emsp;</span> <input
					name="userAge" id="userAge" type="text" size="2"
					style="border: none; color: gray" maxlength="2"
					onBlur="checknum(document.join.userAge.value)"><span
					style="font-size: .8em; color: gray">살&emsp;&emsp;</span> <input
					name="userGender" type="hidden" size="3" maxlength="2"
					style="border: none; color: gray" value="${userInfo.gender}"
					onBlur="checknum(document.join.userGender.value)"><br />
				</div>
			</div>
			<!-- 연락처 입력란 -->
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userTel">연락처</label><br /> <select name="userTel1"
					id="userTel1"
					style="font-size: .8em; height: 50px; width: 26.5%; padding-left: 10px; border: #ced4da 1.5px solid;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> &nbsp; ㅡ &nbsp; <input name="userTel2" id="userTel2" type="text"
					maxlength="4" style="height: 50px; width: 26.5%"
					OnKeyUp="checkTel();">&nbsp; ㅡ &nbsp; <input
					name="userTel3" id="userTel3" type="text" maxlength="4"
					style="height: 50px; width: 26.5%" OnKeyUp="checkTel();"> <br />
				</div>
			</div>
			<!-- 활동지역 입력란 -->
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userAddr">활동지역</label>
				<div>
					<input type="text" class="form-control" id="userAddr"
						name="userAddr" style="font-size: .8em">
				</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<div id="map"></div>
				<input type="hidden" id="memberLat" name="memberLat"
					class="form-group" /> <input type="hidden" id="memberLng"
					name="memberLng" class="form-group" />
				</div>
			</div>
			<div class="form-group" style="padding-bottom: 50px">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<button type="submit" class="btn btn-primary btn-lg btn-block">가입하기</button>
				</div>
			</div>
		</form>
	</div>

<!-- -----------------입력시 변환 스크립트---------------- -->
<script>
	//----주민번호 입력하면 생년월일, 성별 자동으로 입력----//
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
	//주민번호 앞 6자리 입력 후 칸 자동 넘김
	function check() {
		var str = document.join.userRRN1.value.length;
		if (str == 6)
			document.join.userRRN2.focus();
	}
	//주민번호 앞 6자리 입력시 나이 계산
	function inputbirthNage() {
		date = new Date();
		var age = 1;
		var jumin1 = document.join.userRRN1.value;
		var yy = date.getFullYear();
		var birthYear = jumin1.substring(0);
		if (birthYear > 2) {
			age = yy - (1900 + parseInt(jumin1.substring(0, 2)));
			document.join.userrrn1.value = 1900 + parseInt(jumin1.substring(0,
					2));
		} else {
			age = yy - (2000 + parseInt(jumin1.substring(0, 2)));
			document.join.userrrn1.value = 2000 + parseInt(jumin1.substring(0,
					2));
		}
		if (jumin1.substring(2, 4) < 13) {
			document.join.userrrn2.value = parseInt(jumin1.substring(2, 4));
		}
		if (jumin1.substring(4, 6) < 32) {
			document.join.userrrn3.value = parseInt(jumin1.substring(4, 6));
		}
		age += 1;
		document.join.userAge.value = age;
	}
	//주민번호 뒷 한 자리 입력시 성별 자동 입력
	function inputGender() {
		var gen = document.join.userRRN2.value.substring(0);
		if (gen == 1 || gen == 3) {
			document.join.userGender.value = "남성";
		} else if (gen == 2 || gen == 4) {
			document.join.userGender.value = "여성";
		}
	}
	//핸드폰번호 입력 후 칸 자동 넘김
	function checkTel() {
		var str1 = document.join.userTel2.value.length;
		var str2 = document.join.userTel3.value.length;
		if (str1 == 4) {
			document.join.userTel3.focus();
		}
	}
</script>

<!-- ----------------유효성 검증 스크립트----------------- -->
<script>
	////////비밀번호 , 비밀번호 확인 일치 여부 판단////////
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
	////////전체 유효성 체크////////
	function checked() {
		//비밀번호, 비밀번호 확인 공백 및 유효성 검사//
		var pwd = document.getElementById('userPWD').value;
		var pwdOk = document.getElementById('userPWDOk').value;
		var pwdPattern = /^[a-zA-Z0-9]{4,12}$/
		if (!pwdPattern.test(pwd) && pwd != "") {
			alert("비밀번호 형식에 맞지 않습니다. 다시 입력해주세요.");
			document.getElementById('userPWD').focus();
			return false;
		} else if (pwd == "") {
			alert("비밀번호를 입력해주세요.");
			document.getElementById('userPWD').focus();
			return false;
		}
		if (pwdOk == "") {
			alert("비밀번호 확인을 입력해주세요.");
			document.getElementById('userPWDOk').focus();
			return false;
		}
		if (pwd != pwdOk) {
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById('userPWD').focus();
			return false;
		}
		//이름 공백검사//
		var name = document.getElementById('userName').value;
		if (name == "") {
			alert("이름을 입력해주세요.");
			document.getElementById('userName').focus();
			return false;
		}
		//주민번호 공백검사
		var rrn1 = document.getElementById('userRRN1').value;
		var rrn2 = document.getElementById('userRRN2').value;
		if (rrn1 == "") {
			alert("주민번호 앞 6자리를 입력해주세요.");
			document.getElementById('userRRN1').focus();
			return false;
		}
		if (rrn2 == "") {
			alert("주민번호 뒤 1자리를 입력해주세요.");
			document.getElementById('userRRN2').focus();
			return false;
		}
		//연락처 공백검사(중간, 뒷번호 입력 여부)
		var tel2 = document.getElementById('userTel2').value;
		var tel3 = document.getElementById('userTel3').value;
		if (tel2 == "") {
			alert("휴대폰번호 중간 4자리를 입력해주세요.");
			document.getElementById('userTel2').focus();
			return false;
		}
		if (tel3 == "") {
			alert("휴대폰번호 뒷 4자리를 입력해주세요.");
			document.getElementById('userTel3').focus();
			return false;
		}
	}
</script>

<!-- ---------------- 활동지역 맵 스크립트 ----------------- -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=616834812e97e8f82a462cd2cc2e5e4e&libraries=services"></script>
<script>
	var map;
	var geocoder = new kakao.maps.services.Geocoder();
	//0]사용자 위치 구하기
	if (navigator.geolocation) {
		var options = {
			timeout : 3000,
			maxinumAge : 5000
		};
		navigator.geolocation.getCurrentPosition(successCallback);
		//이거 실패하는코드도 입력. 경복궁 37.57801416976735  /  126.97658868798284 
		//실패하면 displayKaKaoMap(lat, lng); 여기에 저값담아보내기
	}

	//0-1]사용자 위치 구하기 성공시 좌표값 displayKaKaoMap로 넘김
	function successCallback(position) {

		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		$("#memberLat").val(lat);
		$("#memberLng").val(lng);
		displayKaKaoMap(lat, lng);
	}

	//1]사용자 뷰에 지도 생성 지도 정보 map에 저장
	function displayKaKaoMap(lat, lng) {
		var mapContainer = document.getElementById('map');
		mapOption = {
			center : new kakao.maps.LatLng(lat, lng), // 현재 위치 중심으로 지도의 중심좌표
			level : 9
		};

		map = new kakao.maps.Map(mapContainer, mapOption);
		//맵 컨트롤
		var mapTypeControl = new kakao.maps.MapTypeControl();
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의! TOPRIGHT는 오른쪽 위
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		//<이 위까지가 지도 기본 셋팅>/// 
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		displayCentermarker(map);
		addeventmap(map)

	}

	//1-1]사용자 뷰 지도 중심에 마커 생성
	var marker;
	function displayCentermarker(map) {
		//마커생성
		marker = new kakao.maps.Marker({
			position : map.getCenter()
		});
		//마커 셋팅
		marker.setMap(map);
	}

	//2]지도에 이벤트를 등록합니다
	function addeventmap(map) {
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchAddrFromCoords(mouseEvent.latLng, displayCenterInfo);

			marker.setPosition(mouseEvent.latLng);
			marker.setMap(map);
			$("#memberLat").val(mouseEvent.latLng.getLat());
			$("#memberLng").val(mouseEvent.latLng.getLng());

		});
	}
	function searchAddrFromCoords(coords, callback) {

		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	function displayCenterInfo(result, status) {

		if (status === kakao.maps.services.Status.OK) {
			var Region = document.getElementById('userAddr');

			for (var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					var regionArray = result[i].address_name.split(" ");
					var resionCut = regionArray[0] + " " + regionArray[1]
					Region.value = resionCut;
					break;
				}
			}
		}

	}
</script>