<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!--  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.5.0/main.min.css,npm/fullcalendar@5.5.0/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css">
-->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/locales-all.min.js"></script>

<style>
body {
	font-size: 12px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.fc-event-title-container {
	text-align: center;
	background-color: black;
}

.modal {
	text-align: center;
	position: fixed;
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

#packSchedule {
	background-color: white;
	border: #052b52 1px solid;
	border-radius: 10px;
}

#packScheduleUpdate {
	background-color: white;
	border: #052b52 1px solid;
	border-radius: 10px;
}

label {
	float: left;
}

.SceduleBtn {
	color: white;
	background-color: #f32a48;
	font-weight: bold;
	border: none;
}

.animated-text {
	display: none;
}

.slider-area {
	display: none;
}

/*달력 요일 뿌려주는 부분*/
.fc-col-header-cell {
	background-color: #052b52;
	color: white;
}

.fc-view {
	box-shadow: 3px 3px 10px #787878;
}

.packMainBtn {
	color: #f32a48;
	background: none;
	font-weight: bold;
	border: #f32a48 1px solid;
}

.packMainBtn:hover {
	color: white;
}

.packCreateBtn:hover {
	color:white;
	background-color: #ff8827;
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

.userThumbnailImg{
	border-radius: 100%;
	width: 50px;
	height: 50px;
}
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div
	style="border-radius: 10px; box-shadow: 0px 0px 5px #787878; padding: 30px; background-color: white;  position: relative; z-index: 1;">
	<div class="row">
		<div class="col-xs-12 col-lg-12" style="padding-bottom: 20px">
			<div class="">
				<a class="packMainBtn btn" href="<c:url value="/pack/view.do"/>"
					style="margine-right: 20px">HOME</a>
			</div>
		</div>
	</div>
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-xs-12 col-md-12 col-lg-12">
			<p
				style="padding-top: 14px; padding-left: 10px; color: black; font-weight: bold; font-size: 1.8em; text-align: center">일&nbsp;정</p>
		</div>
	</div>
	<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
		<div class="offset-lg-1 col-lg-10">
			<div id="calendar"></div>
		</div>
	</div>
</div>
<!--  
<div class="row">
	<div class="col-lg-12">
		<div class="text-center col-lg-12" >
			<p style="font-size:2em;padding-bottom:10px;padding:20px;">&lt;&nbsp;일정&nbsp;&gt;</p>
		</div>
			
	</div>
</div>
-->





<!-- 팩 일정 등록 모달창 시작 -->
<div class="modal fade" id="packScheduleInsertModal"
	data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style="background-color: #052b52;">
				<h4 class="modal-title" style="margin: 5px; color: white;">일정
					등록</h4>
			</div>

			<div class="modal-body">
				<form action="<c:url value="/pack/schedule/insert.do"/>"
					class="bg-light p-5 contact-form" id="packSchedule" method="post">
					<label for="packScheduleTitle">일정 제목</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packScheduleTitle"
							id="packScheduleTitle">
					</div>

					<label for="startDatePicker">시작 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleStart" id="startDatePicker"
							class="form-control" value="">
					</div>

					<label for="endDatePicker">끝 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleEnd" id="endDatePicker"
							class="form-control" value="">
					</div>

					<label for="packScheduleContent">일정 내용</label>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"
							name="packScheduleContent" id="packScheduleContent"></textarea>
					</div>



				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="SceduleBtn btn" id="btnPackSchedule">등록</button>
				<button type="button" class="SceduleBtn btn"
					id="btnPackScheduleInsertClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 등록 모달창 끝 -->

<!-- 팩 일정 상세보기 모달창 시작 -->
<div class="modal fade" id="packScheduleViewModal" data-backdrop="false">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header" style="background-color: #052b52;">
            <h4 class="modal-title packScheduleViewTitle" style="margin: 5px; color: white;"></h4>
         </div>

         <div class="modal-body">
         	<!--  bbbbbbbbbbbbb -->
         	
         	<div class="row" style="padding: 15px; margin-top: 0px;">
         		<div class="col-lg-12" style="margin-bottom:20px;">
         			<img src="" id="userThumbnailImgInModal">
         			<span style="font-size: 16px; margin-left: 10px;" id="packScheduleViewWriter"></span>
       			</div>
         		<div class="col-lg-12 bg-light p-5" style="border: #ff8827 1px solid;border-radius: 10px; padding:10px;">
         			<div class="col-lg-12" style="text-align: left;">
         				<span class="glyphicon glyphicon-calendar" style="color:#052b52; font-size: 20px;">
         				<span id="packScheduleViewStart" style="color:black;"></span> ~ 
         				<span id="packScheduleViewEnd" style="color:black;"></span> 
         			</div>
         			<div class="col-lg-12" id="packScheduleViewContent" 
         				style="border: #ff8827 1px solid; min-height: 200px; margin-top: 20px; 
         					background-color: white; border-radius: 10px; padding: 15px; font-size: 16px; text-align: left">
         			</div>
         			<div class="col-lg-12" id="packScheduleJoinerList" style="text-align: left; margin-top: 15px; line-height: 40px;">
         				<img src="<c:url value="/images/fa-icons/user-check-solid.svg"/>" style="width: 30px; height: 30px; color:#052b52 ">
         				<span style="font-size: 16px; margin-left: 25px;" id="joinerSpan"></span> 
         			</div>
         		</div>
         		<div class="row">
               		<div style="display:none;" id="packScheduleViewNo" value="" style="text-align: left;"></div>
       			 </div>
            
         	</div>
         
         	<!--  
            <div class="row">
               <div class="col-md-2" style="text-align: left;font-weight:bold;">제목</div>
               <div class="col-md-10" id="packScheduleViewTitle" value="" style="text-align: left;"></div>
            </div>
            <div class="row">
               <div class="col-md-2" style="text-align: left;font-weight:bold;">글쓴이</div>
               <div class="col-md-10" id="packScheduleViewWriter" value="" style="text-align: left;"></div>
            </div>
            <div class="row">
               <div class="col-md-2" style="text-align: left;font-weight:bold;">시작 날짜</div>
               <div class="col-md-10" id="packScheduleViewStart" value="" style="text-align: left;"></div>
            </div>
            <div class="row">
               <div class="col-md-2" style="text-align: left;font-weight:bold;">끝 날짜</div>
               <div class="col-md-10" id="packScheduleViewEnd" value="" style="text-align: left;"></div>
            </div>
            <div class="row">
               <div class="col-md-2" style="text-align: left;font-weight:bold;">글 내용</div>
               <div class="col-md-10" id="packScheduleViewContent" value="" style="text-align: left;"></div>
            </div>
            <div class="row">
            	<div class="col-md-2">참가자</div>
            	<div class="col-md-10" id="packScheduleViewJoiner"></div>
            </div>
            -->
            
         </div>

			<div class="modal-footer">
				<button type="button" class="SceduleBtn btn" data-dismiss="modal"
					id="btnPackScheduleUpdate">수정</button>
				<button type="button" class="SceduleBtn btn" data-dismiss="modal"
					id="btnPackScheduleDelete">삭제</button>
				<button type="button" class="SceduleBtn btn" data-dismiss="modal"
					id="btnPackScheduleJoin">참가</button>
				<button type="button" class="SceduleBtn btn"
					id="btnPackScheduleViewClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 상세보기 모달창 끝 -->



<!-- 팩 일정 수정 모달창 시작 -->
<div class="modal fade" id="packSchedulUpdateModal" data-backdrop="false">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header" style="background-color: #052b52;">
            <h4 class="modal-title" style="margin: 5px;font-weight:bold;color:white">일정 수정</h4>
         </div>
			<div class="modal-body">
				<form action="<c:url value="/pack/schedule/update.do"/>"
					class="bg-light p-5 contact-form" id="packScheduleUpdate"
					method="post">
					<label for="packScheduleTitleUpdate">일정 제목</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packScheduleTitle"
							id="packScheduleTitleUpdate">
					</div>

					<label for="startDatePickerUpdate">시작 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleStart"
							id="startDatePickerUpdate" class="form-control" value="">
					</div>

					<label for="endDatePickerUpdate">끝 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleEnd" id="endDatePickerUpdate"
							class="form-control" value="">
					</div>

					<label for="packScheduleContentUpdate">일정 내용</label>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"
							name="packScheduleContent" id="packScheduleContentUpdate"></textarea>
						<input type="hidden" class="form-control" name="packScheduleNo"
							id="packScheduleNoUpdate" />
					</div>



				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="SceduleBtn btn"
					id="btnPackScheduleUpdateOk">수정</button>
				<button type="button" class="SceduleBtn btn"
					id="btnPackScheduleUpdateClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 수정 모달창 끝 -->

<!-- 팩 일정 삭제 모달창 시작 -->
<div class="modal fade" id="packScheduelDeleteModal"
	data-backdrop="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="font-weight: bold;">일정 삭제</h4>
			</div>

			<div class="modal-body">
				<h4 class="text-center">정말로 삭제하시겠습니까?</h4>
				<form action="<c:url value="/pack/schedule/delete.do"/>"
					class="bg-light p-5 contact-form" id="packScheduleDeleteForm"
					style="display: none;">
					<div class="form-group">
						<input type="hidden" class="form-control" name="packScheduleNo"
							id="packScheduleDeleteNo" value="">
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="SceduleBtn btn" data-dismiss="modal"
					id="btnScheduleDeleteOk">삭제</button>
				<button type="button" class="SceduleBtn btn" data-dismiss="modal"
					id="btnScheduleDeleteClose">닫기</button>

			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 삭제 모달창 끝 -->





<script>
   
   $(function(){
      console.log(${calendarJson})
      
      var calendarEl = document.getElementById('calendar');
   
      var calendar = new FullCalendar.Calendar(calendarEl, {
         headerToolbar : {
            left : 'prevYear,prev,next,nextYear today',
            center : 'title',
            right : 'dayGridMonth,dayGridWeek,dayGridDay'
         },
         navLinks : true, // can click day/week names to navigate views
         editable : true,
         dayMaxEvents : true, // allow "more" link when too many events
         locale : 'ko',
         timezone : 'local',
         firstDay : 0,
         eventLimit : true,
         format: 'yy-mm-dd',
         
         events: 
              <c:if test="${empty calendarJson}" var="emp" >
                     [{}]
              </c:if>
              <c:if test="${!emp}"  >
                    ${calendarJson}
              </c:if>
          
         
      });
      //클릭시 모달창 제어
      calendar.on('dateClick', function(info) {
         console.log(info);
         $('#packScheduleInsertModal').modal();
         
         var clickTime = moment(info.date).format("YYYY-MM-DD hh:mm a");
         
         $('#startDatePicker').attr('value',clickTime);
      });
      
      calendar.on('eventClick',function(info){
         console.log('이벤트 클릭');
         //aaaaaa
         $.ajax({
            url : "<c:url value="/pack/schedule/selectOne.do"/>",//요청할 서버의 URL주소
            type : 'post',//데이타 전송방식(디폴트는 get방식) 
            dataType : 'json',//서버로 부터 응답 받을 데이타의 형식 설정
            data : {
               "packId" : ${sessionScope.packId},
               "packScheduleNo" : info.event.id
            },
            success : function(data) {
               console.log('들어옴');
               $('.packScheduleViewTitle').text(data.title);
               $('#packScheduleViewWriter').text(data.name);
               $('#packScheduleViewStart').text(data.start);
               $('#packScheduleViewEnd').text(data.end);
               $('#packScheduleViewContent').text(data.content);
               $('#packScheduleViewNo').text(data.packScheduleNo);
               
               if(data.memberProfileImgs == 'no'){
            	   $('#userThumbnailImgInModal').prop('src',"<c:url value="/images/badges/shoongBadge6.png"/>")
               }
               else{
            	   var str = data.memberProfileImgs;
            	   $('#userThumbnailImgInModal').prop('src',"<c:url value='/images/badges/"+str+"'/>")
               }
               $('#userThumbnailImgInModal').css('width','50px')
               $('#userThumbnailImgInModal').css('height','50px')
               
	           
               
               if(data.isWriter == 'yes'){
                  $('#btnPackScheduleJoin').css('display','none');   
               }
               else{
                  $('#btnPackScheduleUpdate').css('display','none');
                  $('#btnPackScheduleDelete').css('display','none');
               }
               
               if(data.isJoined == 'yes'){
            	   $('#btnPackScheduleJoin').css('display','none');    
               }
               var str = "";
               console.log('아아아아아아아')
               console.log(data.scheduleJoiner);
               $.each(data.scheduleJoiner,function(index,el){
            	   console.log("참가자이름"+el.NAME);
            	   str += "#"+el.NAME+"  ";
               })
               console.log(str);
               $('#joinerSpan').html(str);
               
               $('#packScheduleViewModal').modal();
            },
            error : function(request, error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
               console.log('에러 : ', error.responseText);
            }
            
         });
         
      })
   
      calendar.render();
      
      
		 $('#startDatePicker, #endDatePicker').datetimepicker({
		    	 format: "YYYY-MM-DD hh:mm a",
	     		 locale:'ko'	
		     })//여기까지가 기본 사용 방법
		 $('#startDatePicker','#endDatePicker').on("changeDate",function(e){
		    console.log('들어옴');
		 })
		 
		 $('#btnPackSchedule').click(function(){
				if($('#packScheduleTitle').val() == ''){
					alert('제목을 입력해주세요');
					$('#packScheduleTitle').focus();
					return;
				}
				if($('#startDatePicker').val() == ''){
					alert('시작 날짜를 입력해주세요');
					$('#startDatePicker').focus();
					return;
				}
				if($('#endDatePicker').val() == ''){
					alert('끝 날짜를 입력해주세요');
					$('#endDatePicker').focus();
					return;
				}
				if($('#packScheduleContent').val() == ''){
					alert('내용을 입력해주세요');
					$('#packScheduleContent').focus();
					return;
				}
				var start = moment($('#startDatePicker').val());
				var end = moment($('#endDatePicker').val());
				if(start > end){
					alert('시작 날짜가 끝 날짜보다 크면 안됩니다.');
					return;
				}
			   
		  
		  	$('#packSchedule').submit();
		 });
		 
		 $('#btnPackScheduleClose').click(function(){
		    $('#endDatePicker').prop('value',"");
		 });
		 
		 $('#btnPackScheduleUpdate').click(function(){
		    $('#packScheduleTitleUpdate').prop('value',$('.packScheduleViewTitle').text());
		    $('#startDatePickerUpdate').prop('value',$('#packScheduleViewStart').text());
		    $('#endDatePickerUpdate').prop('value',$('#packScheduleViewEnd').text());
		    $('#packScheduleContentUpdate').prop('value',$('#packScheduleViewContent').text());
		    $('#packScheduleNoUpdate').prop('value',$('#packScheduleViewNo').text());
		    
		    $('#startDatePickerUpdate, #endDatePickerUpdate').datetimepicker({
		    	 format: "YYYY-MM-DD hh:mm a",
			     locale:'ko'
		    });
		    
		    $('#packSchedulUpdateModal').modal();
		 });
		 
		 $('#btnPackScheduleUpdateOk').click(function(){
		    console.log('수정버튼 들어옴');
    		if($('#packScheduleTitleUpdate').val() == ''){
				alert('제목을 입력해주세요');
				$('#packScheduleTitleUpdate').focus();
				return;
			}
			if($('#startDatePickerUpdate').val() == ''){
				alert('시작 날짜를 입력해주세요');
				$('#startDatePickerUpdate').focus();
				return;
			}
			if($('#endDatePickerUpdate').val() == ''){
				alert('끝 날짜를 입력해주세요');
				$('#endDatePickerUpdate').focus();
				return;
			}
			if($('#packScheduleContentUpdate').val() == ''){
				alert('내용을 입력해주세요');
				$('#packScheduleContentUpdate').focus();
				return;
			}
			var start = moment($('#startDatePickerUpdate').val());
			var end = moment($('#endDatePickerUpdate').val());
			if(start > end){
				alert('시작 날짜가 끝 날짜보다 크면 안됩니다.');
				return;
			}
		    
		    
		    $('#packScheduleUpdate').submit();
		 });
		 
		 $('#btnPackScheduleDelete').click(function(){
		    console.log('삭제버튼 들어옴')
		    $('#packScheduelDeleteModal').modal();
		    
		 });
		 
		 $('#btnScheduleDeleteOk').click(function(){
		    $('#packScheduleDeleteNo').prop('value',$('#packScheduleViewNo').text());
		    $('#packScheduleDeleteForm').submit();
		 })
		 
		 //팩 일정등록 닫기
		 $('#btnPackScheduleInsertClose').click(function(){
		  console.log('팩일정등록 닫기 클릭');
		  $('#packScheduleInsertModal').modal('hide');
		  $('#packScheduleTitle').val("");
		  $('#startDatePicker').val("");
		  $('#endDatePicker').val("");
		  $('#packScheduleContent').val("");
		  
		 })
		 
		 $('#btnPackScheduleViewClose').click(function(){
		 	console.log('팩일정 상세보기 닫기 클릭');
		 	$('#packScheduleViewModal').modal('hide');
		    $('#btnPackScheduleUpdate').css('display','inline-block')
		    $('#btnPackScheduleDelete').css('display','inline-block')
		    $('#btnPackScheduleJoin').css('display','inline-block')
		 })
		 
		 $('#btnPackScheduleJoin').click(function(){
		  var packScheduleNo = $('#packScheduleViewNo').text();
		  console.log(packScheduleNo);
			  $.ajax({
				   url:"<c:url value="/pack/schedule/join.do"/>",
				   data:{"packScheduleNo":packScheduleNo,"userId":'${sessionScope.userId}'},
				   dataType:"text",
				   type:'post',
				   success:function(data){
					   console.log(data);
				   },
				   error:function(error){
					   console.log('에러:'+error.responseText);
				   }
			  })
		 })
		 
		 //일정수정 모달창 닫기 버튼 클릭
		 $('#btnPackScheduleUpdateClose').click(function(){
			 console.log('팩모달수정 닫기 클릭')
		 	 $('#packSchedulUpdateModal').modal('hide');
		 })
      
      
      
      
      
      
   })
   
    

   
</script>