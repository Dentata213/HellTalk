<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.3.slim.js" integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <!-- main content -->
       <form>
        <div class="main-content bg-white right-chat-active">
            
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left">
                    <div class="row">
                        <div class="col-xl-12 mb-4">
                            <div class="row">
                                <div class="col-lg-12 mb-3">
                                    <div class="card p-lg-5 p-4 bg-primary-gradiant rounded-3 shadow-xss bg-pattern border-0 overflow-hidden">
                                        <div class="bg-pattern-div"></div>
                                        <h2 class="display2-size display2-md-size fw-700 text-white mb-0 mt-0">Checkout  </h2>
                                    </div>
                                </div>                                 
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card bg-greyblue border-0 p-4 mb-5">
                                        <p class="mb-0 mont-font font-xssss text-uppercase fw-600 text-grey-500"><i class="fa fa-exclamation-circle"></i> Have A Coupon? <a class="expand-btn text-grey-500 fw-700" href="#coupon_info">Click Here To Enter Your Code.</a></p>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-6">
                                    <div class="page-title">
                                        <h4 class="mont-font fw-600 font-md mb-lg-5 mb-4">주문결제</h4>
                                        <form action="#">
                                            <div class="row">
                                                <div class="col-lg-6 mb-3">
                                                    <div class="form-gorup">
                                                        <label class="mont-font fw-600 font-xssss">이름</label>
                                                        <input type="text" name="comment-name" class="form-control" id="username" value="${list.u_nickname}">
                                                    </div>        
                                                </div>                                               
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-6 mb-3">
                                                    <div class="form-gorup">
                                                        <label class="mont-font fw-600 font-xssss">Email</label>
                                                        <input type="text" name="comment-name" class="form-control" id="email" value="${list.u_email}">
                                                    </div>        
                                                </div>

                                                <div class="col-lg-6 mb-3">
                                                    <div class="form-gorup">
                                                        <label class="mont-font fw-600 font-xssss">전화번호</label>
                                                        <input type="text" name="comment-name" class="form-control" id="phone" value="${list.u_phoneno}">
                                                    </div>        
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 mb-3">
                                                    <div class="form-gorup">
                                                        <label class="mont-font fw-600 font-xssss"></label>
                                                        <button type="button" name="comment-name" class="form-control" id="sample4_detailAddress" >우편번호 찾기</button>
                                                    </div>        
                                                </div>

                                                <div class="col-lg-6 mb-3">
                                                    <div class="form-gorup">
                                                        <label class="mont-font fw-600 font-xssss">우편번호</label>
                                                        <input type="text" name="comment-name" class="form-control"  id="sample4_postcode" >
                                                     
                                                    </div>        
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 mb-3">
                                                    <div class="form-gorup">
                                                        <label class="mont-font fw-600 font-xssss">기본주소</label>
                                                        <input type="text" name="comment-name" class="form-control" id="sample4_roadAddress">
                                                        <span  id="guide" style="color:#999;display:none"></span>
                                                    </div>        
                                                </div>

                                                <div class="col-lg-12 mb-3">
                                                    <div class="form-gorup">
                                                        <label class="mont-font fw-600 font-xssss">상세주소</label>
                                                        <input type="text" name="comment-name" class="form-control">
                                                    </div>        
                                                </div>
                                            </div>
                                        </form>
                                        
                                    
                                    </div>
                                </div>
                                <div class="col-xl-5 offset-xl-1 col-lg-6">
                                     <div class="order-details">
                                         <h4 class="mont-font fw-600 font-md mb-5">Order Details</h4>
                                         <div class="table-content table-responsive mb-5 card border-0 bg-greyblue p-lg-5 p-4">
                                            <table class="table order-table order-table-2 mb-0">
                                                <thead>
                                                    <tr>
                                                        <th class="border-0">Product</th>
                                                        <th class="text-right border-0">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    
                                                    <c:forEach var="list" items="${lists}" varStatus="loop">
                                                        <tr>
                                                            <th class="text-grey-500 fw-500 font-xsss">Aliquam lobortis est 
                                                                <strong><span>✕</span>${list.product_quantity}</strong>
                                                            </th>
                                                            <td class="text-right text-grey-500 fw-500 font-xsss">$80.00(한개가격)</td>
                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                                <tfoot>
                                                    <tr class="order-total">
                                                        <th>Order Total</th>
                                                        <td class="text-right text-grey-700 font-xsss fw-700">
                                                        	<span class="order-total-ammount">(총결제금액)</span>
                                                        	<input value="" hidden="hidden" id="uniqueNumber" class="hidden"/>
                                                        </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <div class="checkout-payment card border-0 mb-3 bg-greyblue p-lg-5 p-4">
                                           
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="card shadow-none border-0">
                                            <a href="#" id="iamport" class="w-100 p-3 mt-3 font-xsss text-center text-white bg-current rounded-3 text-uppercase fw-600 ls-3">Place Order</a>    
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </div>

                                        

                                     </div>
                                </div>

                            </div>
                        </div>               
                    </div>
                </div>
                 
            </div>            
        </div>
       </form>
        <!-- main content -->
        
    <script>

    
    var themeObj = {
    bgColor: "#162525", //바탕 배경색
    searchBgColor: "#162525", //검색창 배경색
    contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    pageBgColor: "#162525", //페이지 배경색
    textColor: "#FFFFFF", //기본 글자색
    queryTextColor: "#FFFFFF", //검색창 글자색
    //postcodeTextColor: "", //우편번호 글자색
    //emphTextColor: "", //강조 글자색
    outlineColor: "#444444" //테두리
    };

    window.addEventListener('DOMContentLoaded',function(){
    	
    	//우편번호 검색함수
        $('#sample4_detailAddress').click(function postCode() {
            new daum.Postcode({
                theme: themeObj,
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    
                  
                }
            }).open();
        });
        
       
    	//아임포트 결제
        //결제 고유번호 만들기
		var date = new Date();
        var components = [
            date.getFullYear(),
            date.getMonth()+1,
            date.getDate(),
            date.getHours(),
            date.getMinutes(),
            date.getSeconds(),
            date.getMilliseconds()
        ];
        
        var id = components.join("");
		
		//결제용
		var IMP = window.IMP;   // 생략 가능
        IMP.init("imp11666322");        

        $('#iamport').on('click',function(e, xhr, options){    
        	            
           
            
			var pay = parseInt($('#totalprice').text())
            IMP.request_pay({
                pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: id ,   // 주문번호
                name: "노르웨이 회전 의자",
                amount: 100,                         // 숫자 타입
                buyer_email: "kunhyo204@nate.com",
                buyer_name: "홍길동",
                buyer_tel: "010-4242-4242",
                buyer_addr: "서울특별시 강남구 신사동"
            },function (rsp,xhr) { // callback
            	  
            	 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                
	            if (rsp.success) {
	                // 결제 성공 시 로직
	                // jQuery로 HTTP 요청
	                jQuery.ajax({
	                	url : "<c:url value="/payment/verifyIamport/ + rsp.imp_uid"/>", 
	                    method: "POST",
	                    headers: { "Content-Type": "application/json" },
	                    data: {
	                    imp_uid: rsp.imp_uid,            // 결제 고유번호
	                    merchant_uid: rsp.merchant_uid   // 주문번호
	                    }
	                }).done(function (data) {
	                // 가맹점 서버 결제 API 성공시 로직
	                	console.log(data);
	    	        	
	                	
	    	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	    	        	if(rsp.paid_amount == data.response.amount){
	    	        		var msg = '결제가 완료되었습니다.';
		        			msg += '\n고유ID : ' + rsp.imp_uid;
		        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		        			msg += '\결제 금액 : ' + rsp.paid_amount;
		        			msg += '카드 승인번호 : ' + rsp.apply_num;
		        			
	    		        	alert("결제 및 결제검증완료:",msg);
	    	        	} else {
	    	        		alert("결제 실패");
	    	        	}
	            })
	            } else {
	                // 결제 실패 시 로직
	                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
	            }
            })
        });
        
        
        
        
        
        
        
    });//window
    

    </script>
<script src="${path}/resources/js/plugin.js"></script>
<script src="${path}/resources/js/scripts.js"></script>