<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 
	prefix="fmt"%>
<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src='https://unpkg.com/@turf/turf/turf.min.js'></script>
<script src="<c:url value="/js/togeojson.js"/>"></script>

<style>
/*
.mapboxgl-popup {
	max-width: 200px;
}

.mapboxgl-popup-content {
	text-align: center;
	font-family: 'Open Sans', sans-serif;
}
*/

#map {
	top: 0;
	bottom: 0;
	height:500px;
}

.nav-link {
	color: #ff8827;
}

ul li{
	font-weight : bold;
	font-size: 1em;
	padding-bottom:10px;
}

ul li label{
	padding-right:10px;
}


.my-box{
	border: 5px lightgrey solid;
	list-style: none; 
	padding: 35px; 
	height:448px;
	background-color: white;
}

.mapboxgl-ctrl-geocoder {
	width: 30%;
	padding-left: 19px;
}

.mapbox-directions-component {
	width: 80%;
}

.single-location:hover .location-img img {
	transform: scale(1.1)
}

#graph
{
	max-width: 100%;
	height: 25vh;
	min-height: 200px;
}

.plusImage {
	float: right;
}

.plusImage button {
	border: none;
	background-color: #777777;
	color: white;
	padding: 5px;
	border-radius: 2px;
}

.modal-dialog {
      display: inline-block;
      vertical-align: middle;
}

.imgdiv {
	margin: 10px;
	display: inline-block;
	position: relative
}

.img {
	width: 200px;
	height: 176px;
}

.imgdeletemark {
	display: none;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.dragAndDropDiv {
	width: 100%;
	margin-top: 15px;
	height: 200px;
	border: 2px dashed #777777;
	color: #777777;
	text-align: center;
}

.dragAndDropDivSpan {
	line-height: 200px;
	vertical-align: middle;
	font-size: 150%;
}

.dragAndDropBtn {
	margin-top: 10px;
	border: 1px solid #777777;
	background-color: #ffffff;
	color: #777777;
	text-align: center;
	font-size: 100%;
}

#naviImgModal img {
	width: 100%;
}

.cus {
	border-top: 1px solid white;
	border-bottom: 1px solid white;
}
.cus th {
	border-top: 1px solid white;
	border-bottom: 1px solid white;
	background-color : #ff8827;
	color:white;
	font-size:1em;
}
.cus td {
	cursor: pointer;
}

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
.submitBtn {
	color:white;
	background-color: #ff8827;
	font-weight: bold;
	border: none;
}
.closeBtn{
	color:white;
	background-color: #ff8827;
	font-weight: bold;
	border: none;
}
.insertBtn{
	color:white;
	background-color: #ff8827;
	font-weight: bold;
	border: none;
}
#packNoticeForm{
	background-color: white;
	border : #ff8827 1px solid;
	border-radius: 10px;
}

#packNoticeEditForm{
	background-color: white;
	border : #ff8827 1px solid;
	border-radius: 10px;
}
.deleteBtn{
	color:white;
	background-color: #ff8827;
	font-weight: bold;
	border: none;
}
.editBtn{
	color:white;
	background-color: #ff8827;
	font-weight: bold;
	border: none;
}
.viewBtn{
	color:white;
	background-color: #ff8827;
	font-weight: bold;
	border: none;
}
.modal {
  text-align:center;
     position: fixed;
     left:25%
   }
@media screen and (min-width: 768px) {
  .modal:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}
