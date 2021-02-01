<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>슝-shooong.</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--------------------------- new Template link ----------------------------->
<link rel="stylesheet" href="<c:url value="/change/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/slicknav.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/flaticon.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/animate.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/magnific-popup.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/fontawesome-all.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/themify-icons.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/slick.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/nice-select.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/change/slidingText.css"/>">
<!----------------------------------------------------------------------------->

<!----------------------------전 템플릿에서 필요한 link------------------------------>
<link rel="stylesheet" href="<c:url value="/css/ionicons.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/flaticon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/icomoon.css"/>">
<link rel="stylesheet" href="<c:url value="/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/css/open-iconic-bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-datepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.timepicker.css"/>">
<!-- 달력 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.5.0/main.min.css,npm/fullcalendar@5.5.0/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css">

<!-- 모달 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<!-- 제이쿼리 UI용 CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

<!-- mapbox core-->
<link href="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.css" rel="stylesheet" />

<!-- 채팅  -->
<link rel="stylesheet" href="<c:url value="/css/chat.css?asdff"/>">

<script src="https://kit.fontawesome.com/4f2219bca6.js" crossorigin="anonymous"></script>

<!----------------------------------------------------------------------------->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<!-- top 시작 -->
	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
			</div>
		</div>
	</div>
	<header>
		<tiles:insertAttribute name="top" />
	</header>
	<!-- top끝 -->

	<!-- body 시작 -->
	<main>
		<div class="slider-area hero-overly"">
			<div
				class="single-slider hero-overly  slider-height d-flex align-items-center" style="margin-top: 80px;">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-9">
							<!-- Hero Caption -->
							<div class="hero__caption">
								<!-- h1 style="font-size: 8em">SHOOONG.</h1> -->
								<div class="animated-text">
									<div class="line">SHOOONG.</div>
									<div class="line">SHOOONG.</div>
									<div class="line">SHOOONG.</div>
									<div class="line">SHOOONG.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="popular-location section-padding30">
			<div class="container">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</main>
	<!-- body 끝 -->

	<!-- footer 시작 -->
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
	<!-- footer 끝 -->

	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>
 
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<!-- 
	<script src="<c:url value="/js/jquery-migrate-3.0.1.min.js"/>"></script> 
	-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
	<script src="<c:url value="/js/jquery.timepicker.min.js"/>"></script>
	<!-- 지도 -->
	<script src="https://api.mapbox.com/mapbox-gl-js/v2.0.0/mapbox-gl.js"></script>
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.5.1/mapbox-gl-geocoder.min.js"></script>
	<script
	   src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.0/mapbox-gl-directions.js"></script>
	<script 
	   src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.js'></script>
	<script 
	   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaa4b242f112a823dd2ef5541569589&libraries=services,clusterer"></script>
	
	<!-- JS here -->
	<!-- All JS Custom Plugins Link Here here -->
	<script src="<c:url value="/change/js/vendor/modernizr-3.5.0.min.js"/>"></script>
	<!-- Jquery, Popper, Bootstrap 
	<script src="<c:url value="/change/js/vendor/jquery-1.12.4.min.js"/>"></script> -->
	<script src="<c:url value="/change/js/popper.min.js"/>"></script>
	<script src="<c:url value="/change/js/bootstrap.min.js"/>"></script>
	<!-- Jquery Mobile Menu -->
	<script src="<c:url value="/change/js/jquery.slicknav.min.js"/>"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="<c:url value="/change/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/change/js/slick.min.js"/>"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="<c:url value="/change/js/wow.min.js"/>"></script>
	<script src="<c:url value="/change/js/animated.headline.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.magnific-popup.js"/>"></script>

	<!-- Nice-select, sticky -->
	<script src="<c:url value="/change/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.sticky.js"/>"></script>

	<!-- contact js -->
	<script src="<c:url value="/change/js/contact.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.form.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.validate.min.js"/>"></script>
	<script src="<c:url value="/change/js/mail-script.js"/>"></script>
	<script src="<c:url value="/change/js/jquery.ajaxchimp.min.js"/>"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="<c:url value="/change/js/plugins.js"/>"></script>
	<script src="<c:url value="/change/js/main.js"/>"></script>
</body>
</html>