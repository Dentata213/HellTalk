<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.3.slim.js"
	integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc="
	crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- main content -->

<div>
	<div>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</div>
</div>

<!-- main content -->

<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	var themeObj = {
		bgColor : "#162525", //바탕 배경색
		searchBgColor : "#162525", //검색창 배경색
		contentBgColor : "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		pageBgColor : "#162525", //페이지 배경색
		textColor : "#FFFFFF", //기본 글자색
		queryTextColor : "#FFFFFF", //검색창 글자색
		//postcodeTextColor: "", //우편번호 글자색
		//emphTextColor: "", //강조 글자색
		outlineColor : "#444444" //테두리
	};

	window
			.addEventListener(
					'DOMContentLoaded',
					function() {

						//우편번호 검색함수
						$('#sample4_detailAddress')
								.click(
										function postCode() {
											new daum.Postcode(
													{
														theme : themeObj,
														oncomplete : function(
																data) {
															// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

															// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
															// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
															var roadAddr = data.roadAddress; // 도로명 주소 변수
															var extraRoadAddr = ''; // 참고 항목 변수

															// 법정동명이 있을 경우 추가한다. (법정리는 제외)
															// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
															if (data.bname !== ''
																	&& /[동|로|가]$/g
																			.test(data.bname)) {
																extraRoadAddr += data.bname;
															}
															// 건물명이 있고, 공동주택일 경우 추가한다.
															if (data.buildingName !== ''
																	&& data.apartment === 'Y') {
																extraRoadAddr += (extraRoadAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
															if (extraRoadAddr !== '') {
																extraRoadAddr = ' ('
																		+ extraRoadAddr
																		+ ')';
															}

															// 우편번호와 주소 정보를 해당 필드에 넣는다.
															document
																	.getElementById('sample4_postcode').value = data.zonecode;
															document
																	.getElementById("sample4_roadAddress").value = roadAddr;

														}
													}).open();
										});

						//아임포트 결제
						//결제 고유번호 만들기
						var date = new Date();
						var components = [ date.getFullYear(),
								date.getMonth() + 1, date.getDate(),
								date.getHours(), date.getMinutes(),
								date.getSeconds(), date.getMilliseconds() ];

						var id = components.join("");

						//결제용
						var IMP = window.IMP; // 생략 가능
						IMP.init("imp11666322");

						$('#iamport')
								.on(
										'click',
										function() {

											var pay = parseInt($('#totalprice')
													.text())
											IMP
													.request_pay(
															{
																pg : "html5_inicis",
																pay_method : "card",
																merchant_uid : id, // 주문번호
																name : "노르웨이 회전 의자",
																amount : 100, // 숫자 타입
																buyer_email : "gildong@gmail.com",
																buyer_name : "홍길동",
																buyer_tel : "010-4242-4242",
																buyer_addr : "서울특별시 강남구 신사동"
															},
															function(rsp) { // callback
																if (rsp.success) {
																	// 결제 성공 시 로직
																	// jQuery로 HTTP 요청
																	jQuery
																			.ajax(
																					{
																						url : "/payment/checkout",
																						method : "POST",
																						headers : {
																							"Content-Type" : "application/json"
																						},
																						data : {
																							imp_uid : rsp.imp_uid, // 결제 고유번호
																							merchant_uid : rsp.merchant_uid
																						// 주문번호
																						}
																					})
																			.done(
																					function(
																							data) {
																						// 가맹점 서버 결제 API 성공시 로직
																						console
																								.log(data);

																						// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
																						if (rsp.paid_amount == data.response.amount) {
																							alert("결제 및 결제검증완료");
																						} else {
																							alert("결제 실패");
																						}
																					})
																} else {
																	// 결제 실패 시 로직
																	alert("결제에 실패하였습니다. 에러 내용: "
																			+ rsp.error_msg);
																}
															})
										});

					});//window
</script>
<script src="${path}/resources/js/plugin.js"></script>
<script src="${path}/resources/js/scripts.js"></script>