<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	a:link { 
		color: #ff8827; 
		font-weight:bold;
	}
	a:visted { color: black; }
	
	.surak a:link { color:blue; }
	.gujul a:link { color:red; }

	.custom-border{
		border-radius: 8px;
		background-color: #F5F5F5;
		font-size: 16px;
		text-align: center;
		
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
	.custom-border div{
		margin: 10px 0px 10px 0px;
		
	}
	.custom-border:nth-child(2n+1){
		background-color: white;
	}
	.custom-border:hover{
		background-color: #f7e7da;
		
	}
	.custom-border:nth-child(1):hover{
		background-color: white;
	}
	.introbox div{
		padding-top: 10px; 
	}
	.introEdit:hover {
		cursor: pointer;
	}
	
</style>

<div id="colorlib-main" style="padding:20px">
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
			<p style="padding-top:14px;padding-left:10px;color:black;font-weight: bold;font-size:1.7em;text-align: center">${packInfo.PACK_NAME}</p>
			<hr style="background-color: black;height:1px"/>
		</div>
	</div>
	<div class="container" style="padding-top: 30px;">
		<div class="row">
			<div
				class="offset-md-2 col-md-8 col-lg-offset-2 col-lg-8">
				<div class="row">
					<div class="col-md-4">
						<img
							style="width: 100%; height: 100%; border-radius: 40px;"
							src="<c:url value="/images/pack/${packInfo.PACK_THUMBNAIL }"/>"
							alt="팩 마크">
					</div>
					<div class="col-lg-7 introbox"
						style="margin-left: 30px;">
						<div class="row">
							<div class="col-lg-11 col-xs-11">
								<h2 style="font-weight: bold;">${packInfo.PACK_NAME}</h2>
							</div>
							<div class="col-lg-1 col-xs-1">
								<a href='<c:url value="/pack/infoEdit.do?packId=${sessionScope.packId }"/>'
									class="introEdit">
									<span class="glyphicon glyphicon-edit"
										aria-hidden="true" style="color:black;"></span>
								</a>
							</div>
						</div>
						<div class="row">
							<p class="col-lg-4">#${packInfo.PACK_ACT_REGION
								}</p>
							<p class="col-lg-3">#${packInfo.PACK_ACT_TIME
								}</p>
							<p class="col-lg-3">#${packInfo.PACK_ACT_AGE
								}</p>
						</div>
						<div class="row" style="margin-top: 0px;">
							<p class="col-lg-10">${packInfo.PACK_TAG }</p>
						</div>
						<div class="row">
							<p class="col-lg-10" style="font-size: 15px; line-height: 2.0;">${packInfo.PACK_INTRO}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="padding-top: 40px;">
		<div class="row">
			<div
				class="offset-md-2 col-md-8 col-lg-offset-2 col-lg-8">
				<hr>
			</div>
		</div>

		<div class="row">
			<div
				class="offset-md-2 col-md-8 col-lg-offset-2 col-lg-8">
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul
						class="nav nav-pills justify-content-center"
						role="tablist">
						<li role="presentation" class="active" id="JoinMem">
							<a href="#home" aria-controls="home"
								role="tab" data-toggle="tab">팩 가입신청 목록</a>
						</li>
						<li role="presentation" id="JoinMem"><a
								href="#profile" aria-controls="profile"
								role="tab" data-toggle="tab">팩 가입자 목록</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content"
						style="margin-top: 10px;">
						<div role="tabpanel" class="tab-pane active"
							id="home">
							<c:if test="${empty packJoinList }"
								var="noPackJoinList">
								<div class="row custom-border">
									<div
										class="col-lg-12 col-xs-12 text-center custom-border"
										style="background-color: #F5F5F5;">
										<div>가입 신청자가 없습니다</div>
									</div>
								</div>
							</c:if>

							<c:if test="${!noPackJoinList }">
								<div class="row custom-border"
									style="font-size: 14px; background-color:#ff8827;color:white;">
									<div class="col-lg-2 col-xs-2" style="font-weight:bold;">이름</div>
									<div class="col-lg-2 col-xs-2" style="font-weight:bold;">나이</div>
									<div class="col-lg-3 col-xs-5" style="font-weight:bold;">가입
										신청일</div>
									<div class="col-lg-3 col-xs-2" style="font-weight:bold;">활동량</div>
								</div>
								<c:forEach var="list"
									items="${packJoinList}">
									<div class="row custom-border joinList">
										<div class="col-lg-2 col-xs-2">${list.NAME}</div>
										<div class="col-lg-2 col-xs-1">${list.AGE}</div>
										<div class="col-lg-3 col-xs-3">${list.PACK_JOIN_DATE}</div>
										<div class="col-lg-3 col-xs-4">${list.FREQUENCY}</div>
										<div class="col-lg-1 col-xs-1 surak">
											<a
												href="<c:url value="/pack/joinOk.do?packJoinNo=${list.PACK_JOIN_NO}&packID=${list.PACK_ID }&userID=${list.USER_ID }"/>">
												<span class="glyphicon glyphicon-ok"
													aria-hidden="true"></span>
											</a>
										</div>
										<div class="col-lg-1 col-xs-1 gujul">
											<a
												href="<c:url value="/pack/joinNo.do?packJoinNo=${list.PACK_JOIN_NO}"/>">
												<span
													class="glyphicon glyphicon-remove"
													aria-hidden="true"></span>
											</a>
										</div>
									</div>

								</c:forEach>
							</c:if>

						</div>

						<div role="tabpanel" class="tab-pane"
							id="profile">
							<div class="row custom-border"
								style="font-size: 14px; background-color:#fad1af;">
								<div class="col-lg-3 col-xs-2" style="font-weight:bold;">이름</div>
								<div class="col-lg-2 col-xs-2" style="font-weight:bold;">나이</div>
								<div class="col-lg-3 col-xs-5" style="font-weight:bold;">최근
									접속일</div>
								<div class="col-lg-3 col-xs-2" style="font-weight:bold;">직책</div>
							</div>



							<c:forEach var="memberList"
								items="${packMemberList }">
								<div class="row custom-border" name="test">
									<div class="col-lg-3 col-xs-2">${memberList.NAME }</div>
									<div class="col-lg-2 col-xs-2">30</div>
									<div class="col-lg-3 col-xs-5">${memberList.LASTCONNECT }</div>
									<div class="col-lg-3 col-xs-2">${memberList.AUTHORITY }</div>
									<div class="col-lg-1 col-xs-1 gujul">
										<a
											href="<c:url value="/pack/member/delete.do?packJoinNo=${memberList.PACK_JOIN_NO}"/>&userID=${memberList.USER_ID}">
											<span
												class="glyphicon glyphicon-remove removeMember"
												aria-hidden="true" style="color: red;"></span>
										</a>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END COLORLIB-MAIN -->

