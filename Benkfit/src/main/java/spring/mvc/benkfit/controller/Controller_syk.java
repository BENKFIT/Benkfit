package spring.mvc.benkfit.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.benkfit.service.ServiceImpl_syk;

@Controller
public class Controller_syk {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_syk.class);
	
	@Autowired
	ServiceImpl_syk service;
	/*
	 * @RequestMapping("index_syk")
	 * public String index_syk(){
	 * 		return "Template/index"; 
	 * }
	 */
	
	/*
	 * common
	 */
	
	//예금 목록
	@RequestMapping("checkingList")
	public String checkingList() {
		logger.info("예금상품목록이동");
		
		return "common/product/checking/productList";
	}
	
	//예금 상품 정보
	@RequestMapping("checkingInfo")
	public String checkingInfo(HttpServletRequest req) {
		logger.info("예금상품상세페이지");
		
		String kind = req.getParameter("kind");
		req.setAttribute("kind", kind);
		
		return "common/product/checking/productInfo";
	}
	
	//예금 가이드
	@RequestMapping("checkingGuide")
	public String checkingGuide(HttpServletRequest req) {
		logger.info("예금가이드");
		
		return "common/product/checking/guide";
	}
	
	/*
	 * admin
	 */
	
	//상품 등록 페이지
	@RequestMapping("checkingRegi")
	public String checkingRegi() {
		logger.info("예금등록페이지이동");
		
		return "admin/product/checking/cheqRegi";
	}
	
	//상품 등록
	@RequestMapping("cheqRegiPro")
	public String cheqRegiPro(HttpServletRequest req) {
		logger.info("상품등록");
		service.cheqRegiPro(req);
		
		return "admin/product/checking/cheqRegi";
	}
}
