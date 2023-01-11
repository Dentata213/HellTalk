<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- main content -->
        <div class="main-content bg-white right-chat-active">
            
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left">
                    <div class="row">
                        <div class="col-xl-12 cart-wrapper mb-4">
                            <div class="row">
                                <div class="col-lg-12 mb-3">
                                    <div class="card p-md-5 p-4 bg-primary-gradiant rounded-3 shadow-xss bg-pattern border-0 overflow-hidden">
                                        <div class="bg-pattern-div"></div>
                                        <h2 class="display2-size display2-md-size fw-700 text-white mb-0 mt-0">Cart <span class="fw-700 ls-3 text-grey-200 font-xsssss mt-2 d-block">4 PRODUCT FOUND</span></h2>
                                    </div>
                                </div>


                            </div>
                            <div class="row">
                                <div class="col-lg-8 mb-3">
                                    <div class="table-content table-responsive">
                                        <table class="table text-center">
                                            <thead class="bg-greyblue rounded-3">
                                                <tr>
                                                    <th class="border-0 p-4">&nbsp;</th>
                                                    <th class="border-0 p-4 text-left">Product</th>
                                                    <th class="border-0 p-4">Price</th>
                                                    <th class="border-0 p-4">Quantity</th>
                                                    <th class="border-0 p-4">Total</th>
                                                    <th class="border-0 p-4">&nbsp;</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="list" items="${lists}" varStatus="loop">
                                                <tr>
                                                    <td class="product-thumbnail text-left ps-0">
                                                        <img src="data:image/jpeg;base64,${list.product_img}" alt="Product Thumnail" class="w75 rounded-3">
                                                    </td>
                                                    <td class="product-headline text-left wide-column">
                                                        <h3>
                                                            <a href="#" class="text-grey-900 fw-600 font-xsss">${list.product_name}</a>
                                                        </h3>
                                                    </td>
                                                    <td class="product-p">
                                                        <span class="product-price-wrapper">
                                                            <span class="money text-grey-500 fw-600 font-xsss">${list.product_price}<span class="font-xsssss"> 원</span></span>
                                                        </span>
                                                    </td>
                                                    <td class="product-quantity">
                                                        <div class="quantity">
                                                            <input type="number" class="quantity-input open-font fw-600" name="qty" id="qty-1" value="${list.product_quantity}" min="1">
                                                        <div class="dec qtybutton">-</div><div class="inc qtybutton">+</div></div>
                                                    </td>
                                                    <td class="product-total-price">
                                                        <span class="product-price-wrapper">
                                                            <span class="money fmont"><strong>${list.product_price*list.product_quantity}<span class="font-xsssss"> 원</span></strong></span>
                                                        </span>
                                                    </td>
                                                    <td class="product-remove text-right"><a href="#"><i class="ti-trash font-xs text-grey-500"></i></a></td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--table>
									<c:forEach var="list" items="${lists}" varStatus="loop">
										<tr>
											<td>ProductImg:${list.product_img}/</td>
											<td>ProductName:${list.product_name}/</td>
											<td>${list.product_no}</td>
											<td>Price:${list.product_price}/</td>
											<td>Quantity:${list.product_quantity}/</td>
											<td>Total:${list.product_price*list.product_quantity}
										</tr>
									</c:forEach>
									</table-->
                                    <a href="#" class="update-cart bg-dark float-right text-white fw-600 text-uppercase font-xssss border-dark border rounded-3 border-size-md d-inline-block w175 p-3 text-center ls-3">Update Cart</a>
                                </div>
                                <div class="col-lg-4">
                                    <div class="checkout-payment card border-0 mb-3 bg-greyblue p-4">
                                        <div class="cart-totals">
                                            <h4 class="mont-font fw-600 font-md mb-5">Cart totals</h4>
                                            <div class="table-content table-responsive">
                                                <table class="table order-table">
                                                    <tbody>
                                                        <tr>
                                                            <td class="font-xsss pt-2 fw-600">Subtotal</td>
                                                            <td class="font-xssss fw-700 text-grey-600 pt-2 text-right">$196.00</td>  
                                                        </tr>
                                                        <tr>
                                                            <td class="font-xsss pt-2 fw-600">Shipping</td>
                                                            <td class="font-xssss fw-700 text-grey-600 pt-2 text-right">
                                                                <span>Flat rate: $20.00</span>
                                                            </td>  
                                                        </tr>
                                                        <tr class="order-total">
                                                            <td class="font-xsss pt-2 fw-600">Total</td>
                                                            <td class="font-xssss fw-700 text-grey-600 pt-2 text-right">
                                                                <span class="product-price-wrapper">
                                                                    <span class="money fmont">$226.00</span>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <a href="/payment/checkout" class="bg-dark float-right text-white fw-600 text-uppercase font-xsss border-dark border rounded-3 border-size-md d-inline-block w-100 p-3 text-center ls-3">결재하기</a>
                                </div>
                            </div>
                        </div>               
                    </div>
                </div>
                 
            </div>            
        </div>
        <!-- main content -->
        
    <script>
    	//이미지의 BASE64값 4000자 분리용
	    var str = '${BASE64}';
	    var arr = str.split(',');
	    arr[0] = arr[0].replace("[","");
	    arr[arr.length-1] = arr[arr.length-1].replace("]","");
	    for(i=0; i<arr.length; i++){
	    	arr[i] = arr[i].replace(" ","");
	    	console.log(arr[i]);
	    }
    </script>  
    
    <!--  
부트페이 라이브러리
<script src="https://js.bootpay.co.kr/bootpay-4.2.7.min.js" type="application/javascript"></script>
단일결재호출 - 값들을 넘겨줘야함 application_id, id, name, total가격, ordername(상품명 연결, 일정길이 이상이면 추출후 ...으로 replace), orderid(임의로 생성)
<script type="module" src="${path}/resources/js/payment.js" data-id="${id}" data-name="${name}" id="thisscript"></script>
 -->
 <!-- 혹은 단일결재 실행(단, 결재버튼 누를시에 실행되어야됨) 
 	<script type="module">
 		const response = await Bootpay.requestPayment({
    	"application_id": "",
    	"price": 1000,
    	"order_name": "테스트결제품목",
    	"order_id": "TEST_ORDER_ID000000000000001",
    	"pg": "카카오",
    	"user": {
        	"id": id,
        	"username": "회원이름"
    	}
    	})
 	</script>
 -->
    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>