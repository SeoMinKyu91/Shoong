<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>

</style>
<div style="font-family: 'Noto Sans KR', sans-serif;">
	<h2>[${location}] 자전거 대여소</h2>
	<br>
	<div style="">
		<div class="map_wrap col-sm-8" style="height:500px; margin-bottom: 200px; ">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		</div>
		<div class="col-sm-4">
			<table class="table" id="lendInfoTable">
				<tr class="info"><th style="width: 25%">가게이름</th><th></th></tr>
				<tr class="active"><th>주소</th><th></th></tr>
				<tr class="active"><th>형태</th><th></th></tr>
				<tr class="active"><th>오픈시간</th><th></th></tr>
				<tr class="active"><th>마감시간</th><th></th></tr>
				<tr class="active"><th>쉬는 날</th><th></th></tr>
				<tr class="active"><th>요금형태</th><th></th></tr>
				<tr class="active"><th>요금</th><th></th></tr>
				<tr class="active"><th>전화번호</th><th></th></tr>
			</table>
		</div>
	</div>
		
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaa4b242f112a823dd2ef5541569589&libraries=services"></script>

<script>
// 마커를 담을 배열입니다
console.log("${lendList}")
var marker = null;
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${lendList[0].lat},${lendList[0].lng}), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var clickCheck=false;
var clickIndex=false;

displayPlaces();

function displayPlaces(){
	
	<c:forEach var="item" items="${lendList}">
		//마커가 표시될 위치입니다  
		markerPosition  = new kakao.maps.LatLng(${item.lat}, ${item.lng}); 
		//마커 이벤트
		addMarker(markerPosition,"${item.addr}","${item.bcyclLendNm}","${item.bcyclLendSe}",
				"${item.operOpenHm}","${item.operCloseHm}","${item.rstde}","${item.chrgeSe}",
				"${item.bcyclUseCharge}","${item.phoneNumber}")
	</c:forEach>
        
}


// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position,addr,bcyclLendNm,bcyclLendSe,operOpenHm,operCloseHm,rstde,chrgeSe,bcyclUseCharge,phoneNumber) {
	var clickImageSrc = "<c:url value='/images/chatbot/storage2.png'/>" ,
	    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	    clickMarkerImage = new kakao.maps.MarkerImage(clickImageSrc, imageSize),
		imageSrc = "<c:url value='/images/chatbot/storage1.png'/>" ,
 		markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    
    
    kakao.maps.event.addListener(marker, 'click', function() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setImage(markerImage); 
        }   
    	marker.setImage(clickMarkerImage);
    	$("#lendInfoTable tr th").eq(1).html(bcyclLendNm);
    	$("#lendInfoTable tr th").eq(3).html(addr);
    	$("#lendInfoTable tr th").eq(5).html(bcyclLendSe);
    	$("#lendInfoTable tr th").eq(7).html(operOpenHm);
    	$("#lendInfoTable tr th").eq(9).html(operCloseHm);
    	$("#lendInfoTable tr th").eq(11).html(rstde);
    	$("#lendInfoTable tr th").eq(13).html(chrgeSe);
    	$("#lendInfoTable tr th").eq(15).html(bcyclUseCharge);
    	$("#lendInfoTable tr th").eq(17).html(phoneNumber);

    	
  	});
    return;
}



// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다


</script>



