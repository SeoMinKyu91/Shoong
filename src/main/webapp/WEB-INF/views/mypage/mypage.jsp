<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Chart.js -->
<script src="<c:url value="/admin/js/Chart.min.js"/>"></script>

<style>
.animated-text{
	display:none;
}
.slider-area{
	display:none;
}
.myPageSection{
border:1px solid #bbbbbb;
margin : 10px;
padding: 10px;
}
.cardDiv{
   margin-top: 20px;
   }
.single-location{
   position:relative;
   }
.single-location .location-img{
   border-radius:10px;overflow:hidden;position:relative;z-index:0
}
.single-location .location-img::before
{
   position:absolute;width:100%;height:50%;bottom:0;content:"";z-index:1
}
.single-location .location-img img{
   width:100%;  height: 170px;transform:scale(1);transition:all .5s ease-out 0s
}
.single-location .location-details{
   width:100%;
   position:absolute;left:70%;bottom:-9px;-webkit-transition:all .2s ease-out 0s;
   -moz-transition:all .2s ease-out 0s;
   -ms-transition:all .2s ease-out 0s;-o-transition:all .2s ease-out 0s;transition:all .2s ease-out 0s
   }
.single-location .location-details .location-btn{
   padding:10px 20px;background:#fff;color:#333333;border-radius:30px;opacity:0;visibility:hidden;
   }
.card-body:hover .location-img img{
   transform:scale(1.1)
   }
.card-body:hover .location-details{
   bottom:7%
   }
.card-body:hover .location-details .location-btn{
   opacity:1;visibility:visible;
   }
.card-title{
   font-size: 20px;
}.card-body{
   padding: 5px;
   border:1px solid #eeeeee;
}
.lineMain{
   margin: 30px;
}
.badgeImg{
   border-radius: 50%;
   width:100px;
   height: 100px;
   margin-right: 15px;
}
#inlineInfo{
   background-color: white;
   box-shadow: 0px 0px 5px #787878;
   background-color: rgba( 255, 255, 255, 0.5 );
   border-radius: 10px;
   padding: 20px;
   margin: 10px;
}
.inlineInfo{
   background-color: white;
   box-shadow: 0px 0px 5px #787878;
   background-color: rgba( 255, 255, 255, 0.5 );
   border-radius: 10px;
   padding: 20px;
   margin: 10px;
}
.progbar{
   border: 1px solid #BDBDBD;
   border-radius: 10px;
   margin: 10px;
   background-color: white;
   width: 100%;
   padding: 10px;
}
.buttonbar{
   font-size: 1em;
   display: inline-block;
   margin-left: 30px;
}
.namebar{
   font-size: 15px;
}#id{
   height: 100px;
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
#loginCheck {
	background-color : #f32a48;
	color: white;
	border : none;
}
#loginCheck:hover {
	background-color: #f2f2f7;
}

</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt=""/>
   <div class="lineMain">
	   <!--뱃지사진 + 마일리지  -->
	   <div class="row col-xs-12" id="inlineInfo">
	         <div style="display: inline-block; width: 80%;">
	            <c:if test="${not empty sessionScope.userId}" var="isEmpty">		
	            												<!-- 이미지 넣기 -->		
		            <img class="badgeImg" src='<c:url value="/images/badge/speedBadge.png"/>' alt="뱃지이미지">      
		            <strong class="namebar">${sessionScope.userId}</strong>
		            <a href='<c:url value="/Member/myInfoEdit.do"/>' class="btn btn-primary" id="loginCheck">정보수정</a>
		        </c:if>		
		        <!--  
				<c:if test="${!isEmpty}">	
					<img class="badgeImg" src='<c:url value="/images/badge/speedBadge.png"/>' alt="뱃지이미지">      
		            <strong class="namebar">장동건</strong>
		            <a href='<c:url value="/Member/myInfoEdit.do"/>' class="btn btn-primary" id="loginCheck">정보수정</a>
	        	</c:if>-->
	         </div>
	         <!-- progress바 _ 부트스트랩 -->
		      <div class="row col-sm-12 ">
		         <div class= "col-sm-12 progbar">
		         <h4>이달의 마일리지</h4>
		            <div class="progress">																										<!-- 마일리지 넣기 -->
		              <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100" style="width: 68%">
		                 ${totalLength}km
		              </div>
		            </div>
		         </div>
		      </div>
	    </div>
	<!-- -<div class="row">
     <div class="col-xs-12 col-md-6">
     <!-- 나의 기록  -->
     <div class="row"> 
        <div class="col-xs-12 col-md-6">
         	<div class="inlineInfo  col-xs-12">
	    		<div class="myPageSection" style="background-color: white;"> 
		      		<h3>나의 기록<small>상세</small></h3>
		         	<canvas id="lineChart"></canvas>
	      		</div>
    		</div>
    		<div class="inlineInfo  col-xs-12">
	        	<div class="myPageSection" style="background-color: white;">       
	          		<h3>최근 라이딩<small><a href='<c:url value="/mypage/record/list.do"/>'>전체보기</a></small></h3>
			       	 <div  id="map"></div> 
			     </div>
   		 	</div>
    	</div>
     <div class="col-xs-12 col-md-6 ">
     	<div class="col-xs-12 inlineInfo ">
		<div class="row storyRow">
         <div class="col-md-12 ">
            <h3>다이어리<small><a href='<c:url value="/mypage/diary/list.do"/>'>전체보기</a></small></h3>
            <c:if test="${empty diaryList}" var="isEmpty">
            <h4>다이어리가 없어요.</h4>
            <button type="submit" class="btn btn-default">지금 달리러 가기</button>      
         </c:if>
         </div>
         <c:if test="${!isEmpty}">
            <c:forEach var="item" items="${diaryList}">        
               <div class="col-md-6 cardDiv">
            <article class="card shadow">
               <div class="card-body">
                  <div class="single-location mb-30">
                     <div class="location-img">
                        <c:if test="${empty item.DIARY_THUMBNAIL }" var="isEmpty">
                        <img src='<c:url value="/images/bg_1.jpg"/>' alt="다이어리">
                        </c:if>
                        <c:if test="${!isEmpty}">
                        <img src=/fileupload/${item.DIARY_THUMBNAIL} alt="다이어리 ">
                        </c:if>
                     </div>
                     <div class="location-details">
                        <span class="location-btn">
                           <span class="glyphicon glyphicon-camera" aria-hidden="true">&nbsp</span>${item.DIARY_IMG_COUNT}
                        </span>
                     </div>   
                  </div>
                   <div style="text-align: center;"><a href='<c:url value="/mypage/diary/view.do?diaryCode=${item.DIARY_CODE }"/>'>${item.DIARY_TITLE}</a></div>
                  </div>
            </article>
         </div>         
            </c:forEach>
         </c:if>
   				</div>
     		</div>
   		</div>
	</div> 
