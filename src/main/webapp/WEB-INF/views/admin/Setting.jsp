<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.android.gcm.server.Result"%>
<%@page import="java.util.List"%>
<%@page import="com.google.android.gcm.server.MulticastResult"%>
<%@page import="com.google.android.gcm.server.Message"%>
<%@page import="com.google.android.gcm.server.Sender"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.InputStreamReader"%>


<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%!
	//token값저장용
	ArrayList<String> tokens = new ArrayList<String>();  	
	 
	//Firebase Console->프로젝트 선택->설정->프로젝트 설정
	//->클라우드 메시징->서버키 복사
	final String apiKey = "AAAAJ2Qak8w:APA91bGejFe733-bo1ojzuZprIKJQ8hMCzjc1vD24TM_ulcfnhwmSBMEH9RfAMvtNtmb3BSR5QeGFwSpTovd4fw5v0c6Rne_FauVikJlgLmYsaq5O3-6mhWpHBc7VbSW17VXI3KmyZAt";
	String gcmURL ="https://fcm.googleapis.com/fcm/send";	
	JSONArray resultArray = new JSONArray();
	
	private void requestToFCMServer(String title,String message,String token){
		try{
			
			
			URL url = new URL(gcmURL);
		    HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		    httpConn.setDoOutput(true);
		    httpConn.setRequestMethod("POST");
		    httpConn.setRequestProperty("Content-Type", "application/json");
		    httpConn.setRequestProperty("Authorization", "key=" + apiKey);
		    
			String msg =String.format("{\"data\":{\"dataTitle\":\"%s\",\"dataBody\":\"%s\"},\"to\":\"%s\"}",title,message,token);
		    OutputStream os = httpConn.getOutputStream();
		    
		    //UTF-8로 인코딩:한글처리
		    os.write(msg.getBytes("UTF-8"));
		    os.flush();
		    os.close();
		    
		    
			//요청 보내기
		    int responseCode = httpConn.getResponseCode();      
		    //서버에서 보낸 응답 결과 받기
		    BufferedReader reader = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
		    String responseString; 	
		    while ((responseString = reader.readLine()) != null) { 
		    	System.out.println(responseString);
		    	JSONParser parser = new JSONParser();
		    	JSONObject object=(JSONObject)parser.parse(responseString);		    	
		    	resultArray.add(object);   
		    }
		    reader.close();  
		    
		}
		catch(Exception e){System.out.println(e.getMessage());}
		
	}////////////////////
%>
<%
	request.setCharacterEncoding("UTF-8");
	
    Connection conn = null; 
    PreparedStatement psmt = null; 
    ResultSet rs = null;
    
    String message = request.getParameter("dataBody");
    String title = request.getParameter("dataTitle");;
    int successTokens=0;
    try {
    	Class.forName("oracle.jdbc.OracleDriver");
       
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","shoong","shoong");
        psmt= conn.prepareStatement("SELECT TOKEN FROM FCM_TOKENS");
        rs = psmt.executeQuery();       
       //알림 메시지를 전송할 토큰값을 컬렉션에 저장하기
        while(rs.next()){
            tokens.add(rs.getString(1));
            System.out.println("토큰값?"+rs.getString(1));
        }
        conn.close();        
       
        //FCM서버로 메시지 보내기
        for(String token:tokens){
        	requestToFCMServer(title, message, token);
        }
        //몇대의 스마트폰에 알림 메시지가 성공적으로 보내졌는지 체크
        System.out.println("result : "+resultArray.toJSONString());        
        
        for(int i=0;i < resultArray.size();i++){
        	JSONObject object=(JSONObject)resultArray.get(i);
        	long success=(Long)object.get("success");
        	if(success == 1) successTokens++;
        }
        
    }catch (Exception e) {
        e.printStackTrace();
    }  
