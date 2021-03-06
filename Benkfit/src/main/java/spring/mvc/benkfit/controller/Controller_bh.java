package spring.mvc.benkfit.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.benkfit.service.Service_bh;

@Controller
public class Controller_bh {

	private static final Logger logger = LoggerFactory.getLogger(Controller_bh.class);

	@Autowired
	Service_bh service;

	/*
	 * 이더리움간편체험
	 */
	// 계정생성폼 - 지갑
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("wallet")
	public String create(HttpServletRequest req, Model model) throws Exception {
		logger.info("create");
		return "common/blockChain/create";
	}

	// 계정생성 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("createAccount")
	public String createAccount(HttpServletRequest req, Model model) throws Exception {
		logger.info("CreateAccount");
		service.createAccount(req, model);
		return "common/blockChain/createAccount";
	}

	// 이더잔액
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("Balance")
	public String Balance(HttpServletRequest req, Model model) throws Exception {
		logger.info("Balance");
		service.Balance(req, model);
		return "engine_bh/Balance";
	}

	// 이더송금메인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("transfer")
	public String transfer(HttpServletRequest req, Model model) throws Exception {
		logger.info("transfer");
		return "common/transfer/transfer";
	}

	// 송금완료
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("transferPro")
	public String transferPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("transferPro");
		service.transferPro(req, model);
		return "common/transfer/transferPro";
	}

	// 이더예금메인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("bank")
	public String deposit(HttpServletRequest req, Model model) throws Exception {
		return "common/blockChain/bank";
	}

	// 이더예금
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("depositPro_Eth")
	public String depositPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("depositPro");
		service.deposit(req, model);
		return "common/blockChain/depositPro";
	}

	// 이더예금액보기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("bankBalance")
	public String bankBalance(HttpServletRequest req, Model model) throws Exception {
		logger.info("bankBalance");
		service.bankBalance(req, model);
		return "common/blockChain/bankBalance";
	}

	// 이더 예금 인출하기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("bankWithdraw")
	public String bankWithdraw(HttpServletRequest req, Model model) throws Exception {
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
	// 슬롯머신메인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("slot")
	public String slot(HttpServletRequest req, Model model) throws Exception {
		logger.info("slot");
		return "common/event/slot";
	}

	// 슬롯머신플레이
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("slotResult")
	public String slotResult(HttpServletRequest req, Model model) throws Exception {
		logger.info("slotResult");
		service.slot(req, model);
		return "common/event/slotResult";
	}

	/*
	 * admin
	 */
	// 슬롯머신관리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("slotControl")
	public String slotControl(HttpServletRequest req, Model model) throws Exception {
		logger.info("slotControl");
		return "admin/event/slotControl";
	}

	// 슬롯잔고채우기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("slotStock")
	public String slotStock(HttpServletRequest req, Model model) throws Exception {
		logger.info("slotStock");
		service.slotStock(req, model);
		return "admin/event/slotStock";
	}

	// 슬롯머신잔고확인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("slotStockBalance")
	public String slotStockBalance(HttpServletRequest req, Model model) throws Exception {
		logger.info("slotStockBalance");
		service.slotStockBalance(req, model);
		return "admin/event/slotStockBalance";
	}
	
	// 슬롯머kill함수
	@RequestMapping("slotKill")
	public String slotKill(HttpServletRequest req, Model model) throws Exception {
		logger.info("slotKill");
		service.slotKill(req, model);
		return "admin/event/slotControl";
	}

	/*
	 * 대출
	 */

	/*
	 * common
	 */
	//대출 상품 목록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanList")
	public String loanList(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanList");
		service.loanList(req, model);
		return "common/product/loan/loanList";
	}

	// 대출 상품 정보
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanInfo")
	public String loanInfo(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanInfo");
		service.loanInfo(req, model);
		return "common/product/loan/loanInfo";
	}

	// 대출 가이드
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanGuide")
	public String loanGuide(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanGuide");
		return "common/product/loan/loanGuide";
	}

	// 대출 신청
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanApply")
	public String loanApply(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanApply");
		service.loanApply(req, model);
		return "common/product/loan/result";
	}

	// 대출한도확인하기
	@RequestMapping("loanBalance")
	public String loanBalance(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanBalance");
		service.loanBalance(req, model);
		return "common/product/loan/loanBalance";
	}

	// 대출잔액확인하기
	@RequestMapping("loanleft")
	public String loanleft(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanleft");
		service.loanleft(req, model);
		return "common/product/loan/loanleft";
	}

	// 대출금거래하기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanTransfer")
	public String loanTransfer(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanTransfer");
		service.loanTransfer(req, model);
		return "common/product/loan/loanBalance";
	}

	// 대출상환하기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanRepayment")
	public String loanRepayment(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanRepayment");
		service.loanRepayment(req, model);
		return "common/product/loan/result";
	}

	/*
	 * admin
	 */
	// 대출 상품 등록 페이지
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanRegi")
	public String loanAdd(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanRegi");
		service.loanList(req, model);
		return "admin/product/loan/loanList";
	}

	// 대출 상품 등록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanRegiPro")
	public String loanAddPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanRegiPro");
		service.loanRegiPro(req, model);
		return "admin/product/loan/result";
	}

	// 대출 상품 수정
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanEdit")
	public String loanEdit(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanEdit");
		service.loanEdit(req, model);
		return "admin/product/loan/loanEdit";
	}

	// 대출 상품 수청 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanEditPro")
	public String loanEditPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanEdit");
		service.loanEditPro(req, model);
		return "admin/product/loan/result";
	}

	// 대출 상품 마감
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanDel")
	public String loanDel(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanDel");
		service.loanDel(req, model);
		return "admin/product/loan/delResult";
	}

	// 대출신청리스트-전체
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanApproval")
	public String loanApproval(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanApproval");
		service.loanApproval(req, model);
		System.out.println("=====전체c");
		return "admin/product/loan/loanApproval";
	}
	
	// 대출신청리스트-승인
	@RequestMapping("loanApproval1")
	public String loanApproval1(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanApproval1");
		service.loanApproval1(req, model);
		System.out.println("=====승인c");
		return "admin/product/loan/loanApproval1";
	}
	// 대출신청리스트-대기
	@RequestMapping("loanApproval2")
	public String loanApproval2(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanApproval2");
		service.loanApproval2(req, model);
		System.out.println("=====대기c");
		return "admin/product/loan/loanApproval2";
	}
	// 대출신청리스트-거절
	@RequestMapping("loanApproval3")
	public String loanApproval3(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanApproval3");
		service.loanApproval3(req, model);
		System.out.println("=====거절c");
		return "admin/product/loan/loanApproval3";
	}

	// 대출신청처리(승인)
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loanApprovalPro")
	public String loanApprovalPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("loanApprovalPro");
		service.loanApprovalPro(req, model);
		return "admin/product/loan/result";
	}

	// 대출신청처리(거절)
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("rejection")
	public String rejection(HttpServletRequest req, Model model) throws Exception {
		logger.info("rejection");
		service.rejection(req, model);
		return "admin/product/loan/result";
	}

	// 은행관리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("benkfitControl")
	public String benkfitControl(HttpServletRequest req, Model model) throws Exception {
		logger.info("benkfitControl");
		service.benkfitControl(req, model);
		return "admin/control/benkfitControl";
	}

	// 대출계좌 토큰 할당
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("benkfitLoanStock")
	public String benkfitLoanStock(HttpServletRequest req, Model model) throws Exception {
		logger.info("benkfitLoanStock");
		service.benkfitLoanStock(req, model);
		return "admin/control/benkfitLoanStock";
	}

	// 마이닝하기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("minerStart")
	public String minerStart(HttpServletRequest req, Model model) throws Exception {
		logger.info("minerStart");
		service.minerStart(req, model);
		return "admin/control/mining";
	}

	// 마이닝중지
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("minerStop")
	public String minerStop(HttpServletRequest req, Model model) throws Exception {
		logger.info("minerStop");
		service.minerStop(req, model);
		return "admin/control/mining";
	}

	/*
	 * 거래검증소
	 */

	// 거래검증폼
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("verify")
	public String verify(HttpServletRequest req, Model model) throws Exception {
		logger.info("verify");
		return "common/blockChain/verify";
	}

	// 거래검증
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("verifyPro")
	public String verifyPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("verifyPro");
		service.verify(req, model);
		return "common/blockChain/verifyPro";
	}
	
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("hocument")
	public String hocument(HttpServletRequest req, Model model) throws Exception {
		logger.info("hocument");
		return "common/blockChain/hocument";
	}
	
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("hocumentPro")
	public String hocumentPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("hocument");
		service.hocumentPro(req, model);
		return "common/blockChain/hocumentPro";
	}
}
