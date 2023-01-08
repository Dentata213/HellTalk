/**
 * 
 */

console.log(document.querySelector('#thisscript').getAttribute('data-id'))
var id = document.querySelector('#thisscript').getAttribute('data-id');
var name = document.querySelector('#thisscript').getAttribute('data-name');


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

	
	