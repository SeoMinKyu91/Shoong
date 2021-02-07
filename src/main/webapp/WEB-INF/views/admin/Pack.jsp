<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- class="right_col 이 DiV안에서 작업하지 않으면 깨져요. -->
<div class="right_col" role="main">
	<!-- title -->
	<div>
    	<div class="page-title">
        	<div class="title_left">
            	<h3>Pack<small style="margin-left: 1em;">Management</small></h3>
            </div>
        </div>
        <div class="title_right">
        	<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
            	<div class="input-group">
                	<input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                    	<button class="btn btn-default" type="button">Go!</button>
                    </span>
                </div>
            </div>
    	</div>
	</div>
	<!-- title -->
	
	<div class="clearfix"></div>
	
	<!-- Pack Rank -->
	<div class="row">
		<div class="col-md-6 col-sm-6 col-xs-12">
        	<div class="x_panel" style="height: 372px;">
            	<div class="x_title">
                	<h2>Pack Rank <small>자세히 보시려면 클릭 하세요</small></h2>
                    	<ul class="nav navbar-right panel_toolbox">
                      		<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      		</li>
                      	<li class="dropdown">
                        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                        	<li><a href="#">커뮤니티 활동량</a>
                          	</li>
                          	<li><a href="#">전체 활동량</a>
                          	</li>
                        </ul>
                      	</li>
                      	<li><a class="close-link"><i class="fa fa-close"></i></a>
                      	</li>
                    	</ul>
                    <div class="clearfix"></div>
                 </div>
                 <div class="x_content">
                 	<table class="table table-hover">
                    	<thead>
                        	<tr>
                          		<th>Rank</th>
                         	 	<th>Pack Name</th>
                          		<th>Location</th>
                          		<th>Chief</th>
                        	</tr>
                      	</thead>
                      	<tbody>
		                	<c:if test="${not empty packList}">
								<c:forEach var="pack" items="${packList }" varStatus="loop">
		                        	<tr data-toggle="modal" data-target="#packViewModal">
			                          		<th scope="row">1</th>
					                          <td>${pack.PACK_NAME}</td>
					                          <td>${pack.PACK_ACT_REGION}</td>
					                          <td>${PACK_Manager.USER_ID}</td>
		                        	</tr>
			                	</c:forEach>
			            	</c:if>
                      	</tbody>
                    </table>
            	</div>
        	</div>
    	</div>
		<!-- Pack Rank -->

		<!-- Regional distribution -->
		<div class="col-md-6 col-sm-6 col-xs-12" id="grahp">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Regional distribution <small>지역 분포</small></h2>
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
                    <canvas id="pieChart"></canvas>
                  </div>
                </div>
              </div>
		<!-- Regional distribution -->
	</div><!-- row -->
	<div class="clearfix"></div>
	<!-- Pack List -->
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Pack List <small>Custom design</small></h2>
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

                    <p>Add class <code>bulk_action</code> to table for bulk actions options on row select</p>

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">Pack ID </th>
                            <th class="column-title">Pack Name </th>
                            <th class="column-title">Creation Date </th>
                            <th class="column-title">Location </th>
                            <th class="column-title">Head Count </th>
                            <th class="column-title">caution</th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                        
		                    <c:if test="${not empty packList}">
								<c:forEach var="pack" items="${packList }" varStatus="loop">
                          <tr class="even pointer" data-toggle="modal" data-target="#packViewModal">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
		                            <td>${pack.PACK_ID}</td>
		                            <td>${pack.PACK_NAME} </td>
		                            <td>Dec 24 2020</td>
		                            <td>${pack.PACK_ACT_REGION}</td>
		                            <td>20</td>
		                            <td>1</td>
                          </tr>
                           		</c:forEach>
                            </c:if>
                        </tbody>
                      </table>
                    </div>
							
						
                  </div>
                </div>
              </div>
	</div>
	<!-- Pack List -->
	
	<!-- Pack View Modal -->
			<div class="modal fade" id="packViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">팩 상세보기	<small>팩 이름</small></h4>
			      </div>
			      <div class="modal-body">
			        <div style="margin-top:10px ">
						<!-- 활동량 바 그래프 -->
						<div class="">
			                <div class="x_panel">
			                  <div class="x_title">
			                    <h2>팩 활동량 <small></small></h2>
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
			                    <canvas id="mybarChart"></canvas>
			                  </div>
			                </div>
             			 </div>
             			 <!-- 활동량 바 그래프 -->
             			 
             			 <!-- 리스트 -->
             			 <div class="">
			                <div class="x_panel">
			                  <div class="x_title">
			                    <h2>팩 가입자 <small></small></h2>
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
			                      <table class="table table-striped jambo_table bulk_action">
			                        <thead>
			                          <tr class="headings">
			                            <th>
			                              <input type="checkbox" id="check-all" class="flat">
			                            </th>
			                            <th class="column-title">Badge </th>
			                            <th class="column-title">가입일 </th>
			                            <th class="column-title">아이디 </th>
			                            <th class="column-title">이름 </th>
			                            <th class="column-title">등급 </th>
			                            <th class="column-title">마지막 접속 </th>
			                            <th class="bulk-actions" colspan="7">
			                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
			                            </th>
			                          </tr>
			                        </thead>
			
			                        <tbody>
			                          <tr class="even pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">★</td>
			                            <td class=" ">Dec 23, 2020</td>
			                            <td class=" ">kjh727272 </td>
			                            <td class=" ">가길동</td>
			                            <td class=" ">Chief</td>
			                            <td class="a-right a-right ">3 Hours</td>
			                          </tr>
			                        </tbody>
			                      </table>
			                    </div>
										
									
			                  </div>
			                </div>
              </div>
             			 <!-- 리스트 -->
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary">수정</button>
			        <button type="button" class="btn btn-danger">삭제</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		<!-- Pack View Modal -->
</div><!-- main -->
