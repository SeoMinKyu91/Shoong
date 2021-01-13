<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
.introbox div{
	margin-top: 10px; 
}
.form-text{
	font-size:16px;
}
.form-margin{
	margin-top:23px;
}
.packThumbnailModal img{
	border-radius: 40px;
	width: 60px;
	height: 60px
}
</style>

<div id="colorlib-main">

	<div class="row">
		<div class="col-lg-12">
			<div
				class="section-tittle text-center mb-80 col-lg-12">
				<h1 style="margin-top: 30px;">
					Shoong <small>팩 정보 수정</small>
				</h1>
			</div>

		</div>
	</div>
	<hr>

	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div
				class="offset-md-2 col-md-7 col-lg-offset-2 col-lg-7">
				<div class="row">
					<div class="offset-md-1 col-md-2 col-xs-3">
						<img
							style="width: 80px; height: 80px; border-radius: 40px;"
							src="<c:url value="/images/pack/${packInfo.PACK_THUMBNAIL }"/>"
							alt="팩 마크" id="packThumbnailProfile">
					</div>
					<div class="col-md-8 col-xs-9">
						<div class="row">
							<div class="col-md-12">
								<h3 style="margin-top: 10px;">${packInfo.PACK_NAME }</h3>
							</div>
							<div class="col-md-12">
								<button
									style="color: #0095f6; border: none; background-color: white;"
									id="btnThumbnail">Change Pack Profile Photo</button>
							</div>
						</div>
					</div>
				</div>

				<form class="form-horizontal"
					action="<c:url value='/pack/infoEditOk.do'/>"
					method="post" onsubmit="return formSubmit()"
					style="margin-top: 30px;">
					<div class="form-group form-text">
						<label for="packName"
							class="col-xs-2 control-label">팩
							이름</label>
						<div class="col-xs-9">
							<input type="text" id="packName"
								name="packName" class="form-control"
								value="${packInfo.PACK_NAME }">
						</div>
						<a id="packnameCheck"
							class="col-xs-1 btn form-group">중복체크</a>
					</div>
					<div
						class="form-group form-text form-margin form-text">
						<label for="packTag"
							class="col-xs-2 control-label">팩 태그</label>
						<div class="col-xs-9">
							<input type="text" id="packTag"
								name="packTag" class="form-control"
								value="${packInfo.PACK_TAG }">
							<input type="hidden" id="packActTimeHidden"
								value="${packInfo.PACK_ACT_TIME }">
						</div>

					</div>

					<div class="form-group form-margin"
						style="font-size: 12px;">
						<label class="col-xs-2 control-label"
							style="font-size: 14px;">팩 활동시간</label> <label
							class="radio-inline"> <input
								type="radio" name='packActTime'
								value='주 1회' id="radio1" />주 1회
						</label> <label class="radio-inline"> <input
								type="radio" name='packActTime'
								value='주 2~3회' id="radio2" />주 2~3회
						</label> <label class="radio-inline"> <input
								type="radio" name='packActTime'
								value='주 4회 이상' id="radio3" />주 4회 이상
						</label>
					</div>


					<div class="form-group form-margin">
						<label class="col-xs-2 control-label"
							style="font-size: 14px;">팩 평균 연령</label> <label
							class="radio-inline"> <input
								type="radio" name='packActAge' value='청소년' />청소년
						</label> <label class="radio-inline"> <input
								type="radio" name='packActAge' value='20대' />20대
						</label> <label class="radio-inline"> <input
								type="radio" name='packActAge' value='30대' />30대
						</label> <label class="radio-inline"> <input
								type="radio" name='packActAge' value='40대' />40대
						</label> <label class="radio-inline"> <input
								type="radio" name='packActAge'
								value='50대 이상' />50대 이상
						</label> <label class="radio-inline"> <input
								type="radio" name='packActAge'
								value='전 연령대' />전 연령대
						</label>
					</div>

					<div class="form-group form-margin">
						<label class="col-xs-2 control-label">팩
							소개</label>
						<div class="col-xs-9">
							<textarea id="packIntro" name="packIntro"
								style="width: 100%; height: 150px; padding: 10px;">${packInfo.PACK_INTRO }</textarea>
						</div>
					</div>

					<div class="form-group">
						<input type="hidden" id="packThumbnail"
							value="Pack1.png" name="packThumbnail"
							class="form-group" />
					</div>

					<div class="form-group">
						<div class="col-xs-offset-2 col-xs-9">
							<button id="btnPackInfoSubmit"
								type="submit" class="btn btn-default">수정</button>
						</div>
					</div>


				</form>

			</div>
		</div>
	</div>
	<!-- 팩 썸네일 모달창 시작 -->
	<div class="modal fade" id="thumbnailModal"
		data-backdrop="false">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-body">
					<!-- /////////////////////////   나중에 여기 팩뱃지로 바꿔야함      //////////////////////////////// -->
					<div class="row packThumbnailModal">
						<div class="col-md-2 col-xs-3">
							<img
								src="<c:url value="/images/pack/Pack1.png"/>"
								alt="팩 마크" id="Pack1.png">
						</div>
						<div class="col-md-2 col-xs-3">
							<img
								src="<c:url value="/images/pack/Pack2.png"/>"
								alt="팩 마크" id="Pack2.png">
						</div>
						<div class="col-md-2 col-xs-3">
							<img
								src="<c:url value="/images/pack/Pack3.png"/>"
								alt="팩 마크" id="Pack3.png">
						</div>
						<div class="col-md-2 col-xs-3">
							<img
								src="<c:url value="/images/pack/Pack4.png"/>"
								alt="팩 마크" id="Pack4.png">
						</div>
						<div class="col-md-2 col-xs-3">
							<img
								src="<c:url value="/images/pack/Pack5.png"/>"
								alt="팩 마크" id="Pack5.png">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn text-right"
						data-dismiss="modal" id="btnPackThumbnailOk">선택</button>
					<button type="button"
						class="btn btn-info text-right"
						data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 팩 썸네일 모달창 끝 -->
