<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 제이쿼리 UI용 CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 제이쿼리 코어용 라이브러리 임베드 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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


<style>
#colorlib-main{
	margin-top: 20px;
	margin-bottom: 10px;
}
.popular-location .single-location{
	position:relative;
	margin-top: 30px;
	}
.popular-location .single-location .location-img{
	border-radius:10px;overflow:hidden;position:relative;z-index:0
}
.popular-location .single-location .location-img::before
{
	position:absolute;width:100%;height:50%;bottom:0;content:"";z-index:1
}
.popular-location .single-location .location-img img{
	width:100%;transform:scale(1);transition:all .5s ease-out 0s;height: 150px;
}
.single-location:hover .location-img img{
	transform:scale(1.1)
	}
.plusImage{
float: right;
}
.plusImage button{
border: none;background-color: #777777;color: white;font-family: 'Do Hyeon', sans-serif;padding: 5px;
border-radius: 2px;
}
h1{
font-family: 'Do Hyeon', sans-serif;
}.modal-dialog {
width: 80%;
max-width:800px;
height: 100%;
}
.imgdiv{
     margin: 10px;
	 display: inline-block;    
     position: relative
}
.img{
   	 	width: 200px;
        height:176px;        
}
.imgdeletemark{
      	display: none;   
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate( -50%, -50% );
} 
.dragAndDropDiv {
		width:100%;
    	margin-top: 15px;
    	height: 200px;
        border: 2px dashed #777777;
        color: #777777;
        text-align: center;
		
}.dragAndDropDivSpan{
		line-height: 200px;
        vertical-align: middle;
        font-size:150%;

}.dragAndDropBtn{
    	margin-top: 10px;
        border: 1px solid #777777;
        background-color : #ffffff;
        color: #777777;
        text-align: center;
        font-size:100%;

}#galleryImgModal img{
width: 100%;
}
</style>


<div id="colorlib-page">
<div id="colorlib-main" class="popular-location section-padding30">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- Section Tittle -->
				<div class="section-tittle text-center mb-80">
					<h1>PACK GALLERY</h1>
				</div>
			</div>
		</div>
		<div class="row plusImage">
		<button type="button" data-toggle="modal" data-target="#galleryModal">&nbsp사진 추가&nbsp</button>
		</div>
		<div class="row">
			
			<c:if test="${empty packGalleryList }" var="isEmpty">
				<h3>갤러리에 사진이 없어요.</h3>
			</c:if>
			<c:if test="${!isEmpty}">
				<c:forEach var="item" items="${packGalleryList }">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-location mb-30 ">
							<div class="location-img galleryImg" >
								<img src="/fileupload/${item.pictureName}" alt="팩갤러리 사진">
							</div>
							<input type="hidden" value="${item.pictureName}" >
						</div>
					</div>	
					
				</c:forEach>
			</c:if>
			
		</div>
	</div>
	
  <div class="modal fade" id="galleryModal" data-backdrop="false"  >
	    <div class="modal-dialog modal-lg" >
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4>사진 올리기</h4>
	            </div>
	            <div class="modal-body">
	           			<div class="col-sm-12" style="margin-top:10px ">
							<form method="post" enctype="multipart/form-data" class="col-sm-12">
								 <div id="fileUpload" class="dragAndDropDiv col-sm-12"><span class="dragAndDropDivSpan">Drag & Drop Files Here</span></div>
								 <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
							</form>
							<!-- <button class="dragAndDropBtn col-sm-2  col-sm-offset-10">추가</button> -->
						</div>
						
	            </div>
	            <div class="modal-footer"> 
	            	<form method="post" action="<c:url value="/pack/pictureInput.do"/>">
						<input class="form-control" name="imgArry" id="imgArry"  type="hidden">
						<button type="submit" class="btn btn-default">Save</button>	
					</form>
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal fade" id="galleryViewModal" data-backdrop="false"  >
	    <div class="modal-dialog modal-lg" >
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4>사진 상세보기</h4>
	            </div>
	            <div class="modal-body">
           			<div class="col-sm-12" id="galleryImgModal" style="margin-top:10px">
					</div>
	            </div>
	            <div class="modal-footer"> 
	           		<a class="btn btn-default" id="fileDeleteATag" href="#">삭제</a>
					<a class="btn btn-default" id="fileDownloadATag" href="#">다운로드</a>	
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	        </div>
	    </div>
	</div><!-- 모달 -->
</div>
</div>
<script>

	


// 이미지 다운로드 모달 정보 변경 
		$(".galleryImg").click(function(){
			var fileName = $(this).next().val()
			var imgDownloadHref = '<c:url value="/pack/fileDownload.do?filename='+fileName+'"/>'
			var imgDeleteHref = '<c:url value="/pack/fileDelete.do?filename='+fileName+'"/>'
			$("#fileDownloadATag").attr("href", imgDownloadHref )
			$("#fileDeleteATag").attr("href", imgDeleteHref)
			$('#galleryImgModal').html($(this).html());
			$('#galleryViewModal').modal();
		})

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
        function handleFileUpload(files,obj)
        {
           for (var i = 0; i < files.length; i++) 
           {
                var fd = new FormData();
                fd.append('file', files[i]);
                sendFileToServer(fd);
           }
        }
        
        
        var rowCount=0;
 
      //4] Ajax 이용 해서 서버에 이미지 저장하는 핵심로직
      var imgarr =[];
      function sendFileToServer(formData)
        {
        	
      
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
        
        function deleteFileToServer(filename){

   			$.ajax({
   				url:"<c:url value="/pack/filedelete/post"/>",//요청할 서버의 URL주소
   				type:'post',//데이타 전송방식(디폴트는 get방식) 
   				dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
   				data: "filename="+filename,
   				success:function(data){
   					console.log(data);
   					imgarr.splice(imgarr.indexOf(filename),1); 
   					imageDivShow();
   				},error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
   					console.log('에러 : ',error.responseText);
   				}
   				
   			});
        }
        
        
        
        //6]파일 추가 삭제 후 다이브 다시띄우기.
        function imageDivShow(){
        	var str='';
        	for(var i=0; i < imgarr.length ;i++){
                str += "<div class='imgdiv' id='"+imgarr[i]+"'><img class='img'  src=/fileupload/"+imgarr[i]+"><div class='imgdeletemark'>삭제</div></div>";
            	}
                $("#fileUpload").html(str);
                //이미지에 호버 이벤트 걸기
                $(".imgdiv").hover(function(){
                	 $(this).children().eq(1).css("display","block");
                	 $(this).children().eq(0).css("opacity",0.4); 
                  },function(){
                	 $(this).children().eq(1).css("display","none");
                	 $(this).children().eq(0).css("opacity",1.0);
                  });
                $(".imgdiv").click(function(){
                	deleteFileToServer($(this).attr('id'))
				                 });
				                
				              $('#imgArry').val(imgarr);  
				        }
				
</script>

