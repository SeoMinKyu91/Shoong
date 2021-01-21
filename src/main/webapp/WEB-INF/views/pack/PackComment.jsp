<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
-->
<!-- 모달  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">

<!-- 모달 -->
<link rel="stylesheet" href="<c:url value="/css/comment.css?h"/>">

<style>
	.feed-bottom-icon img{
	margin: 6px 0px 6px 15px;
}
	
</style>


<div id="colorlib-main">
	<div class="row">
		<div class="col-lg-12">
			<div
				class="section-tittle text-center mb-80 col-lg-12">
				<h1 style="margin-top: 15px;">PACK
					COMMENT</h1>
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
						<button type="button" id="btn-feed-write">게시글
							추가하기</button>
					</div>
					<div class="col-6 feedshow">
						<button class="btnfeedshow">내가 글쓴
							목록</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="body-div">
			<div class="offset-md-2 col-md-8 col-sm-12">
				<c:if test="${not empty commentList }"
					var="notempty">
					<c:forEach items="${commentList }"
						var="item" varStatus="loop">

						<div class="row feed-rows">
							<div class="feed">
								<div class="row feed-inner">
									<div class="col-md-12">
										<div class="row feed-row">
											<!-- 피드 top 시작 -->
											<div class="col-12 feed-top">
												<div class="row feed-top-row">
													<div class="col-2 feed-top-imgs"
														style="text-align: center;">
														<!-- 나중에 이미지 사진 교체 해야함 현재는 정확히 어떻게 해야할지 모르겠어서 임시사진 적용 -->
														<img class="feed-top-img-src"
															alt="이미지사진"
															src="<c:url value="/images/image_10.jpg"/>" />
													</div>
													<div class="col-7 feed-top-nick">
														<span class="feed-top-nick-span">${item.packCommentWriter }</span>
													</div>
												</div>
												<!-- feed-top-row -->
											</div>
											<!-- feed-row -->
											<!-- 피드 top 끝 -->
										</div>
										<!-- 피드 이미지 시작 -->
										<c:if
											test="${not empty item.packCommentImages}"
											var="imagesExist">
											<div class="row feed-img-row">

												<div
													class="col-12 feed-img carousel slide"
													id="${item.packCommentNo }"
													data-ride="carousel"
													data-interval="false">
													<!-- indicators -->
													<c:if test="${item.packCommentImages.size() > 1 }">
														<ol class="carousel-indicators">
															<c:forEach items="${item.packCommentImages }"
																var="i" varStatus="index">
																<li <c:if test="${index.index==0 }"> class="active"</c:if>
																	data-target="#${item.packCommentNo}"
																	data-slide-to="${index.index}">
																</li>
															</c:forEach>
														</ol>
													</c:if>

													<!-- Wrapper for slides -->
													<div class="carousel-inner"
														role="listbox">
														<c:forEach
															items="${item.packCommentImages }"
															var="image" varStatus="index">
															<div
																<c:if test="${index.index==0 }" var="isFirst"> class="item active"</c:if>
																<c:if test="${!isFirst }">class="item"</c:if>>
																<img class="feed-img-src"
																	src="/fileupload/${image }"
																	alt="기본사진" />
															</div>
														</c:forEach>
													</div>

													<!-- Controls -->
													<c:if test="${item.packCommentImages.size() > 1 }">
														<a class="left carousel-control"
															href="#${item.packCommentNo }"
															role="button" data-slide="prev"
															style="background-color: none;">
															<span
																class="glyphicon glyphicon-chevron-left"
																aria-hidden="true"></span> <span
																class="sr-only">Previous</span>
														</a>
														<a class="right carousel-control"
															href="#${item.packCommentNo }"
															role="button" data-slide="next">
															<span
																class="glyphicon glyphicon-chevron-right"
																aria-hidden="true"></span> <span
																class="sr-only">Next</span>
														</a>
													</c:if>
												</div>
											</div>
											<!-- feed-img-row -->
										</c:if>
										<c:if test="!imagesExist">

										</c:if>
										<!-- 피드 이미지 끝 -->

										<div class="row feed-content-row">
											<div class="col-12 feed-content">
												<span>${item.packCommentContent }</span>
											</div>
										</div>

										<!-- 피드 bottoms 시작 -->
										<div class="feed-bottoms">
											<div class="row feed-bottom-row">
												<div class="col-10 feed-bottom-icon">
													<img class="icon likely-icon"
														src="<c:url value='/images/fa-icons/heart.png'/>"
														title="Likely" style="">
													<img class="icon reply-icon"
														src="<c:url value='/images/fa-icons/comment.png'/>" />
												</div>
											</div>

											<div class="row feed-bottom-row">
												<c:if
													test="${item.packCommentLikeCount != null}">
													<div class="col-12 feed-likely-row">
														<span style="margin-left: 15px;">좋아요</span>
														<span class="likely-count">${item.packCommentLikeCount}</span>
														<span>개</span>
													</div>
												</c:if>
											</div>

											<div class="row feed-bottom-row"
												style="margin-top: 10px;">
												<div class="col-12 feed-reply-show">
													<span style="margin-left: 15px;">댓글
													</span> <span style="margin-left: 15px;">${item.packCommentReplyCount }개</span>
													<span><a href="#">모두보기</a></span>
												</div>
											</div>

											<div class="row feed-bottom-row">
												<c:if
													test="${not empty item.packCommentReply }">
													<c:forEach
														items="${item.packCommentReply }"
														var="reply">
														<div class="col-12 feed-replys">
															<span
																style="margin-left: 15px; font-weight: bold; font-size: 12px;">${reply.packCommentReplyWriter }</span>
															<span style="margin-left: 15px;">${reply.packCommentReplyContent }</span>
														</div>
													</c:forEach>
												</c:if>
											</div>

											<div class="row feed-bottom-row"
												style="border-top: 1px solid lightgrey; margin-left: 0px; margin-right: 0px; margin-top: 15px;">
												<div
													class="col-10 feed-reply-content">
													<input type="text"
														class="feed-reply-content-input"
														placeholder="댓글달기" />
												</div>
												<div class="col-2 feed-reply-write"
													style="text-align: right;">
													<span>게시</span>
												</div>
											</div>
										</div>
										<!-- 피드 bottoms 끝 -->
									</div>
								</div>
							</div>
						</div>
						<!-- feed rows -->
					</c:forEach>
				</c:if>
				<c:if test="${!notempty }">
					<div>등록된 피드가 없습니다</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- color-lib-main -->

