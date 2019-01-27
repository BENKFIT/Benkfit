package spring.mvc.benkfit.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.benkfit.service.Service_lia;

@Controller
public class Controller_lia {

	private static final Logger logger = LoggerFactory.getLogger(Controller_lia.class);
	
	@Autowired
	Service_lia service;
	
	/*security test*/
	@RequestMapping("home/homeMain")
	public String homeMain() {
		System.out.println("homeMain()");
		return "home/homeMain";
	}
	
	@RequestMapping("user/memberMain")
	public String memberMain() {
		System.out.println("memberMain()");
		return "user/memberMain";
	}
	
	@RequestMapping("admin/adminMain")
	public String adminMain() {
		System.out.println("adminMain()");
		return "admin/adminMain";
	} 
	
	//메인
	@RequestMapping("index")
	public String index() {
		logger.info("index 호출중");
		return "Template/index";
	}
	
	//로그인
	@RequestMapping("login")
	public String login() {
		return "common/login";
	}
	
	//회원가입 양식
	@RequestMapping("signIn")
	public String signIn() {
		logger.info("signIn 호출중");
		return "common/signIn";
	}
	 
	//id 중복확인
	@RequestMapping("idCheck") 
	public String idCheck(HttpServletRequest req, Model model) { 
		logger.info("idCheck 호출중");
		service.id_check(req, model);
		return "common/idCheck";
	}
	
	//실명확인
	@RequestMapping("nameCheck")
	public String nameCheck(HttpServletRequest req, Model model) {
		logger.info("nameCheck 호출중");
		service.nameCheck(req, model);
		return "common/nameCheck";
	}
	
	//이용약관 페이지
	@RequestMapping("terms")
	public String terms() {
		logger.info("terms 호출중");
		return "common/terms";
	}
	
	//회원가입 처리
	@RequestMapping("signInPro")
	public String signInPro() {
		return "";
	}
}
