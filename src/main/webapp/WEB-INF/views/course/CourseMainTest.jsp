<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="<c:url value="/courseTest/img/favicon.png"/>">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/bootstrap.min.css"/>">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/animate.css"/>">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/owl.carousel.min.css"/>">
    <!-- themify CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/themify-icons.css"/>">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/flaticon.css"/>">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/fontawesome/css/all.min.css"/>">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/magnific-popup.css"/>">
    <link rel="stylesheet" href="<c:url value="/courseTest/css/gijgo.min.css"/>">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/nice-select.css"/>">
    <!-- slick CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/slick.css"/>">
    <!-- style CSS -->
    <link rel="stylesheet" href="<c:url value="/courseTest/css/style.css"/>">
</head>
<style>
.animated-text {
	display: none;
}

.slider-area {
	display: none;
}
</style>
<body>
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>SHOOONG.</h2>
                            <p>${sessionScope.userId}님을 위한 코스 추천</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.html">Main</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="about.html">감성</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="packages.html">맛집</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            	연령
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="blog.html">20</a>
                                            <a class="dropdown-item" href="single-blog.html">30</a>
                                            <a class="dropdown-item" href="single-blog.html">40</a>
                                            <a class="dropdown-item" href="single-blog.html">모두</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            	성별
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="top_place.html">남성</a>
                                            <a class="dropdown-item" href="tour_details.html">여성</a>
                                            <a class="dropdown-item" href="elements.html">함께</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.html">더보기</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    

    <!-- about us css start-->
    <section class="hotel_list single_page_hotel_list" style="padding-top: 60px">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>MAIN</h2>
                        <p>Courses waiting for you.</p>
                    </div>
                </div>
            </div>
            

            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<c:url value="/courseTest/img/ind/industries_1.png"/>">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                    <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                </ul>
                            </div>
                            <div class="share_icon">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> Hotel Polonia</a></h3>
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <span>(210 review)</span>
                            </div>
                            <p>London, United Kingdom</p>
                            <p>Date: 23 Aug 2019</p>
                            <p>Duration: 5 days</p>
                            <h5>From <span>$500</span></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<c:url value="/courseTest/img/ind/industries_2.png"/>">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                    <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                </ul>
                            </div>
                            <div class="share_icon">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> Hotel Polonia</a></h3>
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <span>(210 review)</span>
                            </div>
                            <p>London, United Kingdom</p>
                            <p>Date: 23 Aug 2019</p>
                            <p>Duration: 5 days</p>
                            <h5>From <span>$500</span></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<c:url value="/courseTest/img/ind/industries_3.png"/>">
                        <div class="hover_text">
                            <div class="hover_text">
                                <div class="hotel_social_icon">
                                    <ul>
                                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                                        <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                        <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                    </ul>
                                </div>
                                <div class="share_icon">
                                    <i class="ti-share"></i>
                                </div>
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> Hotel Polonia</a></h3>
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <span>(210 review)</span>
                            </div>
                            <p>London, United Kingdom</p>
                            <p>Date: 23 Aug 2019</p>
                            <p>Duration: 5 days</p>
                            <h5>From <span>$500</span></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<c:url value="/courseTest/img/ind/industries_1.png"/>">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                    <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                </ul>
                            </div>
                            <div class="share_icon">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> Hotel Polonia</a></h3>
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <span>(210 review)</span>
                            </div>
                            <p>London, United Kingdom</p>
                            <p>Date: 23 Aug 2019</p>
                            <p>Duration: 5 days</p>
                            <h5>From <span>$500</span></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<c:url value="/courseTest/img/ind/industries_2.png"/>">
                        <div class="hover_text">
                            <div class="hotel_social_icon">
                                <ul>
                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                    <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                </ul>
                            </div>
                            <div class="share_icon">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> Hotel Polonia</a></h3>
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <span>(210 review)</span>
                            </div>
                            <p>London, United Kingdom</p>
                            <p>Date: 23 Aug 2019</p>
                            <p>Duration: 5 days</p>
                            <h5>From <span>$500</span></h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<c:url value="/courseTest/img/ind/industries_3.png"/>">
                        <div class="hover_text">
                            <div class="hover_text">
                                <div class="hotel_social_icon">
                                    <ul>
                                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                                        <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                                        <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                    </ul>
                                </div>
                                <div class="share_icon">
                                    <i class="ti-share"></i>
                                </div>
                            </div>
                        </div>
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> Hotel Polonia</a></h3>
                            <div class="place_review">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <span>(210 review)</span>
                            </div>
                            <p>London, United Kingdom</p>
                            <p>Date: 23 Aug 2019</p>
                            <p>Duration: 5 days</p>
                            <h5>From <span>$500</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about us css end-->


    <!-- jquery plugins here-->
    <script src="<c:url value="/courseTest/js/jquery-1.12.1.min.js"/>"></script>
    <!-- popper js -->
    <script src="<c:url value="/courseTest/js/popper.min.js"/>"></script>
    <!-- bootstrap js -->
    <script src="<c:url value="/courseTest/js/bootstrap.min.js"/>"></script>
    <!-- magnific js -->
    <script src="<c:url value="/courseTest/js/jquery.magnific-popup.js"/>"></script>
    <!-- swiper js -->
    <script src="<c:url value="/courseTest/js/owl.carousel.min.js"/>"></script>
    <!-- masonry js -->
    <script src="<c:url value="/courseTest/js/masonry.pkgd.js"/>"></script>
    <!-- masonry js -->
    <script src="<c:url value="/courseTest/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/courseTest/js/gijgo.min.js"/>"></script>
    <!-- contact js -->
    <script src="<c:url value="/courseTest/js/jquery.ajaxchimp.min.js"/>"></script>
    <script src="<c:url value="/courseTest/js/jquery.form.js"/>"></script>
    <script src="<c:url value="/courseTest/js/jquery.validate.min.js"/>"></script>
    <script src="<c:url value="/courseTest/js/mail-script.js"/>"></script>
    <script src="<c:url value="/courseTest/js/contact.js"/>"></script>
    <!-- custom js -->
    <script src="<c:url value="/courseTest/js/custom.js"/>"></script>
</body>

</html>