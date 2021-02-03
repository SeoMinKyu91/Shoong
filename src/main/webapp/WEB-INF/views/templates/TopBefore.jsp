<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">

<!-- 선택페이지 class="colorlib-active" 추가해주는 스크립트 만들기 -->
<style>
	.box{ -ms-overflow-style: none; } 
	.box::-webkit-scrollbar{ display:none; }
</style>

<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<div class="container-fluid">
		<!--화면 크기가 작을때 보여지는 네비게이션바(모바일용)  -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#collapse-menu">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href='<c:url value="/"/>'><span
				class="glyphicon glyphicon-education"></span> KOSMO</a>
		</div>
		<!-- 화면 크기가 클때 상단에 보여지는 메뉴(데스크탑용) -->
		<div class="collapse navbar-collapse" id="collapse-menu">
			<!-- 네비게이션바에 폼 추가 -->
			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색">
				</div>
				<button type="submit" class="btn btn-info">확인</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/"/>">HOME</a></li>
				<c:if test="${empty sessionScope.id}" var="isNotlogin">
					<li><a href="<c:url value="/OneMemo/Auth/Login.do"/>">로그인</a></li>
				</c:if>
				<c:if test="${not isNotlogin }">
					<li><a href="javascript:logout()">로그아웃</a></li>
				</c:if>
				<li><a href="<c:url value="/OneMemo/BBS/List.do"/>">한줄 댓글
						게시판</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
		</div>
	</div>
</nav>