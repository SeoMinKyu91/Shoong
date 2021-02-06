<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
	.cus {
		border-top: 1px solid white;
		border-bottom: 1px solid white;
	}
	.cus th {
		border-top: 1px solid white;
		border-bottom: 1px solid white;
		background-color : #ff8827;
		color:white;
		font-size:1em;
	}
	.cus td {
		cursor: pointer;
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
	.submitBtn {
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
	.closeBtn{
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
	.insertBtn{
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
	#packNoticeForm{
		background-color: white;
		border : #ff8827 1px solid;
		border-radius: 10px;
	}
	
	#packNoticeEditForm{
		background-color: white;
		border : #ff8827 1px solid;
		border-radius: 10px;
	}
	.deleteBtn{
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
	.editBtn{
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
	.viewBtn{
		color:white;
		background-color: #ff8827;
		font-weight: bold;
		border: none;
	}
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
    .animated-text{
		display:none;
	}
	.slider-area{
		display:none;
	}
	
	body{
		background-color: #F9F9F9;
	}
</style>


<!-- 팩 공지사항 등록 모달창 시작 -->
<div class="modal fade" id="noticeWrite" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"style="margin: 5px;">공지사항 등록</h4>
			</div>

			<div class="modal-body">
				<form action="" class="bg-light p-5 contact-form" id="packNoticeForm">
					<label for="packNoticeTitle" style="float: left;">글 제목</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packNoticeTitle"
							id="packNoticeTitle">
					</div>

					<label for="packNoticeContent" style="float: left;">공지사항 내용</label>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control"  name="packNoticeContent" id="packNoticeContent"></textarea>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="insertBtn btn" data-dismiss="modal" id="btnWriteOk">등록</button>
				<button type="button" class="insertBtn btn" data-dismiss="modal" id="btnNoticeWriteClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 공지사항 등록 모달창 끝 -->

<!-- 팩 공지사항 수정 모달창 시작 -->
<div class="modal fade" id="noticeEdit" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"style="margin: 5px;">공지사항 수정</h4>
			</div>

			<div class="modal-body">
				<form action="" class="bg-light p-5 contact-form" id="packNoticeEditForm">
					<label for="packNoticeTitle" style="float: left;">글 제목</label>
					<div class="form-group">
						<input type="text" class="form-control" name="packNoticeTitle"
							id="packNoticeEditTitle" value="">
					</div>

					<label for="packNoticeContent" style="float: left;">공지사항 내용</label>
					<div class="form-group">
						<textarea cols="30" rows="7" class="form-control" id="packNoticeEditContent" name="packNoticeContent" value=""></textarea>
					</div>
					
					<div class="form-group">
						<input type="hidden" class="form-control" name="packNoticeNo" id="packNoticeEditNo" value="">
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" name="nowPage"  value="${nowPage}">
					</div>

				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="editBtn btn" data-dismiss="modal" id="btnNoticeEditOk">수정</button>
				<button type="button" class="editBtn btn" data-dismiss="modal" id="btnNoticeEditClose">닫기</button>
				
			</div>
		</div>
	</div>
</div>
<!-- 팩 공지사항 수정 모달창 끝 -->

<!-- 팩 공지사항 삭제 모달창 시작 -->
<div class="modal fade" id="noticeDelete" data-backdrop = "false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">공지사항 삭제</h4>
			</div>
			<div class="modal-body">
				<h4 class="text-center">정말로 삭제하시겠습니까?</h4>	
				<form action="" class="bg-light p-5 contact-form" id="packNoticeDeleteForm" style="display: none;">
					<div class="form-group">
						<input type="hidden" class="form-control" name="packNoticeNo" id="packNoticeDeleteNo" value="">
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="deleteBtn btn" data-dismiss="modal" id="btnNoticeDeleteOk">삭제</button>
				<button type="button" class="deleteBtn btn" data-dismiss="modal" id="btnNoticeDeleteClose">닫기</button>
				
			</div>
		</div>
	</div>
</div>
<!-- 팩 공지사항 삭제 모달창 끝 -->

<!-- 팩 공지사항 상세보기 모달창 시작 -->
<div class="modal fade" id="noticeView" data-backdrop="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div id="mdNo">
					
				</div>
				<div id="mdUserID">
				
				</div>
				<div id="mdTitle">
				
				</div>
				<div id="mdPostdate">
				
				</div>
			</div>

			<div class="modal-body" style="height: 400px;">
				<div class="row" style="margin: 10px;">
					<div id="mdContent">
						
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<c:if test="${!empty manager }">
					<button class="viewBtn btn" data-toggle="modal" id="btnNoticeEdit">수정</button>
					<button class="viewBtn btn" data-toggle="modal" id="btnNoticeDelete">삭제</button>
					
				</c:if>
			
				<button type="button" class="closeBtn btn" data-dismiss="modal" id="btnNoticeViewClose">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 팩 공지사항 상세보기 모달창 끝 -->
<div style="border-radius: 10px;box-shadow: 0px 0px 5px #787878;padding: 30px;background-color: white;">
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
		<div class="col-md-12">
			<table class="table table-hover cus">
				<tr>
					<th class="text-center col-lg-2 col-xs-2">번호</th>
					<th class="text-center col-lg-6 col-xs-5">제목</th>
					<th class="text-center col-lg-2 col-xs-2">작성자</th>
					<th class="text-center col-lg-2 col-xs-3">작성일</th>
				</tr>
				<c:if test="${empty list }" var="isEmpty">
					<tr class="text-center">
						<td colspan="4" class="test-center">등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				<c:if test="${!isEmpty}">
					<c:forEach var="item" items="${list }" varStatus="loop">
						<tr class="text-center">
							<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
							<td class="text-left">${item.packNoticeTitle}</td>
							<td>${item.userName}</td>
							<td>${item.packNoticeDate}</td>
							<td style="display: none;">${item.packNoticeContent }</td>
							<td style="display: none;">${item.packNoticeNo }</td>
						</tr>
					</c:forEach>
				</c:if>	
			</table>
		</div>
	</div>
	<c:if test="${!empty manager }">
		<div class="row">
			<div class="col-lg-12 text-right">
				<button class="submitBtn btn" data-toggle="modal" id="btnNoticeWrite">등록</button>

			</div>
		</div>
	</c:if>
	<div class="row">
		<div class="col-lg-12 text-center">${pagingString }</div>
	</div>
</div>
<!-- END COLORLIB-MAIN -->

<script>
	$(function() {
		$('#btnNoticeWrite').on('click', function(e) {
			console.log('버튼 클릭');
			$('#noticeWrite').modal('show');
		})
		

		$('#btnNoticeWriteClose').on('click', function() {
			$('#noticeWrite').modal('hide');
		})
		
		
		$('#btnWriteOk').click(function() {
			console.log("등록하기 버튼 클릭");
			if ($('#packNoticeTitle').val() == "") {
				$('#packNoticeTitle').focus();
				return;
			} else if ($('#packNoticeContent').val() == "") {
				$('#packNoticeContent').focus();
				return;
			}
			//form태그의 action속성 및 method속성 설정
			$('#packNoticeForm').prop({
				action : '<c:url value="/pack/notice/write.do"/>',
				method : 'post'
			});
			//폼객체의 submit()함수로 서버로 전송
			$('#packNoticeForm').submit();
		});
		
		
		var no = "";
		var title = "";
		var user = "";
		var postdate = "";
		var content = "";
		var packNoticeNo = ""
		
		//테이블 클릭시 모달창 띄우기
		//공지사항 상세보기  속성값 설정 해주기
		$(".cus tr").click(function(){
			console.log('테이블 a태그 클릭');
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
		});
		
		
		
		//공지사항 상세보기 모달 내용 삭제
		$("#btnNoticeViewClose").click(function(){
			modalContentDelete();
		})
		
		//공지사항 수정 모달
		$('#btnNoticeEdit').click(function(){
			console.log("수정 모달창 들어옴");
			console.log("팩수정 모달창 packNoticeNo:"+packNoticeNo)
			$("#packNoticeEditNo").attr("value",packNoticeNo);
			$("#packNoticeEditContent").append(content);
			$("#packNoticeEditTitle").attr("value",title);
			
			$('#noticeView').modal('hide');
			modalContentDelete();
			$('#noticeEdit').modal('show');
		})
		
		//공지사항 수정 닫기 모달
		$('#btnNoticeEditClose').click(function(){
			$("#packNoticeEditContent").text("");
		})
		
		
		//공지사항 수정 완료
		$('#btnNoticeEditOk').click(function() {
			console.log("수정하기 버튼 클릭");
			if ($('#packNoticeEditTitle').val() == "") {
				$('#packNoticeEditTitle').focus();
				return;
			} else if ($('#packNoticeEditContent').val() == "") {
				$('#packNoticeEditContent').focus();
				return;
			}
			//form태그의 action속성 및 method속성 설정
			$('#packNoticeEditForm').prop({
				action : '<c:url value="/pack/notice/Edit.do"/>',
				method : 'post'
			});
			//폼객체의 submit()함수로 서버로 전송
			$('#packNoticeEditForm').submit();
		});
		
		
		//공지사항 삭제하기
		

		$('#btnNoticeDelete').on('click', function(e) {
			console.log('버튼 클릭');
			console.log(packNoticeNo);
			
			$('#packNoticeDeleteNo').attr("value",packNoticeNo);
			
			$('#noticeView').modal('hide');
			$('#noticeDelete').modal('show');

		})

		$('#btnNoticeDeleteClose').on('click', function() {
			$('#noticeDelete').modal('hide');
			modalContentDelete();
		})
		
		
		$('#btnNoticeDeleteOk').click(function() {
			console.log("삭제하기 버튼 클릭");
			console.log($('#packNoticeDeleteNo').val())
			
			
			//form태그의 action속성 및 method속성 설정
			$('#packNoticeDeleteForm').prop({
				action : '<c:url value="/pack/notice/delete.do"/>',
				method : 'post'
			});
			//폼객체의 submit()함수로 서버로 전송
			$('#packNoticeDeleteForm').submit();
		});
		
		//공지사항 상세보기 모달내용 삭제 함수
		function modalContentDelete(){
			console.log("모달 닫기 클릭");
			attrDelete();
			
			
			$("#mdNo").text("");
			$("#mdUserID").text("");
			$("#mdTitle").text("");
			$("#mdPostdate").text("");
			$("#mdContent").text("");
		}
		
		function attrDelete(){
			no = "";
			title = "";
			user = "";
			postdate = "";
			content ="";
			packNoticeNo ="";
		}
		
	});
</script>    