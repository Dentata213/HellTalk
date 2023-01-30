package com.helltalk.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helltalk.springapp.dao.PaymentDAO;
import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.models.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService<PaymentDTO>{

	@Autowired
	private PaymentDAO dao;
	
	@Override
	public List<PaymentDTO> selectCartList(Map map) {
		//임시 데이터
		map.put("U_NO", 1);
		List<PaymentDTO> list = dao.selectCartList(map);
		return list;
	}

	@Override
	public List<PaymentDTO> selectReceiptList(Map map) {
		List list = dao.selectReceiptList(map);
		return list;
	}


	@Override
	public int insertCart(Map map) {
		return dao.insertCart(map);
	}

	@Override
	public int updateCart(Map map) {
		
		return 0;
	}

	@Override
	public int deleteCart(Map map) {
		
		return dao.deleteCart(map);
	}

	@Override
	public PaymentDTO selectOneReceipt(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReceipt(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReceipt(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReceipt(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean isEmpty(Map map) {
		return false;
	}

	public Map updateQuantity(Map map) {
		System.out.println("서비스");
		dao.updateQuantity(map);
		
		return map;		
	}

	@Override
	public int calcCart(Map map) {
		
		List<PaymentDTO> lists = selectCartList(map);
		int val=lists.size();
		System.out.println(val);
		int sum = 0;
		for(int i=0;i<lists.size();i++) {
			PaymentDTO str = lists.get(i);
			System.out.println(i+"번째 인덱스 값:"+str.getProduct_quantity());
			System.out.println(i+"번째 인덱스 값:"+str.getProduct_price());

			int qty = Integer.parseInt(str.getProduct_quantity());
			int price = Integer.parseInt(str.getProduct_price());
			sum += qty*price;
			System.out.println(sum);
		}
		System.out.println("for문 바깥 sum"+sum);
		
		return sum;
	}

}
