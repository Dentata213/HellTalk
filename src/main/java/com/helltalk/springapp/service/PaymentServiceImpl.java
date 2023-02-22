package com.helltalk.springapp.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.helltalk.springapp.dao.PaymentDAO;
import com.helltalk.springapp.models.PaymentDTO;
import com.helltalk.springapp.models.PaymentService;
import com.siot.IamportRestClient.Iamport;
import com.siot.IamportRestClient.IamportClient;

@Service
@PropertySource({"classpath:config/database.properties"})
public class PaymentServiceImpl implements PaymentService<PaymentDTO>{
	
	@Value("${imp_key}")
	private String imp_key;

	@Value("${imp_secret}")
	private String imp_secret;
		

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
	
	
	public String getToken() throws IOException {
	    HttpsURLConnection conn = null;
	    URL url = new URL("https://api.iamport.kr/users/getToken");
	    conn = (HttpsURLConnection) url.openConnection();
	    conn.setRequestMethod("POST");
	    conn.setRequestProperty("Content-type", "application/json");
	    conn.setRequestProperty("Accept", "application/json");
	    conn.setDoOutput(true);
	   
	    JsonObject json = new JsonObject();
	    json.addProperty("imp_key", imp_key);
	    json.addProperty("imp_secret", imp_secret);

	    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	    bw.write(json.toString());
	    bw.flush();
	    bw.close();

	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	    Gson gson = new Gson();	    String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
	    String token = gson.fromJson(response, Map.class).get("access_token").toString();

	    br.close();
	    conn.disconnect();

	    return token;
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
		int sum = 0;		
		
		for(int i=0;i<lists.size();i++) {
			try {
				
				PaymentDTO str = lists.get(i);
				int qty = Integer.parseInt(str.getProduct_quantity());
				int price = Integer.parseInt(str.getProduct_price());
				
				String[] checkedItems = new String[map.get("checkedItems").toString().split(",").length];
				
				for(int k=0;k<checkedItems.length;k++) {
					checkedItems[k]=(String) map.get("checkedItems").toString().split(",")[k];				
					String oneItem = checkedItems[k].replace("\"","").replace("[", "").replace("]", "");					
					String proNum = str.getProduct_no();
					
					if(proNum.equals(oneItem)){						
						sum += qty*price;
						System.out.println("if문 내부"+sum);
					}
				}
			}
			catch(Exception e){e.printStackTrace();}
			
		}
		System.out.println("for문 바깥 sum"+sum);
		
		return sum;
	}

}
