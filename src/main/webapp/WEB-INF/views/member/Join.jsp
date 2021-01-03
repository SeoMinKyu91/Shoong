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
	padding-left: 10px
}
#map{
	height: 300px;
	width : 100%;
	overflow: hidden;
	position: relative;
	margin-bottom: 50px;
}
</style>
<div id="colorlib-main" style="padding-top: 100px">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->
	<div class="container">
		<div class="col-xs-12 col-md-12">
			<div class="page-header" style="text-align: center">
				<a href="<c:url value="/"/>"><img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>"
					style="width: 100px; padding-bottom: 50px"></a>
			</div>
		</div>
	</div>
	<!-- 실제 내용 시작 -->
	<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2" style="padding-bottom: 50px">
		<form class="form-horizontal" method="post" name="join"
		style="background-color: white; box-shadow: 0px 0px 5px #000; border-radius: 100px;"
			action="<c:url value='/Member/Join.do'/>">
			<div class="form-group">
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2" 
					style="padding-top: 40px; padding-bottom: 40px; text-align: center">
					<h3 style="font-weight: bold">회원 가입</h3>
				</div>
				<div class=" col-xs-10 offset-xs-1 col-md-8 offset-md-2">
					<!-- 이메일 입력란 -->
					<label for="userId">이메일 </label>
					<Button type="button" id="emailDuplCheck" class="btn btn-sm"
						style="float: right; background-color: white;">
						<span id="duplCheck" role="button"
							style="color: #a39bbd; text-decoration: underline;">중복체크</span>
					</Button>
					<br /> <input type="text" id="userId" name="userId"
						style="font-size: .8em; height: 50px; width: 34%"
						placeholder="이메일을 입력하세요"> @ <input type="text"
						id="emailStrinput" name="emailStrinput" placeholder="직접 입력"
						style="font-size: .8em; height: 50px; width: 29%"> <select
						name="emailStr" id="emailStr"
						style="font-size: .8em; height: 50px; width: 29%; border: #ced4da 1.5px solid; color:#7e757d">
						<option value="">==선택하세요==</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="1">직접입력</option>
					</select> <br /> <span id="emailCheck" style="font-size: .8em; color: gray"></span>
				</div>
				<h1></h1>
			</div>
			<h1></h1>
			<!-- 비밀번호 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userPWD">비밀번호</label> <input type="password"
					class="form-control input-sm" id="userPWD" name="userPWD"
					style="font-size: .8em" placeholder="비밀번호를 입력하세요">
			</div>
			<!-- 비밀번호 확인 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userPWDOk">비밀번호 확인</label> <input type="password"
					class="form-control input-sm" id="userPWDOk" name="userPWDOk"
					style="font-size: .8em" placeholder="위와 같은 비밀번호를 입력하세요"> <span
					id="passwordCheck" style="font-size: .8em; color: gray"></span>
			</div>
			<!-- 이름 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userName">이름</label> <input type="text"
					class="form-control input-sm" id="userName" name="userName"
					style="font-size: .8em" placeholder="이름을 입력하세요">
			</div>
			<!-- 생년월일 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userRRN">생년월일</label> <br /> <input name="userRRN1" id="userRRN1"
					type="text" size="25" maxlength="6" OnKeyUp="check();"
					onChange="inputbirth()" style="height: 50px"
					onBlur="checknum(document.join.userRRN1.value)"
					placeholder="생년월일(6자리)">&nbsp; ㅡ  &nbsp; <input id="userRRN2"
					name="userRRN2" type="text" size="5" maxlength="1"
					onchange="inputGender()" style="height: 50px"
					onBlur="checknum(document.join.userRRN2.value)">&nbsp;xxxxxx
				<br /> <input name="userrrn1" type="text" size="5" maxlength="4"
					disabled="disabled" onBlur="checknum(document.join.userrrn1.value)">년&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="userrrn2" type="text" size="3" maxlength="2"
					disabled="disabled" onBlur="checknum(document.join.userrrn2.value)">월&nbsp;&nbsp;&nbsp;
				<input name="userrrn3" type="text" size="3" maxlength="2"
					disabled="disabled" onBlur="checknum(document.join.userrrn3.value)">일
			</div>
			<!-- 성별 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userGender">성별</label> <br /> <input name="userGender"
					type="text" size="20" maxlength="2" disabled="disabled"
					onBlur="checknum(document.join.userGender.value)">
			</div>
			<!-- 연락처 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userTel">연락처</label><br /> <select name="userTel1"
					id="userTel1"
					style="font-size: .8em; height: 50px; width: 26.5%; padding-left: 10px; border: #ced4da 1.5px solid;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> &nbsp; ㅡ &nbsp; <input name="userTel2" id="userTel2" type="text" maxlength="4"
					style="height: 50px; width: 26.5%" OnKeyUp="checkTel();">&nbsp;
				ㅡ &nbsp; <input name="userTel3" id="userTel3" type="text" maxlength="4"
					style="height: 50px; width: 26.5%" OnKeyUp="checkTel();">
			</div>
			<!-- 활동지역 입력란 -->
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<label for="userAddr">활동지역</label>
				<div >
					<input type="text" class="form-control" id="userAddr" name="userAddr" style="font-size:.8em">
				</div>
			</div>
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
				<div id="map"></div>
			</div>
			<div class="form-group">
				<input type="hidden"  id="memberLat"  name= "memberLat" class="form-group"/>
				<input type="hidden"  id="memberLng"  name= "memberLng" class="form-group"/>
			</div>
			<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2" style="padding-bottom: 50px">
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
	//이메일 직접 입력 시 입력란 활성화
	$('#emailStr').change(function() {
		$("#emailStr option:selected").each(function() {
			if ($(this).val() == '1') { //직접입력일 경우
				$("#emailStrinput").val(''); //값 초기화
			} else { //직접입력이 아닐경우
				$("#emailStrinput").val($(this).text()); //선택값 입력 
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
		if (temp2 < 13) {
			document.join.userrrn2.value = temp2;
		}
		if (temp3 < 32) {
			document.join.userrrn3.value = temp3;
		}
	}
	function inputGender() {
		var gen;
		gen = document.join.userRRN2.value.substring(0);
		if (gen == 1 || gen == 3) {
			document.join.userGender.value = "남성";
		} else if (gen == 2 || gen == 4) {
			document.join.userGender.value = "여성";
		}
	}
	//핸드폰번호 입력 후
	function checkTel() {
		var str1 = document.join.userTel2.value.length;
		var str2 = document.join.userTel3.value.length;
		if (str1 == 4) {
			document.join.userTel3.focus();
		}

	}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=616834812e97e8f82a462cd2cc2e5e4e&libraries=services"></script>
<script>
	//활동지역 맵
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