%>
<%
	//RegisterToken.jsp
	String sql = null;
	String token = null;
    String requestMethod = null;
    
    request.setCharacterEncoding("utf-8");
    
    try{
    	Class.forName("oracle.jdbc.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        conn = DriverManager.getConnection(url,"shoong","shoong");
        
        System.out.println("연결성공");
    }catch(Exception e){
    	System.out.println("연결실패");
        e.printStackTrace();
    }
    token = request.getParameter("token");
    System.out.println("token:"+token);
    if( token ==null || token.equals("") ){
        System.out.println("토큰값이 전달 되지 않았습니다.");
    }else{
        // 토큰값 전달시 쿼리문 입력할곳임
        sql = "INSERT INTO FCM_TOKENS(USER_ID,TOKEN) VALUES(TOKENS_SEQ.NEXTVAL,?)";
        psmt = conn.prepareStatement(sql);        
        psmt.setString(1,token);        
        psmt.executeUpdate();
        System.out.println("토큰값이 입력되었습니다.");
    }
  
    psmt.close();
    conn.close();
    
%>
<style>
	#myButton{
		right: 600px;
		position: absolute;
	}
.dragAndDropDiv {
      width:100%;
       margin-top: 15px;
       height: 200px;
        border: 2px dashed #777777;
        color: #777777;
        text-align: center;
      
}.dragAndDropDivSpan{
      line-height: 200px;
        vertical-align: middle;
        font-size:150%;

}.dragAndDropBtn{
       margin-top: 10px;
        border: 1px solid #777777;
        background-color : #ffffff;
        color: #777777;
        text-align: center;
        font-size:100%;
}
</style>
<!-- class="right_col 이 DiV안에서 작업하지 않으면 깨져요. -->
<div class="right_col" role="main">
<!-- title -->
	<div>
    	<div class="page-title">
        	<div class="title_left">
            	<h3>Setting</h3>
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
	
	<!-- 간단한 세팅? -->
	<div>
    	<div class="x_panel">
        	<div class="x_title">
            	<h2>Easy Setting <small>간편한 설정 목록</small></h2>
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
				  	<div class="panel-group" id="accordionaccordion" role="tablist" aria-multiselectable="true">
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingOne">
					      <h4 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					          Rank Reset
					        </a>
					      </h4>
					    </div>
					    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
					      <div class="panel-body">
							모든 랭킹을 초기화 합니다
							<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary btn-xs" autocomplete="off">
								Reset
							</button>
					      </div>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingTwo">
					      <h4 class="panel-title">
					        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					          Rank View
					        </a>
					      </h4>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					      <div class="panel-body">
							랭킹으로 나타 낼 순위는 몇 순위 까지???
							<input type="radio" style="margin-left: 150px">5
							<input type="radio" style="margin-left: 10px">10
							<input type="radio" style="margin-left: 10px">15
							<input type="radio" style="margin-left: 10px">20
							<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary btn-xs" autocomplete="off">
								Save
							</button>
					      </div>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingThree">
					      <h4 class="panel-title">
					        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					          Dormant Account
					        </a>
					      </h4>
					    </div>
					    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					      <div class="panel-body">
							기간 설정
							<input type="radio" style="margin-left: 200px">1 Week
							<input type="radio" style="margin-left: 10px">2 Week
							<input type="radio" style="margin-left: 10px">15 Days
							<input type="radio" style="margin-left: 10px">1 Month
							<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary btn-xs" autocomplete="off" >
								Save
							</button>
					      </div>
					    </div>
					  </div>
		<!-- 관리자 추가 삭제 -->
				<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingThree">
					      <h4 class="panel-title">
					        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					          Admin Account Manage
					        </a>
					      </h4>
					    </div>
					    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					      <div class="panel-body">
					      
					      <div class="col-md-6 col-sm-6 col-xs-12">
					      
							<div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
							<th class="column-title">No </th>
                            <th class="column-title">Admin ID </th>
                            <th class="column-title">Password </th>
                            <th class="column-title">Name </th>
                            <th class="column-title">Job Code </th>

                          </tr>
                        </thead>

                        <tbody>  
                        <c:forEach var="admin" items="${adminList}" varStatus="status" begin="0" end="24">
                          <tr class="even pointer" data-toggle="modal" data-target="#reportModal">
                            <td class=" ">${status.count}</td>
                            <td class=" ">${admin.ID}</td>
                            <td class=" ">${admin.PWD} </td>
                            <td class=" ">${admin.NAME}</td>
                            <td class=" ">${admin.JOBCODE}</td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      
                    </div>
					      </div>
					      
					      <div class="col-md-6 col-sm-6 col-xs-12">
					      
							<div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
							<th class="column-title">No </th>
                            <th class="column-title">Admin ID </th>
                            <th class="column-title">Password </th>
                            <th class="column-title">Name </th>
                            <th class="column-title">Job Code </th>

                          </tr>
                        </thead>

                        <tbody>  
                        <c:forEach var="admin" items="${adminList}" begin="25" end="50" varStatus="status">
                          <tr class="even pointer" data-toggle="modal" data-target="#reportModal">
                            <td class=" ">${status.count}</td>
                            <td class=" ">${admin.ID}</td>
                            <td class=" ">${admin.PWD} </td>
                            <td class=" ">${admin.NAME}</td>
                            <td class=" ">${admin.JOBCODE}</td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#adminModal" id="myButton" style="margin-top: -18px;" >추가</button>
                    </div>
					      </div>
					      
					    </div>
					    
					    </div>
					  </div>			
		<!-- 관리자 추가 삭제 -->
			</div>		
		</div>
      </div>
    </div>
