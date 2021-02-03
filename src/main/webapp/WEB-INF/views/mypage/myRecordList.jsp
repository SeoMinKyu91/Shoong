<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.map {
	top: 0;
	bottom: 0;
	height:400px;
	width: 100%;
	height: 400px;
}
.animated-text{
	display:none;
}
.slider-area{
	display:none;
}
h1 {
	text-align: center;
}

</style>
    <h1>나의 라이딩</h1>
    <hr/><br/>

	<div class="container">
		<div class="row">
			<c:if test="${empty recordList }" var="isEmpty">
	                  <h3>기록이 없어요</h3>
	                  <button type="submit" class="btn btn-default">지금 달리러 가기</button>      
	         </c:if>
              <c:if test="${!isEmpty}">
                 <c:forEach var="item" items="${recordList }">
		           <div class= "col-xs-12 col-sm-6">
				     	<div class="myPageSection"> 
				     		<!-- 아래부분 추후 코스 상세보기로 바로 이동${item.COURSE_ID } 이용해서  -->      
					       <h3>${item.COURSE_NAME }<small><a href='<c:url value="/"/>'>${item.RECORD_DATE}</a></small></h3>
			       	 	<div class="map" id="${item.RECORD_ID }"></div>
				       	   <span> 총 거리 : ${item.RECORD_LENGTH }km </span>
			     	</div>
			       </div>	
	     		 </c:forEach>
	    	  </c:if>
		</div><!--row-->
	</div><!--cotainer-->
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
		var json = data.features[0];
		console.log('data:%O',data.features[0]);

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
				'line-color': '#ff0000',
				'line-width': 8
			}
		});
		map.setCenter(data.features[0].geometry.coordinates[0][0]);
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

