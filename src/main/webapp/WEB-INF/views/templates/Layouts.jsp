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

<link rel="stylesheet"
	href="<c:url value="/change/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/change/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/slicknav.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/flaticon.css"/>">
<link rel="stylesheet"
	href="<c:url value="/change/css/animate.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/change/css/magnific-popup.css"/>">
<link rel="stylesheet"
	href="<c:url value="/change/css/fontawesome-all.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/change/css/themify-icons.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/slick.css"/>">
<link rel="stylesheet"
	href="<c:url value="/change/css/nice-select.css"/>">
<link rel="stylesheet" href="<c:url value="/change/css/style.css"/>">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<!-- top 시작 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		<div class="slider-area hero-overly">
			<div
				class="single-slider hero-overly  slider-height d-flex align-items-center">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-9">
							<!-- Hero Caption -->
							<div class="hero__caption">
								<h1 style="font-size: 8em">SHOOONG.</h1>
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

	<!-- JS here -->
	<!-- All JS Custom Plugins Link Here here -->
	<script src="<c:url value="/change/js/vendor/modernizr-3.5.0.min.js"/>"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="<c:url value="/change/js/vendor/jquery-1.12.4.min.js"/>"></script>
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