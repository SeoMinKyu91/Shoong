<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.map {
	top: 0;
	bottom: 0;
	height: 400px;
	width: 100%;
	height: 400px;
}

.animated-text {
	display: none;
}

.slider-area {
	display: none;
}

h1 {
	text-align: center;
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

.mainDiv {
	border-radius: 10px;
	box-shadow: 0px 0px 5px #787878;
	padding: 30px;
	background-color: white;
	position: relative;
	z-index: 1;
	overflow: auto;
}
.container{
	overflow: auto;
}
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div class="mainDiv">

	<h1>나의 라이딩</h1>
	<hr />
	<br />

	
		<div class="row">
			<c:if test="${empty recordList }" var="isEmpty">
				<h3>기록이 없어요</h3>
				<button type="submit" class="btn btn-default">지금 달리러 가기</button>
			</c:if>
			<c:if test="${!isEmpty}">
				<c:forEach var="item" items="${recordList }">
					<div class="col-xs-12 col-sm-6">
						<div class="myPageSection">
							<!-- 아래부분 추후 코스 상세보기로 바로 이동${item.COURSE_ID } 이용해서  -->
							<h3>${item.COURSE_NAME }<small><a
									href='<c:url value="/"/>'>${item.RECORD_DATE}</a></small>
							</h3>
							<div class="map" id="${item.RECORD_ID }"></div>
							<span> 총 거리 : ${item.RECORD_LENGTH }km </span>
						</div>
					</div>
				</c:forEach>
			</c:if>
	
		<!--row-->
	</div>
</div>
<!--cotainer-->
<script>
// 너무 느리다.. 방법이 없나 생각해보기.. 레코드 뽑는 개수 지정?
function mapStart(recordId,mapRecord){
	mapboxgl.accessToken = 'pk.eyJ1Ijoid2t1bmdoOTMiLCJhIjoiY2tpd2hpNnZ0MHF3YzMwcnd5ZG1obzh2biJ9.EW26scaL6pDX7yQhFNnwMw';

	var monument = [ 126.87870025634767, 37.478732138068445 ];
	
	var map = new mapboxgl.Map({
		container : String(recordId),
		style : 'mapbox://styles/mapbox/streets-v11',
		center : monument,
		zoom : 10
	})

	var geocoder = new MapboxGeocoder({
		accessToken : mapboxgl.accessToken,
		mapboxgl : mapboxgl
	});

	//mapRecordUpload(map);
	map.on('load', function(){ // 이부분 있어야 바로 로드 가능
		
		var data = mapRecord
		var json = data;
		console.log('data:%O',json);

		map.addSource('route', {
			"type":"geojson",
			"data":json
		});
		map.addLayer({
			'id': 'route',
			'type': 'line',
			'source': 'route',
			'layout': {
				'line-join': 'round',
				'line-cap': 'round'
			},
			'paint': {
				'line-color' : '#24d900',
				'line-width' : 3
			}
		});
		map.setCenter(json.geometry.coordinates[0][0]);
		map.setZoom(10);
	})
}//mapStart()


$(function(){

<c:if test="${!empty recordList }" var="isEmpty">
	<c:forEach var="item" items="${recordList }">
	   
		mapStart(${item.RECORD_ID },${item.mapRecord });

	</c:forEach>
</c:if>

});
</script>

