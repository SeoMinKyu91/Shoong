<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!--  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.5.0/main.min.css,npm/fullcalendar@5.5.0/main.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css">
-->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/locales-all.min.js"></script>

<style>
.packMainBtn {
	color: #f32a48;
	background: none;
	font-weight: bold;
	border: #f32a48 1px solid;
}

.packMainBtn:hover {
	color: white;
}

.packCreateBtn:hover {
	color:white;
	background-color: #ff8827;
}

#bg {
	position: fixed;
	top: 0;
	left: 0;
	opacity: 0.5;
	/* Preserve aspet ratio */
	min-width: 100%;
	min-height: 100%;
}

.userThumbnailImg{
	border-radius: 100%;
	width: 50px;
	height: 50px;
}

.animated-text {
	display: none;
}

.slider-area {
	display: none;
}

#tableTitle th{
	background-color: #052b52;
	color: white;
}

#tableTitle th:hover{
	none;
}
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div
	style="border-radius: 10px; box-shadow: 0px 0px 5px #787878; padding: 30px; background-color: white;  position: relative; z-index: 1;">
	<div class="row">
		<div class="col-xs-12 col-lg-12" style="padding-bottom: 20px">
			<div class="">
				<a class="packMainBtn btn" href="<c:url value="/pack/view.do"/>"
					style="margine-right: 20px">HOME</a>
			</div>
		</div>
	</div>
	<div class="row" style="margin-bottom: 30px;">
		<div class="col-xs-12 col-md-12 col-lg-12">
			<p style="padding-top: 14px; padding-left: 10px; color: black; font-weight: bold; font-size: 1.8em; text-align: center">랭&nbsp;킹</p>
		</div>
	</div>
	<div class="row">
		<div class="offset-lg-1 col-lg-10">
			<table class="table table-hover">
				<tr id="tableTitle">
					<th class="text-center">랭킹</th>
					<th class="text-center">이름</th>
					<th class="text-center">마일리지</th>
				</tr>
				<c:forEach items="${packRank }" var="item" varStatus="loop">
					<tr class="text-center">
						<td>${loop.index+1 }</td>
						<td class="text-center">${item.NAME }</td>
						<c:if test="${empty item.MILEAGE}" var="noMileage">
							<td>0</td>
						</c:if>
						<c:if test="${!noMileage }">
							<td>${item.MILEAGE }</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	
	
	
	
</div>



<script>
   
   $(function(){
      
      
      
   })
   
    

   
</script>