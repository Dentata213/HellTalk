<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
<script src="https://js.bootpay.co.kr/bootpay-4.2.7.min.js" type="application/javascript"></script>
<script type="module" src="${path}/resources/js/payment.js" data-id="${id}" id="thisscript"></script>
 -->
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
                                            
                                                <tr>
                                                    <td class="product-thumbnail text-left ps-0">
                                                        <img src="https://via.placeholder.com/70x100.png" alt="Product Thumnail" class="w75 rounded-3">
                                                    </td>
                                                    <td class="product-headline text-left wide-column">
                                                        <h3>
                                                            <a href="#" class="text-grey-900 fw-600 font-xsss">Super skinny blazer</a>
                                                        </h3>
                                                    </td>
                                                    <td class="product-p">
                                                        <span class="product-price-wrapper">
                                                            <span class="money text-grey-500 fw-600 font-xsss"><span class="font-xsssss">$</span> 49.00</span>
                                                        </span>
                                                    </td>
                                                    <td class="product-quantity">
                                                        <div class="quantity">
                                                            <input type="number" class="quantity-input open-font fw-600" name="qty" id="qty-1" value="1" min="1">
                                                        <div class="dec qtybutton">-</div><div class="inc qtybutton">+</div></div>
                                                    </td>
                                                    <td class="product-total-price">
                                                        <span class="product-price-wrapper">
                                                            <span class="money fmont"><strong><span class="font-xsssss">$ </span>49.00</strong></span>
                                                        </span>
                                                    </td>
                                                    <td class="product-remove text-right"><a href="#"><i class="ti-trash font-xs text-grey-500"></i></a></td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <table>
									<c:forEach var="list" items="${lists}" varStatus="loop">
										<tr>
											<td>${list.product_img}</td>
											<td>${list.product_no}</td>
											<td>${list.product_quantity}</td>
											<td>${list.product_name}</td>
											<td>${list.product_price}</td>
										</tr>
									</c:forEach>
									</table>
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
        
        
    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>