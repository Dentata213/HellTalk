<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.3.slim.js" integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
                                                	<th class="border-0 p-4"><input value="1" hidden="hidden" id="uno"/><input type="checkbox"><input value="all" hidden="hidden" id="all"/></th>
                                                    <th class="border-0 p-4">&nbsp;</th>
                                                    <th class="border-0 p-4 text-left">Product</th>
                                                    <th class="border-0 p-4">Price</th>
                                                    <th class="border-0 p-4">Quantity</th>
                                                    <th class="border-0 p-4">Total</th>
                                                    <th class="border-0 p-4">&nbsp;</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="list" items="${lists}" varStatus="loop" >
                                           
                                                <tr>
                                                	<td><input type="checkbox"><input value="${list.product_no}" hidden="hidden"/></td>
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
                                                            <span class="money text-grey-500 fw-600 font-xsss" id="oneprice">${list.product_price}</span>
                                                            <span class="font-xsssss"> ???</span>
                                                        </span>
                                                    </td>
                                                    <td class="product-quantity">
                                                    	
                                                        <div class="quantity">
                                                        	<input value="${list.product_no}" hidden="hidden" id="cartnum" class="hidden"/>
                                                            <input type="number" class="quantity-input open-font fw-600" name="qty"
															id="qty-1" value="${list.product_quantity}" min="1">
															<div class="dec qtybutton down" id="down">-</div>
															<div class="inc qtybutton up" id="up">+</div>
														</div>
                                                    </td>
                                                    <td class="product-total-price">
                                                        <span class="product-price-wrapper">
                                                            <strong id="onetotalprice"><span class="money fmont">${list.product_price*list.product_quantity}</strong> ???</span>
                                                        </span>
                                                    </td>
												 <td class="product-remove text-right">
                                                        <a href="#"><i class="ti-trash font-xs text-grey-500"></i></a>
                                                        <input value="1" hidden="hidden" id="cartnum" class="hidden"/>
                                                    </td>
											</tr>
                                             
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                  
                                    <a href="#" class="update-cart bg-dark float-right text-white fw-600 text-uppercase font-xssss border-dark border rounded-3 border-size-md d-inline-block w175 p-3 text-center ls-3">Update Cart</a>
                                </div>
                                <div class="col-lg-4">
                                    <div class="checkout-payment card border-0 mb-3 bg-greyblue p-4">
                                        <div class="cart-totals">
                                            <h4 class="mont-font fw-600 font-md mb-5">Cart totals</h4>
                                            <div class="table-content table-responsive">
                                                <table class="table order-table">
                                                    <tbody>
                                                        
                                                        <tr class="order-total">
                                                            <td class="font-xsss pt-2 fw-600">??????????????????</td>
                                                            <td class="font-xssss fw-700 text-grey-600 pt-2 text-right">
                                                                <span class="product-price-wrapper">
                                                                    <span class="money fmont" id="totalprice">${totalprice}</span>
                                                                    <strong><input value="${totalprice}" hidden="hidden" id="totalhidden"/></strong>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <form action="<c:url value="/payment/order.do"/>" id="payinfo" onsubmit="">
                                    	<button class="bg-dark float-right text-white fw-600 text-uppercase font-xsss border-dark border rounded-3 border-size-md d-inline-block w-100 p-3 text-center ls-3">????????????</button>
                                    	<input hidden="hidden" id="hiddenInfo" value="">
                                    </form>
                                </div>
                            </div>
                        </div>               
                    </div>
                </div>
                 
            </div>            
        </div>
        <!-- main content -->
        
    <script>
	//???????????? BASE64??? 4000??? ?????????
	var str = '${BASE64}';
	var arr = str.split(',');
	arr[0] = arr[0].replace("[", "");
	arr[arr.length - 1] = arr[arr.length - 1].replace("]", "");
	for (i = 0; i < arr.length; i++) {
		arr[i] = arr[i].replace(" ", "");
		console.log(arr[i]);
	}
	
	
	document.addEventListener('DOMContentLoaded', function() {
		//?????? ?????? ??????	  
		$('div.quantity').click(
			
			function(e) {
				
				console.log('???????????????');
				var p_num = parseInt($(this).children('input[type=number]').val());
				
				var newval = e.target.classList.contains('up') ? p_num + 1
						: e.target.classList.contains('down') ? p_num - 1
								: p_num;
				
				var product_no= $(this).children('input[hidden=hidden]').val();
				if (parseInt(newval) < 1 || parseInt(newval) > 10) {
					return false;
				}	
				$(this).children('input[type=number]').attr('value', newval);
				console.log('???????????????'+newval);
				
				var event = $(this);
				var onePrice = parseInt(event.parent().prev().children().children('#oneprice').text());	
				
				function newPrice(data) {
					//var oneTotal = data.product_price;
					//console.log('???????????????????????? ??????'+oneTotal);
					console.log('??????????????? ??????'+onePrice);
					var newPrice = onePrice*newval;
					console.log('??????????????? ?????????'+newPrice);
					event.parent().next().children().children().text(newPrice);					
					
				}

				console.log(${list.product_price});
				
				var checkedItems = []
				
				$(':checkbox:checked').each(function(){
	                console.log($(this).next().val());
	                checkedItems.push($(this).next().val());               
	            });
				var checkedItemsed=JSON.stringify(checkedItems);
				
				var data = {"CART_QUANTITY":newval,"PRO_NO":product_no,"totalprice":onePrice,"checkedItems":checkedItemsed};
				$.ajax({
					type: "GET",
		   			url:"<c:url value="/Shop/quantityUpdate"/>",
		   			async:false,
		   			data: data,
		   			dataType:'json'
				})		
				.done(function(data){         													
					
					newPrice(data);
					console.log(data.sum);
					console.log('??????');
					$('#totalprice').text(data.sum)//??? ????????????
					
				}).fail(function(error){
			
					console.log('????????????'+error);
				});		
			
			}
		);////////click
		
		$('td.product-remove').click(function(e){
			     
            console.log('????????????'+$(this).prev().prev().children().children().siblings('input.hidden').val());
            var product_no = $(this).prev().prev().children().children().siblings('input.hidden').val(); //????????????
            var id_no = $(this).children().siblings('input').val(); //ID??? ???????????????
            console.log(id_no); 
            
            var data = {"PRO_NO":product_no,"U_NO":id_no};
			
            $.ajax({
				type: "GET",
	   			url:"<c:url value="/Shop/itemDelete"/>",
	   			async:false,
	   			data: data,
	   			dataType:'json'
			})		
			.done(function(){         																
				console.log('??????');	
				location.reload();
			}).fail(function(error){		
				console.log('????????????'+error);
				
			});		
            
        });
		
        //???????????? ????????? ??????
        var itemLength=$(':checkbox').slice(1).length;
        $(":checkbox").click(function(){
        	var checkedItems = []
		
            if($(this).next().val()==='all'){
	            if($(this).prop('checked')) 
	            	$(':checkbox').slice(1).prop('checked',true);
	            else 
	            	$(':checkbox').slice(1).prop('checked',false);
	        }	
            else{
                if($(this).prop('checked')){
                	
                    if(itemLength===$(':checkbox:checked').length){
                        $('#all').prop('checked',true);                      
                    }
                    else
                    	$('#all').prop('checked',false);
                }
            }
			
			//????????? ???????????? ????????????
			$(':checkbox:checked').each(function(){
                console.log($(this).next().val());
                checkedItems.push($(this).next().val());               
            });
			console.log(checkedItems);
			var data = JSON.stringify(checkedItems);
			
			$.ajax({
				type: "GET",
	   			url:"<c:url value="/Shop/itemCheck"/>",
	   			async:false,
	   			data: {"checkedItems":data},
	   			dataType:'json'
			})		
			.done(function(data){         																
				console.log('??????');
				$('#totalprice').text(data.sum)//??? ????????????
			}).fail(function(error){		
				console.log('????????????'+error);
				
			});		
   		});
		
        
       
        
        
        
	});/////////
</script>
    

    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>