<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src='https://unpkg.com/@turf/turf/turf.min.js'></script>
<script src="<c:url value="/js/togeojson.js"/>"></script>

<style>

ul li {
	font-weight: bold;
	font-size: 1em;
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
	overflow-y: initial !important;
}

.modal-body {
	height: 100%;
	overflow-y: auto;
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

#naviImgModal img {
	width: 100%;
}


.submitBtn {
	color: white;
	background-color: #f32a48;
	font-weight: bold;
	border: none;
}

.closeBtn {
	color: white;
	background-color: #f32a48;
	font-weight: bold;
	border: none;
}

.insertBtn {
	color: white;
	background-color: #f32a48;
	font-weight: bold;
	border: none;
}

#packNoticeForm {
	background-color: white;
	border: #f32a48 1px solid;
	border-radius: 10px;
}

#packNoticeEditForm {
	background-color: white;
	border: #f32a48 1px solid;
	border-radius: 10px;
}

.deleteBtn {
	color: white;
	background-color: #f32a48;
	font-weight: bold;
	border: none;
}

.editBtn {
	color: white;
	background-color: #f32a48;
	font-weight: bold;
	border: none;
}

.viewBtn {
	color: white;
	background-color: #f32a48;
	font-weight: bold;
	border: none;
}

.modal {
	text-align: center;
	position: fixed;
	left: 25%;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.animated-text {
	display: none;
}

.slider-area {
	display: none;
}

.container {
	margin-left : 20px;
}

.mainbody {
	width: 90vw;
	height: 50vh;
}

#map {
	height: 150%;
}
@media ( min-width : 992px) .container {
	width : 900px;
}

.team-img>img {
	width: 100%;
	height: 100%;
}

#courseTable>div {
	font-weight: bold;
	padding-bottom: 15px;
	padding-top: 15px;
	padding-left : 20px;
	background-color: #052b52;
	color: white;
}

#courselist>div {
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left : 20px;
	border-bottom: #cde3fa 1px solid;
	background-color: white;
}

#recordTable>div {
	font-weight: bold;
	padding-bottom: 15px;
	padding-top: 15px;
	background-color: #052b52;
	color: white;
}

#recordlist>div {
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left : 20px;
	border-bottom: #cde3fa 1px solid;
	background-color: white;
}


body {
	background-color: #faf7f7;
}

#btnNoticeWrite {
	color:white;
	background-color: #f32a48;
}

.tab-content {
	overflow: auto;
	height:600px;
	text-align : center;
}

.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

