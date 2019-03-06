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
import spring.mvc.benkfit.service.Service_bh;

@Controller
public class Controller_syk {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_syk.class);
	
	@Autowired
	ServiceImpl_syk service;
	@Autowired
	Service_bh service2;
	
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
	 * admin - 상품
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
	public String createCheq(HttpServletRequest req, Model model) throws Exception{
		logger.info("예금계좌생성");
		service.createCheq(req, model);
		
		return "common/product/cheqSav/result";
	}
	
	//적금계좌생성
	@RequestMapping("createSav")
	public String createSav(HttpServletRequest req, Model model) throws Exception {
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
	
	/*
	 * 이체 
	 */
	
	//계좌이체
	@RequestMapping("transPro")
	public String trans(HttpServletRequest req, Model model) throws Exception {
		logger.info("송금");
		String type = req.getParameter("type");
		if(type.equals("1")) {
			service.transPro(req);
			return "mypage_kay/trans/result";
		}else{
			service2.loanTransfer(req, model);
			return "common/product/loan/result";
		}
	}
	
	//잔액확인
	@RequestMapping("getBalance")
	public String getBalance(HttpServletRequest req) throws Exception{
		logger.info("잔액확인");
		service.getBalance(req);
		
		return "mypage_kay/trans/getBalance";
	}
	
	//입금
	@RequestMapping("deposit")
	public String deposit(HttpServletRequest req) throws Exception{
		logger.info("입금");
		
		return "mypage_kay/trans/deposit";
	}
	
	//입금진행
	@RequestMapping("depositPro")
	public String depositPro(HttpServletRequest req) throws Exception{
		logger.info("입금 실행");
		service.depositPro(req);
		
		return "mypage_kay/trans/deposit";
	}
	
	//출금페이지
	@RequestMapping("withdraw")
	public String withdraw(HttpServletRequest req) throws Exception{
		logger.info("출금");
		
		return "mypage_kay/trans/withdraw";
	}
	
	/*//출금진행
	@RequestMapping("withdrawPro")
	public String withdrawPro(HttpServletRequest req) throws Exception{
		logger.info("출금");
		service.withdraw(req);
		
		return "mypage_kay/withdraw";
	}*/
	
	/*
	 * 자동이체
	 */
	
	//자동이체 페이지
	@RequestMapping("auto_trans")
	public String autoTrans(HttpServletRequest req) throws Exception{
		logger.info("자동이체 페이지");
		service.autoTrans(req);
		
		return "mypage_kay/auto/auto_trans";
	}
	
	//자동이체 등록
	@RequestMapping("autoAdd")
	public String autoAdd(HttpServletRequest req) throws Exception{
		logger.info("자동이체 등록");
		service.autoAdd(req);
		return "mypage_kay/auto/result";
	}
	
	//자동이체 삭제
	@RequestMapping("autoDel")
	public String autoDel(HttpServletRequest req) throws Exception{
		logger.info("자동이체 삭제");
		service.autoDel(req);
		
		return "mypage_kay/auto/autoDel";
	}
	
	/*
	 * 관리페이지
	 */
	
	//관리페이지
	@RequestMapping("manage")
	public String deploy(HttpServletRequest req, Model model) throws Exception{
		logger.info("배포페이지");
		service.deploy(req);
		service2.benkfitControl(req, model);
		return "admin/manage/manage";
	}
	
	//배포
	@RequestMapping("deployPro")
	public String deployPro(HttpServletRequest req) throws Exception{
		logger.info("배포");
		service.deployPro(req);
		
		return "admin/manage/result";
	}
	
	//재배포
	@RequestMapping("reDeploy")
	public String reDeploy(HttpServletRequest req) throws Exception {
		logger.info("재배포");
		service.reDeploy(req);
		
		return "admin/manage/reDeploy";
	}
	
	//내계좌
	@RequestMapping("getMyAccounts")
	public String getMyAccounts(HttpServletRequest req) throws Exception{
		logger.info("내계좌");
		service.trans(req);
		
		return "mypage_kay/trans/getMyAccounts";
	}
}