</style>
<div id="colorlib-main" style="padding:20px">
	<!-- 본문 탭 시작 -->
	<div class="row" style="padding-top: 50px; padding-left: 10px">
		<div class="col-xs-10 offset-xs-1 col-md-7" id="map"></div>
		<div class="col-xs-10 offset-xs-1 col-md-5" role="navigation">
			<ul class="nav nav-tabs" style="list-style:none">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#courseList">코스 목록</a></li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#routeInfo">루트 정보</a></li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#recordList">내 기록</a></li>
			</ul>
			<div class="tab-content">
				<!-- 코스 리스트 시작 -->
				<!-- 기존에 있는 코스가 보임 -->
				<div class="tab-pane active" id="courseList">
					<div class="row">
						<div class="col-md-12">
							<table class="table table-hover cus">
								<tr>
									<th class="text-center col-lg-2 col-xs-1">번호</th>
									<th class="text-center col-lg-6 col-xs-6">제목</th>
									<th class="text-center col-lg-2 col-xs-2">작성자</th>
									<th class="text-center col-lg-2 col-xs-3">작성일</th>
								</tr>
								<c:if test="${empty list }" var="isEmpty">
									<tr class="text-center">
										<td colspan="4" class="test-center">등록된 게시물이 없어요</td>
									</tr>
								</c:if>
								<c:if test="${!isEmpty}">
									<c:forEach var="item" items="${list}" varStatus="loop">
										<tr class="text-center">
											<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
											<td class="text-left">${item.packNoticeTitle}</td>
											<td>${item.userName}</td>
											<td>${item.packNoticeDate}</td>
											<td style="display: none;">${item.packNoticeContent }</td>
											<td style="display: none;">${item.packNoticeNo }</td>
										</tr>
									</c:forEach>
								</c:if>	
							</table>
						</div>
					</div>
					<c:if test="${!empty manager }">
						<div class="row">
							<div class="col-lg-12 text-right">
								<button class="submitBtn btn" data-toggle="modal" id="btnNoticeWrite">등록</button>
			
							</div>
						</div>
					</c:if>
				</div>
				<!-- 코스 리스트 끝 -->
				<!-- 루트 등록 시작 -->
				<div class="tab-pane fade" id="routeInfo">
					<form action="<c:url value=''/>">
						<ul class="my-box">
							<li>
								<label for=" ">작성자</label>&emsp;
								<input type="text" id="userName" style="border:none" placeholder="작성자" readonly="readonly">
							</li>
							<li>
								<label for=" ">이름</label>&emsp;&emsp;
								<input type="text" id="courseName" style="border:#aaaaaa solid 1px; height:25px" placeholder="경로이름">
							</li>
							<li>
								<label for=" ">공개여부</label>
								<input type="radio" id="openNclose" name="openNclose"> 
									<span style="font-weight: normal;">공개</span>&emsp;
								<input type="radio" id="openNclose" name="openNclose">
									<span style="font-weight: normal;">비공개</span>
							</li>
							<li>
								<label for=" ">유형</label>&emsp;&emsp;
								<select
									name="cycleType" id="cycleType"
									style="border: #aaaaaa solid 1px; height:23px; font-weight: normal;color:#888888;">
									<option value="" style="color:#888888;">==선택하세요==</option>
									<option value="" style="color:#888888;">자전거유형1</option>
									<option value="" style="color:#888888;">자전거유형2</option>
									<option value="" style="color:#888888;">자전거유형3</option>
									<option value="" style="color:#888888;">자전거유형4</option>
								</select>
							</li>
							<li>
								<label for=" ">등록</label>&emsp;&emsp;
								<span></span>
							</li>
							<li>
								<label for=" ">거리</label>&emsp;&emsp;
								<span></span>
							</li>
							<li style="padding-bottom: 20px;">
								<label for=" ">설명</label><br/>
								<textarea rows="3" style="border:#aaaaaa solid 1px; width: 100%"></textarea>
							</li>
							<li>
								<button type="submit" class="btn btn-block" 
								style="color:white; background-color: #ff8827; border:#ff8827 solid 1px;float: right;">등록</button>
							</li>
						</ul>
					</form>
				</div>
				<!-- 루트 등록 끝 -->
				<!-- 레코드 리스트 시작 -->
				<!-- 레코드 중에서 코스로 등록하지 않은 레코드가 보임 -->
				<div class="tab-pane fade" id="recordList">
					<div class="row">
						<div class="col-md-12">
							<table class="table table-hover cus">
								<tr>
									<th class="text-center col-lg-2 col-xs-1">파일</th>
									<th class="text-center col-lg-6 col-xs-6">길이</th>
									<th class="text-center col-lg-2 col-xs-2">시간</th>
									<th class="text-center col-lg-2 col-xs-3">일자</th>
								</tr>
								<c:if test="${empty recordList}" var="isEmpty">
									<tr class="text-center">
										<td colspan="4" class="test-center">등록된 게시물이 없어요</td>
									</tr>
								</c:if>
								<c:if test="${!isEmpty}">
									<c:forEach var="item" items="${recordList}" varStatus="loop">
										<tr class="text-center">
											<td class="text-left">${item.fileName}</td>
											<td>${item.recordLength}km</td>
											<td>${item.duration}분</td>
											<td>
												<fmt:formatDate var="dResult" pattern="yy-MM-dd HH:mm" value="${item.recordDate}"/>
												<c:out value="${dResult}"/>
											</td>
											<td style="display: none;">${item.recordId}</td>
										</tr>
									</c:forEach>
								</c:if>	
							</table>
						</div>
					</div>
					<c:if test="${!empty manager }">
						<div class="row">
							<div class="col-lg-12 text-right">
								<button class="submitBtn btn" data-toggle="modal" id="btnNoticeWrite">등록</button>
			
							</div>
						</div>
					</c:if>
				</div>
				<!-- 레코드 리스트 끝 -->
			</div>
			
		</div>
		<!-- 본문 탭 끝 -->
		<div class="modal fade" id="naviModal" data-backdrop="false">
		     <div class="modal-dialog modal-lg" >
		         <div class="modal-content">
		             <div class="modal-header">
		                 <h4>기록 올리기</h4>
		             </div>
		             <div class="modal-body">
	                   	<div class="col-sm-12" style="margin-top:10px ">
		                  <form method="post" enctype="multipart/form-data" class="col-sm-12">
		                      <div id="fileUpload" class="dragAndDropDiv col-sm-12">
		                      	<span class="dragAndDropDivSpan">Drag & Drop Route Files Here</span>
		                      </div>
		                      <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
		                  </form>
		               	</div>
		            </div>
		            <div class="modal-footer"> 
	               		<form method="post" action="<c:url value="/pack/pictureInput.do"/>">
		               		<input class="form-control" name="imgArry" id="imgArry"  type="hidden">
		            	</form>
	                	<button type="button" class="btn btn-default">Load</button>
	                	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		            </div>
		        </div>
		    </div>
	    </div>
	</div>
	<!-- 높이 그래프 시작 -->
	<div class="row" style="padding-top: 50px; padding-left: 10px">
		<div class="col-xs-10 offset-xs-1 col-md-7" id="graph"></div>
	</div>
	<!-- 높이 그래프 끝 -->
	<!-- 관광정보 뿌리기 시작-->
	<!-- 관광정보 뿌리기 끝-->
	<!-- 코스 등록 모달창 시작 -->
	<div class="modal fade" id="noticeEdit" data-backdrop="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"style="margin: 5px;">코스 등록</h4>
				</div>
				<div class="modal-body">
					<form action="" class="bg-light p-5 contact-form" id="packNoticeForm">
						<div class="form-group">
							<input type="text" class="form-control" name="courseId"
								id="courseId" hidden="true" value="">
						</div>
						<label for="courseName" style="float: left;">코스 명</label>
						<div class="form-group">
							<input type="text" class="form-control" name="courseName"
								id="courseName" placeholder="코스명을 입력해주세요.">
						</div>
						<label for="courseCate" style="float: left;">코스 카테고리</label>
						<div class="form-group">
							<select class="form-control" name="cycleType" id="cycleType" >
								<option value="" style="color:#888888;">==선택하세요==</option>
								<option value="" style="color:#888888;">자전거유형1</option>
								<option value="" style="color:#888888;">자전거유형2</option>
								<option value="" style="color:#888888;">자전거유형3</option>
								<option value="" style="color:#888888;">자전거유형4</option>
							</select>
						</div>
						<label for="courseTime" style="float: left;">소요 예상 시간</label>
						<div class="form-group">
							<input type="text" class="form-control" name="courseTime"
								id="courseTime">
						</div>
						<label for="courseLength" style="float: left;">코스 길이</label>
						<div class="form-group">
							<input type="text" class="form-control" name="courseLength"
								id="courseLength">
						</div>
						<label for="courseIntro" style="float: left;">코스 소개 내용</label>
						<div class="form-group">
							<textarea cols="30" rows="7" class="form-control"  name="courseIntro" id="courseIntro">
							</textarea>
						</div>
					</form>
				</div>
	
				<div class="modal-footer">
					<button type="button" class="insertBtn btn" data-dismiss="modal" id="btnWriteOk">코스 등록</button>
					<button type="button" class="insertBtn btn" data-dismiss="modal" id="btnNoticeWriteClose">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 코스 등록 수정 모달창 끝 -->
	
	<!-- 기록 삭제 모달창 시작 -->
	<div class="modal fade" id="noticeDelete" data-backdrop = "false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">나의 기록 삭제</h4>
				</div>
				<div class="modal-body">
					<h4 class="text-center">정말로 삭제하시겠습니까?</h4>	
					<form action="" class="bg-light p-5 contact-form" id="packNoticeDeleteForm" style="display: none;">
						<div class="form-group">
							<input type="hidden" class="form-control" name="packNoticeNo" id="packNoticeDeleteNo" value="">
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="deleteBtn btn" data-dismiss="modal" id="btnNoticeDeleteOk">기록 삭제</button>
					<button type="button" class="deleteBtn btn" data-dismiss="modal" id="btnNoticeDeleteClose">닫기</button>
					
				</div>
			</div>
		</div>
	</div>
	<!-- 기록 삭제 모달창 끝 -->
	
	<!-- 기록 상세보기 모달창 시작 -->
	<div class="modal fade" id="noticeView" data-backdrop="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div id="mdNo"></div>
					<div id="mdPostdate"></div>
				</div>
	
				<div class="modal-body" style="height: 400px;">
					<div class="row" style="margin: 10px;">
						<div id="mdUserID"></div>&nbsp;&nbsp;
						<div id="mdTitle"></div><br /><br />
						<div id="map2" style="height: 300px; padding-top: 20px; width: 550px; padding-top:20px;"></div>
					</div>
				</div>
	
				<div class="modal-footer">
					<button class="viewBtn btn" data-toggle="modal" id="btnNoticeEdit">코스 등록</button>
					<button class="viewBtn btn" data-toggle="modal" id="btnNoticeDelete">기록 삭제</button>
					<button type="button" class="closeBtn btn" data-dismiss="modal" id="btnNoticeViewClose">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 기록 상세보기 모달창 끝 -->
	</div>

