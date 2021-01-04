<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ���⿡ �ڱⰡ css���ο�� ����÷��� �ϸ� link�ɾ �߰��ϸ� �˴ϴ� -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">

<div id="colorlib-main"
	style="padding-top: 30px; padding-left: 30px; padding-right: 30px">
	<div style="margin-bottom: 2%">${sessionScope.id}���ǰ�����</div>
	<div class="row align-items-start">
		<c:if test="${empty imgList}" var="notEmpty">
			<div>��ϵ� �̹����� �����</div>
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