</div>





<script>
//색 투명도로 조절할 것
if ($('#lineChart').length){	
	 
	//var arrLables =["1일", "5일", "10일", "15일", "20일", "25일", "30일"];
	//var arrData =[2, 7, 15, 20, 30, 40,80];
	
	var arrLength =[];
	var arrDate =[];
	
	<c:if test="${!empty chartList}">
	 	<c:forEach var="item" items="${chartList}">        
	 		arrLength.push(${item.chartLength});
	 		arrDate.push("${item.chartDate}일");
	    </c:forEach>
 	</c:if>

	  var ctx = document.getElementById("lineChart");
	  var lineChart = new Chart(ctx, {
		type: 'line',
		data: {
		  labels: arrDate,
		  datasets: [{
			label: "주행거리(Km)",
			backgroundColor: "rgba(255, 100, 15, 0.31)",
			borderColor: "rgba(255, 100, 15, 0.7)",
			pointBorderColor: "rgba(255, 100, 15, 0.7)",
			pointBackgroundColor: "rgba(255, 100, 15, 0.7)",
			pointHoverBackgroundColor: "#fff",
			pointHoverBorderColor: "rgba(220,220,220,1)",
			pointBorderWidth: 1,
			data: arrLength,
		  }]
		},
	});
}//if()
		

function mapStart(){
	mapboxgl.accessToken = 'pk.eyJ1Ijoid2t1bmdoOTMiLCJhIjoiY2tpd2hpNnZ0MHF3YzMwcnd5ZG1obzh2biJ9.EW26scaL6pDX7yQhFNnwMw';

	var monument = [ 126.87870025634767, 37.478732138068445 ];
	
	var imgarr = [];

	var map = new mapboxgl.Map({
		container : 'map',
		style : 'mapbox://styles/mapbox/streets-v11',
		center : monument,
		zoom : 11
	})

	map.addControl(new MapboxDirections({
		accessToken : mapboxgl.accessToken
	}), 'bottom-left');
	
	//주소검색기 컨트롤러 얻어옴
	var geocoder = new MapboxGeocoder({
		accessToken : mapboxgl.accessToken,
		mapboxgl : mapboxgl
	});
	

	//맵박스 현재위치 컨트롤러
	map.addControl(new mapboxgl.GeolocateControl({
		positionOptions : {
			enableHighAccuracy : true
		},
		trackUserLocation : true
	}));
	
	//지오코더가 결과를 반환할 때 마커를 생성한다
	geocoder.on('result', function(data) {
		// Capture the result coordinates
		var point = data.result.center; 
		// Add the marker to the map at the result coordinates
		marker.setLngLat(point).addTo(map); 
	});
	
	mapRecordUpload(map);
	
}//mapStart()

function mapRecordUpload(map){
	map.on('load', function(){ // 이부분 있어야 바로 로드 가능
	<c:if test="${!empty mapRecord}">
	var data = ${mapRecord}
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
	map.setZoom(11);
</c:if>
});
}//mapRecordUpload()


$(function(){
mapStart();
})//로드시 스타트
</script>