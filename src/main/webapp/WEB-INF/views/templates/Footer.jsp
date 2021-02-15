<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
ul li a {
	font-size : 1.2em;
}
</style>
<!-- Footer Start-->
        <div class="footer-area">
            <div class="container">
               <div class="footer-top footer-padding">
                    <div class="row justify-content-between">
                        <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="single-footer-caption mb-30">
                                    <!-- logo -->
                                    <div class="footer-logo">
                                        <a href="<c:url value="/"/>" id="homeAtag"><img
										src="<c:url value='/change/img/shooongLogo.png'/>"
										style="width: 50px;">&emsp; <span id="shooongSpan">SHOOONG.</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Quick Link</h4>
                                    <ul>
                                        <li><a href="<c:url value="/"/>" id="homeAtag">HOME</a></li>
                                        <c:if test="${empty sessionScope.userId}" var="isNotLogin">
											<li><a href="<c:url value="/Member/Join.do"/>">JOIN</a></li>
										</c:if>
										<c:if test="${empty sessionScope.userId}" var="isNotLogin">
											<li><a href="<c:url value="/Member/Login.do"/>">LOGIN</a></li>
										</c:if>
										<c:if test="${!isNotLogin}">
											<li><a href="<c:url value="/Member/Logout.do"/>">LOGOUT</a></li>
											<li><a href="<c:url value="/mypage/main.do"/>">MY PAGE</a></li>
											<li><a href="<c:url value="/pack/main.do"/>">PACK</a></li>
										</c:if>
										<c:if test="${not empty sessionScope.userId}">
											<li><a href="<c:url value="/course/navi.do"/>">SHOONG</a></li>
										</c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>PACK</h4>
                                    <ul>
                                    	<c:if test="${!isNotLogin}">
                                        	<li><a href="<c:url value="/pack/notice/list.do"/>">NOTICE</a></li>
                                        	<li><a href="<c:url value="/pack/comment.do"/>">COMMUNNITY</a></li>
                                        	<li><a href="<c:url value="/pack/gallery.do"/>">GALLERY</a></li>
                                        	<li><a href="<c:url value="/pack/rank.do"/>">RANKING</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>Download App</h4>
                                    <ul>
                                        <li class="app-log"><a href="#"><img src="<c:url value='change/img/gallery/app-logo.png'/>" alt=""></a></li>
                                        <li><a href="#"><img src="<c:url value='change/img/gallery/app-logo2.png'/>" alt=""></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
               </div>
                <div class="footer-bottom">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-xl-9 col-lg-8">
                            <div class="footer-copy-right">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4">
                            <!-- Footer Social -->
                            <div class="footer-social f-right">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fas fa-globe"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
        <!-- Footer End-->
