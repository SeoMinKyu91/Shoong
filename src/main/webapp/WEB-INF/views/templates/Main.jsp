<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<style>
.col-centered {
	float: none;
	margin: 0 auto;
}

.carousel-control {
	width: 8%;
	width: 0px;
}

.carousel-control.left, .carousel-control.right {
	margin-right: 40px;
	margin-left: 32px;
	background-image: none;
	opacity: 1;
}

.carousel-control>a>span {
	color: white;
	font-size: 29px !important;
}

.carousel-col {
	position: relative;
	min-height: 1px;
	padding: 5px;
	float: left;
}

.active>div {
	display: none;
}

.active>div:first-child {
	display: block;
}

/*xs*/
@media ( max-width : 767px) {
	.carousel-inner .active.left {
		left: -50%;
	}
	.carousel-inner .active.right {
		left: 50%;
	}
	.carousel-inner .next {
		left: 50%;
	}
	.carousel-inner .prev {
		left: -50%;
	}
	.carousel-col {
		width: 50%;
	}
	.active>div:first-child+div {
		display: block;
	}
}

/*sm*/
@media ( min-width : 768px) and (max-width: 991px) {
	.carousel-inner .active.left {
		left: -50%;
	}
	.carousel-inner .active.right {
		left: 50%;
	}
	.carousel-inner .next {
		left: 50%;
	}
	.carousel-inner .prev {
		left: -50%;
	}
	.carousel-col {
		width: 50%;
	}
	.active>div:first-child+div {
		display: block;
	}
}

/*md*/
@media ( min-width : 992px) and (max-width: 1199px) {
	.carousel-inner .active.left {
		left: -33%;
	}
	.carousel-inner .active.right {
		left: 33%;
	}
	.carousel-inner .next {
		left: 33%;
	}
	.carousel-inner .prev {
		left: -33%;
	}
	.carousel-col {
		width: 33%;
	}
	.active>div:first-child+div {
		display: block;
	}
	.active>div:first-child+div+div {
		display: block;
	}
}

/*lg*/
@media ( min-width : 1200px) {
	.carousel-inner .active.left {
		left: -25%;
	}
	.carousel-inner .active.right {
		left: 25%;
	}
	.carousel-inner .next {
		left: 25%;
	}
	.carousel-inner .prev {
		left: -25%;
	}
	.carousel-col {
		width: 25%;
	}
	.active>div:first-child+div {
		display: block;
	}
	.active>div:first-child+div+div {
		display: block;
	}
	.active>div:first-child+div+div+div {
		display: block;
	}
}

.block {
	width: 306px;
	height: 230px;
}
.list-img > img {
	width: 500px;
	height: 300px;
}


</style>
<!-- Popular Locations Start -->
<div class="row">
	<div class="col-xs-12 col-lg-12 col-centered">
		<!-- Section Tittle -->
		<div class="section-tittle text-center mb-80">
			<h2>추천 코스</h2>
		</div>
	</div>
</div>
<!-- 캐러셀 -->
<div class="row">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel" data-type="multi" data-interval="2500">
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="col-lg-4 col-xs-6">
					<div class="single-listing mb-30">
						<div class="list-img">
							<img src="<c:url value='/change/img/gallery/jatoo1.jpg'/>" alt="">
						</div>
						<div class="list-caption">
							<h3>
								<a href='<c:url value="#"/>'>동부3고개~사나사계곡 누릉지백숙</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-xs-6">
					<div class="single-listing mb-30">
						<div class="list-img">
							<img src="<c:url value='/change/img/gallery/jatoo2.jpg'/>" alt="">
						</div>
						<div class="list-caption">
							<h3>
								<a href='<c:url value="#"/>'>북악스카이웨이 초소</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-listing mb-30">
						<div class="list-img">
							<img src="<c:url value='/change/img/gallery/jatoo3.jpg'/>" alt="">
						</div>
						<div class="list-caption">
							<h3>
								<a href='<c:url value="#"/>'>이포보_여주보 왕복</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<div class="col-lg-4 col-xs-6">
					<div class="single-listing mb-30">
						<div class="list-img">
							<img src="<c:url value='/change/img/gallery/jatoo4.jpg'/>" alt="">
						</div>
						<div class="list-caption">
							<h3>
								<a href='<c:url value="#"/>'>동해종주 하프코스</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-xs-6">
					<div class="single-listing mb-30">
						<div class="list-img">
							<img src="<c:url value='/change/img/gallery/jatoo5.jpg'/>" alt="">
						</div>
						<div class="list-caption">
							<h3>
								<a href='<c:url value="#"/>'>가오리코스</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-listing mb-30">
						<div class="list-img">
							<img src="<c:url value='/change/img/gallery/jatoo6.jpg'/>" alt="">
						</div>
						<div class="list-caption">
							<h3>
								<a href='<c:url value="#"/>'>팔당토끼굴회귀_동부3고개-황금리-분원리</a>
							</h3>
						</div>
					</div>
				</div>
				<div class="carousel-caption">...</div>
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		</a>
	</div>
</div>
<!-- More Btn -->
<div class="row justify-content-center" style="margin-top: 20px;">
	<div class="room-btn pt-20">
		<a href='<c:url value="#"/>' class="btn view-btn1"
			style="background-color: #f32a48; font-weight: bold;">코스 더
			보기&nbsp;<span class="glyphicon glyphicon-arrow-right"
			aria-hidden="true"></span>
		</a>
	</div>
</div>
<!-- Popular Locations End -->
<script>
	$('.carousel[data-type="multi"] .item').each(function() {
		var next = $(this).next();
		if (!next.length) {
			next = $(this).siblings(':first');
		}
		next.children(':first-child').clone().appendTo($(this));

		for (var i = 0; i < 3; i++) {
			next = next.next();
			if (!next.length) {
				next = $(this).siblings(':first');
			}

			next.children(':first-child').clone().appendTo($(this));
		}
	});
	
	$(function(){
		$.ajax({
			url:"http://localhost:5000/jatoo?region=sj",
			type:"get",
			success:function(data){
				console.log("성공");
				console.log("리시브데이터:%O",data);
				const routeList = data.routes
				var routeListStr = "";
				routeList.forEach(function(elt, i, array){
					
				});
			},
			error:function(request,status,error){
				console.log("실패",request,status,error);
			}
		});
	});
</script>