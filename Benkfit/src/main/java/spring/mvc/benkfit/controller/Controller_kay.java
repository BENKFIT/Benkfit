package spring.mvc.benkfit.controller;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import spring.mvc.benkfit.service.ServiceImpl_syk;
import spring.mvc.benkfit.service.Service_kay;

@Controller
public class Controller_kay {
	private static final Logger logger = LoggerFactory.getLogger(Controller_kay.class);
	
	@Autowired
	Service_kay service;
	@Autowired 
	ServiceImpl_syk service_syk;
	
	/*
	 * 마이페이지
	 * 
	 */		
	
	/*마이페이지*/	
	@Transactional(rollbackFor=Exception.class)
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("mypage")
	public String mypage_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("mypage_kay");
		service.mypage_info(req, model);
		service.myCheq_list(req, model);
		service.myloan_list(req, model);
		service.mysav_list(req, model);
		return "mypage_kay/mypage/mypage_kay";
	}
	
	//자산관리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("asset")
	public String asset(HttpServletRequest req, Model model) throws Exception{
		logger.info("assaet");
		return "mypage_kay/mypage/asset_kay";
	}
	
	//자산관리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("budget")
	public String budget(HttpServletRequest req, Model model) throws Exception{
		logger.info("budget");
		service.budget(req, model);
		return "mypage_kay/mypage/budget_kay";
	}
	
	/*
	 * 예금. 적금. 대출 계좌 조회
	 */
	
	//예금계좌목록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("cheq_account")
	public String cheq_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("cheq_account");
		service.myCheq_list(req, model);
		return "mypage_kay/cheq_sav/cheq_account_kay";
	}
	
	//예금계좌 상세조회
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("cheq_info")
	public String cheq_info(HttpServletRequest req, Model model) throws Exception{
		logger.info("cheq_info");
		service.sel_cheq(req, model);
		return "mypage_kay/cheq_sav/cheq_accountinfo_kay";
	}
	
	//예금 계좌해지 - 계좌pw확인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("delcheq")
	public String delcheq(HttpServletRequest req, Model model) throws Exception{
		logger.info("delcheq");
		service.sls(req, model);
		return "mypage_kay/cheq_sav/delcheq_kay";
	}
	
	// 예금 계좌해지 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("account")
	public String del_cheq(HttpServletRequest req, Model model) throws Exception{
		logger.info("account");
		service.del_cheq(req, model);
		return "mypage_kay/cheq_sav/account_kay";
	}
	
	//대출계좌목록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loan_account")
	public String loan_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("loan_account");
		service.myloan_list(req, model);
		return "mypage_kay/loan_docu/loan_account_kay";
	}
	
	//대출계좌 상세조회
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loan_info")
	public String loan_info(HttpServletRequest req, Model model) throws Exception{
		logger.info("loan_info");
		service.sel_loan(req, model);
		return "mypage_kay/loan_docu/loan_accountinfo_kay";
	}
	
	//적금계좌목록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("sav_account")
	public String sav_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("sav_account");
		service.mysav_list(req, model);
		return "mypage_kay/cheq_sav/sav_account_kay";
	}
	
	//적금계좌 상세조회
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("sav_info")
	public String sav_info(HttpServletRequest req, Model model) throws Exception{
		logger.info("sav_info");
		service.sel_sav(req, model);
		return "mypage_kay/cheq_sav/sav_accountinfo_kay";
	}
	
	//적금 계좌해지 - 계좌pw확인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("delsav")
	public String savcheq(HttpServletRequest req, Model model) throws Exception{
		logger.info("savcheq");
		service.sls(req, model);
		return "mypage_kay/cheq_sav/delsav_kay";
	}
	
	//적금 계좌해지 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("del_sav")
	public String del_sav(HttpServletRequest req, Model model) throws Exception{
		logger.info("del_sav");
		service.del_sav(req, model);
		return "mypage_kay/cheq_sav/del_sav";
	}
	
	/*
	 * 설정
	 */
	
	//QRcode 발급
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("qrcode")
	public String qrcode(HttpServletRequest req, Model model) throws Exception{
		logger.info("qrcode");
		service.qrcode(req, model);
		return "mypage_kay/set/qrcode_kay";
	}
	
	//QRcode 발급처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("qrPro")
	public String qrPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("qrPro");
		service.qrPro(req, model);
		return "mypage_kay/set/qrPro_kay";
	}
	
	//이체한도조회
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("limit_sel")
	public String limit_sel(HttpServletRequest req, Model model) throws Exception{
		logger.info("limit_sel");
		service.myCheq_list(req, model);
		return "mypage_kay/set/limit_sel_kay";
	}
	
	//이체한도수정
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("lim_pro")
	public String limit_up(HttpServletRequest req, Model model) throws Exception{
		logger.info("lim_pro_kay");
		service.limit_up(req, model);
		return "mypage_kay/set/lim_pro_kay";
	}
	
	/*
	 * 회원정보수정 탈퇴
	 * 
	 */
	
	//정보수정-pw
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("myinfoPw")
	public String myinfoPw(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoPw");
		return "mypage_kay/up_del/myinfoPw_kay";
	}
	
	//정보수정form
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("myinfoForm")
	public String myinfoForm(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoForm");
		service.info(req, model);
		return "mypage_kay/up_del/myinfoForm_kay";
	}
	
	//정보수정-처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("myinfoPro")
	public String myinfoPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoPro");
		service.up_info(req, model);
		return "mypage_kay/up_del/myinfoPro_kay";
	}
	
	//회원탈퇴 -pw
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("deluserPw")
	public String deluserPw(HttpServletRequest req, Model model) throws Exception{
		logger.info("deluserPw");
		return"mypage_kay/up_del/deluserPw_kay";
	}
	
	//회원탈퇴처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("deluserPro")
	public String deluserPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("deluserPro");
		service.del_mem(req, model);
		return"mypage_kay/up_del/deluserPro_kay";
	}
	
	/*
	 * 서류
	 */
	
	//내서류 조회 - 목록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("document")
	public String document_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("document_kay");
		service.seldocu(req, model);
		return "mypage_kay/loan_docu/document_kay";
	}
	
	//내서류 조회 - 상세
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("detaildoc")
	public String detaildoc(HttpServletRequest req, Model model) throws Exception{
		logger.info("detaildoc");
		service.detaildocu(req, model);
		return "mypage_kay/loan_docu/detaildoc_kay";
	}
	
	// 서류등록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("upload")
	public String signIn() throws Exception {
		return "mypage_kay/loan_docu/uploadForm_kay";
	}
	
	//문서서류인식
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("value") 
	public String getText(String file, Model model) throws IOException {
		logger.info("value");
		service.getText(file, model);
		return "mypage_kay/loan_docu/value_kay";
	}
	
	//서류등록처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("upresult")
	public String signInPro(MultipartHttpServletRequest req, Model model) throws Exception {
		logger.info("upresult");
		service.signInPro(req, model);
		return "mypage_kay/loan_docu/uploadResult_kay";
	}
	
	//서류삭제
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("deletedocu")
	public String deleterdocu(HttpServletRequest req, Model model) throws Exception {
		logger.info("deleterdocu ");
		service.deletedocu(req, model);
		return "mypage_kay/loan_docu/deletedocu_kay";
	}
	
	//서류양식다운로드
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("down")
	public String down(HttpServletRequest req,HttpServletResponse res, Model model) throws Exception {
		logger.info("down");
		service.downdocu(req, res, model);
		return "mypage_kay/mypage/down_kay";
	}

	/*
	 * 이체
	 */
	
	//계좌이체
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("trans")
	public String trans(HttpServletRequest req, Model model) throws Exception{
		logger.info("trans");
		service_syk.trans(req);
		return "mypage_kay/trans/trans_info_kay";
	}
	
	//계좌이체정보확인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("trans_Chk")
	public String trans_Chk(HttpServletRequest req, Model model) throws Exception{
		logger.info("trans_Chk");
		return "mypage_kay/trans/trans_infoChk_kay";
	}
	
	/* css */
	
	@RequestMapping("forms")
	public String forms(HttpServletRequest req, Model model) throws Exception{
		logger.info("forms");
		return "Template/forms";
	}
	@RequestMapping("button")
	public String button(HttpServletRequest req, Model model) throws Exception{
		logger.info("button");
		return "Template/button";
	}
	@RequestMapping("test")
	public String test(HttpServletRequest req, Model model) throws Exception{
		logger.info("123");
		return "mypage_kay/up_del/s";
	}
	@RequestMapping("table")
	public String table(HttpServletRequest req, Model model) throws Exception{
		logger.info("table");
		return "Template/table_new";
	}
}