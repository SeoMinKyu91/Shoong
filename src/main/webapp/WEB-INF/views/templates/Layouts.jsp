<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>Layout.jsp</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">

<link rel="stylesheet" href="<c:url value="/css/open-iconic-bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">

<link rel="stylesheet" href="<c:url value="/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/owl.theme.default.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/magnific-popup.css"/>">

<link rel="stylesheet" href="<c:url value="/css/aos.css"/>">

<link rel="stylesheet" href="<c:url value="/css/ionicons.min.css"/>">

<link rel="stylesheet" href="<c:url value="/css/bootstrap-datepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.timepicker.css"/>">

<link rel="stylesheet" href="<c:url value="/css/flaticon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/icomoon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/style.css"/>">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

<div id="colorlib-page">	
	<!-- top 시작 -->
	<tiles:insertAttribute name="top"/>
	<!-- top끝 -->
	
	<!-- body 시작 -->
	<tiles:insertAttribute name="body"/>	
	<!-- body 끝 -->
	
	<!-- footer 시작 -->
	<tiles:insertAttribute name="footer"/>
	<!-- footer 끝 -->
	
</div><!-- END COLORLIB-PAGE -->
<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>


<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/js/jquery.waypoints.min.js"/>"></script>
<script src="<c:url value="/js/jquery.stellar.min.js"/>"></script>
<script src="<c:url value="/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/js/aos.js"/>"></script>
<script src="<c:url value="/js/jquery.animateNumber.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.timepicker.min.js"/>"></script>
<script src="<c:url value="/js/scrollax.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
</body>
</html>
