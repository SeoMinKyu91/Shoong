<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- 선택페이지 class="colorlib-active" 추가해주는 스크립트 만들기 -->
<style>
	.test{
		list-style: none;
		display: flex;
	}
	.test li{
		display: flex;
	}
	.navbar-brand {
		float : left;
		height : 50px;
	}

</style>
<!--
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary" class="text-center box" style="width: 100%; height: 50px;background-color: grey; t">
	<a href="<c:url value="/"/>" id="colorlib-logo"><img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>" style="width:100px"></a>
	<nav id="colorlib-main-menu" role="navigation">
		
	</nav>
<!-- 여기는 정확히 무슨 기능인지 잘모르겠지만 활용도가 있을 수도 있을거 같아서 냅뒀습니다 
<div class="colorlib-footer">
	<ul>
		<li><a href="https://ko-kr.facebook.com/"><i class="icon-facebook"></i></a></li>
		<li><a href="https://twitter.com/?lang=ko"><i class="icon-twitter"></i></a></li>
		<li><a href="https://www.instagram.com/"><i class="icon-instagram"></i></a></li>
		<li><a href="https://kr.linkedin.com/"><i class="icon-linkedin"></i></a></li>
	</ul>
</div>	
</aside>  END COLORLIB-ASIDE -->

<nav class="navbar navbar-default navbar-expand-sm navbar-fixed-top">
	<div class="container-fluid">
		<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" style="background-color: white"
				data-toggle="collapse" data-target="#collapse-menu">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href='<c:url value="/"/>'><img src="<c:url value= 'images/shooongLogo.png'/>"  style="width: 40px; height: 40px;"/></a>
		</div>
		<!-- 화면 크기가 클때 상단에 보여지는 메뉴(데스크탑용) -->
		<div class="collapse navbar-collapse navbar-right" id="collapse-menu">
			<!-- 네비게이션바에 폼 추가 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="colorlib-active"><a href="<c:url value="/"/>">HOME</a></li>
				<c:if test="${empty sessionScope.userId}" var="isNotLogin">
					<li><a href="<c:url value="/Member/Login.do"/>">LOGIN</a></li>
				</c:if>
				<c:if test="${!isNotLogin}">
					<li><a href="<c:url value="/Member/Logout.do"/>">LOGOUT</a></li>
					<li><a href="<c:url value="/mypage/main.do"/>">MY PAGE</a></li>
					<li><a href="<c:url value="/pack/main.do"/>">PACK</a></li>
					<li><a href="<c:url value="/course/mainTest.do"/>">COURSE</a></li>
				</c:if>
				<c:if test="${empty sessionScope.userId}" var="isNotLogin">
					<li><a href="<c:url value="/Member/Join.do"/>">JOIN</a></li>
				</c:if>
				<c:if test="${!isNotLogin}"></c:if>
				<c:if test="${sessionScope.userId == 'guest'}" var="isNotId">
					<li><span style="font-size: .8em">${sessionScope.userId}님 어서오세요</span></li>
					<li><a href="<c:url value="/course/mainTest.do"/>">COURSE</a></li>
				</c:if>
				<c:if test="${!isNotId}">
				</c:if>
				<li><a href="<c:url value="/course/navi.do"/>">Course&Record</a></li>
				<li><a id="naviModalBtn" href="#">ROUTE UPLOAD</a></li>
				<li><a href="<c:url value="/admin/home/main.do"/>">관리자페이지</a></li>
			</ul>
		</div>
	</div>
</nav>
<!--  -->
