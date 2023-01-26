package com.helltalk.springapp.controller.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.helltalk.springapp.dao.PaymentDAO;
import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.service.PaymentServiceImpl;

@Controller
@RequestMapping("/Shop")
public class ShopController {

	@Value("${application_id")
	private String application_id;
	@Value("${private_key}")
	private String private_key;
	
	@Autowired
	private RestTemplate restTemplate;
	@Autowired
	private PaymentServiceImpl service;
	
	@RequestMapping(value = "/quantityUpdate",produces = "text/plain; charset=UTF-8",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String quantityUpdate(@RequestParam Map map,Model model) throws JsonProcessingException {		
		
		System.out.println("컨트롤러실행");	
		System.out.println(map);
	
		service.updateQuantity(map);
		
		PaymentDAO dao = new PaymentDAO();
		
		List<PaymentDTO> lists = service.selectCartList(map);
		
		int sum = service.calcCart(map);
		
		model.addAttribute("lists", lists);

		
		ObjectMapper mapper = new ObjectMapper();
	
		map.put("sum", sum);
		
		return mapper.writeValueAsString(map);

	}
	
	
	@RequestMapping(value = "/itemDelete",produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public Map itemDelete(@RequestParam Map map) throws JsonProcessingException {
		System.out.println("컨트롤러");
		service.deleteCart(map);
		System.out.println("뷰페이지반환");
		return map;
	}
	
	
	
}
