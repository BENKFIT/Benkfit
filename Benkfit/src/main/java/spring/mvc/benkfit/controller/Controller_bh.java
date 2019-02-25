package spring.mvc.benkfit.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.web3j.protocol.http.HttpService;

import spring.mvc.benkfit.service.Service_bh;

@Controller
public class Controller_bh {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_bh.class);
	
	@Autowired
	Service_bh service;
	
	/*
	 *  계정생성하기
	 */
	@RequestMapping("wallet")
	public String create(HttpServletRequest req, Model model) throws Exception{
		logger.info("create");
		return "common/blockChain/create";
	}
	@RequestMapping("createAccount")
	public String createAccount(HttpServletRequest req, Model model) throws Exception{
		logger.info("CreateAccount");
		service.createAccount(req, model);
		return "common/blockChain/createAccount";
	}
	
	/*
	 * 계정 잔액 확인하기
	 */
	@RequestMapping("Balance")
	public String Balance(HttpServletRequest req, Model model) throws Exception{
		logger.info("Balance");
		service.Balance(req, model);
		return "common/event/slotBalance";
	}
	
	/*
	 * 슬롯머신
	 */
	//슬롯머신메인
	@RequestMapping("slot")
	public String slot(HttpServletRequest req, Model model) throws Exception{
		logger.info("slot");
		return "common/event/slot";
	}
	//슬롯머신플레이
	@RequestMapping("slotResult")
	public String slotResult(HttpServletRequest req, Model model) throws Exception{
		logger.info("slotResult");
		service.slot(req, model);
		return "common/event/slotResult";
	}

	/*
	 * 대출
	 */
	
	/*
	 * common
	 */
	//대출 상품 목록
	@RequestMapping("loanList")
	public String loanList(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanList");
		service.loanList(req, model);
		return "common/product/loan/loanList";
	}
	
	//대출 상품 정보
	@RequestMapping("loanInfo")
	public String loanInfo(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanInfo");
		service.loanInfo(req, model);
		return "common/product/loan/loanInfo";
	}
	
	//대출 가이드
	@RequestMapping("loanGuide")
	public String loanGuide(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanGuide");
		return "common/product/loan/loanGuide";
	}
	
//	//대출신청폼
//	@RequestMapping("req_loan")
//	public String loan(HttpServletRequest req, Model model) throws Exception{
//		logger.info("loan");
//		return "common/product/loan/loan";
//	}
//	//대출계산
//	@RequestMapping("rtype")
//	public String rtype(HttpServletRequest req, Model model) throws Exception{
//		logger.info("rtype");
//		service.rtype(req, model);
//		return "common/product/loan/rtype";
//	}
	
	/*
	 * admin
	 */
	//대출 상품 등록 페이지
	@RequestMapping("loanRegi")
	public String loanAdd(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanRegi");
		service.loanList(req, model);
		return "admin/product/loan/loanList";
	}
	//대출 상품 등록
	@RequestMapping("loanRegiPro")
	public String loanAddPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanRegiPro");
		service.loanRegiPro(req, model);
		return "admin/product/loan/result";
	}
	//대출 상품 수정
	@RequestMapping("loanEdit")
	public String loanEdit(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanEdit");
		service.loanEdit(req, model);
		return "admin/product/loan/loanEdit";
	}
	//대출 상품 마감
	@RequestMapping("loanDel")
	public String loanDel(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanDel");
		service.loanDel(req, model);
		return "admin/product/loan/delResult";
	}
	
	/*
	 * 송금시작
	 */
	//송금메인
	@RequestMapping("transfer")
	public String transfer(HttpServletRequest req, Model model) throws Exception{
		logger.info("transfer");
		return "common/transfer/transfer";
	}
	//송금완료
	@RequestMapping("transferPro")
	public String transferPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("transferPro");
		service.transferPro(req, model);
		return "common/transfer/transferPro";
	}
	
	/*
	 * 예금
	 */
	//예금메인
	@RequestMapping("bank")
	public String deposit(HttpServletRequest req, Model model) throws Exception{
		return "common/blockChain/bank";
	}
	//예금
	/*@RequestMapping("depositPro")
	public String depositPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("depositPro");
		service.deposit(req, model);
		return "engine_bh/depositPro";
	}*/
	//예금액보기
	@RequestMapping("bankBalance")
	public String bankBalance(HttpServletRequest req, Model model) throws Exception{
		logger.info("bankBalance");
		service.bankBalance(req, model);
		return "common/blockChain/bankBalance";
	}
	//예금 인출하기
	@RequestMapping("bankWithdraw")
	public String bankWithdraw(HttpServletRequest req, Model model) throws Exception{
		logger.info("bankWithdraw");
		service.bankWithdraw(req, model);
		return "common/blockChain/bankWithdraw";
	}
}
