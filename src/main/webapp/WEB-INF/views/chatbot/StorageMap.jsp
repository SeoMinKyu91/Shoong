<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
.map_wrap {position:relative;width:100%;height:500px;}
#markerImg{
   width:100%;
   height: 100%;
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
}img {
	width: 50px;
}
</style>
<div style="margin-bottom: 150px;font-family: 'Noto Sans KR', sans-serif; ">
	<h2>[${location}] 자전거 보관소</h2>
	<br>
	<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	</div>
		
		<img src="<c:url value='/images/chatbot/storage1.png'/>" />
		공기주입기 있음
		<img src="<c:url value='/images/chatbot/storage2.png'/>" />
		공기주입기 없음
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaa4b242f112a823dd2ef5541569589&libraries=services"></script>

<script>
// 마커를 담을 배열입니다
console.log("${storageList}")
var marker = null;
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${storageList[0].lat},${storageList[0].lng}), // 지도의 중심좌표
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
	
	<c:forEach var="item" items="${storageList}">
		//마커가 표시될 위치입니다  
		markerPosition  = new kakao.maps.LatLng(${item.lat}, ${item.lng}); 
		//마커 이벤트
		if("${item.airinjectoryn}" == "Y"){
		    var imageSrc = "<c:url value='/images/chatbot/storage1.png'/>" // 마커 이미지 url, 
		}else{
			var imageSrc = "<c:url value='/images/chatbot/storage2.png'/>" // 마커 이미지 url, 
		}
		addMarker(markerPosition,imageSrc,"${item.addr}")	
	</c:forEach>
        
}


// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position,imageSrc,addr) {

     var  imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    
    kakao.maps.event.addListener(marker, 'mouseover', function() {
	    	displayInfowindow(marker, addr);
		
	});
	kakao.maps.event.addListener(marker, 'mouseout', function() {
	    	infowindow.close();
	});
	
    return;
}



// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker,addr) {
	
	var content = '<div style=" background-color:#d6ecff">';
		content += addr;
		content += '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
    
}


</script>



