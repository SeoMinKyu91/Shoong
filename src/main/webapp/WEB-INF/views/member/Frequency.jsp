<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<link rel="stylesheet" href="<c:url value="/css/test.css"/>">
<!-- 여기에 자기가 css새로운거 적용시려고 하면 link걸어서 추가하면 됩니다 -->
<script>
	$(function(){
		var num = 0;
		$('label > input').change(function() {
			num += parseInt($(this).val());
			console.log('num:',num);
			$('#surveyResult').attr("value", num);
		});
	});
</script>
<!-- ※colorlib-main으로 일단 감싸고 안에다가 작업해야 왼쪽 탑에 안먹히고 작업할 수 있어요 -->
<!-- 설명이 이해가 잘 안되시면  따로 연락주세요...-->

<div id="colorlib-main" style="padding-top: 100px">
	<!-- 위에 딱 붙는게 싫어서 임시로 padding-top: 100px 주었음 수정하고싶으면 수정  -->
	<div class="container">
		<div class="col-xs-12 col-md-12">
			<div class="page-header" style="text-align: center">
				<img alt="shoongLogo" src="<c:url value="/images/shooongLogo.png"/>"
					style="width: 100px">
			</div>
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
				<h1></h1>
			</div>
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
				<h1></h1>
			</div>
			<div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
				<h1></h1>
			</div>
		</div>
	</div>
	<div>
		<form class="form-horizontal" method="post"
			action="<c:url value='/Member/Frequency.do?userId=${param.userId}'/>">
			<!-- 설문시작 및 공통 질문(div1) -->
			<div id="riding">
				<div class="form-group">
					<h3>활동량에 대한 설문</h3>
					<div class="radio">
						<h5>1. 당신은 현재 자전거 생활을 즐기고 계십니까?</h5>
						&emsp;<label> <input type="radio" name="riding" value="1">
							예
						</label> <br /> &emsp;<label> <input type="radio" name="riding"
							value="0"> 아니오
						</label>
					</div>
				</div>
			</div>
			<!-- -------------------------------RidingBegin------------------------------ -->
			<div id="ridingBegin">
				<div class="form-group">
					<h4>자전거 활동에 입문하는 회원에 대한 설문</h4>
					<div class="radio">
						<h5>1. 앞으로 자전거 생활에 입문할 계획이면 그 주 목적은 무엇입니까?</h5>
						&emsp;<label> <input type="radio" name="beginReason"
							value="1" /> 이동 수단
						</label> <br /> &emsp;<label> <input type="radio"
							name="beginReason" value="2" /> 건강 관리
						</label> <br /> &emsp;<label> <input type="radio"
							name="beginReason" value="3" /> 다른 운동을 위한 체력 향상
						</label> <br /> &emsp;<label> <input type="radio"
							name="beginReason" value="4" /> 친목 도모
						</label> <br /> &emsp;<label> <input type="radio"
							name="beginReason" value="5" /> 취미
						</label> <br /> &emsp;<label> <input type="radio"
							name="beginReason" value="6" /> 대회 참가
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="radio">
						<h5>2. 자전거 생활에 입문하는데 있어 겪고 있거나 예상되는 어떤 어려움이 있습니까?(복수선택)</h5>
						<label> <input type="checkbox" name="beginDiff" value="1" />
							&nbsp;라이딩 파트너 또는 그룹(동호회 등) 찾기
						</label> <br /> <label> <input type="checkbox" name="beginDiff"
							value="2" /> &nbsp;라이딩 코스 찾기
						</label> <br /> <label> <input type="checkbox" name="beginDiff"
							value="3" /> &nbsp;라이딩 기초 강습
						</label> <br /> <label> <input type="checkbox" name="beginDiff"
							value="4" /> &nbsp;자전거 및 부품/장비 선택
						</label> <br /> <label> <input type="checkbox" name="beginDiff"
							value="5" /> &nbsp;자전거 정비
						</label> <br /> <label> <input type="checkbox" name="beginDiff"
							value="6" /> &nbsp;자전거 피팅
						</label> <br /> <label> <input type="checkbox" name="beginDiff"
							value="7" /> &nbsp;라이딩 실력 향상
						</label>
					</div>
				</div>
			</div>
			<!-- -------------------------------RidingPro------------------------------ -->
			<div id="ridingPro">
				<div class="form-group">
					<h4>자전거를 이미 즐기고 있는 회원에 대한 설문</h4>
					<div class="radio">
						<h5>1. 현재 자전거 생활을 즐기고 계신다면 자전거를 주로 이용하는 목적은 무엇입니까?</h5>
						&emsp;<label> <input type="radio" name="proPurpose"
							value="1" /> 이동 수단
						</label> <br /> &emsp;<label> <input type="radio"
							name="proPurpose" value="2" /> 건강 관리
						</label> <br /> &emsp;<label> <input type="radio"
							name="proPurpose" value="3" /> 다른 운동을 위한 체력 향상
						</label> <br /> &emsp;<label> <input type="radio"
							name="proPurpose" value="4" /> 친목 도모
						</label> <br /> &emsp;<label> <input type="radio"
							name="proPurpose" value="5" /> 취미
						</label> <br /> &emsp;<label> <input type="radio"
							name="proPurpose" value="6" /> 대회 참가
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="radio">
						<h5>2. 자전거를 얼마나 자주 탑니까?</h5>
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
						<h5>3. 주로 즐기는 라이딩의 종류는 어떤 것 입니까?</h5>
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
						<h5>4. 자전거를 본격적으로 타기 시작한 기간은 얼마나 됩니까?</h5>
						&emsp;<label> <input type="radio" name="proTerm" value="1" />
							1년 미만
						</label> <br /> &emsp;<label> <input type="radio" name="proTerm"
							value="2" /> 1년 이상 3년 미만
						</label> <br /> &emsp;<label> <input type="radio" name="proTerm"
							value="3" /> 3년 이상 5년 미만
						</label> <br /> &emsp;<label> <input type="radio" name="proTerm"
							value="4" /> 5년 이상
						</label>
					</div>
				</div>
				<div class="form-group">
					<div class="radio">
						<h5>5. 자전거 생활에 입문하는데 있어 겪고 있거나 예상되는 어떤 어려움이 있습니까?(복수선택)</h5>
						<label> <input type="checkbox" name="proDiff" value="1" />
							&nbsp;라이딩 파트너 또는 그룹(동호회 등) 찾기
						</label> <br /> <label> <input type="checkbox" name="proDiff"
							value="2" /> &nbsp;라이딩 코스 찾기
						</label> <br /> <label> <input type="checkbox" name="proDiff"
							value="3" /> &nbsp;라이딩 기초 강습
						</label> <br /> <label> <input type="checkbox" name="proDiff"
							value="4" /> &nbsp;자전거 및 부품/장비 선택
						</label> <br /> <label> <input type="checkbox" name="proDiff"
							value="5" /> &nbsp;자전거 정비
						</label> <br /> <label> <input type="checkbox" name="proDiff"
							value="6" /> &nbsp;자전거 피팅
						</label> <br /> <label> <input type="checkbox" name="proDiff"
							value="7" /> &nbsp;라이딩 실력 향상
						</label> <br /> <label> <input type="checkbox" name="proDiff"
							value="8" /> &nbsp;나에게 맞는 훈련 방법
						</label>
					</div>
				</div>
			</div>
			<div class=" col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<input type="hidden" class="form-control" name="surveyResult" id="surveyResult">
			</div>
			<div class="form-group col-xs-10 offset-xs-1 col-md-4 offset-md-4">
				<button type="submit" id="submitSurvey" class="btn btn-primary btn-lg btn-block">설문 제출</button>
			</div>
		</form>
	</div>
</div>
<!-- END COLORLIB-PAGE -->
