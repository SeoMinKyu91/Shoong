<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<style>
label {
	color: #36383b;
}

h3 {
	color: black;
	font-weight: bold;
}

h4 {
	color: black;
	font-weight: bold;
	text-align: center;
	padding-bottom: 20px
}

h6 {
	color: black;
	font-weight: bold;
}
</style>
<script>
	$(function() {
		var num = 0;
		$('label > input').change(function() {
			num += parseInt($(this).val());
			console.log('num:', num);
			$('#surveyResult').attr("value", num);
		});
	});
</script>
<!-- ※colorlib-main으로 일단 감싸고 안에다가 작업해야 왼쪽 탑에 안먹히고 작업할 수 있어요 -->
<!-- 설명이 이해가 잘 안되시면  따로 연락주세요...-->

<div id="colorlib-main" style="padding-top: 100px;">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->
	<div class="wrapper">
		<div class="container">
			<div class="col-xs-12 col-md-12">
				<div class="page-header" style="text-align: center">
					<a href="<c:url value="/"/>"><img alt="shoongLogo"
					src="<c:url value="/images/shooongLogo.png"/>"
					style="width: 100px; padding-bottom: 50px"></a>
				</div>
			</div>
		</div>
		<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2"
			style="padding-bottom: 50px">
			<form class="form-horizontal" method="post"
				style="background-color: white; box-shadow: 0px 0px 5px #000; border-radius: 100px;"
				action="<c:url value='/Member/Frequency.do?userId=${param.userId}'/>">
				<!-- 설문시작 및 공통 질문(div1) -->
				<div class="col-xs-10 offset-xs-1 col-md-8 offset-md-2" 
					style="padding-top: 40px; padding-bottom: 40px; text-align: center">
					<h3 style="font-weight: bold">활동량에 대한 설문</h3>
				</div>
				<div class="col-xs-10 offset-xs-1 col-md-10 offset-md-1">
					<div class="form-group">
						<div class="radio" id="ridingQue" style="padding-bottom: 15px">
							<h6>1. 당신은 현재 자전거를 즐기고 계십니까?</h6>
							&emsp;<label> <input type="radio" id="riding"
								name="riding" value="1"> 예
							</label> <br /> &emsp;<label> <input type="radio" id="riding"
								name="riding" value="2"> 아니오
							</label>
						</div>
						<div class="radio">
							<h6>2. 자전거에 관심을 가지게 된 계기는 무엇입니까?</h6>
							&emsp;<label> <input type="radio" name="ridingReason"
								id="ridingReason" value="1" /> 이동 수단
							</label> <br /> &emsp;<label> <input type="radio"
								name="ridingReason" value="2" /> 건강 관리
							</label> <br /> &emsp;<label> <input type="radio"
								name="ridingReason" value="3" /> 다른 운동을 위한 체력 향상
							</label> <br /> &emsp;<label> <input type="radio"
								name="ridingReason" value="4" /> 친목 도모
							</label> <br /> &emsp;<label> <input type="radio"
								name="ridingReason" value="5" /> 취미
							</label> <br /> &emsp;<label> <input type="radio"
								name="ridingReason" value="6" /> 대회 참가
							</label>
						</div>
					</div>
					<!-- -------------------------------RidingBegin------------------------------ -->
					<div class="form-group" id="ridingBegin">
						<h4>자전거에 관심은 있지만 잘 모르는 회원에 대한 설문</h4>
						<div class="radio">
							<h6>3. 자전거를 타기에 앞서 현재 겪고 있거나 예상되는 어려움이 무엇입니까?(복수선택)</h6>
							&emsp;<label> <input type="checkbox" name="beginDiff" value="1" />
								&nbsp;라이딩 파트너 또는 그룹(동호회 등) 찾기
							</label> <br /> &emsp;<label> <input type="checkbox" name="beginDiff"
								value="2" /> &nbsp;라이딩 코스 찾기
							</label> <br /> &emsp;<label> <input type="checkbox" name="beginDiff"
								value="3" /> &nbsp;라이딩 기초 강습
							</label> <br /> &emsp;<label> <input type="checkbox" name="beginDiff"
								value="4" /> &nbsp;자전거 및 부품/장비 선택
							</label> <br /> &emsp;<label> <input type="checkbox" name="beginDiff"
								value="5" /> &nbsp;자전거 정비
							</label> <br /> &emsp;<label> <input type="checkbox" name="beginDiff"
								value="6" /> &nbsp;자전거 피팅
							</label> <br /> &emsp;<label> <input type="checkbox" name="beginDiff"
								value="7" /> &nbsp;라이딩 실력 향상
							</label>
						</div>
					</div>
					<!-- -------------------------------RidingPro------------------------------ -->
					<div id="ridingPro" class="form-group">
						<h4>자전거에 관심도가 높고 즐기고 있는 회원에 대한 설문</h4>
						<div class="form-group">
							<div class="radio">
								<h6>3. 자전거를 얼마나 자주 탑니까?</h6>
								&emsp;<label> <input type="radio" name="proFrequency"
									value="1" /> 연 1회
								</label> <br /> &emsp;<label> <input type="radio"
									name="proFrequency" value="2" /> 한 달에 1회
								</label> <br /> &emsp;<label> <input type="radio"
									name="proFrequency" value="3" /> 한 달에 2 ~ 3회
								</label> <br /> &emsp;<label> <input type="radio"
									name="proFrequency" value="4" /> 주 1회 이상
								</label> <br /> &emsp;<label> <input type="radio"
									name="proFrequency" value="5" /> 주 3회이상
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="radio">
								<h6>4. 주로 즐기는 라이딩의 종류는 어떤 것 입니까?</h6>
								&emsp;<label> <input type="radio" name="proRiding"
									value="1" /> 도로 라이딩
								</label> <br /> &emsp;<label> <input type="radio"
									name="proRiding" value="2" /> 산악 라이딩
								</label> <br /> &emsp;<label> <input type="radio"
									name="proRiding" value="3" /> 시티 투어
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="radio">
								<h6>5. 자전거를 본격적으로 타기 시작한 기간은 얼마나 됩니까?</h6>
								&emsp;<label> <input type="radio" name="proTerm"
									value="1" /> 1년 미만
								</label> <br /> &emsp;<label> <input type="radio"
									name="proTerm" value="2" /> 1년 이상 3년 미만
								</label> <br /> &emsp;<label> <input type="radio"
									name="proTerm" value="3" /> 3년 이상 5년 미만
								</label> <br /> &emsp;<label> <input type="radio"
									name="proTerm" value="4" /> 5년 이상
								</label>
							</div>
						</div>
						<div class="form-group">
							<div class="checkbox">
								<h6>6. 자전거를 타면서 현재 겪고 있는 어려움이 무엇입니까?(복수선택)</h6>
								&emsp;<label> <input type="checkbox" name="proDiff" value="1" />
									&nbsp;라이딩 파트너 또는 그룹(동호회 등) 찾기
								</label> <br />&emsp;<label> <input type="checkbox" name="proDiff"
									value="2" /> &nbsp;라이딩 코스 찾기
								</label> <br /> &emsp;<label> <input type="checkbox" name="proDiff"
									value="3" /> &nbsp;라이딩 기초 강습
								</label> <br /> &emsp;<label> <input type="checkbox" name="proDiff"
									value="4" /> &nbsp;자전거 및 부품/장비 선택
								</label> <br /> &emsp;<label> <input type="checkbox" name="proDiff"
									value="5" /> &nbsp;자전거 정비
								</label> <br /> &emsp;<label> <input type="checkbox" name="proDiff"
									value="6" /> &nbsp;자전거 피팅
								</label> <br /> &emsp;<label> <input type="checkbox" name="proDiff"
									value="7" /> &nbsp;라이딩 실력 향상
								</label> <br /> &emsp;<label> <input type="checkbox" name="proDiff"
									value="8" /> &nbsp;나에게 맞는 훈련 방법
								</label>
							</div>
						</div>
					</div>
					<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
						<input type="hidden" class="form-control" name="surveyResult"
							id="surveyResult">
					</div>
					<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4"
						style="padding-bottom: 50px">
						<button type="submit" id="submitSurvey"
							class="btn btn-primary btn-lg btn-block">설문 제출</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(
		function(){
			$('#ridingBegin').hide();
			$('#ridingPro').hide();
	});
	
	$('#ridingQue').change(function(){
		$(":input:radio[name=riding]:checked").each(function(){
			if($(this).val() == '2'){
				$('#ridingBegin').show();
				$('#ridingPro').hide();
			}
			else{
				$('#ridingPro').show();
				$('#ridingBegin').hide();
			}
		});
	});
	$('#submitSurvey').click(function(){
		$('.form-group > .checkbox > input').click(function(){
			console.log('2click');
		});
	});
</script>

<!-- 추가 작업 예정 : 전체 유효성 체크 -->
<script>

</script>
