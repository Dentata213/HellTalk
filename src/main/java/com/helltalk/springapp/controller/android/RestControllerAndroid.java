package com.helltalk.springapp.controller.android;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.helltalk.springapp.dao.BBSDao;
import com.helltalk.springapp.dao.BackendDAO;
import com.helltalk.springapp.service.BBSDto;
import com.helltalk.springapp.service.MemberDTO;

@RestController
@RequestMapping("/Android")
public class RestControllerAndroid {

	@Autowired
	private BBSDao dao;
	
	@Autowired
	private BackendDAO Bdao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@CrossOrigin
	@GetMapping("/csrf")
	public String generateCsrfToken(HttpServletRequest request) {
	    CsrfToken csrfToken = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
	    if (csrfToken != null) {
	      return csrfToken.getToken();
	    }
	    return "CSRF token not found";
	}
	
	
	
	@CrossOrigin
	@GetMapping("/bbs/getList")
	public List<BBSDto> getList(){
		return dao.selectBBS(null);
	}
	
	@CrossOrigin
	@PostMapping("/loginAndroid")
	public Map login(String userId, String password) {
		Map map = new HashMap<>();
		map.put("userId", userId);
		map.put("password", password);
		//String userId = map.get("userId").toString();
		//String password = map.get("password").toString();
		System.out.println(userId+" / "+password);
		MemberDTO dto = Bdao.isUser(map);
		System.out.println(dto);
		if(dto!=null) {
			System.out.println("null미처리");
			if(passwordEncoder.matches(password, dto.getU_pw())) {
				map.put("isUser", true);
				map.put("username", userId);
			}else {
				map.put("isUser", false);
			}
		}else {
			map.put("isUser", false);
			System.out.println("null처리");
		}
		map.remove("password");
		map.remove("userId");
		return map;
	}
	

}
