<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.slider-area {
	display: none;
}

.packCreateBtn {
	color: #f32a48;
	background: none;
	font-weight: bold;
	font-size: 1.2em;
	border: #f32a48 1px solid;
}

.packCreateBtn:hover {
	color: white;
}

.packMainBtn {
	color: #f32a48;
	background: none;
	font-weight: bold;
	border: #f32a48 1px solid;
}

.packMainBtn:hover {
	color: white;
}

.MyPackBtn {
	color: #f32a48;
	background: none;
	font-weight: bold;
	border: #f32a48 1px solid;
}

.MyPackBtn:hover {
	color: white;
}

.joinPackBtn {
	background-color: #f32a48;
	color: white;
	border: none;
}

.joinPackBtn:hover {
	color: white;
}

#tbPack:hover {
	background-color: #fff0f2;
}

#packJoinModalBtn {
	background-color: #f32a48;
	color: white;
	border: none;
}

#packJoinModalBtn:hover {
	color: white;
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
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div
	style="border-radius: 10px; box-shadow: 0px 0px 5px #787878; padding: 30px; background-color: white; position: relative; z-index: 1;">
	<div class="row">
		<div class="col-xs-12 col-lg-12" style="padding-bottom: 20px">
			<div class="">
				<a class="packMainBtn btn" href="<c:url value="/pack/main.do"/>"
					style="margine-right: 20px">HOME</a>
				<c:if test="${!empty sessionScope.packId}">
					<a class="MyPackBtn btn" href="<c:url value="/pack/view.do"/>">MY
						PACK</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-lg-12">
			<div id="map"
				style="height: 400px; width: 100%; overflow: hidden; position: relative; margine-top: 50px;"></div>
			<p style="color: grey; font-size: .8em">지도를 클릭 시 클릭 된 지점을 기준으로
				검색(별 모양 마커를 움직이세요)</p>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-lg-12 PackMainTop">
			<table class="col-xs-12 col-md-12">
				<tr>
					<th colspan="2" class="text-left">
						<form class="form-inline" method="post"
							action="<c:url value="/pack/main.do"/>">
							<div class="packAddr" style="font-size: 30px;">
								<span
									style="font-size: .8em; font-weight: bold; padding-left: 10px;">[<span
									id="packRegionSearch"></span>] 근처 팩
								</span> &nbsp;
							</div>
							<input type="text" class="form-group" name="searchWord"
								style="width: 200px; height: 30px; border-radius: 10px; border-color: #333333;" />
							<button class="searchBtn"
								style="border: none; background-color: white; font-size: 30px;">
								<img class="btn-img" src='<c:url value="/images/search.png"/>'
									style="width: 25px; height: 25px;" />
							</button>
						</form>
					</th>
					<th><a class="packCreateBtn btn" style="float: right;"
						href="<c:url value="/pack/create.do"/>">팩 만들기</a></th>
				</tr>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-lg-12" style="margin-top: 20px;">
			<c:if test="${empty packList }" var="isEmpty">
				<h3
					style="height: 40px; font-size: 20px; text-align: center; line-height: 20px;">해당하는
					팩이 없어요.</h3>
			</c:if>
			<c:if test="${!isEmpty}">
				<c:forEach var="item" items="${packList }">
					<div>
						<table class="col-xs-12 col-lg-12">
							<tr id="tbPack">
								<th class="col-xs-3 col-lg-1"><img style="width: 100%;"
									src="<c:url value="/images/pack/${item.packThumbnail}"/>"
									alt="팩 마크"></th>
								<th style="height: 40px; font-weight: light; line-height: 20px;"><span
									style="font-size: 1.2em; font-weight: bolder;">${item.packName}</span><br />${item.packTag}&emsp;#${item.packActTime}&emsp;#${item.packAge}<br />${item.packIntro}</th>
								<th colspan="2" class="text-right">
									<button class="btn joinPackBtn" id="${item.packID}"
										style="margin-top: 10px; font-weight: bold; color: white; border: none; background-color: #f32a48;">가입</button>
								</th>
								<th colspan="2"><hr /></th>
							</tr>
							<tr>
								<th colspan="3"><hr /></th>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
<!-- 모달 -->
<div class="modal fade" id="packJoinModal" data-backdrop="false">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<div class="col-sm-12" id="galleryImgModal" style="margin-top: 10px">
					<span id="packJoinSpan" style="font-size: 20px;">가입 신청
						하시겠습니까?</span>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" id="packJoinModalBtn">신청</button>
				<button type="button" class="btn btn-default" id="packJoinModalBtn"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 모달 -->

