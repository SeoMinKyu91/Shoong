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

<!-- 모달 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- 제이쿼리 UI용 CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

<!-- mapbox core-->
<link href="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.css" rel="stylesheet" />
<!-- mapbox geocoder -->
<link
	rel="stylesheet"
	href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.css"
	type="text/css" />
<!-- mapbox directions -->
<link rel="stylesheet"
	href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.css"
	type="text/css" />
<!-- mapbox draw -->
<link 
	rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.css' type='text/css' />
	
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
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


<!-- 
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="<c:url value="/js/jquery.min.js"/>"></script> 
<script src="<c:url value="/js/jquery-migrate-3.0.1.min.js"/>"></script>-->
<script src="<c:url value="/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/js/jquery.waypoints.min.js"/>"></script>
<script src="<c:url value="/js/jquery.stellar.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/js/aos.js"/>"></script>
<script src="<c:url value="/js/jquery.animateNumber.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.timepicker.min.js"/>"></script>
<script src="<c:url value="/js/scrollax.min.js"/>"></script>
<!-- 지도 -->
<script src="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.js"></script>
<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.min.js"></script>
<script
	src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.js"></script>
<script 
	src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.js'></script>
<script 
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaa4b242f112a823dd2ef5541569589&libraries=services,clusterer"></script>
<script src="<c:url value="/js/main.js"/>"></script>

</body>
</html>
