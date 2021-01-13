<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<<<<<<< HEAD

	<!-- 
   <script src="<c:url value="/js/google-map.js"/>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    -->
	
	<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
	<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
		<a href="<c:url value="/"/>" id="colorlib-logo"><img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>" style="width:100px"></a>
		<nav id="colorlib-main-menu" role="navigation">
			<ul>
				<li><a href="<c:url value="/"/>">HOME</a></li>
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
					<li><a href="<c:url value="/course/main.do"/>">Course</a></li>
				</c:if>
				<c:if test="${!isNotId}">
				</c:if>
				<li><a href="<c:url value="/course/navi.do"/>">Navi</a></li>
				<li><a href="#" data-toggle="modal" data-target="#galleryModal">Route Upload</a></li>
				<li><a href="<c:url value="/admin/home/main.do"/>">관리자페이지</a></li>
			</ul>
		</nav>

	<!-- 여기는 정확히 무슨 기능인지 잘모르겠지만 활용도가 있을 수도 있을거 같아서 냅뒀습니다 -->
	<div class="colorlib-footer">
		<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
=======
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
	<a href="<c:url value="/"/>" id="colorlib-logo"><img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>" style="width:100px"></a>
	<nav id="colorlib-main-menu" role="navigation">
>>>>>>> refs/remotes/origin/test_master
		<ul>
			<li><a href="<c:url value="/"/>">HOME</a></li>
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
				<li><a href="<c:url value="/course/main.do"/>">Course</a></li>
			</c:if>
			<c:if test="${!isNotId}">
			</c:if>
			<li><a href="<c:url value="/course/navi.do"/>">Navi</a></li>
			<li><a href="#" data-toggle="modal" data-target="#naviModal">Route Upload</a></li>
			<li><a href="<c:url value="/admin/home/main.do"/>">관리자페이지</a></li>
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
</aside> <!-- END COLORLIB-ASIDE -->
