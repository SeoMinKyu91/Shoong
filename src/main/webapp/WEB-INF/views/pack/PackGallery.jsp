<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<style>
	.modal {
	  text-align:center;
      position: fixed;
      left:25%
    }
    @media screen and (min-width: 768px) {
      .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
      }
    }
    .modal-dialog {
      display: inline-block;
      vertical-align: middle;
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
	.popular-location .single-location {
		position: relative;
		margin-top: 30px;
	}
	
	.popular-location .single-location .location-img {
		border-radius: 10px;
		overflow: hidden;
		position: relative;
		z-index: 0
	}
	
	.popular-location .single-location .location-img::before {
		position: absolute;
		width: 100%;
		height: 50%;
		bottom: 0;
		content: "";
		z-index: 1
	}
	
	.popular-location .single-location .location-img img {
		width: 100%;
		transform: scale(1);
		transition: all .5s ease-out 0s;
		height: 150px;
	}
	
	.single-location:hover .location-img img {
		transform: scale(1.1)
	}
	
	.plusImage {
		float: right;
	}
	
	.plusImgBtn {
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
	
	.modal-dialog {
		width: 80%;
		max-width: 800px;
		height: 100%;
	}
	
	.imgdiv {
		margin: 10px;
		display: inline-block;
		position: relative
	}
	
	.img {
		width: 200px;
		height: 176px;
	}
	
	.imgdeletemark {
		display: none;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	.dragAndDropDiv {
		width: 100%;
		margin-top: 15px;
		height: 200px;
		border: 2px dashed #ff8827;
		color: #777777;
		text-align: center;
	}
	.dragAndDropDivSpan {
		line-height: 200px;
		vertical-align: middle;
		font-size: 150%;
	}
	.dragAndDropBtn {
		margin-top: 10px;
		border: 1px solid #777777;
		background-color: #ffffff;
		color: #777777;
		text-align: center;
		font-size: 100%;
	}
	#galleryImgModal img {
		width: 100%;
	}
	.addImageBtn{
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
</style>


<div id="colorlib-main" class="popular-location" style="padding:20px;">
	<div class="row">
		<div class="col-lg-12" style="padding-bottom:20px">
			<div class="">
				<a href="<c:url value="/pack/main.do"/>">
				<img alt="pack" src="<c:url value="/images/pack/pack.png"/>"
					style="width: 80px;"></a>
				&emsp;<a class="packCreateBtn btn" 
					href="<c:url value="/pack/main.do"/>">HOME</a>
				<c:if test="${!empty sessionScope.packId}">
					<a class="packCreateBtn btn"
						href="<c:url value="/pack/view.do"/>">MY PACK</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-md-12 col-lg-12">
			<p style="padding-top:14px;padding-left:10px;color:black;font-weight: bold;font-size:1.7em;text-align: center">전국일주</p>
			<hr style="background-color: black;height:1px"/>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="text-center col-lg-12" >
				<p style="font-size:1.8em;padding-bottom:10px;padding:20px;">&lt;&nbsp;갤러리&nbsp;&gt;</p>
			</div>
				
		</div>
	</div>
	<div class="container">
		<div class="row plusImage">
			<button class="plusImgBtn btn" type="button" data-toggle="modal"
				data-target="#galleryModal">&nbsp;사진추가&nbsp;</button>
		</div>
		<div class="row">
			<c:if test="${empty packGalleryList }"
				var="isEmpty">
				<h4>갤러리에 사진이 없어요.</h4>
			</c:if>
			<c:if test="${!isEmpty}">
				<c:forEach var="item"
					items="${packGalleryList }">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-location mb-30 ">
							<div class="location-img galleryImg">
								<img src="/fileupload/${item.pictureName}" alt="팩갤러리 사진">
							</div>
							<input type="hidden" value="${item.pictureName}">
						</div>
					</div>

				</c:forEach>
			</c:if>

		</div>
	</div>

	<div class="modal fade" id="galleryModal"
		data-backdrop="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 style="font-weight: bold;">사진 올리기</h4>
				</div>
				<div class="modal-body">
					<div class="col-sm-12"
						style="margin-top: 10px">
						<form method="post"
							enctype="multipart/form-data"
							class="col-sm-12">
							<div id="fileUpload"
								class="dragAndDropDiv col-sm-12">
								<span class="dragAndDropDivSpan">여기에 이미지를 드래그하세요</span>
							</div>
							<input type="file" name="fileUpload"
								id="fileUpload" style="display: none;"
								multiple />
						</form>
						<!-- <button class="dragAndDropBtn col-sm-2  col-sm-offset-10">추가</button> -->
					</div>

				</div>
				<div class="modal-footer">
					<form method="post"
						action="<c:url value="/pack/pictureInput.do"/>">
						<input class="form-control" name="imgArry"
							id="imgArry" type="hidden">
						<button type="submit"
							class="addImageBtn btn">저장</button>
					</form>
					<button type="button" class="addImageBtn btn"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="galleryViewModal"
		data-backdrop="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4>사진 상세보기</h4>
				</div>
				<div class="modal-body">
					<div class="col-sm-12" id="galleryImgModal"
						style="margin-top: 10px"></div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-default"
						id="fileDeleteATag" href="#">삭제</a>
					<a class="btn btn-default"
						id="fileDownloadATag" href="#">다운로드</a>
					<button type="button" class="btn btn-default"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 -->
</div>
<script>

	// 이미지 다운로드 모달 정보 변경 
	$(".galleryImg").click(function() {
		var fileName = $(this).next().val()
		var imgDownloadHref = '<c:url value="/pack/fileDownload.do?filename='
				+ fileName + '"/>'
		var imgDeleteHref = '<c:url value="/pack/fileDelete.do?filename='
				+ fileName + '"/>'
		$("#fileDownloadATag").attr("href", imgDownloadHref)
		$("#fileDeleteATag").attr("href", imgDeleteHref)
		$('#galleryImgModal').html($(this).html());
		$('#galleryViewModal').modal();
	});

	//이미지 드래그앤 드랍.
    var objDragAndDrop = $(".dragAndDropDiv");
    
    $(document).on("dragenter",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    $(document).on("dragover",".dragAndDropDiv",function(e){
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on("drop",".dragAndDropDiv",function(e){
        $(this).css('border', '2px dotted #0B85A1');
        e.preventDefault();
        var files = e.originalEvent.dataTransfer.files;
        if (files.length > 3) {
            alert('이미지는 3개까지 올릴 수 있습니다.');
            return;
        }
        var size =$("#imgArry").val().split(",").length+files.length;
        console.log(size)   
        if(size > 3){
        	 alert('이미지는 3개까지 올릴 수 있습니다.');
             return;
        }    

        handleFileUpload(files,objDragAndDrop);
    });
       
    //1]drag 영역 클릭시 파일 선택창
  
    $(".dragAndDropBtn").on('click',function (e){
        $('input[type=file]').trigger('click');
    });
    $('input[type=file]').on('change', function(e) {
        var files = e.originalEvent.target.files;
        handleFileUpload(files,objDragAndDrop);
    });
    //1-1]만들어진 다이브 클릭시는 삭제 
    
   
    //2]서버에 파일 전송 메소드
    function handleFileUpload(files,obj){
       for (var i = 0; i < files.length; i++) {
            var fd = new FormData();
            fd.append('file', files[i]);
            sendFileToServer(fd);
       }
    }
    
    var rowCount=0;
	//4] Ajax 이용 해서 서버에 이미지 저장하는 핵심로직
	var imgarr =[];
	function sendFileToServer(formData){
        var extraData ={}; //Extra Data.
        var jqXHR=$.ajax({
            url: "<c:url value="/pack/fileUpload/post"/>",
            type: "POST",
            contentType:false,
            processData: false,
            cache: false,
            data: formData,
            dataType:'json',
            success: function(data){
            	imgarr.push(data.fileName);
            	imageDivShow()
            }
        }); 
    }//파일저장 
    
   	//5] Ajax 이용 해서 서버에 이미지 삭제하기 
   	function deleteFileToServer(filename) {
   		$.ajax({
   			url : "<c:url value="/pack/filedelete/post"/>",//요청할 서버의 URL주소
   			type : 'post',//데이타 전송방식(디폴트는 get방식) 
   			dataType : 'text',//서버로 부터 응답 받을 데이타의 형식 설정
   			data : "filename=" + filename,
   			success : function(data) {
   				console.log(data);
   				imgarr.splice(imgarr.indexOf(filename), 1);
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
			str += "<div class='imgdiv' id='"+imgarr[i]+"'><img class='img'  src=/fileupload/"+imgarr[i]+"><div class='imgdeletemark'>삭제</div></div>";
		}
		$("#fileUpload").html(str);
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

		$('#imgArry').val(imgarr);
	}
</script>
