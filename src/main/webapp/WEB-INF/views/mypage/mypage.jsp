<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ���⿡ �ڱⰡ css���ο�� ����÷��� �ϸ� link�ɾ �߰��ϸ� �˴ϴ� -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- ���⿡ �ڱⰡ css���ο�� ����÷��� �ϸ� link�ɾ �߰��ϸ� �˴ϴ� -->
<!-- �� ���������� �ʿ��� js, css �� ��ũ�ɾ� ��� -->
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
	display: flex; /* ������ �߾����� �ϱ����� flex ��� */
	align-items: center; /* ���Ʒ� ���� �߾����� */
	justify-content: center; /* �¿� ���� �߾����� */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 100%; /* �̹��� �ִ�ʺ� ����, �����̵忡 �̹����� �������� �������� �ʿ� */
	/* �� �������� �ʿ��ؼ� �����߽��ϴ�. ��Ȳ������ �ٸ� �� �ֽ��ϴ�. */
}


</style>

<div id="colorlib-main" style="padding-top: 30px; padding-left: 30px">
	<div style="display: inline-block; width: 80%;">
		<strong>${sessionScope.id}</strong><span>��</span>
		<button style="float: right"
			onclick="location.href='<c:url value="/myInfoEdit.do"/>'">��������</button>
	</div>
	<div
		style="width: 40%; display: inline-block; margin-right: 8%">
		<a style="float: right" href="<c:url value="/"/>">�������</a>
		<table
			class="table table-bordered table-hover table-condensed text-center">
			<!-- ���̺� �÷����� col-*-*�迭�� ���� -->
			<tr style="height: 10px">
				<span>���� ���</span>
			</tr>
			<c:if test="${empty courseList }" var="isEmpty">
				<tr>
					<td colspan="6">��ϵ� �Խù��� �����</td>
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
						<td>${item.COURSE_TIME}�ð�</td>
						<td>${item.COURSE_LENGTH}km</td>
						<td>${item.COURSE_REGION}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<a href='<c:url value="/"/>' style="float: right">������</a>
	</div>
	<div style="display: inline-block;">
		<a>���̾ �ٷΰ���</a>
	</div>
	<div style="margin-top: 10px">
		<span>������</span>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:if test="${empty imgList }" var="isEmpty">
					<span style="text-align: center">��ϵ� �̹����� �����</span>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${imgList}">
						<div class="swiper-slide">
							<img src="<c:url value='/images/gallery/${item.DIARY_IMG_NAME}'/>">
						</div>
					</c:forEach>
				</c:if>
			</div>

			<!-- �׺���̼� -->
			<div class="swiper-button-next"></div>
			<!-- ���� ��ư (�����ʿ� �ִ� ��ư) -->
			<div class="swiper-button-prev"></div>
			<!-- ���� ��ư -->

			<!-- ����¡ -->
			<div class="swiper-pagination"></div>
		</div>
		<a href='<c:url value="/myGallery.do"/>'
			style="float: right; margin-right: 15%">������</a>
	</div>
</div>

<script>
	new Swiper('.swiper-container', {

		slidesPerView : 5, // ���ÿ� ������ �����̵� ����
		spaceBetween : 30, // �����̵尣 ����
		slidesPerGroup : 5, // �׷����� ���� ��, slidesPerView �� ���� ���� �����ϴ°� ����

		// �׷���� ���� ���� ��� ��ĭ���� �޿��
		// 3���� ���;� �Ǵµ� 1���� �ִٸ� 2���� ��ĭ���� ä���� 3���� ����
		loopFillGroupWithBlank : true,

		loop : true, // ���� �ݺ�

		pagination : { // ����¡
			el : '.swiper-pagination',
			clickable : true, // ����¡�� Ŭ���ϸ� �ش� �������� �̵�, �ʿ�� ������ ��� ��� �۵�
		},
		navigation : { // �׺���̼�
			nextEl : '.swiper-button-next', // ���� ��ư Ŭ������
			prevEl : '.swiper-button-prev', // �̹� ��ư Ŭ������
		},
	});
</script>