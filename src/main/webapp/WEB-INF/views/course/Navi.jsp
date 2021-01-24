<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
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
	height:455px;
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
				<div class="tab-pane active" id="routeinfo">
					<form class="form-horizontal" method="post" name="join" onsubmit="return checked()"
					style="background-color: white; box-shadow: 0px 0px 5px #000; border-radius: 100px;"
					action="<c:url value='/Member/Join.do'/>">
						<div class="form-group">
							<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2"
								style="padding-top: 40px; padding-bottom: 40px; text-align: center">
								<h3 style="font-weight: bold">회원 가입</h3>
							</div>
							<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2">
								<!-- 작성자 입력란 -->
								<label for="userId"> 작성자 </label>
								<br /> 
								<input type="text" id="userId" name="userId"
								style="font-size: .8em; height: 50px; width: 34.5%"
								readonly="readonly"> 
							</div>
						</div>
						<!--  입력란 -->
						<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
							<label for="userPWD">비밀번호<span style="font-size: .8em">&nbsp;(4~12자의 영문 대소문자와 숫자로만 입력)</span></label> <input type="password" 
								class="form-control input-sm" id="userPWD" name="userPWD" minlength="4" maxlength="12"
								style="font-size: .8em" placeholder="비밀번호를 입력하세요"> 
						</div>
						<!--  입력란 -->
						<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
							<select name="emailStr" id="emailStr"
									style="font-size: .8em; height: 50px; width: 30%; border: #ced4da 1.5px solid; color: #7e757d">
									<option value="">==선택하세요==</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="1">직접입력</option>
							</select> <br />
						</div>
						<!-- 이름 입력란 -->
						<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
							<label for="userName">이름</label> <input type="text"
								class="form-control input-sm" id="userName" name="userName"
								style="font-size: .8em" placeholder="이름을 입력하세요">
						</div>
						<!-- 연락처 입력란 -->
						<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2">
							<label for="userTel">연락처</label><br /> <select name="userTel1"
								id="userTel1"
								style="font-size: .8em; height: 50px; width: 28%; padding-left: 10px; border: #ced4da 1.5px solid;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select> &nbsp; ㅡ &nbsp; <input name="userTel2" id="userTel2" type="text"
								maxlength="4" style="height: 50px; width: 28%"
								OnKeyUp="checkTel();">&nbsp; ㅡ &nbsp; <input
								name="userTel3" id="userTel3" type="text" maxlength="4"
								style="height: 50px; width: 28%" OnKeyUp="checkTel();"> <br />
						</div>
						<div class="form-group col-xs-10 offset-xs-1 col-md-8 offset-md-2"
							style="padding-bottom: 50px">
							<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>
						</div>
					</form>
					<!-- 
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
						<a class="btn" href="#" style="color:white;background-color: #ff8827; border:#ff8827 solid 1px;float: right;">등록</a>
						<!--  <button type="submit" class="btn btn-block" style="float: right;">등록</button>-->
					</ul>
					 -->
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
	<div class="row" style="padding-top: 50px; padding-left: 10px">
		<div class="col-xs-10 offset-xs-1 col-md-7" id="graph"></div>
	</div>
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
});
</script>