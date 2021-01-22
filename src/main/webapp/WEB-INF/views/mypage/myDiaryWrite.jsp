<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style>
.imgdiv{
     margin:8px;
	 display: inline-block;    
     position: relative
}.img{
   	width: 90px;
    height:90px;
}.imgdeletemark{
    display: none;   
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
}.dragAndDropDiv {
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
    background-color : #ffffff;
    color: #777777;
    text-align: center;
    font-size:100%;
    border:none;
}.diaryInfo{
	margin-top: 40px;
	font-family:'Nanum Pen Script', cursive;
}.diaryInfo div{
	font-size: 25px;
	outline:none;
	background-color: #ebebeb;
	display: inline-block;
	height: 41px;
	line-height: 41px;
	margin-bottom: 20px;
}.diaryInfo .diaryTitle{
	width: 100%;
	
}.diaryInfo .diaryContent{
	height: 200px;
	width: 100%;
}
.diaryInfo span{
	width: 100%;
	font-size: 25px;
}#map{
   height: 100%;
}
</style>

	<div id="colorlib-main">
				
            <div class="modal-body" style="height: 100%;">
            	   <div style="margin-top:10px">
						<div style="width: 100% ;height: 200px;border:1px solid #666666"> 
							 <div  id="map"></div> 
						</div>
					</div>
           			
				 <div class="diaryInfo">
				     <span>제목입력</span><br> 
					 <div class="diaryTitle"  id="titleDiv" contenteditable="true"></div>
					 <span>내용입력 </span> <br> 
					 <div class="diaryContent"  id="contentDiv" contenteditable="true"></div>
				</div>
				<button id="storyBtn">이미지 스토리 만들기</button>
				<div style="margin-top:10px; display:none" id="storyDiv">
						<form method="post" enctype="multipart/form-data" >
							 <div id="fileUpload" class="dragAndDropDiv"><span class="dragAndDropDivSpan">스토리 카드를 만들 이미지를 올려주세요</span></div>
							 <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
						</form>
						<button class="dragAndDropBtn col-sm-1 col-sm-offset-11">사진추가</button>
				</div>
            </div>
			<div class="modal-footer"> 
            	<form method="post" action="<c:url value="/mypage/diary/write.do"/>">
            		<input class="form-control" name="title" id="title"  type="hidden">
            		<input class="form-control" name="content" id="content"  type="hidden">
					<input class="form-control" name="imgArry" id="imgArry"  type="hidden">
					<input class="form-control" name="recordId" value="${recordId}"  type="hidden">
					<button type="submit" id="myStorySave" class="btn btn-default">저장</button>	
					<a type="button" class="btn btn-default" data-dismiss="modal">닫기</a>
				</form>
                
            </div>
            </div>
             

<script>

		$("#myStorySave").click(function(){
			
			var title=$("#titleDiv").html();
			var content=$("#contentDiv").html();
			
			$("#title").val(title);
			$("#content").val(content);
		
		})
		
		$("#storyBtn").click(function(){
			if($("#storyDiv").css("display") == "none"){
			    $("#storyDiv").show();
			} else {
			    $("#storyDiv").hide();
			}
		})
		

//이미지 입력 스크립트.
 
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
            
        //지도 
        
        function mapStart(){
			mapboxgl.accessToken = 'pk.eyJ1Ijoid2t1bmdoOTMiLCJhIjoiY2tpd2hpNnZ0MHF3YzMwcnd5ZG1obzh2biJ9.EW26scaL6pDX7yQhFNnwMw';
		
			var monument = [ 126.87870025634767, 37.478732138068445 ];
			
			var imgarr = [];
		
			var map = new mapboxgl.Map({
				container : 'map',
				style : 'mapbox://styles/mapbox/streets-v11',
				center : monument,
				zoom : 11
			})
		
			
			//주소검색기 컨트롤러 얻어옴
			var geocoder = new MapboxGeocoder({
				accessToken : mapboxgl.accessToken,
				mapboxgl : mapboxgl
			});
			
		
			
			mapRecordUpload(map);
			
		}//mapStart()
		
		function mapRecordUpload(map){
			map.on('load', function(){ // 이부분 있어야 바로 로드 가능
			<c:if test="${!empty mapRecord}">
		
			var data = ${mapRecord}
			var json = data.features[0];
			console.log('data:%O',data.features[0]);
			
			map.addSource('route', {
				"type":"geojson",
				"data":json
			});
			map.addLayer({
				'id': 'route',
				'type': 'line',
				'source': 'route',
				'layout': {
					'line-join': 'round',
					'line-cap': 'round'
				},
				'paint': {
					'line-color': '#ff0000',
					'line-width': 8
				}
			});
			map.setCenter(data.features[0].geometry.coordinates[0][0]);
			map.setZoom(11);
		</c:if>
		});
		}//mapRecordUpload()
		
		
		$(function(){
		mapStart();
		})//로드시 스타트
</script>

				
