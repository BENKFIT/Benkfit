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
	 *  이더리움간편체험
	 */
	//계정생성폼
	@RequestMapping("wallet")
	public String create(HttpServletRequest req, Model model) throws Exception{
		logger.info("create");
		return "common/blockChain/create";
	}
	//계정생성 처리
	@RequestMapping("createAccount")
	public String createAccount(HttpServletRequest req, Model model) throws Exception{
		logger.info("CreateAccount");
		service.createAccount(req, model);
		return "common/blockChain/createAccount";
	}
	//이더잔액
	@RequestMapping("Balance")
	public String Balance(HttpServletRequest req, Model model) throws Exception{
		logger.info("Balance");
		service.Balance(req, model);
		return "engine_bh/Balance";
	}
	//이더송금메인
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
	//이더예금메인
	@RequestMapping("bank")
	public String deposit(HttpServletRequest req, Model model) throws Exception{
		return "common/blockChain/bank";
	}
	//이더예금
	@RequestMapping("depositPro_Eth")
	public String depositPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("depositPro");
		service.deposit(req, model);
		return "common/blockChain/depositPro";
	}
	//이더예금액보기
	@RequestMapping("bankBalance")
	public String bankBalance(HttpServletRequest req, Model model) throws Exception{
		logger.info("bankBalance");
		service.bankBalance(req, model);
		return "common/blockChain/bankBalance";
	}
	//이더 예금 인출하기
	@RequestMapping("bankWithdraw")
	public String bankWithdraw(HttpServletRequest req, Model model) throws Exception{
		logger.info("bankWithdraw");
		service.bankWithdraw(req, model);
		return "common/blockChain/bankWithdraw";
	}
	
	
	/*
	 * 슬롯머신
	 */
	
	
	/*
	 * common
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
	 * admin
	 */
	//슬롯머신관리
	@RequestMapping("slotControl")
	public String slotControl(HttpServletRequest req, Model model) throws Exception{
		logger.info("slotControl");
		return "admin/event/slotControl";
	}
	//슬롯잔고채우기
	@RequestMapping("slotStock")
	public String slotStock(HttpServletRequest req, Model model) throws Exception{
		logger.info("slotStock");
		service.slotStock(req, model);
		return "admin/event/slotStock";
	}
	//슬롯머신잔고확인
	@RequestMapping("slotStockBalance")
	public String slotStockBalance(HttpServletRequest req, Model model) throws Exception{
		logger.info("slotStockBalance");
		service.slotStockBalance(req, model);
		return "admin/event/slotStockBalance";
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
	//대출 신청
	@RequestMapping("loanApply")
	public String loanApply(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanApply");
		service.loanApply(req, model);
		return "common/product/loan/result";
	}
	//대출한도확인하기
	@RequestMapping("loanBalance")
	public String loanBalance(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanBalance");
		service.loanBalance(req, model);
		return "common/product/loan/loanBalance";
	}
	//대출잔액확인하기
	@RequestMapping("loanleft")
	public String loanleft(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanleft");
		service.loanleft(req, model);
		return "common/product/loan/loanleft";
	}
	//대출금거래하기
	@RequestMapping("loanTransfer")
	public String loanTransfer(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanTransfer");
		service.loanTransfer(req, model);
		return "common/product/loan/loanBalance";
	}
	//대출상환하기
	@RequestMapping("loanRepayment")
	public String loanRepayment(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanRepayment");
		service.loanRepayment(req, model);
		return "common/product/loan/result";
	}
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
	//대출 상품 수청 처리
	@RequestMapping("loanEditPro")
	public String loanEditPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanEdit");
		service.loanEditPro(req, model);
		return "admin/product/loan/result";
	}
	//대출 상품 마감
	@RequestMapping("loanDel")
	public String loanDel(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanDel");
		service.loanDel(req, model);
		return "admin/product/loan/delResult";
	}
	//대출신청리스트
	@RequestMapping("loanApproval")
	public String loanApproval(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanApproval");
		service.loanApproval(req, model);
		return "admin/product/loan/loanApproval";
	}
	//대출상품허가승인
	@RequestMapping("loanApprovalPro")
	public String loanApprovalPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("loanApprovalPro");
		service.loanApprovalPro(req, model);
		return "admin/product/loan/result";
	}
}
