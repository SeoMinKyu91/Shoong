<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.cardDiv{
	margin-top: 20px;
	background-color: white;
	}
.single-location{
	position:relative;
	}
.single-location .location-img{
	border-radius:10px;overflow:hidden;position:relative;z-index:0
}
.single-location .location-img::before
{
	position:absolute;width:100%;height:50%;bottom:0;content:"";z-index:1
}
.single-location .location-img img{
	width:100%;  height: 170px;transform:scale(1);transition:all .5s ease-out 0s
}
.single-location .location-details{
	width:100%;
	position:absolute;left:70%;bottom:-9px;-webkit-transition:all .2s ease-out 0s;
	-moz-transition:all .2s ease-out 0s;
	-ms-transition:all .2s ease-out 0s;-o-transition:all .2s ease-out 0s;transition:all .2s ease-out 0s
	}
.single-location .location-details .location-btn{
	padding:10px 20px;background:#fff;color:#333333;border-radius:30px;opacity:0;visibility:hidden;
	font-family: 'Do Hyeon', sans-serif;
	}
.card-body:hover .location-img img{
	transform:scale(1.1)
	}
.card-body:hover .location-details{
	bottom:7%
	}
.card-body:hover .location-details .location-btn{
	opacity:1;visibility:visible;
	}
.card-title{
	font-size: 20px;
}.card-body{
	padding: 5px;
	border:1px solid #eeeeee;
}
.modal-dialog{
    overflow-y: initial !important;
   
}.modal-body{
	max-height: 800px;overflow-y: auto;}
</style>


<div id="colorlib-main">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<h3>나의 라이딩 다이어리<small data-toggle="modal" data-target="#myStoryInputModal">추가하기</small></h3>
			</div>
		</div>	
		<div class="row">
		 <c:if test="${empty diaryList }" var="isEmpty">
            <h3>다이어리가 없어요.</h3>
            <button type="submit" class="btn btn-default">지금 달리러 가기</button>		
         </c:if>
         <c:if test="${!isEmpty}">
         	<c:forEach var="item" items="${diaryList }">        
               <div class="col-md-3 col-xs-6 cardDiv">
				<article class="card shadow">
					<div class="card-body">
						<div class="single-location mb-30">
							<div class="location-img">
								<c:if test="${empty item.DIARY_THUMBNAIL }" var="isEmpty">
								<img src='<c:url value="/images/bg_1.jpg"/>' alt="다이어리">
								</c:if>
								<c:if test="${!isEmpty}">
								<img src=/fileupload/${item.DIARY_THUMBNAIL} alt="다이어리 ">
								</c:if>
							</div>
							<div class="location-details">
								<span class="location-btn">
									<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>${item.DIARY_IMG_COUNT}
								</span>
							</div>	
						</div>
						 <a href='<c:url value="/mypage/diary/view.do?diaryCode=${item.DIARY_CODE }"/>'>${item.DIARY_TITLE}</a>
			         </div>
				</article>
			</div>
                  
                         
            </c:forEach>
         </c:if>
		
			
				
			
		</div><!--row-->
	</div><!--cotainer-->
</div><!--colorlib-main-->
<!-- 모달 -->
<div class="modal fade" id="myStoryInputModal" data-backdrop="false">
    <div class="modal-dialog" >
        <div class="modal-content" style="width:1200px;" >
            <div class="modal-header" >
                <h4></h4>
            </div>
            <div class="modal-body" >
        <c:if test="${empty recordList }" var="isEmpty">
            <h3>코스가 없어요.</h3>
            <button type="submit" class="btn btn-default">지금 달리러 가기</button>		
         </c:if>
         <c:if test="${!isEmpty}">
         	<h3>나중엔 코스 띄우기 </h3>
         	<table class="col-sm-12">
             <c:forEach var="item" items="${recordList }">        
                  <tr>

                      <th>${item.COURSE_NAME }</th>
                      <th>${item.RECORD_DATE }</th>
                      <th>${item.RECORD_LENGTH }</th>
                      <th><a href='<c:url value="/mypage/diary/write.do?recordId=${item.RECORD_ID }"/>'>추가하기</a></th>
                  </tr>        
            </c:forEach>
		  </table>
         </c:if>
           		
           
            </div>
			<div class="modal-footer"> 
            		<a type="button" class="btn btn-default" data-dismiss="modal">닫기</a>
				
                
            </div>
        </div>
    </div>
</div>


<script>

	//스토리 카드를 하나 클릭 했을 때
	$(".cardDiv").click(function(){
		
		
	})
	
	
	
	
	
</script>

