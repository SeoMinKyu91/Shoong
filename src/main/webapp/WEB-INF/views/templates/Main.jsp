<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- Hero Area Start-->
<div class="slider-area hero-overly">
	<div
		class="single-slider hero-overly  slider-height d-flex align-items-center">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-8 col-lg-9">
					<!-- Hero Caption -->
					<div class="hero__caption">
						<h1 style="font-size:8em">SHOOONG.</h1>
					</div>			
				</div>
			</div>
		</div>

	</div>
</div>
<!--Hero Area End-->
<!-- Popular Locations Start -->
<div class="popular-location section-padding30">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- Section Tittle -->
				<div class="section-tittle text-center mb-80">
					<span>Most visited places</span>
					<h2>Popular Locations</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-location mb-30">
					<div class="location-img">
						<img src="<c:url value='/change/img/gallery/location1.png'/>" alt="">
					</div>
					<div class="location-details">
						<p>New York</p>
						<a href="#" class="location-btn">65 <i class="ti-plus"></i>
							Location
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-location mb-30">
					<div class="location-img">
						<img src="<c:url value='/change/img/gallery/location2.png'/>" alt="">
					</div>
					<div class="location-details">
						<p>Paris</p>
						<a href="#" class="location-btn">60 <i class="ti-plus"></i>
							Location
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-location mb-30">
					<div class="location-img">
						<img src="<c:url value='/change/img/gallery/location3.png'/>" alt="">
					</div>
					<div class="location-details">
						<p>Rome</p>
						<a href="#" class="location-btn">50 <i class="ti-plus"></i>
							Location
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-location mb-30">
					<div class="location-img">
						<img src="<c:url value='/change/img/gallery/location4.png'/>" alt="">
					</div>
					<div class="location-details">
						<p>Italy</p>
						<a href="#" class="location-btn">28 <i class="ti-plus"></i>
							Location
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-location mb-30">
					<div class="location-img">
						<img src="<c:url value='/change/img/gallery/location5.png'/>" alt="">
					</div>
					<div class="location-details">
						<p>Nepal</p>
						<a href="#" class="location-btn">99 <i class="ti-plus"></i>
							Location
						</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="single-location mb-30">
					<div class="location-img">
						<img src="<c:url value='/change/img/gallery/location6.png'/>" alt="">
					</div>
					<div class="location-details">
						<p>indonesia</p>
						<a href="#" class="location-btn">78 <i class="ti-plus"></i>
							Location
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- More Btn -->
		<div class="row justify-content-center">
			<div class="room-btn pt-20">
				<a href="catagori.html" class="btn view-btn1">View All Places</a>
			</div>
		</div>
	</div>
</div>
<!-- Popular Locations End -->