<!-- 간단한 세팅? -->
<div class="clearfix"></div>
<!-- 벳지  -->
          <div>
              <div class="x_panel">
                <div class="x_title">
                  <h2>Badge <small>New/Retouch/Delete</small></h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="modal-toggle" data-toggle="modal" data-target="#newBadgeModal" role="button" aria-expanded="false"><i class="fa fa-plus"></i></a>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <ul class="list-unstyled msg_list">
                    <li data-toggle="modal" data-target="#badgeModal">
                      <a>
                        <span class="image">
                          <img src="<c:url value="/admin/images/img.jpg"/>" alt="img" />
                        </span>
                        <span>
                          <span>뱃지 이름</span>
                          <span class="time">뱃지 만든 시각</span>
                        </span>
                        <span class="message">
                          	뱃지 설명
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image">
                          <img src="<c:url value="/admin/images/img.jpg"/>" alt="img" />
                        </span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image">
                          <img src="<c:url value="/admin/images/img.jpg"/>" alt="img" />
                        </span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image">
                          <img src="<c:url value="/admin/images/img.jpg"/>" alt="img" />
                        </span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that
                        </span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
<!-- 벳지  -->
	<div class="clearfix"></div>
<!-- push알람 -->
 <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <h2>Push</h2>
                  <div class="x_title">
                  	<form method="post">
						<table style="border-spacing:1px;background-color:gray;width:400px">
							<tr style="border-spacing:1px;background-color:white">
								<td style="width:20%">제목</td>
								<td><input type="text" name="noti_title" style="width:90%"/></td>
							</tr>
							<tr style="border-spacing:1px;background-color:white">
								<td colspan="2">메시지</td>
								
							</tr>
							<tr style="border-spacing:1px;background-color:white">
								
								<td colspan="2"><textarea name="noti_message" style="width:90%;height:200px" ></textarea></td>
							</tr>
							<tr style="border-spacing:1px;background-color:white">
								<td colspan="2" style="text-align:center"><input type="submit" value="확인"/></td>			
							</tr>  
							
						</table>
					</form>
                  </div>
                 </div>
</div>
<!-- push알람 -->
	<div class="clearfix"></div>
<!-- 금지어 -->
              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Prohibited words <small>욕설/비하 발언/19금</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="modal-toggle" data-toggle="modal" data-target="#newWordModal" role="button" aria-expanded="false"><i class="fa fa-plus"></i></a>
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
                            <th class="column-title">Number </th>
                            <th class="column-title">Words </th>
                            <th class="column-title">Category </th>
                          </tr>
                        </thead>

                        <tbody>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">1</td>
                            <td class=" ">ㅅㅂ</td>
                            <td class=" ">욕설</td>
                          </tr>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">2</td>
                            <td class=" ">ㅄ</td>
                            <td class=" ">욕설</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                </div>
<!-- 금지어 -->
<!-- 금지할 사진 -->
	<div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Prohibited Images <small>욕설/비하 발언/19금</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="modal-toggle" data-toggle="modal" data-target="#newImageModal" role="button" aria-expanded="false"><i class="fa fa-plus"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						  <!-- Indicators -->
						  <ol class="carousel-indicators">
						    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
						  </ol>
						
						  <!-- Wrapper for slides -->
						  <div class="carousel-inner" role="listbox">
						    <div class="item active">
						      <img src="..." alt="...">
						      <div class="carousel-caption">
						        ...
						      </div>
						    </div>
						    <div class="item">
						      <img src="..." alt="...">
						      <div class="carousel-caption">
						        ...
						      </div>
						    </div>
						    ...
						  </div>
						
						  <!-- Controls -->
						  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
                  </div>
	</div>
