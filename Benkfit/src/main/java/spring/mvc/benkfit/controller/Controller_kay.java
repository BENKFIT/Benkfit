package spring.mvc.benkfit.controller;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.benkfit.service.ServiceImpl_syk;
import spring.mvc.benkfit.service.Service_kay;

@Controller
public class Controller_kay {
	private static final Logger logger = LoggerFactory.getLogger(Controller_kay.class);
	
	@Autowired
	Service_kay service;
	@Autowired 
	ServiceImpl_syk service_syk;
	
	/*마이페이지*/		
	@RequestMapping("mypage")
	public String mypage_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("mypage_kay");
		service.mypage_info(req, model);
		service.myCheq_list(req, model);
		service.myloan_list(req, model);
		service.mysav_list(req, model);
		return "mypage_kay/mypage_kay";
	}
	
	//예금계좌 조회
	@RequestMapping("cheq_account")
	public String cheq_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("cheq_account");
		service.myCheq_list(req, model);
		return "mypage_kay/cheq_account_kay";
	}
	//예금계좌 조회
	@RequestMapping("cheq_info")
	public String cheq_info(HttpServletRequest req, Model model) throws Exception{
		logger.info("cheq_info");
		service.sel_cheq(req, model);
		return "mypage_kay/cheq_accountinfo";
	}
	//대출계좌조회
	@RequestMapping("loan_account")
	public String loan_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("loan_account");
		//service.myloan_list(req, model);
		return "mypage_kay/loan_account_kay";
	}
	//대출계좌조회
	@RequestMapping("loan_info")
	public String loan_info(HttpServletRequest req, Model model) throws Exception{
		logger.info("loan_info");
		service.myloan_list(req, model);
		return "mypage_kay/loan_accountinfo";
	}
	//적금계좌조회
	@RequestMapping("sav_account")
	public String sav_account(HttpServletRequest req, Model model) throws Exception{
		logger.info("sav_account");
		service.mysav_list(req, model);
		return "mypage_kay/sav_account_kay";
	}
	//적금계좌조회
	@RequestMapping("sav_info")
	public String sav_info(HttpServletRequest req, Model model) throws Exception{
		logger.info("sav_info");
		return "mypage_kay/sav_accountinfo";
	}
	//QRcode 발급
	@RequestMapping("qrcode")
	public String qrcode(HttpServletRequest req, Model model) throws Exception{
		logger.info("qrcode");
		service.qrcode(req, model);
		return "mypage_kay/qrcode_kay";
	}
	//QRcode 발급처리
	@RequestMapping("qrPro")
	public String qrPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("qrPro");
		service.qrPro(req, model);
		return "mypage_kay/qrPro";
	}
	//이체한도조회
	@RequestMapping("limit_sel")
	public String limit_sel(HttpServletRequest req, Model model) throws Exception{
		logger.info("limit_sel");
		service.myCheq_list(req, model);
		return "mypage_kay/limit_sel_kay";
	}
	//이체한도수정
	@RequestMapping("lim_pro")
	public String limit_up(HttpServletRequest req, Model model) throws Exception{
		logger.info("lim_pro_kay");
		service.limit_up(req, model);
		return "mypage_kay/lim_pro_kay";
	}
	//정보수정-pw
	@RequestMapping("myinfoPw")
	public String myinfoPw(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoPw");
		return "mypage_kay/myinfoPw_kay";
	}
	//정보수정form
	@RequestMapping("myinfoForm")
	public String myinfoForm(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoForm");
		service.info(req, model);
		return "mypage_kay/myinfoForm_kay";
	}
	//정보수정-처리
	@RequestMapping("myinfoPro")
	public String myinfoPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("myinfoPro");
		service.up_info(req, model);
		return "mypage_kay/myinfoPro_kay";
	}
	//내서류 조회
	@RequestMapping("document")
	public String document_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("document_kay");
		service.docu_list(req, model);
		return "mypage_kay/document_kay";
	}
	//서류 등록
	@RequestMapping("upload")
	public String uploadForm_kay(HttpServletRequest  req, Model model) throws Exception{
		logger.info("upload");
		return "mypage_kay/uploadForm_kay";
	}
	 //서류이미지 등록체크
	@RequestMapping("uploadResult")
	public String uploadResult_kay(HttpServletRequest req, Model model) throws Exception{
		logger.info("uploadResult");	
		service.addimg(req, model);
		return "mypage_kay/uploadResult_kay";
	}
	//서류인식
	@RequestMapping("docu_read")
	public String docu_read(String file, Model model) throws Exception{
		logger.info("docu_read");	
		service.readDoc(file, model);
		return "mypage_kay/docu_read";
	}
	//회원탈퇴 -pw
	@RequestMapping("deluserPw")
	public String deluserPw(HttpServletRequest req, Model model) throws Exception{
		logger.info("deluserPw");
		return"mypage_kay/deluserPw_kay";
	}
	//회원탈퇴처리
	@RequestMapping("deluserPro")
	public String deluserPro(HttpServletRequest req, Model model) throws Exception{
		logger.info("deluserPro");
		service.del_mem(req, model);
		return"mypage_kay/deluserPro_kay";
	}
	//계좌이체
	@RequestMapping("trans")
	public String trans(HttpServletRequest req, Model model) throws Exception{
		logger.info("trans");
		service_syk.trans(req);
		
		return "mypage_kay/trans_info";
	}
	//계좌이체정보확인
	@RequestMapping("trans_Chk")
	public String trans_Chk(HttpServletRequest req, Model model) throws Exception{
		logger.info("trans_Chk");
		return "mypage_kay/trans_infoChk";
	}
	//자동이체
	@RequestMapping("auto_trans")
	public String auto_trans(HttpServletRequest req, Model model) throws Exception{
		logger.info("auto_trans");
		return "mypage_kay/auto_trans";
	}
	//자동이체정보확인
	@RequestMapping("auto_Chk")
	public String auto_Chk(HttpServletRequest req, Model model) throws Exception{
		logger.info("auto_Chk");
		return "mypage_kay/auto_transChk";
	}
	
	
	/*//계좌해지 - pwcheq
	@RequestMapping("delcheq")
	public String delcheq(HttpServletRequest req, Model model) throws Exception{
		logger.info("delcheq");
		service.del_cheq(req, model);
		return "mypage_kay/delcheq";
	}*/
	/*//기본setting 페이지
	@RequestMapping("test")
	public String test(HttpServletRequest req, Model model) throws Exception{
		logger.info("test");
		return "mypage_kay/test_kay2";
	}
	//기본setting 페이지
	@RequestMapping("sdf")
	public String sdf(HttpServletRequest req, Model model) throws Exception{
		logger.info("sdf");
		return "mypage_kay/sdf";
	}*/

}