</div>
<!-- END COLORLIB-MAIN -->

<script>

	$(function() {
		
		$(':radio[name="packActTime"]:input[value="${packInfo.PACK_ACT_TIME}"]').prop("checked",true);
		$(':radio[name="packActAge"]:input[value="${packInfo.PACK_ACT_AGE}"]').prop("checked",true);		
		
		$('#btnThumbnail').click(function(){
			$('#thumbnailModal').modal();
			thumbnailCssReset();
		})
		

	});
</script>
<script>

	var duplicationCheck = false;
	function formSubmit() {
		console.log("유효성검사");
		//유효성 체크
		var packName = $('#packName').val()
		var packTag = $('#packTag').val()
		var packIntro = $('#packIntro').val()
		//팩 이름
		if (packName.length == 0) {
			alert('팩 이름을 입력해주세요.')
			return false;
		}
		//팩 태그
		if (packTag.length == 0) {
			alert('팩 태그를 입력해주세요')
			return false;
		}
		//팩 타임
		if (!$('input:radio[name=packActTime]').is(':checked')) {
			alert('팩 활동 시간을 체크해주세요')
			return false;
		}
		//팩 연령
		if (!$('input:radio[name=packActAge]').is(':checked')) {
			alert('팩 활동 연령을 체크해주세요')
			return false;
		}
		//팩 소개
		if (packIntro.length == 0) {
			alert('팩 소개를 입력해주세요')
			return false;
		}
		if (!duplicationCheck) {
			alert('팩 이름 중복 체크를 해주세요.')
			return false;
		}
	}

	$("#packnameCheck").click(function() {
		var packName = $('#packName').val()
		if (packName.length < 2) {
			alert('팩이름을 두 글자 이상 입력해주세요.')
			return;
		}

		$.ajax({
			url : "<c:url value="/pack/checkPackName.do"/>",//요청할 서버의 URL주소
			type : 'post',//데이타 전송방식(디폴트는 get방식) 
			dataType : 'text',//서버로 부터 응답 받을 데이타의 형식 설정
			data : "ckpackName=" + packName,
			success : function(data) {
				if(${packInfo.NAME==packName}){
					alert("사용 할 수 있는 팩이름입니다.");
					duplicationCheck =true;
				}
				else if (data == 'Y') {
					alert("사용 할 수 있는 팩이름입니다.");
					duplicationCheck = true;
				} 
				else {
					alert("사용 할 수 없는 팩이름입니다.");
					duplicationCheck = false;
				}
			},
			error : function(error) {//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
				console.log('에러 : ', error.responseText);
			}

		});

	})
	
	var packThumbnail="";
	
	$('.packThumbnailModal img').click(function(){
		packThumbnail = $(this).attr('id');
		thumbnailCssReset();
	 	$(this).css('border','4px solid red'); 	
		
	})
	
	$('#btnPackThumbnailOk').click(function(){
		console.log('확인버튼 눌러짐');
		console.log(packThumbnail);
		$('#packThumbnail').prop("value",packThumbnail);
		$('#packThumbnailProfile').attr("src","<c:url value='/images/pack/"+packThumbnail+"'/>");
	})
	
	function thumbnailCssReset(){
		$(".packThumbnailModal img").css('border','none');
		
	}
		
	
</script>
