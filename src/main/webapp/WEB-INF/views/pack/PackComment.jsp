	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 제이쿼리 코어용 라이브러리 임베드 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">



<style>
	#colorlib-main{
		margin-top: 20px;
		margin-bottom: 10px;
	}
	.dragAndDropDiv {
		width:100%;
    	margin-top: 15px;
    	height: 200px;
        border: 2px dashed #777777;
        color: #777777;
        text-align: center;
     }
    .dragAndDropDivSpan{
		line-height: 200px;
        vertical-align: middle;
        font-size:150%;
     }
     .dragAndDropBtn{
    	margin-top: 10px;
    	margin-bottom: 5px;
        border: 1px solid #777777;
        background-color : #ffffff;
        color: #777777;
        text-align: center;
        font-size:100%;
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
		
		<!-- 코멘트 작성 및 인기글 목록 -->
		<div class="row">
			<button type="button" class="btn btn-success btn-lg offset-md-1 col-md-5" data-toggle="modal" data-target="#writeModal">
			  +
			</button>
			
			<!-- writeModal -->
			<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">글 작성</h4>
			      </div>
			      <div class="modal-body">
			        <div class="col-sm-12" style="margin-top:10px ">
							<form method="post" enctype="multipart/form-data" class="col-sm-12">
								 <div id="fileUpload" class="dragAndDropDiv col-sm-12"><span class="dragAndDropDivSpan">Drag & Drop Files Here</span></div>
								 <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
							</form>
							<button class="dragAndDropBtn col-sm-2  col-sm-offset-10">추가</button>
			        <br>
					</div>
			      	<input type="hidden" value="${item.pictureName}" >
			        <input type="text" placeholder="내용 작성" style="width: 450px; margin-left: 10px;">
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary">올리기</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		</div><!-- row -->	
		<hr>
		<!-- 코멘트 리스트 -->
		<div class="row">
			<c:if test="${empty commentList }" var="isEmpty">
				<h3>게시물이 없어요.</h3>
			</c:if>
			<c:if test="${!isEmpty }">
				<c:forEach var="item" items="${commentList}" varStatus="loop">
					<button type="button" class="btn btn-default btn-lg offset-md-1 col-md-5" data-toggle="modal" data-target="#listModal">
					  <div>
					  	<table>
					  		<tr>
					  			<td hidden="hidden">${item.no}</td>
					  			<td>${item.id}</td>
					  			<td>${item.postDate}<br/>${item.content}<span class="badge">${item.commentCount}</span></td>
					  		</tr>
					  	</table>
					  </div>
					</button>
				</c:forEach>
			</c:if>
			<!-- listModal -->
			<div class="modal fade" id="listModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"></div>
			      <div class="modal-body">
			        <div class="col-sm-12" style="margin-top:10px ">
			        	<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="single-location mb-30 ">
								<div class="location-img galleryImg" >
									<img src="#" alt="팩갤러리 사진">
								</div>
								<input type="hidden" value="${item.pictureName}" >
							</div>
						</div>	
					<br>
					<hr>
						<div>
							<p>${record.no}</p>
							<p>${record.content }</p>							
						</div>
					</div>
			      </div>
			      <div class="modal-footer">
			      	<div class="row">
			      		<div class="text-center">
			      			<!-- 댓글 -->
			      			<form class="form-inline" id="frm" method="post">
			      				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			      				<input type="hidden" name="no" value="${record.no }"/>
			      				<!-- 수정,삭제 -->
			      				<input type="hidden" name="cno"/>
			      				<input id="title" class="form-control" type="text" name="linecomment"/>
			      				<input class="btm btn-success" id="submit" type="button" value="등록"/>			      			
			      			</form>
			      			<div class="row">
			      				<!-- 댓글 목록 -->
			      				<div id="comments"></div>
			      			</div>
			      		</div>
			      	</div>
					<c:if test="${sessionScope.id == record.id}">
			        <button type="button" class="btn btn-primary">수정</button>
			        <button type="button" class="btn btn-danger">삭제</button>
			        </c:if>
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div><!-- row -->
		

		
		
	</div>
</div>

<script>
	$('#writeModal').on('shown.bs.modal', function () {
		  
		})
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
        $('#listModal').on('shown.bs.modal', function () {
  		  
		})
	//페이지 로드시 코멘트 목록 뿌려주기]
        showComments();
     	//코멘트 입력 및 수정처리
     	var action;
     	${"submit"}.click(function(){
     		if($(this).val()=="등록")
     			action = ""
     	})
</script>



