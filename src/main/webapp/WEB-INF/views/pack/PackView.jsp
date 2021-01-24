<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
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
	.packManageBtn{
		float:right;
		color:#ff8827;
		background-color: white;
		font-weight: bold;
		border: none;
	}
	.packManageBtn:hover {
		color:white;
		background-color: #ff8827;
	}
	#tableTitle{
		background-color: #ff8827;
		color:white;
	}
	#packComment.col:eq(1){
		diplay: none;
	}
</style>
<div id="colorlib-main" style="padding:20px">
	<div class="row">
		<div class="col-lg-12" style="padding-bottom:20px">
			<div class="">
				<a href="<c:url value="/pack/main.do"/>">
				<img alt="pack" src="<c:url value="/images/pack/pack.png"/>"
					style="width: 80px;"></a>
				&emsp;<a class="packCreateBtn btn" 
					href="<c:url value="/pack/main.do"/>">HOME</a>
				<c:if test="${!empty sessionScope.packId}">
					<a class="packCreateBtn btn"
						href="<c:url value="/pack/view.do"/>">MY PACK</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-md-12 col-lg-12">
			<p style="padding-top:14px;padding-left:10px;color:black;font-weight: bold;font-size:1.7em;text-align: center">전국일주</p>
			<hr style="background-color: black;height:1px"/>
			<c:if test="${!empty manager}">
				<a class="packManageBtn btn" href="<c:url value="/pack/manage.do"/>">
					<span class="glyphicon glyphicon-cog"></span>&nbsp;팩 관리</a>
			</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-offset-1 col-lg-5">
			<div class="row">
				<div class="col-lg-10 col-sm-8">
					<p style="font-weight: bold;font-size:1.5em;">공지사항</p>
				</div>
				<div class="col-lg-2 col-sm-4" style="padding-top: 10px; float: right;">
					<a href="<c:url value="/pack/notice/list.do"/>" class="btn-custom"> 더보기 
						<span class="ion-ios-arrow-forward"></span>
					</a>
				</div>
			</div>
			<table class="table table-bordered table-hover">
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
		<div class="col-lg-5">
			<div class="row">
				<div class="col-lg-10 col-sm-8">
					<p style="font-weight: bold;font-size:1.5em;">팩 일정</p>
				</div>
				<div class="col-lg-2 col-sm-4" style="padding-top: 10px; float: right;">
					<a href="<c:url value="/pack/calendar.do"/>" class="btn-custom">더보기 
						<span class="ion-ios-arrow-forward"></span>
					</a>
				</div>
			</div>
			<div id="calender"></div>
		</div>
	</div><!-- row -->
		<div class="row">
			<div class="col-lg-offset-1 col-lg-5 " style="margin-top: 10px;">
				<div class="row">
					<div class="col-lg-10 col-sm-8">
						<p style="font-weight: bold;font-size:1.5em;">코멘트</p>
					</div>
					<div class="col-lg-2 col-sm-4" style="padding-top: 10px; float: right;">
						<a href="<c:url value="/pack/comment.do"/>" class="btn-custom">더보기 
							<span class="ion-ios-arrow-forward"></span>
						</a>
					</div>
				</div>
				<table class="table table-bordered table-hover" id="packComment">
					<tr id="tableTitle">
						<th class="text-center">번호</th>
						<th class="text-center">작성자</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
						<th class="text-center"><span class="glyphicon glyphicon-heart"></span></th>
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
			<div class="col-md-5" style="margin-top: 10px;">
				<div class="row">
					<div class="col-lg-10 col-sm-8">
						<p style="font-weight: bold;font-size:1.5em;">갤러리</p>
					</div>
					<div class="col-lg-2 col-sm-4" style="padding-top: 10px; float: right;">
					<a href="<c:url value="/pack/gallery.do"/>" class="btn-custom">더보기 
						<span class="ion-ios-arrow-forward"></span>
					</a>
				</div>
				</div>
				<div id="gallery">
					<c:if test="${empty packGalleryList}" var="isEmpty">
						<h3 style="text-align: center; line-height: 150px;color:grey">갤러리에 사진이 없어요.</h3>
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
			<div class="col-lg-offset-1 col-lg-10" style="margin-top: 10px;">
				<div class="row">
					<div class="col-lg-11 col-sm-9">
						<p style="font-weight: bold;font-size:1.5em;">코스 목록</p>
					</div>
					<div class="col-lg-1 col-sm-3" style="padding-top: 13px;">
						<a href="#" class="btn-custom">더보기 
						<span class="ion-ios-arrow-forward"></span>
					</a>
					</div>
				</div>
				<table class="table table-bordered table-hover">
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
</div>