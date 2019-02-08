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
		System.out.println("mypage_kay1");
		service.myCheq_list(req, model);
		service.docu_list(req, model);
		service.info(req, model);
		return "mypage_kay/mypage_kay";
	}
	/*예금계좌 조회*/
	@RequestMapping("sel_account")
	public String sel_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("sel_account");
		return "mypage_kay/sel_account_kay";
	}
	/*대출계좌조회*/
	@RequestMapping("loan_account")
	public String loan_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("loan_account");
		service.myCheq_list(req, model);
		return "mypage_kay/loan_account_kay";
	}
	/*QRcode 발급*/
	@RequestMapping("qrcode")
	public String qrcode(HttpServletRequest req, Model model) throws Exception{
		logger.info("qrcode");
		service.qrcode(req, model);
		return "mypage_kay/qrcode_kay";
	}
	/*이체한도조회*/
	@RequestMapping("limit_sel")
	public String limit_sel(HttpServletRequest req, Model model) throws Exception{
		logger.info("limit_sel");
		service.limit_sel(req, model);
		return "mypage_kay/limit_sel_kay";
	}
	/*이체한도수정*/
	@RequestMapping("lim_pro")
	public String limit_up(HttpServletRequest req, Model model) throws Exception{
		logger.info("lim_pro_kay");
		service.limit_up(req, model);
		return "mypage_kay/lim_pro_kay";
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
		service.info(req, model);
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
		service.docu_list(req, model);
		return "mypage_kay/document_kay";
	}
	/*서류 등록*/
	@RequestMapping(value="upload")
	public String uploadForm_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("upload");

		return "mypage_kay/uploadForm_kay";
	}
	/* 서류이미지 등록체크*/
	@RequestMapping(value="uploadResult")
	public String uploadResult_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("uploadResult");		
		service.docu_upload(req, model);
		return "mypage_kay/uploadResult_kay";
	}
	/*서류인식*/
	
	
	/*회원탈퇴 -pw*/
	@RequestMapping("deluserPw")
	public String deluserPw(HttpServletRequest req, Model model) throws Exception{
		logger.info("deluserPw");
		return"mypage_kay/deluserPw_kay";
	}
	/*기본setting 페이지*/
	/*@RequestMapping("test")
	public String test(HttpServletRequest req, Model model) throws Exception{
		logger.info("test");
		return "mypage_kay/test_kay";
	}*/
}