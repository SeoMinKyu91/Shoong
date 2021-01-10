<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Chart.js -->
<script src="<c:url value="/admin/js/Chart.min.js"/>"></script>

<style>
.myPageSection{
border:1px solid #bbbbbb;
margin : 10px;
padding: 10px;
}
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
	


<div id="colorlib-main" style="padding-top: 30px; padding-left: 30px">
	<!--뱃지사진 + 마일리지  -->
	<div class="row">
		<div class= "col-xs-12">
			<div style="display: inline-block; width: 80%;">
				<img style="border-radius: 25px;width:50px;height: 50px;" src='<c:url value="/images/bg_1.jpg"/>' alt="스토리 메인 사진">
								
				<strong>김길동${name}</strong><span>님</span> 
				<a href='<c:url value="/Member/myInfoEdit.do"/>'>정보수정</a>
			</div>
		</div>
	</div>
		<!-- progress바 _ 부트스트랩 -->
	<div class="row">
		<div class= "col-xs-12 col-sm-6">
		<h4>마일리지</h4>
			<div class="progress">
			  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100" style="width: 68%">
			    <span class="sr-only">66km</span>
			  </div>
			</div>
		</div>
	</div>
	
	<!-- 나의 기록  -->
	<div class="row">
		<div class= "col-xs-12 col-sm-6">   
			<div class="myPageSection" > 
				<h3>나의 기록<small>1월 기록</small></h3>
		       <canvas id="lineChart"></canvas>
	     	</div>
	     </div>
	     <div class= "col-xs-12 col-sm-6">
	     	<div class="myPageSection">       
		        <h3>코스</h3>
		       	<div style="width: 100%; height: 250px;  background-color: #eeeeee;"></div>
	     	</div>
	     </div>
   	</div>
   	<!-- 다이어리 일부 띄우기-->
  	<div class="row storyRow">
			<div class="col-xs-12">
				<h3>다이어리<small><a href='<c:url value="/mypage/Diary.do"/>'>전체보기</a></small></h3>
			</div>
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
</div>
   		




<script>
//색 투명도로 조절할 것
if ($('#lineChart').length ){	
	 
	  
	
	  var ctx = document.getElementById("lineChart");
	  var lineChart = new Chart(ctx, {
		type: 'line',
		data: {
		  labels: ["1일", "5일", "10일", "15일", "20일", "25일", "30일"],
		  datasets: [{
			label: "주행거리(Km)",
			backgroundColor: "rgba(255, 100, 15, 0.31)",
			borderColor: "rgba(255, 100, 15, 0.7)",
			pointBorderColor: "rgba(255, 100, 15, 0.7)",
			pointBackgroundColor: "rgba(255, 100, 15, 0.7)",
			pointHoverBackgroundColor: "#fff",
			pointHoverBorderColor: "rgba(220,220,220,1)",
			pointBorderWidth: 1,
			data: [2, 7, 15, 20, 30, 40,80]
		  }]
		},
	  });
	
	}
		
	
</script>