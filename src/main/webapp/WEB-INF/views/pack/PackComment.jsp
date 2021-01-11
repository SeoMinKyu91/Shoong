	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 제이쿼리 코어용 라이브러리 임베드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 제이쿼리 UI용 라이브러리 임베드 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- 모달  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- 모달 -->
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/comment.css"/>">

<script>
	
</script>

<style>
	.feed-bottom-icon img{
	margin: 6px 0px 6px 15px;
}
	

	
	
	
</style>


<div id="colorlib-page">
	<div id="colorlib-main">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-tittle text-center mb-80 col-lg-12" >
					<h1 style="margin-top: 15px;">PACK COMMENT</h1>
				</div>
					
			</div>
		</div>	
		<hr>
		
		<!-- 피드 메인 시작 DIV -->
		<div class="container">
			<div class="row" id="body-div">
				<div class="col-12" style="display:flex; justify-content: center; align-items:center;">
					<div class="row feed-rows">
						<div class="feed" style="border:1px blue solid;">
							<div class="row feed-inner" style="boder:1px green solid;">
								<div class="col-12">
									<div class="row feed-row">
										<!-- 피드 top 시작 -->
										<div class="col-12 feed-top">
											<div class="row feed-top-row">
												
												<div class="col-2 feed-top-imgs" style="text-align: center;">
													<img class="feed-top-img-src" alt="이미지사진" src="<c:url value="/images/image_10.jpg"/>"/>
												</div>
												
												<div class="col-7 feed-top-nick">
													<span class="feed-top-nick-span">김길동</span>
												</div>
												
											</div><!-- feed-top-row -->
										</div><!-- feed-row -->
										<!-- 피드 top 끝 -->
										
										
									</div>
									<!-- 피드 이미지 시작 -->
									<div class="row feed-img-row">
										<div class="col-12 feed-img carousel slide" id="testoftest" data-ride="carousel" data-interval="false">
											<!-- indicators -->
											<ol class="carousel-indicators">
												<li data-target="testoftest" data-slide-to="0" class="active"></li>
											    <li data-target="testoftest" data-slide-to="1"></li>
    											<li data-target="testoftest" data-slide-to="2"></li>
											</ol>
											
											<!-- Wrapper for slides -->
											<div class="carousel-inner" role="listbox">
												<div class="item active">
													<img class="feed-img-src" src="<c:url value="/images/image_6.jpg"/>" alt=""/>
												</div>
												<div class="item">
													<img class="feed-img-src" src="<c:url value="/images/image_7.jpg"/>" alt=""/>
												</div>
												<div class="item">
													<img class="feed-img-src" src="<c:url value="/images/image_8.jpg"/>" alt=""/>
												</div>
											</div>
											
											<!-- Controls -->
											<a class="left carousel-control" href="#testoftest" role="button" data-slide="prev" style="background-color: none;">
										    	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										    	<span class="sr-only">Previous</span>
									    	</a>
										    <a class="right carousel-control" href="#testoftest" role="button" data-slide="next">
										    	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										    	<span class="sr-only">Next</span>
										  	</a>
											
										</div>
									</div><!-- feed-img-row -->
									<!-- 피드 이미지 끝 -->
									
									<!-- 피드 bottom 시작 -->
									<div class="feed-bottoms">
										<div class="row feed-bottom-row" >
											<div class="col-10 feed-bottom-icon">
												<img class="icon likely-icon" src="<c:url value='/images/fa-icons/heart.png'/>" title="Likely" style="">
												<img class="icon reply-icon" src="<c:url value='/images/fa-icons/comment.png'/>" />
											</div>
										</div>
									</div>
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		

		
		
	</div>
</div>

<script>
	
</script>



