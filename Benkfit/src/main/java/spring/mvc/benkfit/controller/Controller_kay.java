package spring.mvc.benkfit.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import spring.mvc.benkfit.service.Service_kay;

@Controller
public class Controller_kay {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_kay.class);
	@Autowired
	Service_kay service;
	
	/*메인
	@RequestMapping("index")
	public String main(HttpServletRequest req, Model model) throws Exception{
		logger.info("main");
		return "Template/index1" ;
	}*/
	/*마이페이지*/		
	@RequestMapping("mypage")
	public String mypage_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("mypage_kay");
		service.myCheq_list(req, model);
		service.docu_list(req, model);
		service.info(req, model);
		return "mypage_kay/mypage_kay";
	}
	/*예금계좌조회*/
	@RequestMapping("sel_account")
	public String sel_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("sel_account");
		return "mypage_kay/sel_account_kay";
	}
	/*대출계좌조회*/
	@RequestMapping("loan_account")
	public String loan_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("loan_account");
		return "mypage_kay/loan_account_kay";
	}
	/*QRcode 발급*/
	@RequestMapping("qrcode")
	public String qrcode(HttpServletRequest req, Model model) throws Exception{
		logger.info("qrcode");
		service.qrcode(req, model);
		return "mypage_kay/qrcode_kay";
	}
	/*이체한도*/
	@RequestMapping("limit_sel")
	public String limit_sel(HttpServletRequest req, Model model) throws Exception{
		logger.info("limit_sel");
		return "mypage_kay/limit_sel_kay";
	}
	/*정보수정-pw*/
	@RequestMapping("myinfoPw")
	public String myinfoPw(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoPw");
		return "mypage_kay/myinfoPw_kay";
	}
	/*정보수정form*/
	@RequestMapping("myinfoForm")
	public String myinfoForm(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoForm");
		/*service.*/
		return "mypage_kay/myinfoForm_kay";
	}
	/*정보수정-처리*/
	@RequestMapping("myinfoPro")
	public String myinfoPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoPro");
		return "mypage_kay/myinfoPro_kay";
	}
	/*내서류 조회*/
	@RequestMapping("document")
	public String document_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("document_kay");
		return "mypage_kay/document_kay";
	}
	/*회원탈퇴 -pw*/
	@RequestMapping("deluserPw")
	public String deluserPw(HttpServletRequest req, Model model) throws Exception{
		logger.info("deluserPw");
		return"mypage_kay/deluserPw_kay";
	}
	
	/*기본setting 페이지*/
	@RequestMapping("test")
	public String test(HttpServletRequest req, Model model) throws Exception{
		logger.info("test");
		return "mypage_kay/test_kay";
	}
}