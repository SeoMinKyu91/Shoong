<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
	
	.feed-view{
		height: 600px;
		padding: 0px;
		border: 1px solid black;
		background-color: white;
	}
	.feed-img-carousel{
		height: 600px;
		padding: 0px;
	}
	.feed-writer-pr div{
		height: 100%;
		line-height: 90px;
	}
	.feed-contents{
		border-bottom: 1px solid black;
		border-right: 1px solid black;
		border-top: 1px solid black;
	}
	.feed-content{ -ms-overflow-style: none; } 
	.feed-content::-webkit-scrollbar{ display:none; }
	.feed-reply-list{ -ms-overflow-style: none; } 
	.feed-reply-list::-webkit-scrollbar{ display:none; }
	.img-reply{
		width: 40px;
		height: 40px;
	}
	.feed-icon-like img{
		height: 100%;
		width: 100%;
	}
	.feed-icons div{
		padding-top: 12px;
		margin-right: 10px;
	}
	.feed-icons div .icon{
		width: 25px;
		height: 25px;
		cursor: pointer;
	}
	.feed-reply-div{
		padding: 0px;
		margin:0px;
		width: 100%;
		height: 100%;
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
	  opacity: 1;
	  /* Preserve aspet ratio */
	  min-width: 100%;
	  min-height: 100%;
	}
	
	
	
</style>

<div class="row" style="margin-left: 20px; margin-bottom: 2px; ">
		
	<div class="col-lg-12" style="padding-bottom:10px;">
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

<div class="container" style="margin-top:50px;">
	<div class="row">
		<div class="col-lg-offset-1 col-lg-10">
			<div class="row">
				<div class="col-lg-6 feed-view">
					<div class="col-12 feed-img-carousel carousel slide" id="feed-img-carousel" data-ride="carousel" data-interval="false">
						<!-- indicators -->
						<c:if test="${packCommentView.packCommentImages.size() > 1 }">
							<ol class="carousel-indicators">
								<c:forEach items="${packCommentView.packCommentImages }" var="i" varStatus="index">
									<li <c:if test="${index.index==0 }"> class="active"</c:if>
										data-target="#feed-img-carousel"
										data-slide-to="${index.index}">
									</li>
								</c:forEach>
							</ol>
						</c:if>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" style="height: 600px;">
							<c:forEach items="${packCommentView.packCommentImages }" var="image" varStatus="index">
								<div <c:if test="${index.index==0 }" var="isFirst"> class="item active"</c:if>
									<c:if test="${!isFirst }">class="item"</c:if>>
									<img class="feed-img-src" src="/fileupload/${image }" alt="기본사진" style="height: 600px; width: 100%;"/>
								</div>
							</c:forEach>
						</div>

						<!-- Controls -->
						<c:if test="${packCommentView.packCommentImages.size() > 1 }">
							<a class="left carousel-control"
								href="#feed-img-carousel"
								role="button" data-slide="prev"
								style="background-color: none;">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="opacity: 0.2;"></span> 
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#feed-img-carousel" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="opacity: 0.2;"></span> 
								<span class="sr-only">Next</span>
							</a>
						</c:if>
					</div>
				</div>
				
				
				
				<div class="col-lg-5 feed-view feed-contents" style="border-left: none;">
					<div class="col-lg-12 feed-writer-pr" style="height: 90px; border-bottom: 1px solid lightgrey;">
						<div class="col-lg-2" style="height: 100%; line-height: 90px;">
							<img src="<c:url value="/images/person_4.jpg"/>" alt="프로필사진" style="height: 60%; border-radius: 100%; border: 2px solid black;"/>
						</div>
						<div class="col-lg-8">	
							<span style="margin-left: 5px; font-size: 15px; font-weight: bold">${packCommentView.packCommentWriter }</span>
						</div>
						<div class="col-lg-1">
							<div class="dropdown">
								<i class="fas fa-ellipsis-h" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px; margin-left: 15px; cursor: pointer;"></i>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								    <li role="presentation"><a role="menuitem" class="feed-update" tabindex="-1">수정</a></li>
								    <li role="presentation"><a role="menuitem" class="feed-delete" tabindex="-1">삭제</a></li>
							 	</ul>
							</div>
							
							
						</div>
					</div>
					<div class="col-lg-12 feed-content" style="height: 120px;overflow:scroll; padding: 20px;">
						<span style="font-size: 18px;">${packCommentView.packCommentContent }</span>							
					</div>
					<div class="col-lg-12 feed-reply-list" style="height: 250px; border-top:1px solid lightgrey; overflow: scroll;">
						<c:if test="${not empty packCommentView.packCommentReply }" var="exist">
							<c:forEach items="${packCommentView.packCommentReply }" var="reply">
								<div class="row feed-reply" style="padding: 10px;">
									<div class="col-lg-2">
										<div class="img-reply">
											<img src="<c:url value="/images/person_2.jpg"/>" style="border-radius: 100%; width: 100%; height: 100%; border:1px solid black;"/>
										</div>
									</div>
									<div class="col-lg-10" style="padding-top:8px; padding-left: 0px;">
										<span style="font-weight: bold; font-size: 12px;">${reply.packCommentReplyWriter }</span><span style="font-size:14px; margin-left:20px;">${reply.packCommentReplyContent }</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div class="col-lg-12 feed-icons" style="height: 80px;border-top:1px solid lightgrey;border-bottom:1px solid lightgrey;">
						<div class="row" style="margin: 0px; padding: 0px;">
							<div class="col-lg-1 feed-icon-like">
									<img class="icon" src="<c:url value="/images/fa-icons/heart-regular.svg"/>" alt="좋아요이미지" title="좋아요" style="width: 25px; height: 25px;">
							</div>
							<div class="col-lg-1 feed-icon-reply">
								<img class="icon" src="<c:url value="/images/fa-icons/comment-regular.svg"/>" alt="" title="댓글"/>
							</div>
						</div>
						<div class="row" style="margin:0px;; padding: 0px;">
							<div class="col-lg-12" style="padding-bottom:0px;">
								<span>좋아요 ${packCommentView.packCommentLikeCount } 개</span>
							</div>
						</div>
						
					</div>
					
					<div class="col-lg-12 feed-reply-write" style="height: 58px;">
						<div class="col-lg-10 feed-reply-div">
							<input type="text" class="feed-reply-write-input" placeholder="댓글달기" style="width:100%; height: 100%; border:none;outline: none;">
						</div>
						<div class="col-lg-2 feed-reply-div" style="padding-left: 20px;padding-top: 5px;">
							<span style="cursor: pointer; font-weight: bold">게시</span>
						</div>
					</div>
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
					<div class="feed-story" id="feed-story-update" contenteditable="true">글자를 입력해주세요</div>
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

