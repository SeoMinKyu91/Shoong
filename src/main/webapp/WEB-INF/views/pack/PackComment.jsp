<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
-->

<!-- 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
<link rel="stylesheet" href="cards-gallery.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
-->


<link rel="stylesheet" href="<c:url value="/css/comment.css?fasd"/>">
<script src="https://kit.fontawesome.com/4f2219bca6.js" crossorigin="anonymous"></script>

<style>
	.feed-bottom-icon img{
		margin: 6px 0px 6px 15px;
	}
	.packCreateBtn {
		color:#ff8827;
		background-color: white;
		font-weight: bold;
		border: none;
	}
	.packCreateBtn:hover {
		color:white;
		background-color: #ff8827;
	}
	.packManageBtn{
		float:right;
		color:#ff8827;
		background-color: white;
		font-weight: bold;
		border: none;
	}
	.packManageBtn:hover {
		color:white;
		background-color: #ff8827;
	}
	#packComment.col:eq(1){
		diplay: none;
	}
	.icons-div img{
		width: 30px;
		height: 30px;
	}
	.icons-div a:hover{
		cursor: pointer;
	}
	
	.modal.modal-center {
  		text-align: center;
	}

	@media screen and (min-width: 768px) { 
  		.modal.modal-center:before {
	  		display: inline-block;
	    	vertical-align: middle;
	    	content: " ";
	    	height: 100%;
  		}
	}

	.modal-dialog.modal-center {
	  display: inline-block;
	  text-align: left;
	  vertical-align: middle; 
	}
	.likely-icon:hover{
		cursor: pointer;
	}
	
	.reply-icon:hover{
		cursor: pointer;
	}
	.replyMore{
		cursor: pointer;
	}
	.replyMore:hover{
		border-bottom: 1px solid black;
	}
	
	.animated-text{
		display:none;
	}
	.slider-area{
		display:none;
	}
	
	#bg {
	  position: fixed; 
	  top: 0; 
	  left: 0; 
	  opacity: 0.5;
	  /* Preserve aspet ratio */
	  min-width: 100%;
	  min-height: 100%;
	}
	
	
</style>

	
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div class="row">
		
	<!-- 팩 위에 꺼 -->
	<div class="col-lg-12">
		<div class="row">
			<div class="col-xs-9 col-sm-10 col-md-10 col-lg-10">
				<a href="<c:url value="/pack/main.do"/>">
				<img alt="pack" src="<c:url value="/images/pack/pack.png"/>" style="width: 80px;"></a>&emsp;<a class="packCreateBtn btn" href="<c:url value="/pack/main.do"/>">HOME</a>
				<c:if test="${!empty sessionScope.packId}">
					<a class="packCreateBtn btn" href="<c:url value="/pack/view.do"/>">MY PACK</a>
				</c:if>
			</div>
			<div class="col-xs-3 col-sm-2 col-md-2 col-lg-2 icons-div" style="padding-top: 17px;">
				<a id="btn-feed-write"><i class="fas fa-edit fa-2x" style="color: black; margin-left: 5px;"></i></a>
				<a href="<c:url value="/pack/myComment.do"/>"><i class="far fa-user fa-2x" style="color: black; margin-left: 5px;"></i></a>
				<a href="<c:url value="/pack/comment.do"/>"><i class="far fa-list-alt"></i></a>
			</div>
		</div>
		
		
	</div>
</div>
<hr style="background-color:black; height:1px; margin: 0px;"/>

<!-- 피드 메인 시작 DIV -->
<div class="container">
	<div class="row" id="body-div">
		<div class="offset-md-2 col-md-8 col-sm-12">
			<c:if test="${not empty commentList }" var="notempty">
				<c:forEach items="${commentList }" var="item" varStatus="loop">
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
									<c:if test="${not empty item.packCommentImages}" var="imagesExist">
										<div class="row feed-img-row">
											
											<div class="col-12 feed-img carousel slide" id="${item.packCommentNo }" data-ride="carousel" data-interval="false">
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
												<c:if test="${item.packCommentLike eq '0'}">
													<img class="icon likely-icon" src="<c:url value='/images/fa-icons/heart.png'/>" title="Likely"/>
												</c:if>
												<c:if test="${item.packCommentLike eq '1'}">
													<img class="icon likely-icon" src="<c:url value='/images/fa-icons/heart-solid.svg'/>" title="Likely"/>	
												</c:if>
												<img class="icon reply-icon" src="<c:url value='/images/fa-icons/comment.png'/>" title="reply"/>
											</div>
										</div>

										<div class="row feed-bottom-row">
											<c:if test="${item.packCommentLikeCount != null}">
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
												<span style="margin-left: 15px;">댓글</span> <span style="margin-left: 15px;" id="span${item.packCommentNo }">${item.packCommentReplyCount }개</span>
												<input type="hidden" value="${item.packCommentReplyCount }" id="rpc${item.packCommentNo }"/>
												<span class="replyMore">모두보기</span>
											</div>
										</div>

										<div class="row feed-bottom-row qwerasdf">
											<c:if
												test="${not empty item.packCommentReply }">
												<c:forEach items="${item.packCommentReply }" var="reply" varStatus="loop" begin="0" end="3">
													<div class="col-lg-11 feed-replys" id="replyNo${reply.packCommentReplyNo }">
														<span style="margin-left: 15px; font-weight: bold; font-size: 12px;">${reply.packCommentReplyWriter }</span>
														<span style="margin-left: 15px;">${reply.packCommentReplyContent }</span>
														
													</div>
													<c:if test="${sessionScope.userId eq reply.userId }">
														<div class="col-lg-1 feed-replys-readmore" id="readmore${reply.packCommentReplyNo }">
															<i class="fas fa-ellipsis-h reply-readmore" style="font-size: 15px; cursor: pointer; opacity: 0.4;"></i>
															<input class="replyNo" type="hidden" value="${reply.packCommentReplyNo}">
														</div>
													</c:if>
												</c:forEach>
											</c:if>
										</div>

										<div class="row feed-bottom-row"
											style="border-top: 1px solid lightgrey; margin-left: 0px; margin-right: 0px; margin-top: 15px;">
											<div class="col-10 feed-reply-content">
												<input type="text" class="feed-reply-content-input" placeholder="댓글달기"/>
											</div>
											<div class="col-2 feed-reply-write" style="text-align: right;">
												<span style="cursor: pointer;">게시</span>
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
				<div class="offset-sm-2 col-sm-9" style="margin-top:30px;">
					<h1>등록된 게시글이 없습니다</h1>
				</div>
			</c:if>
		</div>
	</div>
