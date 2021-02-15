<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<style>
.imgdiv {
	margin: 8px;
	display: inline-block;
	position: relative
}

.img {
	width: 90px;
	height: 90px;
}

.
.diaryInfo {
	margin-top: 40px;
	font-family: 'Nanum Pen Script', cursive;
}

.diaryInfo div {
	font-size: 25px;
	outline: none;
	background-color: #EFF8FB;
	display: inline-block;
	height: 41px;
	line-height: 41px;
	margin-bottom: 20px;
}

.diaryInfo .diaryTitle {
	width: 100%;
	font-size: 20px;
}

.diaryInfo .diaryContent {
	height: 200px;
	width: 100%;
	font-size: 20px;
}

.diaryInfo span {
	width: 100%;
	font-size: 22px;
}

.animated-text {
	display: none;
}

.slider-area {
	display: none;
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

.mainDiv {
	border-radius: 10px;
	box-shadow: 0px 0px 5px #787878;
	padding: 30px;
	padding-bottom:50px;
	background-color: white;
	position: relative;
	z-index: 1;
}

h3 {
	text-align: center;
}

img {
	display: block;
	margin: 0px auto;
}
#myStorySave{
	float: right;
}
</style>
<img src="<c:url value='/change/img/MainPicture.jpg'/>" id="bg" alt="">
<div class="mainDiv">
	<h3>이미지 상세 내용 (${row}/${imgMap.DIARY_IMG_COUNT})</h3><br/>
	<div style="height: 100%;">
		<div>
			<img style="height: 400px; width: 600px;"
				src="/fileupload/${imgMap.DIARY_IMG_NAME}" alt="팩갤러리 사진">
		</div>
		<br/>
		<div class="diaryInfo">
			<span>▶ 소제목입력</span><br>
			<div class="diaryTitle" id="titleDiv" contenteditable="true"></div><br/>
			<span>▶ 내용입력 </span> <br><br/>
			<div class="diaryContent" id="contentDiv" contenteditable="true"></div>
		</div>
	</div>
	<div>
		<form method="post"
			action="<c:url value="/mypage/diary/story/writeOk.do"/>">
			<input class="form-control" name="title" id="title" type="hidden">
			<input class="form-control" name="content" id="content" type="hidden">
			<input class="form-control" name="imgCount"
				value="${imgMap.DIARY_IMG_COUNT}" type="hidden"> <input
				class="form-control" name="imgCode" value="${imgMap.DIARY_IMG_CODE}"
				type="hidden"> <input class="form-control" name="diaryCode"
				value="${imgMap.DIARY_CODE}" type="hidden"> <input
				class="form-control" name="row" value="${row}" type="hidden">
			<button type="submit" id="myStorySave" class="btn btn-default">다음</button>
		</form>

	</div>
</div>
<script>
	$("#myStorySave").click(function() {

		var title = $("#titleDiv").html();
		var content = $("#contentDiv").html();

		$("#title").val(title);
		$("#content").val(content);

	})
</script>