.list-caption {
    border: 1px solid #e1ebf7;
    padding: 15px 20px 15px 20px;
    border-top: 0;
    position: relative;
    z-index: 0;
}
</style>
<!-- 본문 시작 -->
<!-- 본문 탭 시작 -->
<div class="mainbody">
	<div class="col-lg-6 col-xs-12" id="map"></div>
	
	<!-- 탭 메뉴 및 정보 -->
	<div role="tabpanel" class="menuVar col-lg-6 col-xs-12">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#courseList"
				style="color: #f32a48" aria-controls="home" role="tab"
				data-toggle="tab">코스 목록</a></li>
			<li role="presentation"><a href="#recordList"
				style="color: #f32a48" aria-controls="profile" role="tab"
				data-toggle="tab">내 기록</a></li>
			<li role="presentation"><a href="#messages1"
				style="color: #f32a48" aria-controls="messages" role="tab"
				data-toggle="tab">맛집</a></li>
			<li role="presentation"><a href="#messages2"
				style="color: #f32a48" aria-controls="messages" role="tab"
				data-toggle="tab">관광지</a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="courseList">
				<div class="row" id="courseTable">
					<div class="text-center col-lg-2 col-xs-2">카테고리</div>
					<div class="text-center col-lg-3 col-xs-3">코스명</div>
					<div class="text-center col-lg-2 col-xs-2">길이(km)</div>
					<div class="text-center col-lg-2 col-xs-2">시간(분)</div>
					<div class="text-center col-lg-3 col-xs-3">등록일</div>
				</div>
				<c:if test="${empty courseList}" var="isEmpty">
					<div class="text-center col-xs-12 col-lg-12">
						<div class="text-center">등록된 게시물이 없어요</div>
					</div>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${courseList}" varStatus="loop">
					<div class="row" id="courselist">
						<div class="text-center col-lg-2 col-xs-2">${item.courseCateName}</div>
						<div class="text-center col-lg-3 col-xs-3">${item.courseName}</div>
						<div class="text-center col-lg-2 col-xs-2">${item.courseLength}</div>
						<div class="text-center col-lg-2 col-xs-2">${item.courseTime}</div>
						<div class="text-center col-lg-3 col-xs-3">
							<fmt:formatDate var="dResult" pattern="yy-MM-dd HH:mm"
								value="${item.courseRegiDate}" />
							<c:out value="${dResult}" />
						</div>
						<div style="display: none;">${item.courseId}</div>
					</div>
					</c:forEach>
				</c:if>
				<c:if test="${!empty manager }">
					<div class="row">
						<div class="col-lg-12 text-right">
							<button class="submitBtn btn" data-toggle="modal"
								id="btnNoticeWrite">등록</button>
						</div>
					</div>
				</c:if>
			</div>
			<div role="tabpanel" class="tab-pane" id="recordList">
				<div class="row" id="recordTable">
					<div class="text-center col-lg-4 col-xs-4">파일</div>
					<div class="text-center col-lg-3 col-xs-3">길이(km)</div>
					<div class="text-center col-lg-2 col-xs-2">시간(분)</div>
					<div class="text-center col-lg-3 col-xs-3">일자</div>
				</div>
				<c:if test="${empty recordList}" var="isEmpty">
					<div class="text-center col-lg-12">
						<div class="test-center">등록된 게시물이 없어요</div>
					</div>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${recordList}" varStatus="loop">
					<div class="row" id="recordlist">
						<div class="text-center col-lg-4 col-xs-4">${item.fileName}</div>
						<div class="text-center col-lg-3 col-xs-3">${item.recordLength}km</div>
						<div class="text-center col-lg-2 col-xs-2">${item.duration}분</div>
						<div class="text-center col-lg-3 col-xs-3">
							<fmt:formatDate var="dResult" pattern="yy-MM-dd HH:mm"
								value="${item.recordDate}" />
							<c:out value="${dResult}" />
						</div>
						<div style="display: none;">${item.recordId}</div>
					</div>
					</c:forEach>
				</c:if>
				<c:if test="${!empty manager }">
					<div class="row">
						<div class="col-lg-12 text-right">
							<button class="submitBtn btn" data-toggle="modal"
								id="btnNoticeWrite">등록</button>
						</div>
					</div>
				</c:if>
			</div>
			<!-- 맛집 크롤링 tap pane 끝-->
			<div role="tabpanel" class="tab-pane" id="messages1">
				<div class="row">
					<div class="col-lg-12 col-xs-12">
						<span style="font-size:2em; color:grey;line-height:500px;">불러오는 중입니다.</span>
					</div>
				</div>
			</div>
			<!-- 크롤링 tap pane 끝-->
			<!-- 관광 크롤링 tap pane 끝-->
			<div role="tabpanel" class="tab-pane" id="messages2">
				<div class="row">
					<div class="col-lg-12 col-xs-12">
						<span style="font-size:2em; color:grey;line-height:500px;">불러오는 중입니다.</span>
					</div>
				</div>
			</div>
			<!-- 크롤링 tap pane 끝-->
		</div>
	</div>
	<!-- 본문 탭 끝 -->
</div>
<!-- 코스 등록 모달창 시작 -->
<div class="modal fade" id="noticeEdit" data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="margin: 5px;">코스 등록</h4>
			</div>
			<div class="modal-body">
				<form action="" class="bg-light p-5 contact-form"
					id="packNoticeForm">
					<div class="form-group">
						<input type="text" class="form-control" name="courseFileName"
							id="courseFileName" hidden="true" value="">
					</div>
					<label for="map3" style="float: left;">코스</label><br />
					<div class="form-group">
						<div id="map3" style="height: 300px; width: 550px;"></div>
					</div>
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
						<select class="form-control" name="courseCateId" id="courseCateId">
							<option value="0" style="color: #888888;">==선택하세요==</option>
							<option value="101" style="color: #888888;">감성코스</option>
							<option value="102" style="color: #888888;">맛집코스</option>
							<option value="103" style="color: #888888;">숨겨진코스</option>
							<option value="104" style="color: #888888;">도전코스</option>
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
						<textarea rows="7" class="form-control" name="courseIntro"
							id="courseIntro"></textarea>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="insertBtn btn" data-dismiss="modal"
					id="btnWriteOk">코스 등록</button>
				<button type="button" class="insertBtn btn" data-dismiss="modal"
					id="btnNoticeWriteClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 코스 등록 모달창 끝 -->

