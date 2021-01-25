<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- 선택페이지 class="colorlib-active" 추가해주는 스크립트 만들기 -->
<style>
	.box{ -ms-overflow-style: none; } 
	.box::-webkit-scrollbar{ display:none; }
</style>

<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center box">
	<a href="<c:url value="/"/>" id="colorlib-logo"><img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>" style="width:100px"></a>
	<nav id="colorlib-main-menu" role="navigation">
		<ul>
			<li class="colorlib-active"><a href="<c:url value="/"/>">HOME</a></li>
			<c:if test="${empty sessionScope.userId}" var="isNotLogin">
				<li><a href="<c:url value="/Member/Login.do"/>">LOGIN</a></li>
			</c:if>
			<c:if test="${!isNotLogin}">
				<li><a href="<c:url value="/Member/Logout.do"/>">LOGOUT</a></li>
				<li><a href="<c:url value="/mypage/main.do"/>">MY PAGE</a></li>
				<li><a href="<c:url value="/pack/main.do"/>">PACK</a></li>
				<li><a href="<c:url value="/course/main.do"/>">COURSE</a></li>
			</c:if>
			<c:if test="${empty sessionScope.userId}" var="isNotLogin">
				<li><a href="<c:url value="/Member/Join.do"/>">JOIN</a></li>
			</c:if>
			<c:if test="${!isNotLogin}"></c:if>
			<c:if test="${sessionScope.userId == 'guest'}" var="isNotId">
				<li><span style="font-size: .8em">${sessionScope.userId}님 어서오세요</span></li>
				<li><a href="<c:url value="/course/main.do"/>">COURSE</a></li>
			</c:if>
			<c:if test="${!isNotId}">
			</c:if>
			<li><a href="<c:url value="/course/navi.do"/>">NAVI</a></li>
			<li><a id="naviModalBtn" href="#">ROUTE UPLOAD</a></li>
			<li><a href="<c:url value="/admin/home/main.do"/>">관리자페이지</a></li>
		</ul>
	</nav>

<!-- 여기는 정확히 무슨 기능인지 잘모르겠지만 활용도가 있을 수도 있을거 같아서 냅뒀습니다 -->
<div class="colorlib-footer">
	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	<!-- Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> -->
	<ul>
		<li><a href="https://ko-kr.facebook.com/"><i class="icon-facebook"></i></a></li>
		<li><a href="https://twitter.com/?lang=ko"><i class="icon-twitter"></i></a></li>
		<li><a href="https://www.instagram.com/"><i class="icon-instagram"></i></a></li>
		<li><a href="https://kr.linkedin.com/"><i class="icon-linkedin"></i></a></li>
	</ul>
</div>
</aside> <!-- END COLORLIB-ASIDE -->