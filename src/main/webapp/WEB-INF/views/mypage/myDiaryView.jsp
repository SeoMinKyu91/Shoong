<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
h1, h2, h3, h4, h5, h6 {
  margin-top: 0;
  margin-bottom: 0.5rem;
}

p {
  margin-top: 0;
  margin-bottom: 1rem;
}
img {
  vertical-align: middle;
  border-style: none;
}
hr {
  margin-top: 1rem;
  margin-bottom: 1rem;
  border: 0;
  border-top: 1px solid rgba(0, 0, 0, 0.1);
}
.align-items-center {
  align-items: center !important;
}

.bg-light {
  background-color: #f8f9fa !important;
}
.no-gutters {
  margin-right: 0;
  margin-left: 0;
}
.img-fluid {
  width: 100%;
  height: auto;
}
.order-lg-first {
    order: -1;
  }
  
.projects-section {
  padding: 10rem 0;
}
.projects-section .featured-text {
  padding: 2rem;
}
@media (min-width: 992px) {
  .projects-section .featured-text {
    padding: 0 0 0 2rem;
    border-left: 0.5rem solid #64a19d;
  }
}
.projects-section .project-text {
  padding: 3rem;
  font-size: 90%;
}
@media (min-width: 992px) {
  .projects-section .project-text {
    padding: 5rem;
  }
  .projects-section .project-text hr {
    border-color: #64a19d;
    border-width: 0.25rem;
    width: 30%;
  }
}
.justify-content-center {
  justify-content: center !important;
}
.text-black-50 {
  color: rgba(0, 0, 0, 0.5) !important;
}
.d-none {
  display: none !important;
}
  .d-lg-block {
    display: block !important;
  }
.animated-text{
	display:none;
}
.slider-area{
	display:none;
}
.text{
	text-align: center;
	background-color: white;
	border: 30%;
}

</style>

	<div class="text">
        <h1>${diaryMap.DIARY_TITLE}</h1>
        <p>날짜 : ${diaryMap.DIARY_DATE}</p>
        <p>${diaryMap.DIARY_MAIN_CONTENT}</p>
        <p class="text-black-50 mb-0"></p>
    </div>
         <!-- Projects-->
        <section class="projects-section" id="projects">
            <div class="container">
                <!-- Featured Project Row-->
                <div>
                   <!-- 지도 넣을 곳 -->
                    <div><div id="map"></div></div>
                </div>
                
                <c:if test="${empty diaryImglist}" var="isEmpty">
                  <span>이미지 없음</span>
             </c:if>
             <c:if test="${!isEmpty}">
             <c:forEach var="item" items="${diaryImglist }" varStatus="status">
             <c:if test="${(status.count)%2==1}">
                <!-- Project One Row-->
                   <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
                       <div class="col-lg-6"><img class="img-fluid" src="/fileupload/${item.DIARY_IMG_NAME}" alt="" /></div>
                       <div class="bg-light col-lg-6">
                           <div class="bg-black text-center h-100 project">
                               <div class="d-flex h-100">
                                   <div class="project-text w-100 my-auto text-center text-lg-left">
                                       <h4>#${item.DIARY_IMG_TITLE}</h4>
                                       <hr class="d-none d-lg-block mb-0 ml-0" />
                                       <p>${item.DIARY_IMG_CONTENT}</p>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                </c:if>
                <c:if test="${(status.count)%2==0}">
                   <!-- Project Two Row-->
                   <div class="row justify-content-center no-gutters">
                       <div class="col-lg-6"><img class="img-fluid" src="/fileupload/${item.DIARY_IMG_NAME}" alt="" /></div>
                       <div class="col-lg-6 order-lg-first bg-light">
                           <div class="bg-black text-center h-100 project">
                               <div class="d-flex h-100">
                                   <div class="project-text w-100 my-auto text-center text-lg-left">
                                       <h4>#${item.DIARY_IMG_TITLE}</h4>
                                       <hr class="d-none d-lg-block mb-0 mr-0" />
                                       <p>${item.DIARY_IMG_CONTENT}</p>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                 </c:if>
                   </c:forEach>
                </c:if>
            </div>
        </section>


<script>
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

	
	//주소검색기 컨트롤러 얻어옴
	var geocoder = new MapboxGeocoder({
		accessToken : mapboxgl.accessToken,
		mapboxgl : mapboxgl
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