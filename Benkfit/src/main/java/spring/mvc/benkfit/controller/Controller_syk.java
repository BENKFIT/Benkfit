package spring.mvc.benkfit.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.api.Http;

import spring.mvc.benkfit.service.ServiceImpl_syk;

@Controller
public class Controller_syk {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_syk.class);
	
	@Autowired
	ServiceImpl_syk service;
	
	/*
	 * common
	 */
	
	//예금 목록
	@RequestMapping("cheqSavList")
	public String checkingList(HttpServletRequest req) {
		logger.info("예금상품목록이동");
		service.cheqSavList(req);
		
		return "common/product/cheqSav/productList";
	}
	
	//예금 상품 정보
	@RequestMapping("cheqInfo")
	public String cheqInfo(HttpServletRequest req) {
		logger.info("예금상품상세페이지");
		service.cheqInfo(req);
		
		return "common/product/cheqSav/productInfo";
	}
	
	//적금 상품 정보
	@RequestMapping("savInfo")
	public String savInfo(HttpServletRequest req) {
		logger.info("적금상품상세페이지");
		service.savInfo(req);
		
		return "common/product/cheqSav/productInfo";
	}
	
	//예금 가이드
	@RequestMapping("checkingGuide")
	public String checkingGuide(HttpServletRequest req) {
		logger.info("예금가이드");
		
		return "common/product/cheqSav/guide";
	}
	
	/*
	 * admin
	 */
	
	//예금 등록 페이지
	@RequestMapping("cheqSavRegi")
	public String cheqSavRegi(HttpServletRequest req) {
		logger.info("예금등록페이지이동");
		service.cheqSavList(req);
		
		return "admin/product/cheqSav/cheqSavList";
	}
	
	//예금 상품 등록
	@RequestMapping("cheqRegiPro")
	public String cheqRegiPro(HttpServletRequest req) {
		logger.info("상품등록");
		service.cheqRegiPro(req);
		
		return "admin/product/cheqSav/result";
	}
	
	//적금 상품 등록
	@RequestMapping("savRegiPro")
	public String savRegiPro(HttpServletRequest req) {
		logger.info("상품등록");
		service.savRegiPro(req);
		
		return "admin/product/cheqSav/result";
	}
	
	//예금계좌생성
	@RequestMapping("createCheq")
	public String createCheq(HttpServletRequest req, Model model) {
		logger.info("예금계좌생성");
		service.createCheq(req, model);
		
		return "common/product/cheqSav/result";
	}
	
	//적금계좌생성
	@RequestMapping("createSav")
	public String createSav(HttpServletRequest req, Model model) {
		logger.info("예금계좌생성");
		service.createSav(req, model);
		
		return "common/product/cheqSav/result";
	}
	
	//예금상품수정
	@RequestMapping("cheqEdit")
	public String cheqEdit(HttpServletRequest req) {
		logger.info("예금상품수정");
		service.cheqEdit(req);
		
		return "admin/product/cheqSav/cheqEdit";
	}
	
	//적금상품수정
	@RequestMapping("savEdit")
	public String savEdit(HttpServletRequest req) {
		logger.info("적금상품수정");
		service.savEdit(req);
		
		return "admin/product/cheqSav/savEdit";
	}
	
	//예금상품삭제
	@RequestMapping("cheqDel")
	public String cheqDel(HttpServletRequest req) {
		logger.info("예금상품삭제");
		service.cheqDel(req);
		
		return "admin/product/cheqSav/delResult";
	}
	
	//적금상품삭제
	@RequestMapping("savDel")
	public String savDel(HttpServletRequest req) {
		logger.info("적금상품삭제");
		service.savDel(req);
		
		return "admin/product/cheqSav/delResult";
	}
}
