<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#shooongSpan {
	color: white;
	font-size: 1.3em;
}

#homeAtag:hover {
	text-decoration: none;
}

@media screen and (max-width: 767px) {
    .header-bottom{ padding: 0; }
}
</style>
<!-- Preloader Start -->
<!-- Header Start -->
<div class="header-area header-transparent"
	style="background-color: #1c1930; border-bottom: none; height: 80px; line-height: 0px;">
	<div class="main-header">
		<div class="col-xs-12 col-lg-12 header-bottom header-sticky">
			<div class="container-fluid">
			<!--  
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						style="background-color: white" data-toggle="collapse"
						data-target="#collapse-menu">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href='<c:url value="/MainPage.kosmo"/>'>
						<img
							src="<c:url value="/change/img/shooongLogo.png"/>"
							style="width: 25px; height: 25px">&emsp; <span id="shooongSpan">SHOOONG.</span></a>
				</div>
				-->
				<div class="row align-items-center">
					<!-- Logo -->
					<div class="col-xl-2 col-lg-2 col-md-1">
						<div class="logo">
							<a href="<c:url value="/"/>" id="homeAtag"><img
								src="<c:url value='/change/img/shooongLogo.png'/>"
								style="width: 50px;">&emsp; <span id="shooongSpan">SHOOONG.</span></a>
						</div>
					</div>
					<div class="col-xs-10 col-lg-10">
						<!-- Main-menu -->
						<div class="main-menu f-right d-none d-block">
							<nav>
								<ul class="navigation">
									<li><a href="<c:url value="/"/>">HOME</a></li>
									<c:if test="${empty sessionScope.userId}" var="isNotLogin">
										<li><a href="<c:url value="/Member/Login.do"/>">LOGIN</a></li>
									</c:if>
									<c:if test="${!isNotLogin}">
										<li><a href="<c:url value="/Member/Logout.do"/>">LOGOUT</a></li>
										<li><a href="<c:url value="/mypage/main.do"/>">MY
												PAGE</a></li>
										<li><a href="<c:url value="/pack/main.do"/>">PACK</a></li>
										<li><a href="<c:url value="/course/mainTest.do"/>">COURSE</a></li>
									</c:if>
									<c:if test="${empty sessionScope.userId}" var="isNotLogin">
										<li><a href="<c:url value="/Member/Join.do"/>">JOIN</a></li>
									</c:if>
									<c:if test="${!isNotLogin}"></c:if>
									<c:if test="${sessionScope.userId == 'guest'}" var="isNotId">
										<li><span style="font-size: .8em">${sessionScope.userId}님
												어서오세요</span></li>
										<li><a href="<c:url value="/course/mainTest.do"/>">COURSE</a></li>
									</c:if>
									<c:if test="${!isNotId}">
									</c:if>
									<c:if test="${not empty sessionScope.userId}">
										<li><a href="<c:url value="/course/navi.do"/>">Course&Record</a></li>
									</c:if>
									<li><a id="naviModalBtn" href="#">ROUTE UPLOAD</a></li>
									<li><a href="<c:url value="/admin/home/main.do"/>">관리자페이지</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<!-- Mobile Menu -->
					<div class="col-12">
						<div class="mobile_menu d-block "></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
