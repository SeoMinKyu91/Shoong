<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
	<!-- 
   <script src="<c:url value="/js/google-map.js"/>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    -->
  <script src="<c:url value="/js/main.js"/>"></script>
	


<div id="colorlib-page">
	<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
	<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
	
		<h1 id="colorlib-logo"><a href="<c:url value="/"/>"><img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>" style="width:100px"></a></h1>
		
		<nav id="colorlib-main-menu" role="navigation">
	
			<ul>
				<li><a href="<c:url value="/"/>">HOME</a></li>
				<li><a href="<c:url value="/course/navi.do"/>">Navi</a></li>
				<c:if test="${empty sessionScope.userId}" var="isNotLogin">
					<li><a href="<c:url value="/Member/Login.do"/>">LOGIN</a></li>
				</c:if>
				<c:if test="${!isNotLogin}">
					<li><a href="<c:url value="/Member/Logout.do"/>">LOGOUT</a></li>
					<li><a href="<c:url value="/Member/mypage.do"/>">MY PAGE</a></li>
					<li><a href="<c:url value="/pack/main.do"/>">PACK</a></li>
					<li><a href="<c:url value="/course/main.do"/>">Course</a></li>
				</c:if>
				<c:if test="${empty sessionScope.userId}" var="isNotLogin">
					<li><a href="<c:url value="/Member/Join.do"/>">JOIN</a></li>
				</c:if>
				<c:if test="${!isNotLogin}"></c:if>
				<c:if test="${sessionScope.userId == 'guest'}" var="isNotId">
					<li><span style="font-size: .8em">${sessionScope.userId}님 어서오세요</span></li>
				</c:if>
				<c:if test="${!isNotId}">
				</c:if>
				<li><a href="<c:url value="/course/navi.do"/>">Navi</a></li>
				<li><a href="<c:url value="/course/navi.do"/>" data-toggle="modal" data-target="#galleryModal">Route Upload</a></li>
			</ul>
		</nav>
		


	<!-- 여기는 정확히 무슨 기능인지 잘모르겠지만 활용도가 있을 수도 있을거 같아서 냅뒀습니다 -->
	<div class="colorlib-footer">
		<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
		<ul>
			<li><a href="#"><i class="icon-facebook"></i></a></li>
			<li><a href="#"><i class="icon-twitter"></i></a></li>
			<li><a href="#"><i class="icon-instagram"></i></a></li>
			<li><a href="#"><i class="icon-linkedin"></i></a></li>
		</ul>
	</div>
	<!-- 여기는 정확히 무슨 기능인지 잘모르겠지만 활용도가 있을 수도 있을거 같아서 냅뒀습니다 -->
	</aside> <!-- END COLORLIB-ASIDE -->
</div>

