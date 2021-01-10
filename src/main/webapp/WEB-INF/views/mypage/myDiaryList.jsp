<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.cardDiv{
	margin-top: 20px;
	background-color: white;
	}
.single-location{
	position:relative;
	}
.single-location .location-img{
	border-radius:10px;overflow:hidden;position:relative;z-index:0
}
.single-location .location-img::before
{
	position:absolute;width:100%;height:50%;bottom:0;content:"";z-index:1
}
.single-location .location-img img{
	width:100%;  height: 170px;transform:scale(1);transition:all .5s ease-out 0s
}
.single-location .location-details{
	width:100%;
	position:absolute;left:70%;bottom:-9px;-webkit-transition:all .2s ease-out 0s;
	-moz-transition:all .2s ease-out 0s;
	-ms-transition:all .2s ease-out 0s;-o-transition:all .2s ease-out 0s;transition:all .2s ease-out 0s
	}
.single-location .location-details .location-btn{
	padding:10px 20px;background:#fff;color:#333333;border-radius:30px;opacity:0;visibility:hidden;
	font-family: 'Do Hyeon', sans-serif;
	}
.card-body:hover .location-img img{
	transform:scale(1.1)
	}
.card-body:hover .location-details{
	bottom:7%
	}
.card-body:hover .location-details .location-btn{
	opacity:1;visibility:visible;
	}
.card-title{
	font-size: 20px;
}.card-body{
	padding: 5px;
	border:1px solid #eeeeee;
}
</style>


<div id="colorlib-main">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<h3>나의 라이딩 다이어리<small><a href='<c:url value="/mypage/DiaryWrite.do"/>'>추가하기</a></small></h3>
			</div>
		</div>	
		<div class="row">
			<div class="col-md-3 col-xs-6 cardDiv">
				<article class="card shadow">
					<div class="card-body">
						<div class="single-location mb-30">
							<div class="location-img">
								<img src='<c:url value="/images/bg_1.jpg"/>' alt="스토리 메인 사진">
								<!--<img src=/fileupload/${item.storyMainImg} alt="스토리 메인 사진">  -->
							</div>
							<div class="location-details">
								<span class="location-btn">
									<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>5
								</span>
							</div>	
						</div>
			            <h4 class="card-title">한강 라이딩</h4>
			         </div>
				</article>
				<input class="storyNo" type="hidden" value="${item.storyNo}"/>
			</div>
				
			<div class="col-md-3 col-xs-6 cardDiv">
				<article class="card shadow">
					<div class="card-body">
						<div class="single-location mb-30">
							<div class="location-img">
								<img src='<c:url value="/images/bg_2.jpg"/>' alt="스토리 메인 사진">
								<!--<img src=/fileupload/${item.storyMainImg} alt="스토리 메인 사진">  -->
							</div>
							<div class="location-details">
								<span class="location-btn">
									<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>5
								</span>
							</div>	
						</div>
			            <h4 class="card-title">북한강 라이딩</h4>
			         </div>
				</article>
				<input class="storyNo" type="hidden" value="${item.storyNo}"/>
			</div>
			
			<div class="col-md-3 col-xs-6 cardDiv">
				<article class="card shadow">
					<div class="card-body">
						<div class="single-location mb-30">
							<div class="location-img">
								<img src='<c:url value="/images/bg_3.jpg"/>' alt="스토리 메인 사진">
								<!--<img src=/fileupload/${item.storyMainImg} alt="스토리 메인 사진">  -->
							</div>
							<div class="location-details">
								<span class="location-btn">
									<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>5
								</span>
							</div>	
						</div>
			            <h4 class="card-title">야간 라이딩</h4>
			         </div>
				</article>
				<input class="storyNo" type="hidden" value="${item.storyNo}"/>
			</div>
			<div class="col-md-3 col-xs-6 cardDiv">
				<article class="card shadow">
					<div class="card-body">
						<div class="single-location mb-30">
							<div class="location-img">
								<img src='<c:url value="/images/bg_4.jpg"/>' alt="스토리 메인 사진">
								<!--<img src=/fileupload/${item.storyMainImg} alt="스토리 메인 사진">  -->
							</div>
							<div class="location-details">
								<span class="location-btn">
									<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>5
								</span>
							</div>	
						</div>
			            <h4 class="card-title">야간 라이딩</h4>
			         </div>
				</article>
				<input class="storyNo" type="hidden" value="${item.storyNo}"/>
			</div>
		</div><!--row-->
	</div><!--cotainer-->
</div><!--colorlib-main-->




<script>
	
	//스토리 카드를 하나 클릭 했을 때
	$(".cardDiv").click(function(){
		
		
	})
	
	
	
	
	
</script>

