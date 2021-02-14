<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 제이쿼리 UI용 CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
	.packCreateBtn {
		color:#ff8827;
		background-color: white;
		font-weight: bold;
		border: none;
	}
	.packCreateBtn:hover {
		color:white;
		background-color: #ff8827;
	}
</style>
<div id="colorlib-main" style="padding:20px">
	<div class="row">
		<div class="col-lg-12" style="padding-bottom:20px">
			<div class="">
				<a href="<c:url value="/pack/main.do"/>">
				<img alt="pack" src="<c:url value="/images/pack/pack.png"/>"
					style="width: 80px;"></a>
				&emsp;<a class="packCreateBtn btn" 
					href="<c:url value="/pack/main.do"/>">HOME</a>
				<c:if test="${!empty sessionScope.packId}">
					<a class="packCreateBtn btn" 
						href="<c:url value="/pack/view.do"/>">MY PACK</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<h3 style="padding-left:10px;color:black;font-weight: bold;">팩 만들기</h3>
			<hr style="background-color:black; height:1px"/>
		</div>
	</div>
	<!-- 지도 -->
	<div class="row">
		<div class="col-xs-10 col-xs-1 col-md-10 col-md-offset-1">
			<div id="map" style="height: 400px;width: 100%;overflow: hidden;position: relative;margine-top: 50px;"></div>
		</div>
	</div>
	<!-- 팩 가입 정보-->
	<div class="row col-xs-12 col-md-12" style="padding-top:30px;padding-left:70px;">
		<form class="form-horizontal" action="<c:url value='/pack/createOk.do'/>" method="post" onsubmit="return formSubmit()">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-xs-2 col-md-2 control-label">팩 이름</label>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" id= "packName" name= "packName" class="form-control" placeholder="팩  이름">
		    </div>
		    <a id="packnameCheck" class="col-xs-1 btn form-group" style="color:#ff8827; text-decoration: underline;">중복체크</a>
		  </div>
		  <div class="form-group">
		    <label class="col-xs-2 col-md-2 control-label">팩 태그</label>
		    <div class="col-xs-8 col-md-8">
		      <input  type="text" id ="packTag" name= "packTag" class="form-control" placeholder="팩  태그">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-xs-2 col-md-2 control-label">지역</label>
		    <div class="col-xs-8 col-md-8">
		      <input type="text" id= "packActRegion" name= "packActRegion"  class="form-control">
		    </div>
		  </div>
		  <div class="form-group">
			    <label class="col-xs-2 col-md-2 control-label">팩 활동시간</label>
			   	<label class="radio-inline">&emsp;
				<input type="radio" name='packActTime' value='주 1회' />주 1회
		 		</label>
			   	<label class="radio-inline">
				<input type="radio" name='packActTime' value='주 2~3회' />주 2~3회
		 			</label>
				<label class="radio-inline">
				 <input type="radio" name='packActTime' value='주 4회 이상' />주 4회 이상
			 	</label>
		  </div>
		  <div class="form-group">
			    <label class="col-xs-2 col-md-2 control-label">팩 평균 연령</label>
			   	<label class="radio-inline">&emsp;
				 <input type="radio" name='packActAge' value='청소년'/>청소년		 		
				</label>
			   	<label class="radio-inline">
				 	 <input type="radio" name='packActAge' value='20대' />20대		
				</label>
				<label class="radio-inline">
				 	<input  type="radio" name='packActAge' value='30대'/>30대
				 </label>
				<label class="radio-inline">
				  	<input  type="radio" name='packActAge' value='40대'/>40대
				</label>
				<label class="radio-inline">
				 	 <input  type="radio" name='packActAge' value='50대 이상'/>50대 이상	
				</label>
				<label class="radio-inline">
				 	<input type="radio" name='packActAge' value='전 연령대'/>전 연령대
				</label>
		  </div>
		  <div class="form-group">
		  	  <label class="col-xs-2 col-md-2 control-label">팩 로고</label>
			<div class="packThumbnails col-xs-9 col-md-9" style="width: 100%">
				<img id="packLogo1.png" src="<c:url value='/images/pack/packLogo1.png'/>" alt="팩 1번마크" style="width: 5%"/>
				<img id="packLogo2.png" src="<c:url value='/images/pack/packLogo2.png'/>" alt="팩 2번마크" style="width: 5%"/>
				<img id="packLogo3.png" src="<c:url value='/images/pack/packLogo3.png'/>" alt="팩 3번마크" style="width: 5%"/>
				<img id="packLogo4.png" src="<c:url value='/images/pack/packLogo4.png'/>" alt="팩 4번마크" style="width: 5%"/>
				<img id="packLogo5.png" src="<c:url value='/images/pack/packLogo5.png'/>" alt="팩 5번마크" style="width: 5%"/>
				<img id="packLogo6.png" src="<c:url value='/images/pack/packLogo6.png'/>" alt="팩 6번마크" style="width: 5%"/>
				<img id="packLogo7.png" src="<c:url value='/images/pack/packLogo7.png'/>" alt="팩 7번마크" style="width: 5%"/>
			</div>
		  </div>
		  <div class="form-group">
	 		<label class="col-xs-2 col-md-2 control-label">팩 소개</label>
			<textarea id="packIntro" name="packIntro" class="form-control col-xs-9 col-md-8" rows="3"></textarea>
		  </div>
		  <div class="form-group">
			<input type="hidden"  id="packThumbnail"  value="Pack1.png" name= "packThumbnail" class="form-group"/>
			<input type="hidden"  id="packLat"  name= "packLat" class="form-group"/>
			<input type="hidden"  id="packLng"  name= "packLng" class="form-group"/>
		  </div>
		  <div class="form-group">
		    <div class="col-xs-offset-6 col-xs-3 col-md-offset-6 col-md-3">
		      <button id="formSubmitBtn" type="submit" class="btn" 
		      	style="background-color: #ff8827;border: none;color: white;font-weight:bold;">등록</button>
		    </div>
		  </div>
		</form>
	</div>
