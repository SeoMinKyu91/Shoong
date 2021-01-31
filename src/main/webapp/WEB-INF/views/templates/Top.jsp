<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Preloader Start -->
<div id="preloader-active">
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-inner position-relative">
			<div class="preloader-circle"></div>
			<div class="preloader-img pere-text">
				<img src="<c:url value="change/img/logo/loder.jpg"/>" alt="">
			</div>
		</div>
	</div>
</div>
<!-- Preloader Start -->
<header>
	<!-- Header Start -->
	<div class="header-area header-transparent">
		<div class="main-header">
			<div class="header-bottom  header-sticky">
				<div class="container-fluid">
					<div class="row align-items-center">
						<!-- Logo -->
						<div class="col-xl-2 col-lg-2 col-md-1">
							<div class="logo">
								<a href="index.html"><img
									src="<c:url value='change/img/shooongLogo.png'/>" style="width:50px">&emsp;SHOOONG</a>
							</div>
						</div>
						<div class="col-xl-10 col-lg-10 col-md-8">
							<!-- Main-menu -->
							<div class="main-menu f-right d-none d-lg-block">
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
										<li><a href="<c:url value="/course/navi.do"/>">Course&Record</a></li>
										<li><a id="naviModalBtn" href="#">ROUTE UPLOAD</a></li>
										<li><a href="<c:url value="/admin/home/main.do"/>">관리자페이지</a></li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
</header>