<!-- 팩 정보수정 모달창 시작 -->
<div class="modal fade" id="packIntroEdit" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-body">
				<form action="#" class="bg-light p-5 contact-form" method="post"
					enctype="multipart/form-data">
					<label for="packName">팩 이름</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packName"
							id="packName">
					</div>

					<label for="packName">팩 연령대</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packName"
							id="packName">
					</div>

					<label for="packIntro">팩 소개글</label>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control" id="packIntro"
							name="packIntro"></textarea>
					</div>
				</form>
				<button type="button" class="btn btn-primary" data-dismiss="modal">수정</button>
				<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- 팩 정보수정 모달창 끝 -->
<script>
	$(function() {
		/*
		$(".introEdit").click(function(){
			console.log('팩정보수정 클릭');
			$.ajax({
				url:"<c:url value="/pack/manager/info/Edit.do"/>",//요청할 서버의 URL주소
				type:'post',//데이타 전송방식(디폴트는 get방식) 
				dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
				data: "packId="+${sessionScope.packId},
				success:function(data){
					console.log('성공 메소드 실행');
				
				},
				error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
					console.log('에러 : ',error.responseText);
				}
				
				});
		})
		*/
		
		$("#profile").click(function(){
			console.log('됩니다');
		})
		
		$("#home").click(function(){
			console.log('됩니다');
		})
		
		
		$(" a:first").click(function(){
			console.log('맴버리스트 첫번째 a태그');
			
			/*
			no = $(this).children().eq(0).text();
			title = $(this).children().eq(1).text();
			user = $(this).children().eq(2).text();
			postdate = $(this).children().eq(3).text();
			content = $(this).children().eq(4).text();
			packNoticeNo = $(this).children().eq(5).text();
			
			
			$("#mdNo").append("글 번호: " + no);
			$("#mdUserID").append("작성자 : " + user);
			$("#mdTitle").append("제목 : " + title);
			$("#mdPostdate").append("작성일 : " + postdate);
			$("#mdContent").append(""+content);
			
			$('#noticeView').modal('show');
			*/
		});
		
		$(".test a:last").click(function(){
			console.log('맴버리스트 두번쨰 a태그');
			
			/*
			no = $(this).children().eq(0).text();
			title = $(this).children().eq(1).text();
			user = $(this).children().eq(2).text();
			postdate = $(this).children().eq(3).text();
			content = $(this).children().eq(4).text();
			packNoticeNo = $(this).children().eq(5).text();
			
			
			$("#mdNo").append("글 번호: " + no);
			$("#mdUserID").append("작성자 : " + user);
			$("#mdTitle").append("제목 : " + title);
			$("#mdPostdate").append("작성일 : " + postdate);
			$("#mdContent").append(""+content);
			
			$('#noticeView').modal('show');
			*/
		});
	});
</script>