<!-- 기록 삭제 모달창 시작 -->
<div class="modal fade" id="noticeDelete" data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">나의 기록 삭제</h4>
			</div>
			<div class="modal-body">
				<h4 class="text-center">정말로 삭제하시겠습니까?</h4>
				<form action="" class="bg-light p-5 contact-form"
					id="packNoticeDeleteForm" style="display: none;">
					<div class="form-group">
						<input type="hidden" class="form-control" name="packNoticeNo"
							id="packNoticeDeleteNo" value="">
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="deleteBtn btn" data-dismiss="modal"
					id="btnNoticeDeleteOk">기록 삭제</button>
				<button type="button" class="deleteBtn btn" data-dismiss="modal"
					id="btnNoticeDeleteClose">닫기</button>

			</div>
		</div>
	</div>
</div>
<!-- 기록 삭제 모달창 끝 -->

<!-- 기록 상세보기 모달창 시작 -->
<div class="modal fade" id="noticeView" data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div id="mdNo"></div>
				<div id="mdPostdate"></div>
			</div>

			<div class="modal-body" style="height: 400px;">
				<div class="row" style="margin: 10px;">
					<div id="mdUserID"></div>
					&nbsp;&nbsp;
					<div id="mdTitle"></div>
					<br /> <br />
					<div id="map2"
						style="height: 300px; padding-top: 20px; width: 550px; padding-top: 20px;"></div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="viewBtn btn" data-toggle="modal" id="btnNoticeEdit">코스
					등록</button>
				<button class="viewBtn btn" data-toggle="modal" id="btnNoticeDelete">기록
					삭제</button>
				<button type="button" class="closeBtn btn" data-dismiss="modal"
					id="btnNoticeViewClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 기록 상세보기 모달창 끝 -->

<!-- 코스 상세보기 모달창 시작 -->
<div class="modal modal-center fade" id="courseView" data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div id="mdCourseNo"></div>
				<div id="mdCoursePostdate"></div>
			</div>

			<div class="modal-body" style="height: 400px;">
				<div class="row" style="margin: 10px;">
					<div id="mdCourseUserID"></div>
					&nbsp;&nbsp;
					<div id="mdCourseTitle"></div>
					<br /> <br />
					<div id="map4"
						style="height: 300px; padding-top: 20px; width: 550px;"></div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="viewBtn btn" data-toggle="modal"
					id="btnCourseViewCart">코스 찜</button>
				<button class="viewBtn btn" data-toggle="modal"
					id="btnCourseViewStar">코스 추천</button>
				<button type="button" class="closeBtn btn" data-dismiss="modal"
					id="btnCourseViewClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 코스 상세보기 모달창 끝 -->
