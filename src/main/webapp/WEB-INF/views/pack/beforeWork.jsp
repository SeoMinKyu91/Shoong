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
<div class="modal fade" id="packScheduleModal" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"style="margin: 5px;">공지사항 등록</h4>
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
			$('#packScheduleModal').modal();
			$('#startDatePicker').attr('value',info.dateStr);
	
		});
		
		calendar.on('eventClick',function(){
			console.log('이벤트 클릭');
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
	})
	
	$('#btnPackScheduleClose').click(function(){
		$('#endDatePicker').prop('value',"");
	})
	

</script>