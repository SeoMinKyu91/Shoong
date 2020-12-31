<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/packInfoEdit.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- 제이쿼리 UI용 CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 제이쿼리 코어용 라이브러리 임베드 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 제이쿼리 UI용 라이브러리 임베드 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- 모달  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- 모달 -->


<script>

	
	
</script>

<style>
	.cus {
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	.cus th {
		border-bottom: 2px solid black;
	}
	
</style>

<div id="colorlib-page">
	<div id="colorlib-main">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-tittle text-center mb-80 col-lg-12" >
					<h1 style="margin-top: 30px;"> Shoong <small> courseList </small></h1>
				</div>
					
			</div>
		</div>
		<hr>
		
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover cus">
						<tr>
							<th class="text-center col-lg-2 col-xs-1">번호</th>
							<th class="text-center col-lg-6 col-xs-6">제목</th>
							<th class="text-center col-lg-2 col-xs-2">작성자</th>
							<th class="text-center col-lg-2 col-xs-3">작성일</th>
						</tr>
						<tr>
							courseID : ${courseList.courseID}
						</tr>
						<!-- 
						<c:if test="${empty list }" var="isEmpty">
							<tr class="text-center">
								<td colspan="4" class="test-center">등록된 게시물이 없어요</td>
							</tr>
						</c:if>
						 -->
						<!-- 
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
						 -->
					</table>
				</div>
			</div>
			<!--<c:if test="${!empty manager }">
				<div class="row">
					<div class="col-lg-12 text-right">
						<button class="btn btn-warning" data-toggle="modal" id="btnNoticeWrite">등록</button>

					</div>
				</div>
			</c:if>
			-->
			<!-- 
			<div class="row">
				<div class="col-lg-12 text-center">${pagingString }</div>
			</div> -->
		</div>
		
		
		
	</div>
	<!-- END COLORLIB-MAIN -->
</div>
<!-- END COLORLIB-PAGE -->