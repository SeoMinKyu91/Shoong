<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<div id="colorlib-main" style="padding-top: 30px;padding-left: 30px">
	<div style="margin-bottom: 2%">${sessionScope.id}님 정보수정</div>
	<div style="width: 40%;display: inline-block;margin-right: 8%">
		<p>활동 지역 변경</p>
		<p>  시     구</p>
	</div>
	<div style="width: 40%;display: inline-block;">
		<span>뱃지수정</span>
	</div>
	<div style="margin-top: 10%">
		<input type="button" value="번호 수정" />
		<input type="button" value="비밀번호 변경" />
	</div>
</div>