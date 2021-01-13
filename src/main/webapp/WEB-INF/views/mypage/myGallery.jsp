<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">

<div id="colorlib-main"
	style="padding-top: 30px; padding-left: 30px; padding-right: 30px">
	<div style="margin-bottom: 2%">${name}님의갤러리</div>
	<div class="row align-items-start">
		<c:if test="${empty imgList}" var="notEmpty">
			<div>등록된 이미지가 없어요</div>
		</c:if>
		<c:if test="${!notEmpty}">
			<c:forEach var="item" items="${imgList}" varStatus="status">
				<div class="col img-thumbnail" style="margin: 10px;">
					<img src="<c:url value='/images/gallery/${item.DIARY_IMG_NAME}'/>"
						id="${status.count}"/>
				</div>
			</c:forEach>
		</c:if>

	</div>

</div>

