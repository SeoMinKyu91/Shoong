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

        <div class="col-md-12 col-sm-12 col-xs-12">

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
                    
		              
		              <div class="title_right">
		              
		              <div class="col-md-3 form-inline" style="display: inline-block;position: relative;left: 915px">
				           <select class="form-control" >
			                   <option>아이디</option>
			                   <option>이름</option>
			                   <option>나이</option>
			                   <option>성별</option>
			                   <option>주소</option>
			                   <option>전화번호</option>
			               </select>
			            </div>
		              
		                <div class="col-md-4 col-sm-5 col-xs-12 form-group pull-right top_search">
		                  <div class="input-group">
		                    <input type="text" class="form-control" placeholder="Search for...">
		                    <span class="input-group-btn">
		                      <button class="btn btn-default" type="button">SEARCH</button>
		                    </span>
		                  </div>
		                </div>
		              </div>
		              
		              
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">NO </th>
                            <th class="column-title">USER ID</th>
                            <th class="column-title">NAME </th>
                            <th class="column-title">AGE </th>
                            <th class="column-title">GENDER </th>
                            <th class="column-title">ADDRESS </th>
                            <th class="column-title">TEL </th>
                          </tr>
                        </thead>


                        <tbody>
                        
                        <c:forEach var="i" begin="1" end="10">
                        
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class="col-md-1">${i}</td>
                            <td class=""><a href="#" id="popbutton${i }">123${i }@gmail.com</a></td>
                            <td class="">가길동</td>
                            <td class=" ">2${i }</td>
                            <td class=" ">여자</td>
                            <td class=" ">서울시 금천구</td>
                            <td class="a-right a-right ">010-1111-${i }${i }${i }${i }</td>
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
				        Footer
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>

</div>

<script>
var selectedId = "";
var selected = "";

$(function(){	
	
    $("a").click(function(){
        $('div.modal').modal();
        selectedId = $(this).attr("id");
        selected = $("#selectedId").html();
        $("h4[class='modal-title']").html(selected); 
        console.log(selectedId);
        console.log(selected);
    });
});


</script>