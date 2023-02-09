package com.helltalk.springapp.models;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PaidDTO {
	String receipt;
	String user_id;
	String product_no;
	String product_name;
	String product_img;
	String product_price;
	String product_quantity;
	Date checkoutDate;
	String status;
	
	int cart_no;
}
