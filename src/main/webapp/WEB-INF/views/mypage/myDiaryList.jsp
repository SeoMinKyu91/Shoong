<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<!--
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
<link rel="stylesheet" href="cards-gallery.css">
-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>

<style>
.gallery-block{
   padding-bottom: 60px;
   padding-top: 60px;
}

.gallery-block .heading{
    margin-bottom: 50px;
    text-align: center;
}

.gallery-block .heading h2{
    font-weight: bold;
    font-size: 5rem;
    text-transform: uppercase;
}

.gallery-block.cards-gallery h6 {
  font-size: 17px;
  font-weight: bold; 
}

.gallery-block.cards-gallery .card{
  transition: 0.4s ease; 
}

.gallery-block.cards-gallery .card img {
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15); 
}

.gallery-block.cards-gallery .card-body {
  text-align: center; 
}

.gallery-block.cards-gallery .card-body p {
  font-size: 15px; 
}

.gallery-block.cards-gallery a {
  color: #212529; 
}

.gallery-block.cards-gallery a:hover {
  text-decoration: none; 
}

.gallery-block.cards-gallery .card {
  margin-bottom: 30px; 
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
}

@media (min-width: 576px) {

   .gallery-block .transform-on-hover:hover {
       transform: translateY(-10px) scale(1.02);
       box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.15) !important; 

   }
}

th{
   font-size: 1.5em;
   font-weight: normal;
}
.animated-text{
	display:none;
}
.slider-area{
	display:none;
}
.popular-location{
	padding-top: 70px;
	
}
</style>


    <section class="gallery-block cards-gallery">
       <div class="container">
           <div class="heading">
             <h2>My Riding Diary<small class="test1">추가하기</small></h2>
           </div>
           <br/>
           <div class="row">
              <c:if test="${empty diaryList }" var="isEmpty">
                  <h3>다이어리가 없어요.</h3>
                  <button type="submit" class="btn btn-default">지금 달리러 가기</button>      
              </c:if>
              <c:if test="${!isEmpty}">
                 <c:forEach var="item" items="${diaryList }">
                     <div class="col-md-6 col-lg-4">
                         <div class="card border-0 transform-on-hover">
                            <c:if test="${empty item.DIARY_THUMBNAIL }" var="isEmpty">
                               <img src='<c:url value="/images/bg_1.jpg"/>' alt="Card Image" class="card-img-top">
                            </c:if>
                            <c:if test="${!isEmpty}">
                           <img src=/fileupload/${item.DIARY_THUMBNAIL} class="card-img-top">
                        </c:if>
                             <div class="card-body">
                                 <h6><a href='<c:url value="/mypage/diary/view.do?diaryCode=${item.DIARY_CODE }"/>'>${item.DIARY_TITLE}</a></h6>
                             </div>
                         </div>
                     </div>
                </c:forEach>
             </c:if>
           </div>
       </div>
    </section>   
    <!-- 모달 -->
      
      <div id="myStoryInputModal" class="modal fade" data-backdrop="false">
           <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                     <div class="modal-header">
                          <h2>다이어리 추가하기</h2>
                     </div>
                     <div class="modal-body">
                           <c:if test="${empty recordList }" var="isEmpty">
                           <h3>코스가 없어요.</h3>
                           <button type="submit" class="btn btn-default">지금 달리러 가기</button>      
                        </c:if>
                            <c:if test="${!isEmpty}">
                        <table class="col-sm-12">
                         <c:forEach var="item" items="${recordList }">        
                              <tr>
            
                                  <th>${item.COURSE_NAME }</th>
                                  <th>${item.RECORD_DATE }</th>
                                  <th>${item.RECORD_LENGTH }km</th>
                                  <th><a href='<c:url value="/mypage/diary/write.do?recordId=${item.RECORD_ID }"/>'>추가하기</a></th>
                              </tr>        
                        </c:forEach>
                    </table>
                     </c:if>
                     </div>
                     <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                     </div>
                </div>
           </div>
      </div>
      
      <script>
      	jQuery.noConflict();
      	$(function(){
      		$('.test1').click(function(){
      			console.log('버튼 클릭');
      			$('#myStoryInputModal').modal('show');	
      		})
      		
      			
      	})
      
      	
      </script>