<script>
//날자 계산
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

$(function(){
	$.ajax('<c:url value="/courseTest/gpxkml/address.kml"/>').done(function(xml){ 
	    console.log(toGeoJSON.kml(xml)); 
	});
	
	$.ajax('<c:url value="/courseTest/gpxkml/20201018_114312.gpx"/>').done(function(xml){ 
	    console.log(toGeoJSON.gpx(xml)); 
	});
	
	$('#naviModalBtn').click(function() {
		console.log('클릭모달버튼');
		$('#naviModal').modal();
	});
	//맵박스 토큰
	mapboxgl.accessToken = 'pk.eyJ1Ijoid2t1bmdoOTMiLCJhIjoiY2tpd2hpNnZ0MHF3YzMwcnd5ZG1obzh2biJ9.EW26scaL6pDX7yQhFNnwMw';

	var monument = [ 126.87870025634767, 37.478732138068445 ];
	
	var imgarr = [];
	
	var map = new mapboxgl.Map({
		container : 'map',
		style : 'mapbox://styles/mapbox/streets-v11',
		center : monument,
		zoom : 16
	});
	
	var map2 = new mapboxgl.Map({
		container : 'map2',
		style : 'mapbox://styles/mapbox/streets-v11',
		center : monument,
		zoom : 12
	});
	
	map2.getCanvas().style.width = '550px';
	map2.getCanvas().style.marginTop = '20px';
	
	/*
	//행정구역 별 구분선 추가
	map.on('load',function() {
		map.addSource('states',{
					'type' : 'geojson',
					'data' : 'https://raw.githubusercontent.com/vuski/admdongkor/master/ver20201001/HangJeongDong_ver20201001.geojson'
					});
		}
	);
	 */

	//맵박스 다이렉션 컨트롤러 추가
	map.addControl(new MapboxDirections({
		accessToken : mapboxgl.accessToken
	}), 'bottom-left');
	
	//주소검색기 컨트롤러 얻어옴
	var geocoder = new MapboxGeocoder({
		accessToken : mapboxgl.accessToken,
		mapboxgl : mapboxgl
	});
	
	map.on('load',function(){
		$('.mapboxgl-ctrl-geocoder--input').prop('placeholder','검색');
	});

	/**/
	//맵박스 지오코더 컨트롤러 추가
	map.addControl(geocoder, 'top-left');

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
	
	//geojson
	var json;
	
	//load
	$(".modal-footer button:eq(0)").click(function() {
		console.log("로드 버튼 누름");
		
		$.ajax({
			url:"<c:url value='/course/routeLoad'/>",
			type:"post",
			dataType:"json",
			data:{
				"fileName":$('#imgArry').val()
			},
			success:function(data){
				console.log('요청 성공');
				//console.log('data:%O',data.features[0]);
				console.log('data:%O',data);
				//json = data.features[0];
				json = data;
				
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
				map.setCenter(json.geometry.coordinates[0][0]);
				map.setZoom(11);
				
				var length = turf.length(json, {units: 'kilometers'});
				console.log('lenght:',length);
				
				//등록,거리
				$('.form-horizontal li:eq(4) span').html(new Date().format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));
				$('.form-horizontal li:eq(3) span').html(length+"km");
				
				$('#naviModal').modal("toggle");
			}
		});
		
// 		$(".modal-footer button:eq(2)").click();
	});
	
	// 이미지 다운로드 모달 정보 변경 
	$(".galleryImg").click(function() {
		var fileName = $(this).next().val()
		var imgDownloadHref = '<c:url value="/pack/fileDownload.do?filename='
				+ fileName + '"/>'
		var imgDeleteHref = '<c:url value="/pack/fileDelete.do?filename='
				+ fileName + '"/>'
		$("#fileDownloadATag").attr("href", imgDownloadHref)
		$("#fileDeleteATag").attr("href", imgDeleteHref)
		$('#galleryImgModal').html($(this).html());
		$('#galleryViewModal').modal();
	});

	//이미지 드래그앤 드랍.
	var objDragAndDrop = $(".dragAndDropDiv");

	$(document).on("dragenter", ".dragAndDropDiv", function(e) {
		e.stopPropagation();
		e.preventDefault();
		$(this).css('border', '2px solid #0B85A1');
	});
	$(document).on("dragover", ".dragAndDropDiv", function(e) {
		e.stopPropagation();
		e.preventDefault();
	});
	$(document).on("drop", ".dragAndDropDiv", function(e) {
		$(this).css('border', '2px dotted #0B85A1');
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		if (files.length > 1) {
			alert('루트는 1개까지 올릴 수 있습니다.');
			return;
		}
		var size = $("#imgArry").val().split(",").length + files.length;
		console.log(size)
		if (size > 2) {
			alert('루트는 1개까지 올릴 수 있습니다.');
			return;
		}

		handleFileUpload(files, objDragAndDrop);
	});

	//1]drag 영역 클릭시 파일 선택창
	$(".dragAndDropBtn").on('click', function(e) {
		$('input[type=file]').trigger('click');
	});
	$('input[type=file]').on('change', function(e) {
		var files = e.originalEvent.target.files;
		handleFileUpload(files, objDragAndDrop);
	});
	//1-1]만들어진 다이브 클릭시는 삭제 

	//2]서버에 파일 전송 메소드
	function handleFileUpload(files, obj) {
		for (var i = 0; i < files.length; i++) {
			var fd = new FormData();
			fd.append('file', files[i]);
			sendFileToServer(fd);
		}
	}

	var rowCount = 0;

	//4] Ajax 이용 해서 서버에 이미지 저장하는 핵심로직
	
	function sendFileToServer(formData) {
		var extraData = {}; //Extra Data.
		var jqXHR = $.ajax({
			url : "<c:url value='/course/fileUpload'/>",
			type : "POST",
			contentType : false,
			processData : false,
			cache : false,
			data : formData,
			dataType : 'json',
			success : function(data) {
				console.log(data);
				imgarr.push(data.fileName);
				imageDivShow()
			}
		});

	}//파일저장 

	//5] Ajax 이용 해서 서버에 이미지 삭제하기 
	function deleteFileToServer(filename) {
		$.ajax({
			url : "<c:url value="/pack/filedelete/post"/>",//요청할 서버의 URL주소
			type : 'post',//데이타 전송방식(디폴트는 get방식) 
			dataType : 'text',//서버로 부터 응답 받을 데이타의 형식 설정
			data : "filename=" + filename,
			success : function(data) {
				console.log(data);
				imgarr.splice(imgarr.indexOf(filename), 1);
				imageDivShow();
				if(map.getSource('route')) {
					map.removeLayer('route');
					map.removeSource('route');
				}
			},
			error : function(error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
				console.log('에러 : ', error.responseText);
			}
		});
	}

	//6]파일 추가 삭제 후 다이브 다시띄우기.
	function imageDivShow() {
		var str = '';
		for (var i = 0; i < imgarr.length; i++) {
			str += "<div class='imgdiv' id='"+imgarr[i]+"'><img class='img'  src=/fileupload/"+imgarr[i]+"><div class='imgdeletemark'>삭제</div></div>";
		}
		$("#fileUpload").html(str);
		//이미지에 호버 이벤트 걸기
		$(".imgdiv").hover(function() {
			$(this).children().eq(1).css("display", "block");
			$(this).children().eq(0).css("opacity", 0.4);
		}, function() {
			$(this).children().eq(1).css("display", "none");
			$(this).children().eq(0).css("opacity", 1.0);
		});
		$(".imgdiv").click(function() {
			deleteFileToServer($(this).attr('id'))
		});

		$('#imgArry').val(imgarr);
	}
	
	$('#btnNoticeWrite').on('click', function(e) {
		console.log('버튼 클릭');
		$('#noticeWrite').modal('show');
	})
	

	$('#btnNoticeWriteClose').on('click', function() {
		$('#noticeWrite').modal('hide');
	})
	
	
	$('#btnWriteOk').click(function() {
		console.log("등록하기 버튼 클릭");
		if ($('#packNoticeTitle').val() == "") {
			$('#packNoticeTitle').focus();
			return;
		} else if ($('#packNoticeContent').val() == "") {
			$('#packNoticeContent').focus();
			return;
		}
		//form태그의 action속성 및 method속성 설정
		$('#packNoticeForm').prop({
			action : '<c:url value="/pack/notice/write.do"/>',
			method : 'post'
		});
		//폼객체의 submit()함수로 서버로 전송
		$('#packNoticeForm').submit();
	});
	
	
	var fileName = "";
	var recordDate = "";
	var recordLength = "";
	var recordDuration = ""
	var recordNo = "";
	
	//테이블 클릭시 모달창 띄우기
	//공지사항 상세보기  속성값 설정 해주기
	$("#recordList .cus tr").click(function(){
		$('.viewBtn').show();
		var userId = "<c:out value='${sessionScope.userId}'/>";
		console.log('테이블 a태그 클릭',userId);
		fileName = $(this).children().eq(0).text();
		recordLength = $(this).children().eq(1).text();
		recordDuration = $(this).children().eq(2).text();
		recordDate = $(this).children().eq(3).text();
		recordNo = $(this).children().eq(4).text();
		
		/*
		if(userId === title){
			console.log(userId,'와',title);
			//$('.viewBtn').attr("hidden","false");
			$('.viewBtn').show();
		} else {
			console.log(userId,'와',title,'달라');
			$('.viewBtn').hide();
		}
		*/
		
		$("#mdNo").append("파일 : " + fileName);
		$("#mdUserID").append("길이 : " + recordLength);
		$("#mdTitle").append("시간 : " + recordDuration);
		$("#mdPostdate").append("일자 : " + recordDate);
		$("#mdContent").append(""+recordNo);
		
		$('#noticeView').modal('show');
	});
	
	//공지사항 상세보기 모달 내용 삭제
	$("#btnNoticeViewClose").click(function(){
		modalContentDelete();
	});
	
	//공지사항 수정 모달
	$('#btnNoticeEdit').click(function(){
		console.log("수정 모달창 들어옴");
		console.log("팩수정 모달창 packNoticeNo:"+recordNo)
		$("#courseId").attr("value",fileName);
		$("#courseTime").attr("value",recordDuration);
		$("#courseLength").attr("value",recordLength);
		//$("#packNoticeEditTitle").attr("value",title);
		
		$('#noticeView').modal('hide');
		modalContentDelete();
		$('#noticeEdit').modal('show');
	});
	
	//공지사항 수정 닫기 모달
	$('#btnNoticeEditClose').click(function(){
		$("#packNoticeEditContent").text("");
	});
	
	
	//공지사항 수정 완료
	$('#btnNoticeEditOk').click(function() {
		console.log("수정하기 버튼 클릭");
		if ($('#packNoticeEditTitle').val() == "") {
			$('#packNoticeEditTitle').focus();
			return;
		} else if ($('#packNoticeEditContent').val() == "") {
			$('#packNoticeEditContent').focus();
			return;
		}
		//form태그의 action속성 및 method속성 설정
		$('#packNoticeEditForm').prop({
			action : '<c:url value="/pack/notice/Edit.do"/>',
			method : 'post'
		});
		//폼객체의 submit()함수로 서버로 전송
		$('#packNoticeEditForm').submit();
	});
	
	
	//공지사항 삭제하기
	$('#btnNoticeDelete').on('click', function(e) {
		console.log('버튼 클릭');
		console.log(packNoticeNo);
		
		$('#packNoticeDeleteNo').attr("value",packNoticeNo);
		
		$('#noticeView').modal('hide');
		$('#noticeDelete').modal('show');

	})

	$('#btnNoticeDeleteClose').on('click', function() {
		$('#noticeDelete').modal('hide');
		modalContentDelete();
	})
	
	
	$('#btnNoticeDeleteOk').click(function() {
		console.log("삭제하기 버튼 클릭");
		console.log($('#packNoticeDeleteNo').val())
		
		
		//form태그의 action속성 및 method속성 설정
		$('#packNoticeDeleteForm').prop({
			action : '<c:url value="/pack/notice/delete.do"/>',
			method : 'post'
		});
		//폼객체의 submit()함수로 서버로 전송
		$('#packNoticeDeleteForm').submit();
	});
	
	//공지사항 상세보기 모달내용 삭제 함수
	function modalContentDelete(){
		console.log("모달 닫기 클릭");
		attrDelete();
		
		
		$("#mdNo").text("");
		$("#mdUserID").text("");
		$("#mdTitle").text("");
		$("#mdPostdate").text("");
		$("#mdContent").text("");
	}
	
	function attrDelete(){
		no = "";
		title = "";
		user = "";
		postdate = "";
		content ="";
		packNoticeNo ="";
	}
	
});
</script>