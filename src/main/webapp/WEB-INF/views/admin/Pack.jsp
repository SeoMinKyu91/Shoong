<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                        	<tr data-toggle="modal" data-target="#packViewModal">
                          		<th scope="row">1</th>
		                          <td>가나다</td>
		                          <td>용인</td>
		                          <td>가길동</td>
                        	</tr>
                        	<tr>
	                          <th scope="row">2</th>
		                          <td>나다라</td>
		                          <td>가산동</td>
		                          <td>나길동</td>
                        	</tr>
                       		<tr>
                          		<th scope="row">3</th>
		                          <td>Larry</td>
		                          <td>the Bird</td>
		                          <td>@twitter</td>
                        	</tr>
                        	<tr>
                          		<th scope="row">4</th>
		                          <td>Larry</td>
		                          <td>the Bird</td>
		                          <td>@twitter</td>
                        	</tr>
                        	<tr>
                          		<th scope="row">5</th>
		                          <td>Larry</td>
		                          <td>the Bird</td>
		                          <td>@twitter</td>
                        	</tr>
                        	<tr>
                          		<th scope="row">6</th>
		                          <td>Larry</td>
		                          <td>the Bird</td>
		                          <td>@twitter</td>
                        	</tr>
                        	<tr>
                          		<th scope="row">7</th>
		                          <td>Larry</td>
		                          <td>the Bird</td>
		                          <td>@twitter</td>
                        	</tr>
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
                            <th class="column-title no-link last"><span class="nobr">Action</span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                          <tr class="even pointer" data-toggle="modal" data-target="#packViewModal">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">가나다 </td>
                            <td class=" ">Dec 24 2020</td>
                            <td class=" ">용인</td>
                            <td class=" ">20</td>
                            <td class="a-right a-right ">1</td>
                            <td class=" last">
                            	<button type="button" class="btn btn-default btn-xs btn-warning">!</button>
                            	<button type="button" class="btn btn-default btn-xs btn-danger">X</button>
                            </a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000039</td>
                            <td class=" ">May 23, 2014 11:30:12 PM</td>
                            <td class=" ">121000208 <i class="success fa fa-long-arrow-up"></i>
                            </td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$741.20</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000038</td>
                            <td class=" ">May 24, 2014 10:55:33 PM</td>
                            <td class=" ">121000203 <i class="success fa fa-long-arrow-up"></i>
                            </td>
                            <td class=" ">Mike Smith</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$432.26</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000037</td>
                            <td class=" ">May 24, 2014 10:52:44 PM</td>
                            <td class=" ">121000204</td>
                            <td class=" ">Mike Smith</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$333.21</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">May 24, 2014 11:47:56 PM </td>
                            <td class=" ">121000210</td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$7.45</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000039</td>
                            <td class=" ">May 26, 2014 11:30:12 PM</td>
                            <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i>
                            </td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$741.20</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000038</td>
                            <td class=" ">May 26, 2014 10:55:33 PM</td>
                            <td class=" ">121000203</td>
                            <td class=" ">Mike Smith</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$432.26</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000037</td>
                            <td class=" ">May 26, 2014 10:52:44 PM</td>
                            <td class=" ">121000204</td>
                            <td class=" ">Mike Smith</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$333.21</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>

                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">May 27, 2014 11:47:56 PM </td>
                            <td class=" ">121000210</td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$7.45</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000039</td>
                            <td class=" ">May 28, 2014 11:30:12 PM</td>
                            <td class=" ">121000208</td>
                            <td class=" ">John Blank L</td>
                            <td class=" ">Paid</td>
                            <td class="a-right a-right ">$741.20</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
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
			                          <tr class="odd pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">☆</td>
			                            <td class=" ">Jan 01, 2021</td>
			                            <td class=" ">abc1234</td>
			                            <td class=" ">나길동</td>
			                            <td class=" ">Manager</td>
			                            <td class="a-right a-right ">17 Hours</td>
			                          </tr>
			                          <tr class="even pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">●</td>
			                            <td class=" ">Jan 08, 2021</td>
			                            <td class=" ">qwer1234</td>
			                            <td class=" ">다길동</td>
			                            <td class=" ">Member</td>
			                            <td class="a-right a-right ">8 Hours</td>
			                          </tr>
			                          <tr class="odd pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">121000037</td>
			                            <td class=" ">May 24, 2014 10:52:44 PM</td>
			                            <td class=" ">121000204</td>
			                            <td class=" ">Mike Smith</td>
			                            <td class=" ">Paid</td>
			                            <td class="a-right a-right ">$333.21</td>
			                          </tr>
			                          <tr class="even pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">121000040</td>
			                            <td class=" ">May 24, 2014 11:47:56 PM </td>
			                            <td class=" ">121000210</td>
			                            <td class=" ">John Blank L</td>
			                            <td class=" ">Paid</td>
			                            <td class="a-right a-right ">$7.45</td>
			                          </tr>
			                          <tr class="odd pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">121000039</td>
			                            <td class=" ">May 26, 2014 11:30:12 PM</td>
			                            <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i>
			                            </td>
			                            <td class=" ">John Blank L</td>
			                            <td class=" ">Paid</td>
			                            <td class="a-right a-right ">$741.20</td>
			                          </tr>
			                          <tr class="even pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">121000038</td>
			                            <td class=" ">May 26, 2014 10:55:33 PM</td>
			                            <td class=" ">121000203</td>
			                            <td class=" ">Mike Smith</td>
			                            <td class=" ">Paid</td>
			                            <td class="a-right a-right ">$432.26</td>
			                          </tr>
			                          <tr class="odd pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">121000037</td>
			                            <td class=" ">May 26, 2014 10:52:44 PM</td>
			                            <td class=" ">121000204</td>
			                            <td class=" ">Mike Smith</td>
			                            <td class=" ">Paid</td>
			                            <td class="a-right a-right ">$333.21</td>
			                          </tr>
			
			                          <tr class="even pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">121000040</td>
			                            <td class=" ">May 27, 2014 11:47:56 PM </td>
			                            <td class=" ">121000210</td>
			                            <td class=" ">John Blank L</td>
			                            <td class=" ">Paid</td>
			                            <td class="a-right a-right ">$7.45</td>
			                          </tr>
			                          <tr class="odd pointer">
			                            <td class="a-center ">
			                              <input type="checkbox" class="flat" name="table_records">
			                            </td>
			                            <td class=" ">121000039</td>
			                            <td class=" ">May 28, 2014 11:30:12 PM</td>
			                            <td class=" ">121000208</td>
			                            <td class=" ">John Blank L</td>
			                            <td class=" ">Paid</td>
			                            <td class="a-right a-right ">$741.20</td>
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
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		<!-- Pack View Modal -->
</div><!-- main -->