<!-- 피드 글 삭제 모달 시작 -->
<div class="modal fade" id="feed-delete-modal"
	data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body" style="height: 100px; line-height: 70px; text-align: center;">
				<span style="font-size:25px; font-weight: bold;">게시글을 삭제하시겠습니까?</span>
			</div>
			<div class="modal-footer">
				<form method="post" action="<c:url value="/pack/comment/delete.do"/>" id="packCommentDelete">
					<input type="hidden" name="packCommentNo" id="packCommentUpdateNo" value="${packCommentView.packCommentNo }">
				</form>
				<button type="submit" class="btn btn-default" id="btnCommentDelete">Delete</button>
				<button type="button" class="btn btn-default closeButton" data-dismiss="modal" id="feed-write-cancle">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 피드 글 삭제 모달 끝 -->



<script>
	$(function() {
		var objDragAndDrop = $('.feed-img-modal');
		
		$('#btn-feed-write').click(function(){
			$('#feed-write-modal').modal();
		})
		
		
		$('.feed-story').click(function(){
			console.log('들어옴');
			if($(this).parent().attr('id') == 'feed-write-form'){
				console.log('입력 모달');
				$('.feed-story').html("");	
			}
			$('.feed-story').css('opacity','1');
		});		
		
		$('#feed-write-cancle').click(function(){
			$('.feed-story').html("글자를 입력해주세요");
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
			var verify = "write";
			if($(this).parent().attr('id')=='feed-update-form'){
				console.log('이거는 왜 잘됨? ㅋㅋㅋ');
				verify = 'update';
			}
			
			
			var files = e.originalEvent.dataTransfer.files;
			
			var size = $("#imgArray").val().split(",").length + files.length;
			console.log(size)
			if (size > 3) {
				alert('이미지는 3개까지 올릴 수 있습니다.');
				return;
			}
			
			handleFileUpload(files, objDragAndDrop,verify);
		});
		
		//2]서버에 파일 전송 메소드
		function handleFileUpload(files, obj,verify) {
			var fd = new FormData();
			fd.append('verify',verify)
			for (var i = 0; i < files.length; i++) {
				fd.append('file', files[i]);
				console.log(fd);
				sendFileToServer(fd,verify);
			}
		}

		var rowCount = 0;

		//4] Ajax 이용 해서 서버에 이미지 저장하는 핵심로직
		var imgarr = [];
		function sendFileToServer(formData,verify) {
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
					imageDivShow(data.verify)
				}
			});

		}//파일저장 
		
		//5] Ajax 이용 해서 서버에 이미지 삭제하기 

		function deleteFileToServer(filename,verify) {
			$.ajax({
				url : "<c:url value="/pack/comment/filedelete/post"/>",//요청할 서버의 URL주소
				type : 'post',//데이타 전송방식(디폴트는 get방식) 
				dataType : 'text',//서버로 부터 응답 받을 데이타의 형식 설정
				data : "filename=" + filename,
				success : function(data) {
					console.log(data);
					imgarr.splice(imgarr.indexOf(filename), 1);
					console.log(imgarr);
					console.log("ajax안에서 verify"+verify)
					imageDivShow(verify);
				},
				error : function(error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
					console.log('에러 : ', error.responseText);
				}

			});
		}

		//6]파일 추가 삭제 후 다이브 다시띄우기.
		function imageDivShow(verify) {
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
				deleteFileToServer($(this).attr('id'),verify)
			});
			if(verify == 'update'){
				console.log('verify잘들어온 후 Update초기화');
				$('#imgArrayUpdate').val(imgarr);
				console.log($('#imgArrayUpdate').val());
			}
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
			
			var packCommentNo = ${packCommentView.packCommentNo};
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
			$('.feed-story').html("");
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
			var verify = 'update'
			imageDivShow(verify);
			
			
			
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
			$('#feed-story-update-modal').val($('#feed-story-update').text());
			
			console.log('내가 확인하고싶은 content:'+$('#feed-story-update-modal').val());
			console.log($('#feed-story-modal').val());
			console.log($('#imgArray').val());
			
			$('#sendToServerFormUpdate').submit();
		});
		
		//삭제
		$('.feed-delete').click(function(){
			$('#feed-delete-modal').modal('show');
		});
		
		$('#btnCommentDelete').click(function(){
			$('#packCommentDelete').submit();
		});

		
	})
</script>