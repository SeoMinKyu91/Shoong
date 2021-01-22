<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- class="right_col 이 DiV안에서 작업하지 않으면 깨져요. -->
<!-- main -->
<div class="right_col" role="main">
	<!-- title -->
	<div>
    	<div class="page-title">
        	<div class="title_left">
            	<h3>Declaration<small style="margin-left: 1em;">Process</small></h3>
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
	<!-- Report List -->
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Report List <small>Custom design</small></h2>
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
                            <th class="column-title">Target </th>
                            <th class="column-title">Reporter </th>
                            <th class="column-title">Pack</th>
                            <th class="column-title">Date Created </th>
                            <th class="column-title">Type of Report </th>
                            <th class="column-title">Report Count </th>
                            <th class="column-title no-link last"><span class="nobr">Action</span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                        <c:if test="${empty list}" var="isEmpty">
                        	<tr class="text-center">
                        		<td colspan="4" class="text-center">등록된 글이 없습니다</td>
                        	</tr>
                        </c:if>
                        <c:if test="${!isEmpty}">
                        	<c:forEach var="item" items="${list }" varStatus="loop">
	                          <tr class="even pointer" data-toggle="modal" data-target="#reportModal" id="reportList" data-reportTargetID=${item.reportTargetID} data-reportDate=${item.reportDate}>
	                            <td class="a-center ">
	                              <input type="checkbox" class="flat" name="table_records">
	                            </td>
	                            <td class=" ">${item.reportTargetID }</td>
	                            <td class=" ">${item.reportID} </td>
	                            <td class=" ">소속된 팩도 까먹었고</td>
	                            <td class=" ">${item.reportDate }</td>
	                            <td class=" ">${item.reportCategory }</td>
	                            <td class="a-right a-right ">신고된 횟수를 넣야되네</td>
	                            <td class=" last">
	                            	<button type="button" class="btn btn-default btn-xs btn-warning">!</button>
	                            	<button type="button" class="btn btn-default btn-xs btn-danger">X</button>
	                            </td>
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
	<!-- Report List -->
	
	<!-- Report Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			    <div class="modal-body">
			      		<div class="x_content">
		                  <ul class="list-unstyled msg_list">
		                    <li>
		                      <img alt="img" src="https://files.itworld.co.kr/archive/image/2017/12/GettyImages-889581518.jpg" class="img-responsive">
		                     </li>
		                     <li>
		                      <a>
		                        <span class="image">
		                          <img src="<c:url value="/admin/images/img.jpg"/>" alt="img" />
		                        </span>
		                        <span>
		                          <span><span id="reportTargetID"></span></span>
		                          <span class="time"><span  id="reportDate"></span></span>
		                        </span>
		                        <span class="message">
		                          	테스트를 위한 욕 욕 욕 욕 욕
		                        </span>
		                      </a>
		                    </li>
		                   </ul>
		                 </div>
			    </div>
			    <div class="modal-footer">
			    	<div style="margin-top:10px ">
			        	<button type="button" class="btn btn-warning">경고</button>
			        	<button type="button" class="btn btn-danger">영구 제명</button>
			        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	<!-- Report Modal -->
</div>
<!-- main -->

<script>
	var reportTargetID = ""
	var reportDate = ""
	
	$(document).ready(function(){
		$('#reportList').on('show',function(event){
			selectedId=$(event.relatedTarget).data(reportTargetID);
			
			reportTargetID = $(event.relatedTarget).data('reportTargetID');
			reportDate = $(event.relatedTarget).data('reportDate');
			
			$('#reportTargetID').html(reportTargetID);
			$('#reportDate').html(reportDate);
		});
	});
</script>