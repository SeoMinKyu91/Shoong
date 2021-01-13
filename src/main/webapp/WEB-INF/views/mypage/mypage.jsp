<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	
<style>
.swiper-container {
	height: 250px;
	margin-right: 10%
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
	
}

/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }



</style>

<div id="colorlib-main" style="padding-top: 30px; padding-left: 30px">
	<div style="display: inline-block; width: 80%;">
		<strong>${name}</strong><span>님</span>
		<a href='<c:url value="/Member/myInfoEdit.do"/>'>정보수정</a>
	</div>
	<div style="width: 40%; display: inline-block; margin-right: 8%">
		<a style="float: right" href="<c:url value="/"/>">주행시작</a>
		<table
			class="table table-bordered table-hover table-condensed text-center">
			<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
			<tr style="height: 10px">
				<span>나의 기록</span>
			</tr>
			<c:if test="${empty courseList }" var="isEmpty">
				<tr>
					<td colspan="6">등록된 게시물이 없어요</td>
				</tr>
			</c:if>
			<c:if test="${!isEmpty}">

				<c:forEach var="item" items="${courseList}">
					<tr>
						<td class="text-left" colspan="12"><a
							href="<c:url value="/"/>"> ${item.COURSE_NAME}</a></td>
					</tr>
					<tr>
						<td>${item.COURSE_DATE}</td>
						<td>${item.COURSE_TIME}시간</td>
						<td>${item.COURSE_LENGTH}km</td>
						<td>${item.COURSE_REGION}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<a href='<c:url value="/"/>' style="float: right">더보기</a>
	</div>
	<div style="display: inline-block;">
		<a>다이어리 바로가기</a>
	</div>
	<div style="margin-top: 10px">
		<span>갤러리</span>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:if test="${empty imgList }" var="isEmpty">
					<span style="text-align: center">등록된 이미지가 없어요</span>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${imgList}" varStatus="status">
						<div class="swiper-slide">
								<img src="<c:url value='/images/gallery/${item.DIARY_IMG_NAME}'/>"
								id="${status.count}" data-toggle="modal" data-target="#myModal" onclick="modalClick(id);" >
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div>
			<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div>
			<!-- 이전 버튼 -->

			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
		<a href='<c:url value="/myGallery.do"/>'
			style="float: right; margin-right: 15%">더보기</a>
	</div>

	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" data-backdrop="false"> <!-- 사용자 지정 부분① : id명 -->
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">모달 창 타이틀</h4> <!-- 사용자 지정 부분② : 타이틀 -->
          
        </div>
        <div class="modal-body">
          <p>여기에 필요한 텍스트 메시지 넣기</p> <!-- 사용자 지정 부분③ : 텍스트 메시지 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


</div>

<script>
	new Swiper('.swiper-container', {

		slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 30, // 슬라이드간 간격
		slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
	});
	
	function modalClick(id) {
		
		console.log(id+"클릭");
	}

	
	
</script>