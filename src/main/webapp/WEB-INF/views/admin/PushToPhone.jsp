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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		   
		    //백그라운드일때도   onMessageReceived를 호출하려면 키값을 data로 설정해야한다  
		    //notification일때는 백그라운드 상태에서 onMessageReceived가 호출이 안된다.
		    /*
		    {"data":{"제목키값":"제목","내용키값":"내용"},"to":"메시지는 보낼 토큰값"}
		    
		    */
		    
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
            System.out.println(rs.getString(1));
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
<script>
	alert("<%=successTokens%>개의 기기에 메시지가 전송되었어요...");
	location.href="Setting.jsp";
</script>
