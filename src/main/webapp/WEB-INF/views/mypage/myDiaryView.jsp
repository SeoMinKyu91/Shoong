<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#colorlib-main{
	font-family:'Nanum Pen Script', cursive;
}
#colorlib-main span{
	font-size:25px;

</style>


<div id="colorlib-main">
				 <h2>제목 : ${diaryMap.DIARY_TITLE}</h2>
				 <p>날짜 : ${diaryMap.DIARY_DATE}</p>
				
           		 <div style="margin-top:10px">
						<div style="width: 100% ;height: 200px;border:1px solid #666666"> 추후 코스 넣기</div>
				</div>
           		
           		
				 <div>
				    <span>내용 : ${diaryMap.DIARY_MAIN_CONTENT}</span>
				    
				</div>
				
           
            
         <c:if test="${empty diaryImglist}" var="isEmpty">
            
         </c:if>
         <c:if test="${!isEmpty}">
         	<c:forEach var="item" items="${diaryImglist }" varStatus="loop" >        
               <h3>#${item.DIARY_IMG_TITLE}</h4>
               <div style="margin-top:10px">
            	    <img style="height: 400px; width: 600px;" src="/fileupload/${item.DIARY_IMG_NAME}" alt="팩갤러리 사진">
			   </div> 
			   <div>
				    <span>${item.DIARY_IMG_CONTENT}</span>
				</div>
            </c:forEach>
         </c:if>
</div>     