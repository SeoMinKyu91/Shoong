<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ���⿡ �ڱⰡ css���ο�� ����÷��� �ϸ� link�ɾ �߰��ϸ� �˴ϴ� -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- ���⿡ �ڱⰡ css���ο�� ����÷��� �ϸ� link�ɾ �߰��ϸ� �˴ϴ� -->
<div id="colorlib-main" style="padding-top: 30px;padding-left: 30px">
	<div style="margin-bottom: 2%">${sessionScope.id}�� ��������</div>
	<div style="width: 40%;display: inline-block;margin-right: 8%">
		<p>Ȱ�� ���� ����</p>
		<p>  ��     ��</p>
	</div>
	<div style="width: 40%;display: inline-block;">
		<span>��������</span>
	</div>
	<div style="margin-top: 10%">
		<input type="button" value="��ȣ ����" />
		<input type="button" value="��й�ȣ ����" />
	</div>
</div>