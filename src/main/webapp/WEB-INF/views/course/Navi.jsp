<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
	
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
	height:400px;
}


ul li{
	font-weight : bold;
	font-size: 1em;
}

ul li span{
	font-size: .8em;
	font-weight : normal;
	color:black;
}

.my-box{
	border: 5px lightgrey solid;
	list-style: none; 
	padding: 30px; 
	height:355px;
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
	width: 80%;
	max-width: 800px;
	height: 100%;
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
</style>
<div id="colorlib-main" style="padding:20px">
	<div class="row" style="padding-top: 50px; padding-left: 10px">
		<div class="col-xs-10 offset-xs-1 col-md-7" id="map"></div>
		<div class="col-xs-10 offset-xs-1 col-md-5" role="navigation">
			<ul class="nav nav-tabs" style="list-style:none">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#routeinfo">루트 정보</a></li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#routestop">루트 경유지</a></li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#placeinfo">관광 정보</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="routeinfo">
					<ul class="my-box">
						<li>
							<label for=" ">이름</label>
							<span>&emsp;유경이네</span>
						</li>
						<li>
							<label for=" ">공개</label>
							<span id="Private">&emsp;공개된 루트</span>
						</li>
						<li>
							<label for=" ">유형</label>
							<span>&emsp;자전거ㆍ일반</span>
						</li>
						<li>
							<label for=" ">등록</label>
							<span>&emsp;김유경 2021년 1월 13일 수요일 오전 1:40</span>
						</li>
						<li>
							<label for=" ">거리</label>
							<span>&emsp;000km(↑↓누적고도 +000m, -000m)</span>
						</li>
						<li>
							<label for=" ">특징</label>
							<span>&emsp;</span>
						</li>
						<li>
							<label for=" ">평가</label>
							<span>&emsp;아직 등록된 평점이 없습니다</span>
						</li>
						<li>
							<label for=" ">설명</label>
							<span>&emsp;유경이네 방문</span>
						</li>
					</ul>
				</div>
				<div class="tab-pane fade" id="routestop">
					<ul class="my-box">
						<li>
							<label for=" ">이름</label>
							<span>&emsp;유경이네</span>
						</li>
					</ul>
				</div>
				<div class="tab-pane fade" id="placeinfo">
					<ul class="my-box">
						<li>
							<label for=" ">이름</label>
							<span>&emsp;유경이네</span>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
		<div class="modal fade" id="naviModal" data-backdrop="false">
		     <div class="modal-dialog modal-lg" >
		         <div class="modal-content">
		             <div class="modal-header">
		                 <h4>사진 올리기</h4>
		             </div>
		             <div class="modal-body">
	                   	<div class="col-sm-12" style="margin-top:10px ">
		                  <form method="post" enctype="multipart/form-data" class="col-sm-12">
		                      <div id="fileUpload" class="dragAndDropDiv col-sm-12">
		                      	<span class="dragAndDropDivSpan">Drag & Drop Files Here</span>
		                      </div>
		                      <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
		                  </form>
		               	</div>
		            </div>
		            <div class="modal-footer"> 
	               		<form method="post" action="<c:url value="/pack/pictureInput.do"/>">
		               		<input class="form-control" name="imgArry" id="imgArry"  type="hidden">
		               		<!-- 
		               		<button type="submit" class="btn btn-default">Save</button>
		               		 -->   
		            	</form>
	                	<button type="button" class="btn btn-default">Load</button>
	                	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		            </div>
		        </div>
		    </div>
	    </div>
	</div>
	<div class="row" style="padding-top: 50px; padding-left: 10px">
		<div class="col-xs-10 offset-xs-1 col-md-7" id="graph"></div>
	</div>
</div>

<script>
//맵박스 토큰
$(function(){
	
	$('#naviModalBtn').click(function() {
		console.log('클릭모달버튼');
		$('#naviModal').modal();
	});
	
	mapboxgl.accessToken = 'pk.eyJ1Ijoid2t1bmdoOTMiLCJhIjoiY2tpd2hpNnZ0MHF3YzMwcnd5ZG1obzh2biJ9.EW26scaL6pDX7yQhFNnwMw';

	var monument = [ 126.87870025634767, 37.478732138068445 ];
	
	var imgarr = [];
	
	var map = new mapboxgl.Map({
		container : 'map',
		style : 'mapbox://styles/mapbox/streets-v11',
		center : monument,
		zoom : 16
	});

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
				console.log('data:%O',data.features[0]);
				json = data.features[0];
				
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
			}
		});
		
		$(".modal-footer button:eq(2)").click();
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
});
</script>