package com.helltalk.springapp.controller.qna;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helltalk.springapp.service.QnADto;
import com.helltalk.springapp.service.QnAService;

import kr.co.bootpay.model.request.Authentication;

@Controller
@RequestMapping("/qna")
public class QNAController {
	
	//서비스 주입
	@Autowired
	private QnAService<QnADto> qnaService;
	
	@RequestMapping("/list")
	public String list() {
		
		return "qna/QnA.helltalk";
	}
	@RequestMapping("/Write.do")
		public String write() {
			
		return "qna/Write";
		
		
		}
	}
