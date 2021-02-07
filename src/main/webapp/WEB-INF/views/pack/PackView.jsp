<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.packCreateBtn {
	color: #f32a48;
	background-color: white;
	font-weight: bold;
	border: none;
}

.packCreateBtn:hover {
	color: white;
	background-color: #f32a48;
}

.packManageBtn {
	float: right;
	color: #f32a48;
	background-color: white;
	font-weight: bold;
	border: none;
}

.packManageBtn:hover {
	color: white;
	background-color: #f32a48;
}

#tableTitle {
	background-color: #052b52;
	color: #ffffff;
}

#packComment.col:eq(1) {
	diplay: none;
}

.animated-text {
	display: none;
}

.slider-area {
	display: none;
}

.packMainBtn {
	color: #f32a48;
	background: none;
	font-weight: bold;
	border: #f32a48 1px solid;
	float: right;
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

.btn-custom {
	color: #f32a48;
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
/*
body {
	background-color: #F9F9F9;
}
*/
.carousel {	
	margin: 0 auto;
	padding: 0 68px;
}
.carousel .carousel-item {
	text-align: center;
	overflow: hidden;
	height: 160px;
}
.carousel .carousel-item .img-box {
	background: #fff;
	padding: 9px;
	box-shadow: 0 6px 20px -6px rgba(0,0,0,0.4);
}
.carousel .carousel-item img {
	margin: 0 auto;
}
.carousel-control-prev, .carousel-control-next {
	width: 68px;
	background: none;
}
.carousel-control-prev i, .carousel-control-next i {
	font-size: 28px;
	position: absolute;
	top: 50%;
	display: inline-block;
	margin-top: -15px;
	z-index: 5;
	left: 0;
	right: 0;
	color: rgba(0, 0, 0, 0.8);
	text-shadow: 0 3px 3px #e6e6e6, 0 0 0 #000;
}
.carousel-indicators {
	bottom: -40px;
}
.carousel-indicators li, .carousel-indicators li.active {
	width: 10px;
	height: 10px;
	border: none;
	border-radius: 50%;
	margin: 1px 4px;
	box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
}
.carousel-indicators li {	
	background: #999;
	border-color: transparent;
}
.carousel-indicators li.active {
	background: #555;
}
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div
	style="border-radius: 10px; box-shadow: 0px 0px 5px #787878; padding: 30px; background-color: white; position: relative; z-index: 1;">
	<div class="row">
		<div class="col-xs-12 col-lg-12" style="padding-bottom: 20px">
			<a class="packManageBtn btn" href="<c:url value="/pack/manage.do"/>">
				<span class="glyphicon glyphicon-cog"></span>&nbsp;팩 관리
			</a>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-md-12 col-lg-12">
			<h1 style="text-align: center; font-weight: bold">${sessionScope.packName}</h1>
			<br />
			<hr style="background-color: black; height: 1px" />
			<div class="">
				<a class="packMainBtn btn" href="<c:url value="/pack/calendar.do"/>"
					style="margine-right: 20px"><span
					class="glyphicon glyphicon-calendar"></span>&nbsp;팩 일정</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-offset-1 col-lg-5">
			<div class="row">
				<div class="col-lg-9 col-xs-9">
					<p style="font-weight: bold; font-size: 1.5em;">공지사항</p>
				</div>
				<div class="col-lg-3 col-xs-3"
					style="padding-top: 10px; float: right;">
					<a href="<c:url value="/pack/notice/list.do"/>" class="btn-custom"
						style="float: right;"> 더보기 <span class="ion-ios-arrow-forward"></span>
					</a>
				</div>
			</div>
			<table class="table table-hover">
				<tr id="tableTitle">
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
				</tr>
				<c:if test="${empty list }" var="isEmpty">
					<tr class="text-center">
						<td colspan="4" class="test-center">등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${list }" varStatus="loop">
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
		<!-- 여기에 코멘트 -->
		<div class="col-lg-5 ">
			<div class="row">
				<div class="col-lg-9 col-xs-9">
					<p style="font-weight: bold; font-size: 1.5em;">커뮤니티</p>
				</div>
				<div class="col-lg-3 col-xs-3"
					style="padding-top: 10px; float: right;">
					<a href="<c:url value="/pack/comment.do"/>" class="btn-custom"
						style="float: right;">더보기 <span class="ion-ios-arrow-forward"></span>
					</a>
				</div>
			</div>
			<table class="table table-hover" id="packComment">
				<tr id="tableTitle">
					<th class="text-center">번호</th>
					<th class="text-center">작성자</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성일</th>
					<th class="text-center"><span
						class="glyphicon glyphicon-heart"></span></th>
				</tr>
				<c:if test="${empty list}" var="isEmpty">
					<tr class="text-center">
						<td colspan="4" class="test-center">등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				<tr class="text-center">
					<td>4</td>
					<td class="text-left ">제목4</td>
					<td>장동건</td>
					<td>2021-01-20</td>
					<td>1</td>
				</tr>
				<tr class="text-center">
					<td>3</td>
					<td class="text-left">제목3</td>
					<td>장동건</td>
					<td>2021-01-20</td>
					<td>2</td>
				</tr>
				<tr class="text-center">
					<td>2</td>
					<td class="text-left">제목2</td>
					<td>장동건</td>
					<td>2021-01-20</td>
					<td>3</td>
				</tr>
				<tr class="text-center">
					<td>1</td>
					<td class="text-left">제목1</td>
					<td>장동건</td>
					<td>2021-01-20</td>
					<td>4</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-lg-offset-1 col-lg-10 " style="margin-top: 10px;">
			<div class="col-lg-9 col-xs-9">
				<p style="font-weight: bold; font-size: 1.5em;">갤러리</p>
			</div>
			<div class="col-lg-3 col-xs-3"
				style="padding-top: 10px; float: right;">
				<a href="<c:url value="/pack/gallery.do"/>" class="btn-custom"
					style="float: right;">더보기 <span class="ion-ios-arrow-forward"></span>
				</a>
			</div>
			<div id="gallery">
				<c:if test="${empty packGalleryList}" var="isEmpty">
					<br />
					<!-- 
					<h3 style="text-align: center; color: grey">갤러리에 사진이 없어요.</h3> -->
					<div class="container-xl">
							<div class="col-md-12  mx-auto">
								<div id="myCarousel" class="carousel slide" data-ride="carousel"
									data-interval="0">
									<!-- Wrapper for carousel items -->
									<div class="carousel-inner">
										<div class="carousel-item active">
											<div class="row">
												<div class="col-sm-4">
													<div class="img-box">
														<img src="<c:url value='/change/img/elements/a.jpg'/>" class="img-fluid"
															alt="">
													</div>
												</div>
												<div class="col-sm-4">
													<div class="img-box">
														<img src="<c:url value='/change/img/elements/a2.jpg'/>" class="img-fluid"
															alt="">
													</div>
												</div>
												<div class="col-sm-4">
													<div class="img-box">
														<img src="<c:url value='/change/img/elements/d.jpg'/>" class="img-fluid"
															alt="">
													</div>
												</div>
												
											</div>
										</div>
									</div>
									<!-- Carousel controls -->
									<a class="carousel-control-prev" href="#myCarousel"
										data-slide="prev"> <i class="fa fa-chevron-left"></i>
									</a> <a class="carousel-control-next" href="#myCarousel"
										data-slide="next"> <i class="fa fa-chevron-right"></i>
									</a>
								</div>
							</div>
					</div>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${packGalleryList }">
						<img style="width: 49%; height: 100px; margin-bottom: 5px;"
							src="/fileupload/${item.pictureName}" alt="팩갤러리 사진">
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-lg-offset-1 col-lg-10" style="margin-top: 10px;">
			<div class="row">
				<div class="col-lg-10 col-xs-9">
					<p style="font-weight: bold; font-size: 1.5em;">코스 목록</p>
				</div>
				<div class="col-lg-2 col-xs-3" style="padding-top: 13px;">
					<a href="#" class="btn-custom" style="float: right;">더보기 <span
						class="ion-ios-arrow-forward"></span>
					</a>
				</div>
			</div>
			<table class="table table-hover">
				<tr id="tableTitle">
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
				</tr>
				<tr class="text-center">
					<td>1</td>
					<td class="text-left ">제목1</td>
					<td>작성자1</td>
					<td>10</td>
				</tr>
				<tr class="text-center">
					<td>2</td>
					<td class="text-left">제목2</td>
					<td>작성자2</td>
					<td>20</td>
				</tr>
				<tr class="text-center">
					<td>3</td>
					<td class="text-left">제목3</td>
					<td>작성자3</td>
					<td>30</td>
				</tr>
				<tr class="text-center">
					<td>4</td>
					<td class="text-left">제목4</td>
					<td>작성자4</td>
					<td>40</td>
				</tr>
			</table>
		</div>
	</div>
</div>