<!-- 금지할 사진 -->
<!-- ---------------------------------------------   MODAL   -------------------------------------------------------- -->
	<!-- New Badge Modal -->
	<div class="modal fade" id="newBadgeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			    <div class="modal-body">
			      		<div class="x_content">
		                  <ul class="list-unstyled msg_list">
		                    <li>
		                      <input type="file">
		                     </li>
		                     <li>
		                      <a>
		                        <span>
		                          뱃지 이름
		                          <input type="text" class="form-control input-sm" placeholder="Text input">
		                        </span>
		                        <span class="message">
		                        뱃지 내용
		                          <input type="text" class="form-control input-sm" placeholder="Text input">
		                        </span>
		                      </a>
		                    </li>
		                   </ul>
		                 </div>
			    </div>
			    <div class="modal-footer">
			    	<div style="margin-top:10px ">
			        	<button type="button" class="btn btn-primary">저장</button>
			        	<button type="button" class="btn btn-warning">임시 저장</button>
			        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	<!-- New Badge Modal -->
	<!-- Badge Modal -->
	<div class="modal fade" id="badgeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
		                        <span>
		                          <span>뱃지 이름</span>
		                          <span class="time">생성일</span>
		                        </span>
		                        <span class="message">
		                          	뱃지에 대한 설명
		                        </span>
		                      </a>
		                    </li>
		                   </ul>
		                 </div>
			    </div>
			    <div class="modal-footer">
			    	<div style="margin-top:10px ">
			        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#badgEditModal">수정</button>
			        	<button type="button" class="btn btn-danger">삭제</button>
			        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	<!-- Badge Modal -->
	<!-- New Word Modal -->
			<div class="modal fade" id="newWordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">Prohibited words</h4>
			      </div>
			      <div class="modal-body">
			        <div style="margin-top:10px ">
					        <input type="radio"> 욕설
							<input type="radio"style="margin-left:10px"> 비하 발언
							<input type="radio"style="margin-left:10px"> 19 금
							<input type="radio"style="margin-left:10px"> etc
						<input type="text" class="form-control" placeholder="Text input" style="margin-top:10px ">
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary">save</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
			      </div>
			    </div>
			  </div>
			</div>
		<!-- New Word Modal -->
		<!-- New Image Modal -->
			<div class="modal fade" id="newImageModal" data-backdrop="false">
       <div class="modal-dialog modal-lg" >
           <div class="modal-content">
               <div class="modal-header">
                   <h4>사진 올리기</h4>
               </div>
               <div class="modal-body">
                       <div class="col-sm-12" style="margin-top:10px ">
                     <form method="post" enctype="multipart/form-data" class="col-sm-12">
                         <div id="fileUpload" class="dragAndDropDiv col-sm-12"><span class="dragAndDropDivSpan">Drag & Drop Files Here</span></div>
                         <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
                     </form>
                     <!-- <button class="dragAndDropBtn col-sm-2  col-sm-offset-10">추가</button> -->
                  </div>
                  
               </div>
               <div class="modal-footer"> 
                  <form method="post" action="<c:url value="/pack/pictureInput.do"/>">
                  <input class="form-control" name="imgArry" id="imgArry"  type="hidden">
                  <button type="submit" class="btn btn-default">Save</button>   
               </form>
                   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
           </div>
       </div>
   </div>
  </div>
		<!-- New Image Modal -->
		<!-- Admin Modal -->
			<div class="modal fade" id="adminModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">Manager input</h4>
			      </div>
			      <div class="modal-body">
			        <div style="margin-top:10px ">
					        <input type="radio"> Master
							<input type="radio"style="margin-left:10px"> Sub Master
							<input type="radio"style="margin-left:10px"> Manager
						<input type="text" class="form-control" placeholder="ID input" style="margin-top:10px ">
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary">save</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
			      </div>
			    </div>
			  </div>
			</div>
		<!-- Admin Modal -->
</div>
<!-- main -->
<script>
$('#accordion').collapse('hide');

$('#myButton').on('click', function () {
    var $btn = $(this).button('loading')
    // business logic...
    $btn.button('reset')
  })
</script>
