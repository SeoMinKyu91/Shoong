<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.animated-text{
	display:none;
}
.slider-area{
	display:none;
}

</style>

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


