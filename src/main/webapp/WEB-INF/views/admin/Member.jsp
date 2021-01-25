<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<style>
th, td{
	text-align: center;
}

</style>



<!-- class="right_col 이 DiV안에서 작업하지 않으면 깨져요. -->
<div class="right_col" role="main">

        <div class="col-xs-12">

                <div class="x_panel">
                  <div class="x_title">
                    <h2>MEMBER <small>회원 관리</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content">

                    <div class="table-responsive">
                    <div class="title_right form-inline float-right">
                    	<form name="form1" method="post" action="<c:url value="/admin/member/search.do"/>">
                    		<select class="form-control " name="searchType">
			                   <option value="id" <c:out value="${searchType eq 'id' ? 'selected' : ''}"/>>아이디</option>
			                   <option value="name" <c:out value="${searchType eq 'name' ? 'selected' : ''}"/>>이름</option>
			                   <option value="age" <c:out value="${searchType eq 'age' ? 'selected' : ''}"/>>나이</option>
			                   <option value="gender" <c:out value="${searchType eq 'gender' ? 'selected' : ''}"/>>성별</option>
			                   <option value="addr" <c:out value="${searchType eq 'addr' ? 'selected' : ''}"/>>주소</option>
			                   <option value="tel" <c:out value="${searchType eq 'tel' ? 'selected' : ''}"/>>전화번호</option>
			               </select>
                    	<input class="form-control" name="keyword" value="${keyword}" placeholder="Search for...">
                    	<input class="btn btn-default" type="submit" value="search">
                    	
                    	
                    	</form>
                    
                    </div>
		              
		              <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th class="column-title">NO </th>
                            <th class="column-title">USER ID</th>
                            <th class="column-title">NAME </th>
                            <th class="column-title">AGE </th>
                            <th class="column-title">GENDER </th>
                            <th class="column-title">ADDRESS </th>
                            <th class="column-title">TEL </th>
                            <th class="column-title">회원 삭제 </th>
                          </tr>
                        </thead>


                        <tbody>
                        
                        <c:forEach var="member" items="${memberList}" varStatus="status">
                        
                          <tr class="even pointer">
                            <td class="col-md-1">${status.count}</td>
                            <td class=""><a href="#" data-toggle="modal" data-target="#layerpop" data-user_id="${member.USER_ID}" data-name="${member.NAME}" data-age="${member.AGE}" 
                            data-gender="${member.GENDER}" data-addr="${member.ADDRESS}" data-tel="${member.USERTEL}">${member.USER_ID}</a></td>
                            <td class="">${member.NAME}</td>
                            <td class=" ">${member.AGE}</td>
                            <td class=" ">${member.GENDER}</td>
                            <td class=" ">${member.ADDRESS}</td>
                            <td class="a-right a-right ">${member.USERTEL}</td>
                            <td class=" "><button type="button" class="btn btn-xs btn-danger" data-target="#memberDelete" data-toggle="modal" data-id="${member.USER_ID}">X</button></td>
                           </tr>
                         
                         </c:forEach>                 
                        </tbody>
                      </table>   
		              </div>	
                  </div>
                </div>
              </div>
              <div class="modal fade" id="layerpop" >
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <!-- header -->
				      <div class="modal-header">
				        <!-- 닫기(x) 버튼 -->
				        <button type="button" class="close" data-dismiss="modal">×</button>
				        <!-- header title -->
				        <h4 class="modal-title"></h4>
				      </div>
				      <!-- body -->
				      <div class="modal-body">
				           	<table>
				           		<tr>
				           			<td>이름 : </td><td id="name"></td>
				           		<tr>
				           		<tr>
				           			<td>나이 : </td><td id="age"></td>
				           		<tr>
				           		<tr>
				           			<td>성별 : </td><td id="gender"></td>
				           		<tr>
				           		<tr>
				           			<td>주소 : </td><td id="addr"></td>
				           		<tr>
				           		<tr>
				           			<td>전화번호 : </td><td id="tel"></td>
				           		<tr>
				           	</table>
				      </div>
				      <!-- Footer -->
				      <div class="modal-footer">
				        
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
		<!-- Delete Modal -->
			<div class="modal fade" id="memberDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title"><small>회원 삭제</small></h4>
			      </div>
			      <div class="modal-body">
			        <div style="margin-top:10px" >
			        	<p>정말 삭제하시겠습니까?</p>
					</div>
			      </div>
			      <div class="modal-footer">
			        <button id="deleteBtn" type="button" class="btn btn-default" data-dismiss="modal">삭제</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
		<!-- Delete Modal -->
</div>

<script>
var id="";
var name = "";
var age = "";
var gender = "";
var addr = "";
var tel = "";

$(document).ready(function(){
	$('#layerpop').on('show.bs.modal',function(event){
		selectedId =$(event.relatedTarget).data('user_id');

		name =$(event.relatedTarget).data('name');
		age =$(event.relatedTarget).data('age');
		gender =$(event.relatedTarget).data('gender');
		addr =$(event.relatedTarget).data('addr');
		tel =$(event.relatedTarget).data('tel');
		
		$("h4[class='modal-title']").html(selectedId);
		$("#name").html(name);
		$("#age").html(age);
		$("#gender").html(gender);
		$("#addr").html(addr);
		$("#tel").html(tel);
		
		console.log(name);
	});
	
var deleteId = "";

	$('#memberDelete').on('show.bs.modal',function(event){
		deleteId = $(event.relatedTarget).data('id');
		console.log(deleteId);
	});

	$('#deleteBtn').click(function(){
		console.log("클릭함수안");
		$.ajax({
			type:"POST",
			url:"<c:url value="/admin/member/memberDelete.do"/>",
			data:{"id":deleteId},
			success:function(){
				alert('삭제 성공했습니다.');
				location.reload();
			},error:function(e){
				alert('삭제 실패했습니다.'+"ERROR : " + e.statusText);
			}
		});
	});

});


</script>