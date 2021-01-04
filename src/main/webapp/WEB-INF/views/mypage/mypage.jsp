<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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


</style>

<div id="colorlib-main" style="padding-top: 30px; padding-left: 30px">
	<div style="display: inline-block; width: 80%;">
		<strong>${sessionScope.id}</strong><span>님</span>
		<button style="float: right"
			onclick="location.href='<c:url value="/myInfoEdit.do"/>'">정보수정</button>
	</div>
	<div
		style="width: 40%; display: inline-block; margin-right: 8%">
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
						<td class="text-left" colspan="12">
						<a href="<c:url value="/"/>">
							${item.COURSE_NAME}</a></td>
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
					<c:forEach var="item" items="${imgList}">
						<div class="swiper-slide">
							<img src="<c:url value='/images/gallery/${item.DIARY_IMG_NAME}'/>">
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
</script>