<script>
   $(function(){
	   	jQuery.noConflict();
        var packId="";
        $(".joinPackBtn").click(function(){
           packId = $(this).attr("id")
           $('#packJoinModal').modal();
        });
        
        $('#packJoinModalCloseBtn').click(function(){
        	$('#packJoinModal').modal('hide');
        	$('#packJoinSpan').html('가입 신청 하시겠습니까?');
        	$('#packJoinModalBtn').css('display','inline-block');
        })
/*
         $(function() {
            $("#accordion").accordion({
                  collapsible: true,
                  active: false,
                  animate:500,
                  icons: false
            });
            //게터 호출
            var animate = $("#accordion").accordion("option", "animate" );
            //세터-accordion()함수 다음에
            $("#accordion").accordion( "option", "animate", 1000 );
         });
*/         
         
         
         $("#packJoinModalBtn").click(function(){
            $.ajax({
               url:"<c:url value="/pack/joinPack.do"/>",//요청할 서버의 URL주소
               type:'post',//데이타 전송방식(디폴트는 get방식) 
               dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
               data: "packId="+packId,
               success:function(data){
            	   $('#packJoinModalBtn').css('display','none');
                   $("#packJoinSpan").html("가입신청이 완료되었습니다.");
                  
               },
               error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
                  $("#packJoinSpan").html("죄송합니다. 다시시도해주세요")
               }
            })
         });
        var map;
         var clusterer;
         var markerLat;
         var markerLng;
         var geocoder = new kakao.maps.services.Geocoder(); 
         //0]사용자 위치 구하기
         
         
         if (navigator.geolocation) {
               var options = { timeout: 3000, maxinumAge: 5000 };
              navigator.geolocation.getCurrentPosition(successCallback,error);
            }
      
          
          //0-1]사용자 위치 구하기 성공시 좌표값 displayKaKaoMap로 넘김
          function successCallback(position) {
              
               <c:if test="${empty searchLat}" var="isEmpty">
                  var lat = position.coords.latitude;
                  var lng = position.coords.longitude;
               displayKaKaoMap(lat, lng);    
            </c:if>
            <c:if test="${!isEmpty}">
                displayKaKaoMap(${searchLat},${searchLng});
            </c:if>
              
               //if문
               
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
                   center: new kakao.maps.LatLng(lat, lng), // 현재 위치 중심으로 지도의 중심좌표
                   level:11
               };

               map = new kakao.maps.Map(mapContainer, mapOption); 
               //맵 컨트롤
               var mapTypeControl = new kakao.maps.MapTypeControl();
              // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의! TOPRIGHT는 오른쪽 위
              map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
              // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
              var zoomControl = new kakao.maps.ZoomControl();
              map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
             //클러스터 
              clustererCreate();
              //주소
             searchAddrFromCoords(map.getCenter(), displayCenterInfo);
             displayCentermarker(map);
             addeventmap(map);
         }
         
          /////
          function clustererCreate(){
             
              clusterer = new kakao.maps.MarkerClusterer({
                     map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
                     averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
                     minLevel: 8// 클러스터 할 최소 지도 레벨 
                });
              // 데이터에서 좌표 값을 가지고 마커를 표시합니다

             var markerPosition= null;
             var marker=null;
               <c:forEach var="item" items="${packList }">
               
                  // 마커가 표시될 위치입니다  
                  markerPosition  = new kakao.maps.LatLng(${item.packLat}, ${item.packLng}); 
                  
                  // 마커를 생성합니다
                  marker = new kakao.maps.Marker({
                      position: markerPosition
                  });
                  
                  clusterer.addMarker(marker);      
               </c:forEach>

             }
          
          /////////////////////////////주소 관련 ////////////////////
          //주소 클릭 마커 없앨시 삭제
         var marker;
         
         function displayCentermarker(map){
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
            var imageSize = new kakao.maps.Size(24, 35); 
             var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
             //마커생성
             marker = new kakao.maps.Marker({ 
                   position: map.getCenter(),
                   image : markerImage 
            }); 
             //마커 셋팅
            marker.setMap(map);
          }   
          //주소 클릭 마커 없앨시 삭제
          
          
          //지도에 이벤트를 등록합니다
          function addeventmap(map) {
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                
                   //주소 클릭 마커 없앨시 삭제
                     marker.setPosition(mouseEvent.latLng);
                     marker.setMap(map);
                     //주소 클릭 마커 없앨시 삭제
                     markerLat = mouseEvent.latLng.getLat();
                     markerLng = mouseEvent.latLng.getLng();
                     //
                     searchAddrFromCoords(mouseEvent.latLng, displayCenterInfo);
         
           }); 
          }

          function searchAddrFromCoords(coords, callback) {
              geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);     
          }

          //행정동 위치 구해서 띄어주느 함수 
          var firstAccess = false;
          function displayCenterInfo(result, status) {

             if (status === kakao.maps.services.Status.OK) {
                  var Region = document.getElementById('packRegionSearch');

                  for(var i = 0; i < result.length; i++) {
                      // 행정동의 region_type 값은 'H' 이므로
                      if (result[i].region_type === 'H') {
                         var regionArray = result[i].address_name.split(" ");
                         var resionCut = regionArray[0]+" "+regionArray[1];
                         if(resionCut!=Region.innerHTML){
                            Region.innerHTML =resionCut;
                            if(firstAccess){
                            reSearch(resionCut);
                            }
                            firstAccess = true;
                         }
                          break;
                      }
                  }
              } 
              
          }

          function reSearch(searchRegion) {
             location.href = "<c:url value='/pack/main.do?lat="+markerLat+"&lng="+markerLng+"&searchRegion="+searchRegion+"'/>";
          }
   });

</script>