</div>

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
						contenteditable="true">회원님의 공유할 이야기를 적어주세요</div>
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

<!-- 피드 댓글 삭제 모달 시작 -->
<div class="modal modal-center fade" id="reply-delete-modal" data-backdrop='false'>
	<div class="modal-dialog modal-center">
		<div class="modal-content">
			<div class="modal-body" style="padding: 0px;margin: 0px; cursor: pointer">
				<div class="reply-modal-deleteOk" style="text-align: center;border-bottom: 1px solid lightgrey; padding-top: 15px;padding-bottom: 15px;">
					<span style="color: red; font-weight: bold;">삭 제</span>
				</div>
				<div class="reply-modal-cancel" style="text-align: center;padding-top: 15px;padding-bottom: 15px;">
					<span>취 소</span>
				</div >
				<input type="hidden" class="replyNo-hidden">
				<input type="hidden" class="commentNo-hidden">
			</div>
		</div>
	</div>
</div>
<!-- 피드 댓글 삭제 모달 끝 -->

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
		
		$('.feed-reply-write').children().click(function(){
			console.log('게시버튼 클릭');
			var replyContentDiv = $(this).parent().parent().find('div.feed-reply-content').children(); 
			var replyContent = replyContentDiv.val();
			var packCommentNo = $(this).parent().parent().parent().parent().find('div.feed-img-row').find('div.feed-img').attr('id');
			var replyAdd = $(this).parent().parent().parent().find('div.qwerasdf');
			var replyCount = $('#rpc'+packCommentNo+'').val();
			console.log(packCommentNo);
			console.log(replyContent);
			
			if(replyContent==''){
				alert('댓글 내용을 입력해주세요');
				return;
			}
			else{
				$.ajax({
					url : "<c:url value="/pack/comment/reply/write"/>",//요청할 서버의 URL주소
					type : 'post',//데이타 전송방식(디폴트는 get방식) 
					dataType : 'json',//서버로 부터 응답 받을 데이타의 형식 설정
					data : {'replyContent':replyContent,'packCommentNo':packCommentNo},
					success : function(data) {
						console.log(data);
						console.log("댓글번호:"+data.PACK_COMMENT_REPLY_NO);
						console.log("댓글내용:"+data.PACK_COMMENT_REPLY_CONTENT);
						console.log('에이작스 요청후 이름:'+data.NAME);
						replyContentDiv.val("");
						replyWriteAfter(data,replyAdd);
						replyCountUpdate(replyCount,packCommentNo);
					},
					error : function(error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
						console.log('에러 : ', error.responseText);
					}
				});	
			}
			
			
		});
		
		function replyWriteAfter(data,replyAdd){
			console.log('append함수 내용:'+data.PACK_COMMENT_REPLY_CONTENT);
			console.log('replyWriteAfter함수 들어옴');
			var replyNo = data.PACK_COMMENT_REPLY_NO;
			console.log('댓글 번호!!!!!!!!!!!!!!!!!!!!!:'+replyNo);
			var str = '<div class="col-11 feed-replys" id="replyNo'+replyNo+'"><span style="margin-left: 15px; font-weight:bold; font-size:12px;">'+data.NAME+'</span>';
			str += ' <span style="margin-left: 15px;">'+data.PACK_COMMENT_REPLY_CONTENT+'</span></div>';
			
			if(data.USER_ID == '${sessionScope.userId}'){
				str += '<div class="col-lg-1 feed-replys-readmore" id="readmore'+replyNo+'"><i class="fas fa-ellipsis-h reply-readmore" style="font-size: 15px; cursor: pointer; opacity: 0.4;"></i>'
				str += '<input class="replyNo" type="hidden" value="'+replyNo+'"/></div>'
			}
			
			replyAdd.append(str);
			
			$('.reply-readmore').click(function(){
				console.log('씨벌럼아~왜안되냥!');
				var replyNo = $(this).parent().children().eq(1).val();
				var packCommentNo = $(this).parent().parent().parent().parent().find('div.feed-img-row').find('div.feed-img').attr('id');
				console.log(packCommentNo);
				console.log(replyNo);
				
				$('.replyNo-hidden').val(replyNo);
				$('.commentNo-hidden').val(packCommentNo);
				$('#reply-delete-modal').modal('show',replyNo);
			});
			
			
		}
		
		$('.reply-readmore').click(function(){
			var replyNo = $(this).parent().children().eq(1).val();
			var packCommentNo = $(this).parent().parent().parent().parent().find('div.feed-img-row').find('div.feed-img').attr('id');
			console.log("디비 드가기전 댓글 번호:"+replyNo);
			console.log('디비 드가기전 글번호:'+packCommentNo);
			$('.replyNo-hidden').val(replyNo);
			$('.commentNo-hidden').val(packCommentNo);
			$('#reply-delete-modal').modal('show',replyNo);
		});
		
		$('.reply-modal-deleteOk').click(function(){
			console.log('삭제버튼 클릭')
			var replyNo = $('.replyNo-hidden').val();
			var commentNo = $('.commentNo-hidden').val();
			console.log('================');
			console.log(replyNo);
			console.log(commentNo);
			$.ajax({
				url:"<c:url value="/pack/comment/reply/delete"/>",
				data: {'packCommentReplyNo':replyNo,'packCommentNo':commentNo},
				type: 'post',
				dataType: 'json',
				success:function(data){
					console.log("삭제후 db에서 가져온 값:"+data);
					deleteReply(data,replyNo);
					$('#reply-delete-modal').modal('hide');
						
					
				},
				error:function(error){
					console.log('에러:',error.responseText);
				}
				
			});
			

		});
		
		$('.reply-modal-cancel').click(function(){
			$('#reply-delete-modal').modal('hide');
			$('.replyNo-hidden').val('');
		});
		
		function deleteReply(data,replyNo){
			$("#replyNo"+replyNo+"").remove();
			$('#readmore'+replyNo+'').remove();
			$('#span'+data.packCommentNo+'').html(data.packCommentReplyCount+'개');
		}
		function replyCountUpdate(replyCount,packCommentNo){
			var qwe = $('#span'+packCommentNo+'').text();
			var beforeCount = qwe.substring(0,qwe.indexOf('개'));
			console.log('기존댓글 수:'+beforeCount);
			var afterCount = beforeCount*1 + 1;
			$('#span'+packCommentNo+'').text(afterCount+'개');
			console.log('바뀐 댓글 수!!'+afterCount);
		}
		
		$('.reply-icon').click(function(){
			$(this).parent().parent().parent().find('input.feed-reply-content-input').focus();
		});
		
		$('.likely-icon').click(function(){
			var packCommentNo = $(this).parent().parent().parent().parent().find('div.feed-img-row').find('div.feed-img').attr('id');
			console.log('좋아요 클릭시 글번호:'+packCommentNo);
			var likelyIcon = $(this);
			var likelyCountSpan = $(this).parent().parent().parent().find('.likely-count');
			$.ajax({
				url:"<c:url value="/pack/comment/like.do"/>",
				data:"packCommentNo="+packCommentNo,
				dataType:"json",
				type:"post",
				success:function(data){
					console.log("좋아요 클릭후 controller리턴 값")
					console.log(data.result);
					console.log(data.likeCount);
					if(data.result == 'like'){
						changeLike(likelyIcon,likelyCountSpan,data);
					}
					else{
						changeDislike(likelyIcon,likelyCountSpan,data);
					}
				},
				error:function(error){
					console.log("에러"+error.responseText);
				}
				
			})
			
		});
		
		function changeDislike(imgTag,likeCountSpan,data){
			imgTag.prop('src','<c:url value="/images/fa-icons/heart.png"/>');
			likeCountSpan.text(data.likeCount);
			
		};
		function changeLike(imgTag,likeCountSpan,data){
			imgTag.prop('src','<c:url value='/images/fa-icons/heart-solid.svg'/>');
			likeCountSpan.text(data.likeCount);
		};
		
		$('.replyMore').click(function(){
			var packCommentNo = $(this).parent().parent().parent().parent().find('div.feed-img').attr('id');
			$.ajax({
				url : "<c:url value="/pack/comment/replyMore.do"/>",
				data : 'packCommentNo='+packCommentNo,
				dataType : "json",
				type:'post',
				success:function(data){
					console.log(data);
				},
				error:function(error){
					console.log('에러:'+error.responseText);
				}
				
			});
			
		});
		
		
		
	});
</script>