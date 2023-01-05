package com.helltalk.springapp;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AddressController {
		
		@GetMapping("/address.do")
		public String address() {
			System.out.println("카카오 지도 API 테스트");
			return "/address/Address";
		}
		@GetMapping("/address2.do")
		public String address2() {
			System.out.println("카카오 지도 API 테스트");
			return "/address/Address2";
		}
		
}
