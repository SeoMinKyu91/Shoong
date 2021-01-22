<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th, td{
	text-align: center;
}

</style>

<!-- class="right_col 이 DiV안에서 작업하지 않으면 깨져요. -->
<div class="right_col" role="main">
        <div class="col-md-6 col-sm-6 col-xs-12">

                <div class="x_panel">
                  <div class="x_title">
                    <h2>코스 좋아요 순위<small>월별</small></h2>
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
		                
		              </div>
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th class="column-title">NO</th>
                            <th class="column-title">CATEGORY</th>
                            <th class="column-title">NAME</th>
                            <th class="column-title">LIKE COUNT</th>
                          </tr>
                        </thead>


                        <tbody>
                        
                        <c:forEach var="i" begin="1" end="10">
                        
                          <tr class="even pointer">
                            <td class=" ">${i }</td>
                            <td class=" "><a href="#">감성코스</a></td>
                            <td class=" "><a href="#">코스${i}</a></td>
                            <td class=" ">5${i }</td>

                            
                          </tr>
                         
                         </c:forEach>
                          
                         
                        </tbody>
                      </table>
                    </div>		
						
                  </div>
                </div>
              </div>
              
              <div class="col-md-6 col-sm-6 col-xs-12">

                <div class="x_panel">
                  <div class="x_title">
                    <h2>팩 가입인원수 순위<small>월별</small></h2>
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
		                
		              </div>
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th class="column-title">NO</th>
                            <th class="column-title">NAME</th>
                            <th class="column-title">USERS</th>
                            <th class="column-title">RECORDS</th>
                          </tr>
                        </thead>


                        <tbody>
                        
                        <c:forEach var="i" begin="1" end="10">
                        
                          <tr class="even pointer">

                            <td class=" ">${i }</td>
                            <td class=" "><a href="#">팩${i }</a></td>
                            <td class=" "><a href="#">${i}</a></td>
                            <td class=" ">${i }</td>

                            
                          </tr>
                         
                         </c:forEach>
                          
                         
                        </tbody>
                      </table>
                    </div>		
						
                  </div>
                </div>
              </div>
              
              
              <div class="col-md-6 col-sm-6 col-xs-12">

                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 주행거리 순위 <small>월별</small></h2>
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
                            <th class="column-title">NO </th>
                            <th class="column-title">USER ID</th>
                            <th class="column-title">NAME </th>
                            <th class="column-title">LENGTH </th>
                            <th class="column-title">AGE </th>
                            <th class="column-title">GENDER </th>
                          </tr>
                        </thead>


                        <tbody>
                        
                        <c:forEach var="i" begin="1" end="10">
                        
                          <tr class="even pointer">
                            <td class="col-md-1">${i}</td>
                            <td class=" "><a href="#">123${i }@gmail.com</a></td>
                            <td class="">가길동</td>
                            <td class=" ">?KM</td>
                            <td class=" ">2${i }</td>
                            <td class=" ">여자</td>
                          </tr>
                         
                         </c:forEach>
                          
                         
                        </tbody>
                      </table>
                    </div>		
						
                  </div>
                </div>
              </div>
              
              <div class="col-md-6 col-sm-6 col-xs-12">

                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 코스주행횟수 순위 <small>월별</small></h2>
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
                            <th class="column-title">NO </th>
                            <th class="column-title">USER ID</th>
                            <th class="column-title">NAME </th>
                            <th class="column-title">RECORDS </th>
                            <th class="column-title">AGE </th>
                            <th class="column-title">GENDER </th>
                          </tr>
                        </thead>


                        <tbody>
                        
                        <c:forEach var="i" begin="1" end="10">
                        
                          <tr class="even pointer">
                            <td class="col-md-1">${i}</td>
                            <td class=" "><a href="#">123${i }@gmail.com</a></td>
                            <td class="">가길동</td>
                            <td class=" ">??</td>
                            <td class=" ">2${i }</td>
                            <td class=" ">여자</td>
                          </tr>
                         
                         </c:forEach>
                          
                         
                        </tbody>
                      </table>
                    </div>		
						
                  </div>
                </div>
              </div>
              
              
</div>

