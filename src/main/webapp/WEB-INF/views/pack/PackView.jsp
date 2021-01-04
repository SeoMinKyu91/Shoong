	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 제이쿼리 코어용 라이브러리 임베드 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">



<style>
	#colorlib-main{
		margin-top: 20px;
		margin-bottom: 10px;
	}
	#packComment.col:eq(1){
		diplay: none;
	}
</style>


<div id="colorlib-page">
	<div id="colorlib-main">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-tittle text-center mb-80 col-lg-12" >
					<h1 style="margin-top: 15px;">마이 팩 <small>가입한 팩 이름 띄우기</small></h1>
				</div>
					
			</div>
		</div>
		<hr>
		
		<c:if test="${!empty manager }">
			<div class="row">
				<div class="col-lg-12">
					<a class="btn btn-info" href="<c:url value="/pack/manage.do"/>">팩 관리</a>
				</div>
			</div>
		</c:if>
		<div class="col-lg-12">
			<a class="btn btn-info" href="<c:url value="/pack/calendar.do"/>">팩 일정</a>
		</div>

		
		<div class="row">
				<div class="offset-md-1 col-md-5">
					<div class="row">
						<div class="col-lg-9 col-sm-8">
							<h3>공지사항</h3>
						</div>
						<div class="col-lg-3 col-sm-4" style="padding-top: 13px;">
							<a href="<c:url value="/pack/notice/list.do"/>" class="btn-custom">Read More 
								<span class="ion-ios-arrow-forward"></span>
							</a>
						</div>
					</div>
				
					
					<table class="table table-bordered table-hover">
						<tr>
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
				<div class="col-md-5">
					<div class="row">
						<div class="col-lg-9 col-sm-8">
							<h3>Calender</h3>
						</div>
						<div class="col-lg-3 col-sm-4" style="padding-top: 13px;">
							<a href="<c:url value="#"/>" class="btn-custom"> View Details
								<span class="ion-ios-arrow-forward"></span>
							</a>
						</div>
					</div>
					
					<div id="calender"></div>
				</div>
			</div><!-- row -->
			
			<div class="row">
				<div class="offset-md-1 col-md-5 " style="margin-top: 10px;">
					<div class="row">
						<div class="col-lg-9 col-sm-8">
							<h3>Comment</h3>
						</div>
						<div class="col-lg-3 col-sm-4" style="padding-top: 13px;">
							<a href="<c:url value="/pack/comment.do"/>" class="btn-custom">Read More 
								<small><span class="ion-ios-arrow-forward"></span></small>
							</a>
						</div>
					</div>
				
					<table class="table table-bordered table-hover" id="packComment">
						<tr>
							<th class="text-center">가려야할 번호</th>
							<th class="text-center">작성자</th>
							<th class="text-center">제목</th>
							<th class="text-center">작성일</th>
							<th class="text-center">좋아요~</th>
						</tr>
						<tr class="text-center danger">
							<td class="text-left ">가려야할 번호</td>
							<td>작성자1</td>
							<td class="text-left ">제목1</td>
							<td>10.12</td>
							<td>1</td>
						</tr>
						<tr class="text-center">
							<td class="text-left ">가려야할 번호</td>
							<td>작성자2</td>
							<td class="text-left">제목2</td>
							<td>11.20</td>
							<td>2</td>
						</tr>
						<tr class="text-center">
							<td class="text-left ">가려야할 번호</td>
							<td>작성자3</td>
							<td class="text-left">제목3</td>
							<td>12.30</td>
							<td>3</td>
						</tr>
						<tr class="text-center">
							<td class="text-left ">가려야할 번호</td>
							<td>작성자4</td>
							<td class="text-left">제목4</td>
							<td>4.05</td>
							<td>4</td>
						</tr>
					</table>
				</div>
				<div class="col-md-5" style="margin-top: 10px;">
					<div class="row">
						<div class="col-lg-9 col-sm-8">
							<h3>Gallery</h3>
						</div>
						<div class="col-lg-3 col-sm-4" style="padding-top: 13px;">
							<a href="<c:url value="/pack/gallery.do"/>" class="btn-custom"> View Details
								<span class="ion-ios-arrow-forward"></span>
							</a>
						</div>
					</div>
				
					<div id="gallery">
						
						<c:if test="${empty packGalleryList}" var="isEmpty">
							<h3>갤러리에 사진이 없어요.</h3>
						</c:if>
						<c:if test="${!isEmpty}">
							<c:forEach var="item" items="${packGalleryList }">
								 <img style="width: 45%;height:100px;" src=/fileupload/${item.pictureName} alt="팩갤러리 사진">
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div><!-- row -->
			
			<div class="row">
				<div class="offset-md-1 col-md-10 " style="margin-top: 10px;">
					<div class="row">
						<div class="col-lg-10 col-sm-9">
							<h3>Pack Course List</h3>
						</div>
						<div class="col-lg-2 col-sm-3" style="padding-top: 13px;">
							<a href="<c:url value="#"/>" class="btn-custom"> View Details
								<span class="ion-ios-arrow-forward"></span>
							</a>
						</div>
					</div>
				
					
					<table class="table table-bordered table-hover">
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">작성자</th>
							<th class="text-center">작성일</th>
						</tr>
						<tr class="text-center danger">
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
</div>





