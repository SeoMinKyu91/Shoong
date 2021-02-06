<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
<link rel="stylesheet" href="cards-gallery.css">
<link rel="stylesheet" href="<c:url value="/css/comment.css?as"/>">
<script src="https://kit.fontawesome.com/4f2219bca6.js" crossorigin="anonymous"></script>
<style>
	.feed-bottom-icon img{
		margin: 6px 0px 6px 15px;
	}
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
	.feed-img{
		height: 250px;
		padding: 4px;
	}
	.feed-img img{
		width: 100%;
		height: 100%;
		z-index: 1;
	}
	.feed-img-hover{
		width:99%;
		height:100%;
		background-color:black;
		z-index:3;
		display: none;
		text-align: center;
		position: absolute;
		opacity: 0.5;
		top: 0%;
		left: 0%;
		line-height: 250px;
	}
	.feed-img-hover span{
		color:white;
		font-size: 16px;
		font-weight: bold;
		margin-right: 2px;
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
<div class="row" style="margin-left: 20px; margin-bottom: 2px; ">
		
	<div class="col-lg-12" style="padding-bottom:10px background-color: lightgrey">
		<div class="row">
			<div class="col-xs-9 col-sm-10 col-md-10 col-lg-10" style="padding-top:20px">
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

<div class="container" style="margin-top:25px;">
	<div class="row">
		<div class="offset-lg-2 col-lg-8">
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${empty commentList }" var="isEmpty">
						<h4>등록된 게시글이 없습니다</h4>	
					</c:if>
					<c:if test="${not isEmpty}">
						<c:forEach items="${commentList}" var="item" varStatus="loop">
							<c:if test="${not empty item }">
								<c:forEach items="${item.packCommentImages }" var="image" varStatus="loop" begin="0" end="0">
									<div class="col-md-4 feed-img">
										<img alt="기본사진" src="/fileupload/${image }"/>
										<a href="<c:url value="/pack/comment/view.do?packCommentNo=${item.packCommentNo }"/>">
											<div class="feed-img-hover">
												<img src="<c:url value='/images/fa-icons/comment-white.png'/>" style="width:25px;height:25px;">
												<span>${item.packCommentReplyCount }</span>
												<img src="<c:url value='/images/fa-icons/heart-white.png'/>"style="width:25px;height:25px;">
												<span>${item.packCommentLikeCount }</span>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>	
				</div>
			</div>
			
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
				<button type="button" class="btn btn-default closeButton"
					data-dismiss="modal" id="feed-write-cancle">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 피드 글 쓰기 모달 끝 -->

<!-- 피드 글 수정 모달 시작 -->
<div class="modal fade" id="feed-update-modal"
	data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"
				style="text-align: center;">
				<h4 style="text-align: center;">게시물 수정</h4>
			</div>
			<div class="modal-body">
				<form action="" class="" id="feed-update-form"
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
					action="<c:url value="/pack/comment/update.do"/>"
					id="sendToServerFormUpdate">
					<input type="hidden" name="imgArray" id="imgArrayUpdate" class="form-control">
					<input type="hidden" name='packCommentContent' class="form=control" id="feed-story-update-modal">
					<input type="hidden" name="packCommentNo" id="packCommentUpdateNo">
				</form>
				<button type="submit" class="btn btn-default"
					id="btnCommentUpdate">Save</button>
				<button type="button" class="btn btn-default closeButton"
					data-dismiss="modal" id="feed-write-cancle">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 피드 글 수정 모달 끝 -->

<script>
	$(function() {
		jQuery.noConflict();
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
		
		//수정 버튼 클릭시
		$('.feed-update').click(function(){
			console.log('업데이트 클릭');
			
			var packCommentNo = $(this).parent().attr('aria-labelledby');
			console.log(packCommentNo);
			
			$.ajax({
				 url:"<c:url value="/pack/comment/selectOne.do"/>",
				 type : 'post',
				 dataType : 'json',
				 data: "packCommentNo=" + packCommentNo,
				 success : function(data){
					console.log("팩 콘텐트:"+data.PACK_COMMENT_CONTENT);
					console.log("팩 번호:"+data.PACK_COMMENT_NO);
					updateModal(data);
					$('#feed-update-modal').modal('show');
				 },
				 error:function(error){
					 console.log('에러: ',error.reponseText);
				 }
			 });
			
			
		});
		
		//수정 모달 초기화
		function updateModal(data){
			
			//css설정
			$('.feed-story').css('opacity',1);
			
			$('.feed-story').html(data.PACK_COMMENT_CONTENT);
			$('#packCommentUpdateNo').val(data.PACK_COMMENT_NO);
			
			console.log("내가확인하고 싶은 no 값:" + $('#packCommentUpdateNo').val());
			
			if(data.packCommentImgs != null){
				$.each(data.packCommentImgs,function(index,el){
					console.log(index+":"+el);
					imgarr.push(el);
				})
				console.log("imgarr배열:"+ imgarr.length);
			}
			imageDivShowUpdate();
			
			
			
		}
		
		function imageDivShowUpdate() {
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
			$('#imgArrayUpdate').val(imgarr);
		}
		
		function deleteFileToServerUpdate(filename) {
			$.ajax({
				url : "<c:url value="/pack/comment/filedelete/post"/>",//요청할 서버의 URL주소
				type : 'post',//데이타 전송방식(디폴트는 get방식) 
				dataType : 'text',//서버로 부터 응답 받을 데이타의 형식 설정
				data : "filename=" + filename,
				success : function(data) {
					console.log(data);
					imgarr.splice(imgarr.indexOf(filename), 1);
					console.log(imgarr);
					imageDivShowUpdate();
				},
				error : function(error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
					console.log('에러 : ', error.responseText);
				}

			});
		}
		
		//close버튼 클릭시 초기화
		$('.closeButton').click(function(){
			console.log('닫기 버튼 클릭');
			imgarr.splice(0,imgarr.length);
			$('.feed-story').html("글자를 입력해주세요");
			$('.feed-story').css('opacity',0.7);
			$('.feed-img-modal').html("<span class='feed-img-modal-span'>Drag & Drop Files Here</span>");
			
		});
		
		//서버로 update 전송
		$('#btnCommentUpdate').click(function(){
			console.log("수정하고 난뒤 packContent값:"+$('.feed-story').text());
			$('#feed-story-update-modal').val($('.feed-story').text());
			
			console.log('내가 확인하고싶은 content:'+$('#feed-story-update-modal').val());
			console.log($('#feed-story-modal').val());
			console.log($('#imgArray').val());
			
			$('#sendToServerFormUpdate').submit();
		});
		
		
		$(".feed-img").hover(function() {
			$(this).find('.feed-img-hover').css("display", "block");
		}, function() {
			$(this).find('.feed-img-hover').css("display", "none");
		});

		
	})
</script>