</div>

<script>
	var duplicationCheck = false;
	function formSubmit() {
		//유효성 체크
		var packName = $('#packName').val()
		var packTag = $('#packTag').val()
		var packActRegion = $('#packActRegion').val()
		var packIntro = $('#packIntro').val()
		//팩 이름
		if (packName.length == 0) {
			alert('팩 이름을 입력해주세요.')
			return false;
		}
		//팩 태그
		if (packTag.length == 0) {
			alert('팩 태그를 입력해주세요')
			return false;
		}
		//팩 지역
		if (packActRegion.length == 0) {
			alert('팩 활동지역을 입력해주세요')
			return false;
		}
		//팩 타임
		if (!$('input:radio[name=packActTime]').is(':checked')) {
			alert('팩 활동 시간을 체크해주세요')
			return false;
		}
		//팩 연령
		if (!$('input:radio[name=packActAge]').is(':checked')) {
			alert('팩 활동 연령을 체크해주세요')
			return false;
		}
		//팩 소개
		if (packIntro.length == 0) {
			alert('팩 소개를 입력해주세요')
			return false;
		}
		if (!duplicationCheck) {
			alert('팩 이름 중복 체크를 해주세요.')
			return false;
		}
	}

	$(".packThumbnails img").click(function() {

		var packThumbnailName = $(this).attr('id');
		$(".packThumbnails img").css('border', 'none');
		$(this).css('border', '2px solid #2291c3');
		$("#packThumbnail").val(packThumbnailName);

	})
	$("#packnameCheck").click(function() {
		var packName = $('#packName').val()
		if (packName.length < 2) {
			alert('팩이름을 두 글자 이상 입력해주세요.')
			return;
		}

		$.ajax({
			url : "<c:url value="/pack/checkPackName.do"/>",//요청할 서버의 URL주소
			type : 'post',//데이타 전송방식(디폴트는 get방식) 
			dataType : 'text',//서버로 부터 응답 받을 데이타의 형식 설정
			data : "ckpackName=" + packName,
			success : function(data) {
				if (data == 'Y') {
					alert("사용 할 수 있는 팩이름입니다.");
					duplicationCheck = true;
				} else {
					alert("사용 할 수 없는 팩이름입니다.");
					duplicationCheck = false;
				}
			},
			error : function(error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
				console.log('에러 : ', error.responseText);
			}

		});

	})
</script>
<!--  -->
<script>
	var map;
	var geocoder = new kakao.maps.services.Geocoder();
	//0]사용자 위치 구하기
	if (navigator.geolocation) {
		var options = {
			timeout : 3000,
			maxinumAge : 5000
		};
		navigator.geolocation.getCurrentPosition(successCallback,error);
	}

	 //0-1]사용자 위치 구하기 성공시 좌표값 displayKaKaoMap로 넘김/지도 생성 순성상 있어줘야한다.
      function successCallback(position) {
    	  SearchMap()   
       }
      //0-2]사용자 위치 구하기 실패시
      function error(position){
    	  SearchMap()
      }
      function SearchMap(){
    	 <c:if test="${empty searchLat}" var="isEmpty">
    		 console.log("?????????")
    		 displayKaKaoMap(37.57801416976735,  126.97658868798284 );
      </c:if>
      <c:if test="${!isEmpty}">
          displayKaKaoMap(${searchLat},${searchLng});
      </c:if>
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
			$("#packLat").val(mouseEvent.latLng.getLat());
			$("#packLng").val(mouseEvent.latLng.getLng());

		});
	}

	function searchAddrFromCoords(coords, callback) {

		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	function displayCenterInfo(result, status) {

		if (status === kakao.maps.services.Status.OK) {
			var Region = document.getElementById('packActRegion');

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

	//지도스크립트//
</script>