<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/packInfoEdit.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
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

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/locales-all.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.5.0/main.min.css,npm/fullcalendar@5.5.0/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css">

<!-- 데이트 피커 -->
<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>



<style>

  body {
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  
  .fc-event-title-container{
  	text-align: center;
  	background-color: black;
  }

</style>

<div id="colorlib-page">
	<div id="colorlib-main">
		
		<div class="row">
			<div class="col-lg-12">
				<div class="section-tittle text-center mb-80 col-lg-12" >
					<h1 style="margin-top: 30px;">Shoong <small>팩 일정</small></h1>
				</div>
					
			</div>
		</div>
		<hr>
		<div id="calendar"></div>
		
		
		
		

		

	</div>
	<!-- END COLORLIB-MAIN -->
</div>
<!-- END COLORLIB-PAGE -->

<!-- 팩 일정 등록 모달창 시작 -->
<div class="modal fade" id="packScheduleInsertModal" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"style="margin: 5px;">팩일정 등록</h4>
			</div>

			<div class="modal-body">
				<form action="<c:url value="/pack/schedule/insert.do"/>" class="bg-light p-5 contact-form" id="packSchedule" method="post">
					<label for="packScheduleTitle">일정 제목</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packScheduleTitle" id="packScheduleTitle">
					</div>

					<label for="startDatePicker">시작 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleStart" id="startDatePicker" class="form-control" value="">
					</div>
					
					<label for="endDatePicker">끝 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleEnd" id="endDatePicker" class="form-control" value="">
					</div>
					
					<label for="packScheduleContent">일정 내용</label>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"  name="packScheduleContent" id="packScheduleContent"></textarea>
					</div>
					
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackSchedule">등록</button>
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackScheduleClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 등록 모달창 끝 -->

<!-- 팩 일정 상세보기 모달창 시작 -->
<div class="modal fade" id="packScheduleViewModal" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"style="margin: 5px;">팩일정 상세보기</h4>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="col-md-2">제목</div>
					<div class="col-md-10" id="packScheduleViewTitle" value=""></div>
				</div>
				<div class="row">
					<div class="col-md-2">글쓴이</div>
					<div class="col-md-10" id="packScheduleViewWriter" value=""></div>
				</div>
				<div class="row">
					<div class="col-md-2">시작 날짜</div>
					<div class="col-md-10" id="packScheduleViewStart" value=""></div>
				</div>
				<div class="row">
					<div class="col-md-2">끝 날짜</div>
					<div class="col-md-10" id="packScheduleViewEnd" value=""></div>
				</div>
				<div class="row">
					<div class="col-md-2">글 내용</div>
					<div class="col-md-10" id="packScheduleViewContent" value=""></div>
				</div>
				<div class="row">
					<div style="display:none;" id="packScheduleViewNo" value=""></div>
				</div>
				
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackScheduleUpdate">수정</button>
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackScheduleDelete">삭제</button>
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackScheduleJoin">참가</button>
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackScheduleClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 상세보기 모달창 끝 -->



<!-- 팩 일정 수정 모달창 시작 -->
<div class="modal fade" id="packSchedulUpdateModal" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"style="margin: 5px;">팩일정 수정</h4>
			</div>

			<div class="modal-body">
				<form action="<c:url value="/pack/schedule/update.do"/>" class="bg-light p-5 contact-form" id="packScheduleUpdate" method="post">
					<label for="packScheduleTitleUpdate">일정 제목</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packScheduleTitle" id="packScheduleTitleUpdate">
					</div>

					<label for="startDatePickerUpdate">시작 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleStart" id="startDatePickerUpdate" class="form-control" value="">
					</div>
					
					<label for="endDatePickerUpdate">끝 날짜</label>
					<div class="form-group">
						<input type="text" name="packScheduleEnd" id="endDatePickerUpdate" class="form-control" value="">
					</div>
					
					<label for="packScheduleContentUpdate">일정 내용</label>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"  name="packScheduleContent" id="packScheduleContentUpdate"></textarea>
						<input type="hidden" class="form-control" name="packScheduleNo" id="packScheduleNoUpdate"/>
					</div>
					
					
					
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackScheduleUpdateOk">수정</button>
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnPackScheduleUpdateClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 수정 모달창 끝 -->

<!-- 팩 일정 삭제 모달창 시작 -->
<div class="modal fade" id="packScheduelDeleteModal" data-backdrop = "false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">팩일정 삭제</h4>
			</div>

			<div class="modal-body">
				<h3 class="text-center">정말로 삭제하시겠습니까?</h3>	
				<form action="<c:url value="/pack/schedule/delete.do"/>" class="bg-light p-5 contact-form" id="packScheduleDeleteForm" style="display: none;">
					<div class="form-group">
						<input type="hidden" class="form-control" name="packScheduleNo" id="packScheduleDeleteNo" value="">
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnScheduleDeleteOk">삭제</button>
				<button type="button" class="btn btn-info" data-dismiss="modal" id="btnScheduleDeleteClose">닫기</button>
				
			</div>
		</div>
	</div>
</div>
<!-- 팩 일정 삭제 모달창 끝 -->



<script>

	document.addEventListener('DOMContentLoaded', function() {
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
			$('#startDatePicker').attr('value',info.dateStr);
	
		});
		
		calendar.on('eventClick',function(info){
			console.log('이벤트 클릭');
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
					$('#packScheduleViewTitle').text(data.title);
					$('#packScheduleViewWriter').text(data.userId);
					$('#packScheduleViewStart').text(data.start);
					$('#packScheduleViewEnd').text(data.end);
					$('#packScheduleViewContent').text(data.content);
					$('#packScheduleViewNo').text(data.packScheduleNo);
					
					
					if(data.isWriter == 'yes'){
						$('#btnPackScheduleJoin').css('display','none');	
					}
					else{
						$('#btnPackScheduleUpdate').css('display','none');
						$('#btnPackScheduleDelete').css('display','none');
					}
					
					$('#packScheduleViewModal').modal();
				},
				error : function(request, error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
					console.log('에러 : ', error.responseText);
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			});
		})
	
		calendar.render();
	});
	
	 
	$('#startDatePicker, #endDatePicker').datepicker({
		format: "yyyy-mm-dd",
		startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    language : "ko",
	    todayHighlight: true//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		})//여기까지가 기본 사용 방법
	$('#startDatePicker','#endDatePicker').on("changeDate",function(e){
		console.log('들어옴');
	})
	
	$('#btnPackSchedule').click(function(){
		$('#packSchedule').submit();
	});
	
	$('#btnPackScheduleClose').click(function(){
		$('#endDatePicker').prop('value',"");
	});
	
	$('#btnPackScheduleUpdate').click(function(){
		$('#packScheduleTitleUpdate').prop('value',$('#packScheduleViewTitle').text());
		$('#startDatePickerUpdate').prop('value',$('#packScheduleViewStart').text());
		$('#endDatePickerUpdate').prop('value',$('#packScheduleViewEnd').text());
		$('#packScheduleContentUpdate').prop('value',$('#packScheduleViewContent').text());
		$('#packScheduleNoUpdate').prop('value',$('#packScheduleViewNo').text());
		
		$('#startDatePickerUpdate, #endDatePickerUpdate').datepicker({
			format: "yyyy-mm-dd",
			startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    language : "ko"
		});
		
		$('#packSchedulUpdateModal').modal();
	});
	
	$('#btnPackScheduleUpdateOk').click(function(){
		console.log('수정버튼 들어옴');
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
	
	
</script>