<!-- 피드 글 쓰기 모달 시작 -->
<div class="modal fade" id="feed-write-modal"
	data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"
				style="text-align: center;">
				<h4 style="text-align: center;">게시물 등록</h4>
			</div>
			<div class="modal-body">
				<form action="" class="" id="feed-write-form"
					method="post" enctype="multipart/form-data">
					<div class="feed-story"
						contenteditable="true">글자를 입력해주세요</div>
					<div class="feed-img-modal">
						<span class="feed-img-modal-span">Drag
							& Drop Files Here</span>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<form method="post"
					action="<c:url value="/pack/comment/write.do"/>"
					id="sendToServerForm">
					<input type="hidden" name="imgArray"
						id="imgArray" class="form-control">
					<input type="hidden"
						name='packCommentContent'
						id="feed-story-modal">
				</form>
				<button type="submit" class="btn btn-default"
					id="btnCommentWrite">Save</button>
				<button type="button" class="btn btn-default"
					data-dismiss="modal" id="feed-write-cancle">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 피드 글 쓰기 모달 끝 -->

<script>
	$(function() {
		var objDragAndDrop = $('.feed-img-modal');
		
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
		
		
		//Drag & Drop Event관련
		$(document).on('dragenter','.feed-img-modal',function(e){
			e.stopPropagation();
			e.preventDefault();
			console.log('dragenter');
		});
		$(document).on('dragover','.feed-img-modal',function(e){
			e.stopPropagation();
			e.preventDefault();
			console.log('dragover');
		});
		$(document).on('drop','.feed-img-modal',function(e){
			console.log('drop이벤트');
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
			
			var size = $("#imgArray").val().split(",").length + files.length;
			console.log(size)
			if (size > 3) {
				alert('이미지는 3개까지 올릴 수 있습니다.');
				return;
			}
			
			handleFileUpload(files, objDragAndDrop);
		});
		
		//2]서버에 파일 전송 메소드
		function handleFileUpload(files, obj) {
			for (var i = 0; i < files.length; i++) {
				var fd = new FormData();
				fd.append('file', files[i]);
				sendFileToServer(fd);
			}
		}

		var rowCount = 0;

		//4] Ajax 이용 해서 서버에 이미지 저장하는 핵심로직
		var imgarr = [];
		function sendFileToServer(formData) {
			var extraData = {}; //Extra Data.
			var jqXHR = $.ajax({
				url : "<c:url value="/pack/comment/fileUpload/post"/>",
				type : "POST",
				contentType : false,
				processData : false,
				cache : false,
				data : formData,
				dataType : 'json',
				success : function(data) {
					imgarr.push(data.fileName);
					imageDivShow()
				}
			});

		}//파일저장 
		
		//5] Ajax 이용 해서 서버에 이미지 삭제하기 

		function deleteFileToServer(filename) {
			$.ajax({
				url : "<c:url value="/pack/comment/filedelete/post"/>",//요청할 서버의 URL주소
				type : 'post',//데이타 전송방식(디폴트는 get방식) 
				dataType : 'text',//서버로 부터 응답 받을 데이타의 형식 설정
				data : "filename=" + filename,
				success : function(data) {
					console.log(data);
					imgarr.splice(imgarr.indexOf(filename), 1);
					console.log(imgarr);
					imageDivShow();
				},
				error : function(error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
					console.log('에러 : ', error.responseText);
				}

			});
		}

		//6]파일 추가 삭제 후 다이브 다시띄우기.
		function imageDivShow() {
			var str = '';
			for (var i = 0; i < imgarr.length; i++) {
				str += "<div class='imgdiv' id='"+imgarr[i]+"'><img class='previewImg'  src=/fileupload/"+imgarr[i]+"><div class='imgdeletemark'>삭제</div></div>";
			}
			$(".feed-img-modal").html(str);
			//이미지에 호버 이벤트 걸기
			$(".imgdiv").hover(function() {
				$(this).children().eq(1).css("display", "block");
				$(this).children().eq(0).css("opacity", 0.4);
			}, function() {
				$(this).children().eq(1).css("display", "none");
				$(this).children().eq(0).css("opacity", 1.0);
			});
			$(".imgdiv").click(function() {
				deleteFileToServer($(this).attr('id'))
			});
			$('#imgArray').val(imgarr);
		}
		
		
		//서버로 전송하는 버튼
		$('#btnCommentWrite').click(function(){
			
			$('#feed-story-modal').val($('.feed-story').text());
			console.log($('#feed-story-modal').val());
			console.log($('#imgArray').val());
			
			$('#sendToServerForm').submit();
		});
		
		
	});
</script>