<!-- 본문 끝 -->
<script>
	//날자 계산
	Date.prototype.format = function(f) {
		if (!this.valueOf())
			return " ";

		var weekName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];
		var d = this;

		return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
			switch ($1) {
			case "yyyy":
				return d.getFullYear();
			case "yy":
				return (d.getFullYear() % 1000).zf(2);
			case "MM":
				return (d.getMonth() + 1).zf(2);
			case "dd":
				return d.getDate().zf(2);
			case "E":
				return weekName[d.getDay()];
			case "HH":
				return d.getHours().zf(2);
			case "hh":
				return ((h = d.getHours() % 12) ? h : 12).zf(2);
			case "mm":
				return d.getMinutes().zf(2);
			case "ss":
				return d.getSeconds().zf(2);
			case "a/p":
				return d.getHours() < 12 ? "오전" : "오후";
			default:
				return $1;
			}
		});
	};

	String.prototype.string = function(len) {
		var s = '', i = 0;
		while (i++ < len) {
			s += this;
		}
		return s;
	};
	String.prototype.zf = function(len) {
		return "0".string(len - this.length) + this;
	};
	Number.prototype.zf = function(len) {
		return this.toString().zf(len);
	};
	
	function saveToFile_Chrome(fileName, content) {
		var blob = new Blob([content], { type: 'text/plain' });
	    objURL = window.URL.createObjectURL(blob);
	            
	    // 이전에 생성된 메모리 해제
	    if (window.__Xr_objURL_forCreatingFile__) {
	        window.URL.revokeObjectURL(window.__Xr_objURL_forCreatingFile__);
	    }
	    window.__Xr_objURL_forCreatingFile__ = objURL;
	    var a = document.createElement('a');
	    a.download = fileName;
	    a.href = objURL;
	    a.click();
	}
	
	$('style').append('.modal .modal-body {max-height: '
			+ ($('body').height() * .6)
			+ 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}');
	
	$(function() {

		/*
		$.ajax('<c:url value="/courseTest/gpxkml/address.kml"/>').done(
				function(xml) {
					console.log(toGeoJSON.kml(xml));
				});
		*/
		/*
		$.ajax('<c:url value="/gpxkml/오천자전거길.gpx.gpx"/>').done(
				function(xml) {
					var json = JSON.stringify(toGeoJSON.gpx(xml));
					saveToFile_Chrome("output.json",json);
					$.ajax({
						url : "<c:url value='/course/convert/route'/>",
						type : "post",
						dataType : "json",
						data : {
							"fileName" : $('#imgArry').val()
						},
						success : function(data) {
							
						}
					});
				});
		*/

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

		var map3 = new mapboxgl.Map({
			container : 'map3',
			style : 'mapbox://styles/mapbox/streets-v11',
			center : monument,
			zoom : 12
		});

		var map4 = new mapboxgl.Map({
			container : 'map4',
			style : 'mapbox://styles/mapbox/streets-v11',
			center : monument,
			zoom : 12
		});

		//map.getCanvas().style.width = '700px';

		map2.getCanvas().style.width = '550px';
		map2.getCanvas().style.marginTop = '20px';

		map3.getCanvas().style.width = '550px';
		map3.getCanvas().style.marginTop = '5px';

		map4.getCanvas().style.width = '550px';
		map4.getCanvas().style.marginTop = '5px';

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

		map.on('load', function() {
			$('.mapboxgl-ctrl-geocoder--input').prop('placeholder', '검색');
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

		$('#btnNoticeWrite').on('click', function(e) {
			console.log('btnNoticeWrite 버튼 클릭');
			$('#noticeWrite').modal('show');
			$('body').css("overflow", "hidden");
		})

		//내 기록을 코스로 등록 모달 닫기
		$('#btnNoticeWriteClose').click(function() {
			$("#packNoticeEditContent").text("");
			if (map3.getSource('route')) {
				map3.removeLayer('route');
				map3.removeSource('route');
			}

			$('#noticeWrite').modal('hide');
			$('body').css("overflow", "scroll");
		});

		//내 기록을 코스로 등록 모달 완료
		$('#btnWriteOk').click(function() {
			console.log("등록하기 버튼 클릭");
			if ($('#courseName').val() == "") {
				$('#courseName').focus();
				console.log("1");
				return;
			} else if ($('#courseCateId').val() == "0") {
				$('#courseCateId').focus();
				console.log("2");
				return;
			} else if ($('#courseIntro').val() == "") {
				$('#courseIntro').focus();
				console.log("3");
				return;
			}
			console.log("4");
			//form태그의 action속성 및 method속성 설정
			$('#packNoticeForm').prop({
				action : "<c:url value='/course/insert.do'/>",
				method : 'POST'
			});
			console.log("5");
			//폼객체의 submit()함수로 서버로 전송
			$('#packNoticeForm').submit();
			console.log("6");
			if (map3.getSource('route')) {
				map3.removeLayer('route');
				map3.removeSource('route');
			}
			modalContentDelete();
		});

		var courseCateName = "";
		var courseName = "";
		var courseLength = "";
		var courseTime = ""
		var courseRegiDate = "";

		var courseId = "";

		//코스 목록 클릭시 모달 창
		//$("#courseList .cus tr").click(function() {
		$("#courseList #courselist").click(function() {
			$('.viewBtn').show();

			courseId = $(this).children().eq(5).text().trim();

			$.ajax({
				url : "<c:url value='/course/viewcourse'/>",
				type : "get",
				dataType : "json",
				data : "courseId=" + courseId,
				success : function(json) {
					//var json = JSON.parse(data);
					console.log("%o", json);
					//console.log("코스이름",json.courseName);

					courseName = json.courseName;
					courseLength = json.courseLength;
					courseTime = json.courseTime;
					courseRegiDate = json.courseRegiDate;
					courseIntro = json.courseIntro;
					
					$("#mdCourseNo").html(courseName);
					$("#mdCourseUserID").html("거리 : " + courseLength + "km");
					$("#mdCourseTitle").html("탄 시간 : "+ courseTime + "분");
					$("#mdCoursePostdate").html("등록 날짜 : " + courseRegiDate);
					$("#mdCourseContent").html("코스 소개 " + courseIntro);

					$.ajax({
						url : "<c:url value='/course/routeLoad'/>",
						type : "post",
						dataType : "json",
						data : {
							"fileName":json.courseFileName
						},
						success : function(data) {
							map4.addSource('route', {
								"type":"geojson",
								"data":data
							});
							map4.addLayer({
								'id' : 'route',
								'type' : 'line',
								'source' : 'route',
								'layout' : {
									'line-join' : 'round',
									'line-cap' : 'round'
								},
								'paint' : {
									'line-color' : '#24d900',
									'line-width' : 3
								}
							});
							map4.setCenter(data.geometry.coordinates[0][0]);
							map4.setZoom(11);

							var length = turf.length(data, {
								units : 'kilometers'
							});
							console.log('lenght:', length);
						}
					});
				}
			});

			//루트 가져오기
			$('#courseView').modal('show');
			$('body').css("overflow", "hidden");
		});

		//내 기록 상세보기 모달 내용 삭제
		$("#btnCourseViewClose").click(function() {
			modalContentDelete();
			$('body').css("overflow", "scroll");
			if (map4.getSource('route')) {
				map4.removeLayer('route');
				map4.removeSource('route');
			}
		});

		var fileName = "";
		var recordDate = "";
		var recordLength = "";
		var recordDuration = ""
		var recordNo = "";

		//테이블 클릭시 모달창 띄우기
		//내 기록 상세보기  속성값 설정 해주기
		//$("#recordList .cus tr").click(function() {
		$("#recordList #recordlist").click(function() {
			$('.viewBtn').show();
			var userId = "${sessionScope.userId}";
			console.log('테이블 a태그 클릭', userId);
			fileName = $(this).children().eq(0).text().trim();
			recordLength = $(this).children().eq(1).text();
			recordDuration = $(this).children().eq(2).text();
			recordDate = $(this).children().eq(3).text();
			recordNo = $(this).children().eq(4).text();

			$("#mdNo").html("파일 : " + fileName);
			$("#mdUserID").html("길이 : " + recordLength);
			$("#mdTitle").html("시간 : " + recordDuration);
			$("#mdPostdate").html("일자 : " + recordDate);
			$("#mdContent").html("" + recordNo);

			//루트 가져오기
			$.ajax({
				url : "<c:url value='/course/routeLoad'/>",
				type : "post",
				dataType : "json",
				data : {
					"fileName":fileName
				},
				success : function(data) {
					console.log('요청 성공');
					//console.log('data:%O',data.features[0]);
					console.log('data:%O', data);
					//json = data.features[0];
					json = data;

					map2.addSource('route', {
						"type" : "geojson",
						"data" : json
					});
					map2.addLayer({
						'id' : 'route',
						'type' : 'line',
						'source' : 'route',
						'layout' : {
							'line-join' : 'round',
							'line-cap' : 'round'
						},
						'paint' : {
							'line-color' : '#24d900',
							'line-width' : 3
						}
					});
					
					map2.setCenter(json.geometry.coordinates[0][0]);
					map2.setZoom(11);

					var length = turf.length(json, {
						units : 'kilometers'
					});
					console.log('lenght:', length);
				}
			});

			$('#noticeView').modal('show');
			$('body').css("overflow", "hidden");
		});

		//내 기록 상세보기 모달 내용 삭제
		$("#btnNoticeViewClose").click(function() {
			modalContentDelete();
			$('body').css("overflow", "scroll");
			if (map2.getSource('route')) {
				map2.removeLayer('route');
				map2.removeSource('route');
			}
		});

		//내 기록을 코스로 등록 모달
		$('#btnNoticeEdit').click(function() {
			console.log("수정 모달창 들어옴");
			console.log("팩수정 모달창 packNoticeNo:" + recordNo)
			$("#courseFileName").attr("value", fileName);
			$("#courseId").attr("value", fileName);
			$("#courseTime").attr("value", recordDuration);
			$("#courseLength").attr("value", recordLength);

			//지도 띄우기
			//루트 가져오기
			$.ajax({
				url : "<c:url value='/course/routeLoad'/>",
				type : "post",
				dataType : "json",
				data : {
					"fileName" : fileName
				},
				success : function(data) {
					console.log('요청 성공');
					//console.log('data:%O',data.features[0]);
					console.log('data:%O', data);
					//json = data.features[0];
					json = data;

					map3.addSource('route', {
						"type" : "geojson",
						"data" : json
					});
					map3.addLayer({
						'id' : 'route',
						'type' : 'line',
						'source' : 'route',
						'layout' : {
							'line-join' : 'round',
							'line-cap' : 'round'
						},
						'paint' : {
							'line-color' : '#24d900',
							'line-width' : 3
						}
					});
					map3.setCenter(json.geometry.coordinates[0][0]);
					map3.setZoom(11);

					var length = turf.length(json, {
						units : 'kilometers'
					});
					console.log('lenght:', length);
				}
			});

			$('#noticeView').modal('hide');
			modalContentDelete();
			$('#noticeEdit').modal('show');
		});

		//내 기록을 코스로 등록 모달 내용 삭제
		$("#btnNoticeWriteClose").click(function() {
			modalContentDelete();
			$('body').css("overflow", "scroll");
			if (map3.getSource('route')) {
				map3.removeLayer('route');
				map3.removeSource('route');
			}
		});

		//공지사항 삭제하기
		$('#btnNoticeDelete').on('click', function(e) {
			console.log('버튼 클릭');
			console.log(packNoticeNo);

			$('#packNoticeDeleteNo').attr("value", packNoticeNo);

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

		//상세보기 모달내용 삭제 함수
		function modalContentDelete() {
			console.log("모달 닫기 클릭");
			attrDelete();

			$("#mdNo").text("");
			$("#mdUserID").text("");
			$("#mdTitle").text("");
			$("#mdPostdate").text("");
			$("#mdContent").text("");
		}

		function attrDelete() {
			no = "";
			title = "";
			user = "";
			postdate = "";
			content = "";
			packNoticeNo = "";
		}

		$('#myTab a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
		
		map.on('click',function(e){
			console.log("클릭한 좌표:",e.lngLat.lat,":",e.lngLat.lng);
			$.ajax({
				url:"http://localhost:5000/places/matzip?lat="+e.lngLat.lat+"&lng="+e.lngLat.lng,
				type:"get",
				//success:receiverecommandresponse,
				success:function(data){
					console.log("성공");
					console.log("리시브데이터:%O",data);
					const matzipList = data.places;
					var imageListStr="";
					matzipList.forEach(function(elt, i, array) {
						imageListStr += 
							'<div class="col-lg-4 col-xs-4"><div class="list-img"><img src="'+elt.url+'" style="width: 100%; height: 200px;"></div><div class="list-caption"><h5><span>'+elt.name+"(💛"+elt.score+")"+'</span><p style="font-size:.9em">'+elt.addr+'</p></h5></div></div>'						
					});
					$('#messages1').html(imageListStr);
					//console.log("첫번째",matzipList[0].addr);
				},
				error:function(request,status,error){
					console.log("실패",request,status,error);
				}
			});		
			$.ajax({
				url:"http://localhost:5000/places/janggwan?lat="+e.lngLat.lat+"&lng="+e.lngLat.lng,
				type:"get",
				//success:receiverecommandresponse,
				success:function(data){
					console.log("성공");
					console.log("리시브데이터:%O",data);
					const matzipList = data.places;
					var imageListStr="";
					matzipList.forEach(function(elt, i, array) {
						imageListStr += 
							'<div class="col-lg-4 col-xs-4"><div class="list-img"><img src="'+elt.url+'" style="width: 100%; height: 200px;"></div><div class="list-caption"><h5><span>'+elt.name+"(💛"+elt.score+")"+'</span><p style="font-size:.9em">'+elt.addr+'</p></h5></div></div>'						
					});
					$('#messages2').html(imageListStr);
					//console.log("첫번째",matzipList[0].addr);
				},
				error:function(request,status,error){
					console.log("실패",request,status,error);
				}
			});	
		});
		
		/*
		function receiverecommandresponse(data){
			console.log("리시브데이터:%O",data);
		}
		*/

	});
</script>