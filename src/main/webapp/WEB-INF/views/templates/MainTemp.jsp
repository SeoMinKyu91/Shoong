<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->

<!-- ※colorlib-main으로 일단 감싸고 안에다가 작업해야 왼쪽 탑에 안먹히고 작업할 수 있어요 -->
<!-- 설명이 이해가 잘 안되시면  따로 연락주세요...-->
<div id="colorlib-main" style=""><!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->
	<!--::header part start::-->
    <div class="burger">
		<div class="burger__patty"></div>
		<div class="burger__patty"></div>
		<div class="burger__patty"></div>
	</div>

	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container-fluid">
        <a class="navbar-brand js-scroll-trigger" href="index.html">
			<img class="img-fluid" src="images/logo.png" alt="" />
		</a>
      </div>
    </nav>

    <!-- breadcrumb start-->
   <div class="demo-2">
		<div class="page-view">
			<div class="project">
				<div class="text">
					<h1>SKYLINE</h1>
					<p>Photo by James Traf</p>
				</div>
			</div>
			<div class="project">
				<div class="text">
					<h1>Architecture</h1>
					<p>Photo by Steve Richey</p>
				</div>
			</div>
			<div class="project">
				<div class="text">
					<h1>Shadows</h1>
					<p>Photo by Samuel Zeller</p>
				</div>
			</div>
			<div class="project">
				<div class="text">
					<h1>Perspective</h1>
					<p>Photo by Padurariu Alexandru</p>
				</div>
			</div>
			<nav class="arrows">
				<div class="arrow previous">
					<svg viewBox="208.3 352 4.2 6.4">
						<polygon class="st0" points="212.1,357.3 211.5,358 208.7,355.1 211.5,352.3 212.1,353 209.9,355.1"/>
					</svg>
				</div>
				<div class="arrow next">
					<svg viewBox="208.3 352 4.2 6.4">
						<polygon class="st0" points="212.1,357.3 211.5,358 208.7,355.1 211.5,352.3 212.1,353 209.9,355.1"/>
					</svg>
				</div>
			</nav>
		</div>
	</div>
	<div id="about" class="section wb">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="message-box">                        
                        <h2> Welcome To PhotoShoot</h2>
                        <p> Integer rutrum ligula eu dignissim laoreet. Pellentesque venenatis nibh sed tellus faucibus bibendum. Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed vitae rutrum neque. Ut id erat sit amet libero bibendum aliquam. Donec ac egestas libero, eu bibendum risus. Phasellus et congue justo. Integer rutrum ligula eu dignissim laoreet. Pellentesque venenatis nibh sed tellus faucibus bibendum. Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
						<p>Sed vitae rutrum neque. Ut id erat sit amet libero bibendum aliquam. Donec ac egestas libero, eu bibendum risus. Phasellus et congue justo.</p>
						
                        <a href="#" class="hover-effect-new"><span>Lorem Ipsum</span></a>
                    </div><!-- end messagebox -->
                </div><!-- end col -->

                <div class="col-md-6">
                    <div class="right-box-pro wow fadeIn">
                        <img src="uploads/about_01.jpg" alt="" class="img-fluid img-rounded">
                    </div><!-- end media -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	
	<div id="gallery" class="section lb">
		<div class="container">
			<div class="section-title text-center">
				<h3>Gallery</h3>
				<p>Quisque eget nisl id nulla sagittis auctor quis id. Aliquam quis vehicula enim, non aliquam risus.</p>
			</div><!-- end title -->
		
			<div class="gallery-menu text-center row">
				<div class="col-md-12">
					<div class="button-group filter-button-group">
						<button class="active" data-filter="*">All</button>
						<button data-filter=".photo_a">Wedding</button>
						<button data-filter=".photo_b">Models</button>
						<button data-filter=".photo_c">Fashion</button>
					</div>
				</div>
			</div>
		
			<div class="gallery-list row">
				<div class="col-md-4 col-sm-6 gallery-grid photo_a">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-01.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Wedding</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-01.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_b">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-04.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Models</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-04.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_c">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-07.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Fashion</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-07.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_a">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-02.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Wedding</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-02.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_b">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-05.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Models</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-05.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_c">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-08.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Fashion</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-08.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_a">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-03.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Wedding</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-03.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_b">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-06.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Models</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-06.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-sm-6 gallery-grid photo_c">
					<div class="gallery-single fix">
						<img src="uploads/gallery_img-09.jpg" class="img-fluid" alt="Image">
						<div class="box-content">
							<div class="inner-content">
								<h3 class="title">Fashion</h3>
								<span class="post">Latest Photo</span>
							</div>
							<ul class="icon">
								<li><a href="uploads/gallery_img-09.jpg" data-rel="prettyPhoto[gal]"><i class="fa fa-search"></i></a></li>
								<li><a href="#"><i class="fa fa-link"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
	
    <div id="services" class="section lb">
        <div class="container">
            <div class="section-title text-center">
                <h3>Services</h3>
                <p>Quisque eget nisl id nulla sagittis auctor quis id. Aliquam quis vehicula enim, non aliquam risus.</p>
            </div><!-- end title -->

            <div class="row">
				<div class="col-md-4">
					<div class="effect-new">
						<div class="services-inner-box">
							<div class="ser-icon">
								<i class="flaticon-wedding-photo"></i>
							</div>
							<h2>Wedding Photography</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						</div>
					</div>
                </div><!-- end col -->
                <div class="col-md-4">
					<div class="effect-new">
						<div class="services-inner-box">
							<div class="ser-icon">
								<i class="flaticon-image"></i>
							</div>
							<h2>Portrait photography</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						</div>
					</div>
                </div><!-- end col -->
				<div class="col-md-4">
					<div class="effect-new">
						<div class="services-inner-box">
							<div class="ser-icon">
								<i class="flaticon-event"></i>
							</div>
							<h2>Event Photography</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						</div>
					</div>
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	
	 <div id="reviews" class="section wb parallaxie" style="background: url('uploads/reviews-bg.jpg')">
        <div class="container">
            <div class="section-title text-center">
                <h3>Reviews</h3>
                <p>We thanks for all our awesome testimonials! There are hundreds of our happy customers! </p>
            </div><!-- end title -->

            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="testi-carousel owl-carousel owl-theme">
                        <div class="testimonial clearfix">
							<figure class="testimonial_img">
								<img src="uploads/testi_01.jpg" alt="" class="img-fluid">
							</figure>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Wonderful Support!</h3>
                                <p>They have got my project on time with the competition with a sed highly skilled, and experienced & professional team.</p>
                            </div>
                            <div class="testi-meta">
                                <h4>James Fernando </h4>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<figure class="testimonial_img">
								<img src="uploads/testi_02.jpg" alt="" class="img-fluid">
							</figure>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Awesome Services!</h3>
                                <p>Explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you completed.</p>
                            </div>
                            <div class="testi-meta">
                                <h4>Jacques Philips </h4>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<figure class="testimonial_img">
								<img src="uploads/testi_03.jpg" alt="" class="img-fluid">
							</figure>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Great & Talented Team!</h3>
                                <p>The master-builder of human happines no one rejects, dislikes avoids pleasure itself, because it is very pursue pleasure. </p>
                            </div>
                            <div class="testi-meta">
                                <h4>Venanda Mercy </h4>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->
                        <div class="testimonial clearfix">
							<figure class="testimonial_img">
								<img src="uploads/testi_01.jpg" alt="" class="img-fluid">
							</figure>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Wonderful Support!</h3>
                                <p>They have got my project on time with the competition with a sed highly skilled, and experienced & professional team.</p>
                            </div>
                            <div class="testi-meta">
                                <h4>James Fernando </h4>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<figure class="testimonial_img">
								<img src="uploads/testi_02.jpg" alt="" class="img-fluid">
							</figure>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Awesome Services!</h3>
                                <p>Explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you completed.</p>
                            </div>
                            <div class="testi-meta">
                                <h4>Jacques Philips </h4>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->

                        <div class="testimonial clearfix">
							<figure class="testimonial_img">
								<img src="uploads/testi_03.jpg" alt="" class="img-fluid">
							</figure>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Great & Talented Team!</h3>
                                <p>The master-builder of human happines no one rejects, dislikes avoids pleasure itself, because it is very pursue pleasure. </p>
                            </div>
                            <div class="testi-meta">
                                <h4>Venanda Mercy </h4>
                            </div>
                            <!-- end testi-meta -->
                        </div><!-- end testimonial -->
                    </div><!-- end carousel -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	
	<div id="pricing" class="section lb">
		<div class="container">
			<div class="section-title text-center">
                <h3>Pricing</h3>
                <p>Quisque eget nisl id nulla sagittis auctor quis id. Aliquam quis vehicula enim, non aliquam risus.</p>
            </div><!-- end title -->
			
			<div class="row no-gutters pricing-table my-3">
				<div class="col-md-4 pr-2">
					<div class="list-group text-center my-3">
						<div class="list-group-item text-white bg-dark">
							<h4 class="text-center">Basic</h4>
						</div>
						<div class="list-group-item text-uppercase font-weight-bold">
							Free
						</div>
						<a href="#" class="list-group-item">
							100 GB HDD Storage
						</a>
						<a href="#" class="list-group-item">
							Web Server
						</a>
						<a href="#" class="list-group-item">
							DNS Hosting
						</a>
						<a href="#" class="list-group-item">
							Mail Server
						</a>
						<div class="list-group-item">
							<button class="btn btn-secondary hover-effect-new btn-lg btn-block text-truncate"><span>Sign-up</span></button>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="list-group text-center bg-alt">
						<div href="#" class="list-group-item text-white bg-dark">
							<h4 class="text-center">Standard<br></h4>
						</div>
						<div class="list-group-item text-uppercase font-weight-bold">
							$99/mo.
						</div>
						<a href="#" class="list-group-item">
							1 TB HDD Storage
						</a>
						<a href="#" class="list-group-item">
							<span class="float-right"><i class="ion-ios-star-outline fa fa-star-o"></i></span> Database Option
						</a>
						<a href="#" class="list-group-item">
							Web Server
						</a>
						<a href="#" class="list-group-item">
							DNS Hosting
						</a>
						<a href="#" class="list-group-item">
							Mail Server
						</a>
						<a href="#" class="list-group-item">
							24/7 Monitoring
						</a>
						<div class="list-group-item bg-inverse">
							<button class="btn btn-secondary hover-effect-new btn-lg btn-block text-truncate"><span>Buy Now</span></button>
						</div>
					</div>
				</div>
				<div class="col-md-4 pl-2">
					<div class="list-group text-center my-3">
						<div href="#" class="list-group-item text-white bg-dark">
							<h4 class="text-center">Managed</h4>
						</div>
						<div class="list-group-item text-uppercase font-weight-bold">
							Contact Us
						</div>
						<a href="#" class="list-group-item">
							Upto 10 TB HDD Storage
						</a>
						<a href="#" class="list-group-item">
							Consultation
						</a>
						<a href="#" class="list-group-item">
							Custom Servers
						</a>
						<a href="#" class="list-group-item">
							24/7 Support
						</a>
						<div class="list-group-item">
							<button class="btn btn-secondary hover-effect-new btn-lg btn-block text-truncate"><span>Contact Us</span></button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<footer class="main-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-12">
					<div class="mb-3 img-logo">
						<a href="#">
							 <img src="images/logo2.png" alt="">
						</a>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12">
					<h4 class="mb-4 ph-fonts-style foot-title">
						RECENT NEWS
					</h4>
					<p class="ph-links-column">
						<a href="#" class="text-black">About us</a>
						<a href="#" class="text-black">Services</a>
						<a href="#" class="text-black">Selected Work</a>
						<a href="#" class="text-black">Get In Touch</a>
						<a href="#" class="text-black">Careers</a>
					</p>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12">
					<h4 class="mb-4 ph-fonts-style foot-title">
						CATEGORIES
					</h4>
					<p class="ph-links-column">
						<a href="#" class="text-black">Business</a>
						<a href="#" class="text-black">Design</a>
						<a href="#" class="text-black">Real life</a>
						<a href="#" class="text-black">Science</a>
						<a href="#" class="text-black">Tech</a>
					</p>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12">
					<h4 class="mb-4 ph-fonts-style foot-title">
						SUBSCRIBE
					</h4>
					<p class="ph-fonts-style_p">
						Get monthly updates and free resources.
					</p>
					<div class="media-container-column" data-form-type="formoid">
						<div data-form-alert="" class="align-center" hidden="">
							Thanks for filling out the form!
						</div>

						<form class="form-inline" action="#" method="post">
							<input value="" data-form-email="true" type="hidden">
							<div class="form-group">
								<input class="form-control input-sm input-inverse my-2" name="email" required="" data-form-field="Email" placeholder="Email" id="email" type="email">
							</div>
							<div class="input-group-btn">
								<button href="" class="btn hover-effect-new btn-primary" type="submit" role="button"><span> Subscribe </span></button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</footer>

    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-left">                    
                    <p class="footer-company-name">All Rights Reserved. &copy; 2018 Design by : 
					<a href="https://html.design/">html design</a> Distributed by: <a href="https://themewagon.com/">ThemeWagon</a>
                    </p>
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>
	
    <!-- hotel list css end -->
</div><!-- END COLORLIB-MAIN -->
