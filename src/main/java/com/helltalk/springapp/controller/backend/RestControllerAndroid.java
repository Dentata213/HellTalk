package com.helltalk.springapp.controller.backend;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.helltalk.springapp.dao.BackendDAO;
import com.helltalk.springapp.service.MemberDTO;

@RestController
public class RestControllerAndroid {

	@Autowired
	private BackendDAO dao;
	
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
	

}
