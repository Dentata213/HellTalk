<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

        <!-- main content -->
        <div class="main-content right-chat-active">
            
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left">
                    <div class="row">
                        <div class="col-xl-12 mt-3">
                            <div class="row">
                                <div class="col-lg-5 offset-lg-1 mb-4">
                                      <img data-thumb="<img src='https://via.placeholder.com/350x350.png' />" src="https://via.placeholder.com/350x350.png" alt="icon">
                                </div>
                                <div class="col-lg-6  col-md-12 pad-top-lg-200 pad-bottom-lg-100 pad-top-100 pad-bottom-75 ps-md--5">
                                    <h4 class="text-danger font-xssss fw-700 ls-2">365폐업준비</h4>
                                    <h2 class="fw-700 text-grey-900 display1-size lh-3 porduct-title display2-md-size">상품명</h2>
                                   
                                    <div class="clearfix"></div>
                                    <p class="font-xsss fw-400 text-grey-500 lh-30 pe-5 mt-3 me-5">매우 엄청나고 대단한 상품에 대한 소란스럽고 웅장한 설명, 매우 엄청나고 대단한 상품에 대한 소란스럽고 웅장한 설명, 매우 엄청나고 대단한 상품에 대한 소란스럽고 웅장한 설명, 매우 엄청나고 대단한 상품에 대한 소란스럽고 웅장한 설명</p>

                                    <h6 class="display2-size fw-700 text-current ls-2 mb-2">10,000<span class="font-xl">원</span>&nbsp;<span class="font-xs text-grey-500" style="text-decoration: line-through;">12,000원</span></h6>
                                    
                                    <div class="clearfix"></div>
                                    <form action="#" class="form--action mt-4 mb-3" method="POST">
                                        <div class="product-action flex-row align-items-center">
                                            <div class="quantity me-3">
                                                <input type="number" class="quantity-input" name="qty" id="qty" value="1" min="1">
                                                <div class="dec qtybutton">-</div>
                                                <div class="inc qtybutton">+</div>
                                            </div>
                                      
                                            <a href="<c:url value="/payment/mycart"/>" class="add-to-cart bg-dark text-white fw-700 ps-lg-5 pe-lg-5 text-uppercase font-xssss float-left border-dark border rounded-3 border-size-md d-inline-block mt-0 p-3 text-center ls-3">장바구니 담기</a>
                                            <a href="#" class="btn-round-xl alert-dark text-white d-inline-block mt-0 ms-4 float-left"><i class="ti-heart font-sm"></i></a>
                                        </div>  
                                    </form>
                                    <div class="clearfix"></div>

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


