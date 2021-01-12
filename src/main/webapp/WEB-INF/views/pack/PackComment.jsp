<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- 모달  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- 모달 -->
<link rel="stylesheet" href="<c:url value="/css/comment.css?j"/>">

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
			<div class="row" id="top-var">
				<div class="offset-md-2 col-md-8 col-sm-12">
					<div class="row top-menus">
						<div class="col-6 feedwrite">
							 <button type="button" data-toggle="modal" id="btn-feed-write" data-target="#feed-write-modal">게시글 추가하기</button>
						</div>
						<div class="col-6 feedshow">
							<button class="btnfeedshow">내가 글쓴 목록</button>
						</div>
					</div>
				</div>
			</div>
		
			<div class="row" id="body-div">
				<div class="offset-md-2 col-md-8 col-sm-12">
					<div class="row feed-rows">
						<div class="feed">
							<div class="row feed-inner">
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
									
									<div class="row feed-content-row">
										<div class="col-12 feed-content">
											<span>안녕하세요 오늘 날씨가 정말 좋네요 잘부탁드릴게요</span>										
										</div>
									</div>
									
									<!-- 피드 bottoms 시작 -->
									<div class="feed-bottoms">
										<div class="row feed-bottom-row" >
											<div class="col-10 feed-bottom-icon">
												<img class="icon likely-icon" src="<c:url value='/images/fa-icons/heart.png'/>" title="Likely" style="">
												<img class="icon reply-icon" src="<c:url value='/images/fa-icons/comment.png'/>" />
											</div>
										</div>
										
										<div class="row feed-bottom-row">
											<div class="col-12 feed-likely-row">
												<span style="margin-left:15px;">좋아요</span>
												<span class="likely-count" >1</span>
												<span>개</span>
											</div>
										</div>
										
										
										
										<div class="row feed-bottom-row" style="margin-top:10px;">
											<div class="col-12 feed-reply-show">
												<span style="margin-left:15px;">댓글 6개 모두보기</span>
											</div>
										</div>
										
										<div class="row feed-bottom-row">
											<div class="col-12 feed-replys">
												<span style="margin-left:15px; font-weight: bold; font-size: 12px;">이길동</span>
												<span style="margin-left:15px;">오~ 잘보고 갑니다~</span>
											</div>
											<div class="col-12 feed-replys">
												<span style="margin-left:15px; font-weight: bold; font-size: 12px;">박길동</span>
												<span style="margin-left:15px;">오~~ 정말 코스가 좋군요!!</span>
											</div>
										</div>
										
										<div class="row feed-bottom-row" style="border-top:1px solid lightgrey; margin-left: 0px; margin-right: 0px; margin-top: 15px;">
											<div class="col-10 feed-reply-content">
												<input type="text" class="feed-reply-content-input" placeholder="댓글달기"/>
											</div>
											<div class="col-2 feed-reply-write" style="text-align: right;">
												<span>게시</span>
											</div>
										</div>
									</div>
									<!-- 피드 bottoms 끝 -->
									
									
								</div>
								
							</div>
						</div>
						
					</div><!-- feed rows -->
				</div>
			</div>
		</div>
	</div><!-- color-lib-main -->
</div>


<!-- 피드 글 쓰기 모달 시작 -->
<div class="modal fade" id="feed-write-modal" data-backdrop="false"  >
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header" style="text-align: center;">
                <h4 style="text-align: center;">게시물 등록</h4>
            </div>
            <div class="modal-body"style="height: 400px;">
				<form action="" class="" id="feed-write-form">
					<div class="feed-story" contenteditable="true">
						글자를 입력해주세요
					</div>
				</form>
            </div>
            <div class="modal-footer"> 
               <form method="post" action="<c:url value="/pack/pictureInput.do"/>">
               <input class="form-control" name="imgArry" id="imgArry"  type="hidden">
               <button type="submit" class="btn btn-default">Save</button>   
            </form>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="feed-write-cancle">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- 피드 글 쓰기 모달 끝 -->
   
   
   
<script>
	$(function() {
		$('#btn-feed-write').click(function(){
			$('#feed-write-modal').modal();
		})
		
		
		$('.feed-story').click(function(){
			console.log('들어옴');
			$('.feed-story').text("");
			$('.feed-story').css('opacity','1');
		});		
		
		$('#feed-write-cancle').click(function(){
			$('.feed-story').text("글자를 입력해주세요");
			$('.feed-story').css('opacity','0.7');
		})
	});
</script>



