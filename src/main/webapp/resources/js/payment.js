/**
 * 
 */

console.log(document.querySelector('#thisscript').getAttribute('data-id'))
var id = document.querySelector('#thisscript').getAttribute('data-id');
var name = document.querySelector('#thisscript').getAttribute('data-name');


    const response = await Bootpay.requestPayment({
    "application_id": "63a0f89acf9f6d001bd12076",
    "price": 1000,
    "order_name": "테스트결제품목",
    "order_id": "TEST_ORDER_ID000000000000001",
    "pg": "카카오",
    "method": "간편",
    "tax_free": 0,
    "user": {
        "id": id,
        "username": "회원이름",
        "phone": "01000000000",
        "email": "test@test.com"
    },
    "items": [
        {
        "id": "item_id",
        "name": "테스트아이템",
        "qty": 1,
        "price": 1000
        }
    ],
    "extra": {
        "open_type": "iframe",
        "card_quota": "0,2,3",
        "escrow": false
    }
    })

	
	