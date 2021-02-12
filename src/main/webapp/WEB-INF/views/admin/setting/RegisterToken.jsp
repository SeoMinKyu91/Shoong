<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	Connection conn = null;
    PreparedStatement pstm = null;
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
        pstm = conn.prepareStatement(sql);        
        pstm.setString(1,token);        
        pstm.executeUpdate();
        System.out.println("토큰값이 입력되었습니다.");
    }
  
    pstm.close();
    conn.close();
    
%>