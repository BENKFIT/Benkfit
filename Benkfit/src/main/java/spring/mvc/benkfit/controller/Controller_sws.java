package spring.mvc.benkfit.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.admin.methods.response.NewAccountIdentifier;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;

import spring.mvc.benkfit.persistence.DAO_lia;
import spring.mvc.benkfit.persistence.DAO_sws;
import spring.mvc.benkfit.service.ServiceImpl_syk;
import spring.mvc.benkfit.service.Service_sws;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.MySavAccountVO;
import spring.mvc.benkfit.vo.MyloanAccountVO;
import spring.mvc.benkfit.vo.SavProductVO;
import spring.mvc.benkfit.vo.TransDetailVO;
import spring.mvc.benkfit.vo.UsersVO;
import spring.mvc.benkfit.vo.myCheqAccountVO;

@Controller
public class Controller_sws {
	
	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));

	final String path = "C:\\DEV43\\ether\\keystore\\";
	int chkNum = 0;

	String fn = "0x";

	BigInteger gasPrice = BigInteger.valueOf(3000000);
	BigInteger gasLimit = BigInteger.valueOf(3000000);

	@Autowired
	Service_sws service;
	@Autowired
	ServiceImpl_syk service2;
	
	@Autowired
	DAO_sws dao;
	@Autowired
	DAO_lia dao2;

	private static final Logger logger = LoggerFactory.getLogger(Controller_sws.class);

	// 첫방문 고객 안내
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("firstVisit_sws")
	public String string() throws Exception {
		logger.info("firstVisit_sws");
		return "common/info/firstVisit";
	}
	
	// FAQ
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("faq_sws")
	public String faq_sws() throws Exception {
		logger.info("faq_sws");
		return "common/info/faq";
	}

	// 이용 시간 안내
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("hoursOfUse_sws")
	public String hoursOfUse_sws() throws Exception {
		logger.info("hoursOfUse_sws");
		return "common/info/hoursOfUse";
	}

	// 이용 수수료 안내
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("useFee_sws")
	public String useFee_sws() throws Exception {
		logger.info("useFee_sws");
		return "common/info/useFee";
	}

	// ********************************************************************************** //

	// 이벤트 목록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("eventList_sws")
	public String eventList_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("eventList_sws");

		service.eventList_sws(req, model);

		return "common/event/eventList";
	}

	// 이벤트 상세 페이지
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("eventContentForm_sws")
	public String eventContentForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("eventContentForm_sws");
		String eve_num = req.getParameter("eve_num");
		
		service.eventContentForm_sws(req, model);

		if (eve_num.equals("1")) {
			return "common/event/slot";
		}
		
		return "common/event/eventContentForm";
	}

	// 관리자 - 이벤트 목록
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("event_list_sws")
	public String event_list_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_list_sws");

		service.eventList_sws(req, model);

		return "admin/event/event_list";
	}

	// 관리자 - 이벤트 상세 페이지
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("event_contentForm_sws")
	public String event_contentForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_contentForm_sws");
		String eve_num = req.getParameter("eve_num");

		service.eventContentForm_sws(req, model);
		
		if (eve_num.equals("1")) {
			return "common/event/slotAdmin";
		}
		return "admin/event/event_contentForm";
	}

	// 관리자 - 이벤트 추가 폼
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("event_addForm_sws")
	public String event_addForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_addForm_sws");

		return "admin/event/event_addForm";
	}

	// 관리자 - 이벤트 추가 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("event_addPro_sws")
	public String event_addPro_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_addPro_sws");

		service.event_addPro_sws(req, model);

		return "admin/event/event_addPro";
	}

	// 관리자 - 이벤트 수정 폼
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("event_modifyForm_sws")
	public String event_modifyForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_modifyForm_sws");

		service.event_modifyForm_sws(req, model);

		return "admin/event/event_modifyForm";
	}

	// 관리자 - 이벤트 수정 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("event_modifyPro_sws")
	public String event_modifyPro_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_modifyPro_sws");

		service.event_modifyPro_sws(req, model);

		return "admin/event/event_modifyPro";
	}

	// 관리자 - 이벤트 삭체 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("event_deletePro_sws")
	public String event_deletePro_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_deletePro_sws");

		service.event_deletePro_sws(req, model);

		return "admin/event/event_deletePro";
	}

	// 다음지도 은행
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("map_sws")
	public String map_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("map_sws");
		return "common/map/map";
	}
	
	// 결산 차트
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("productChart_sws")
	public String productChart_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("productChart_sws");
		return "admin/chart/productChart";
	}
	
	// 결산 차트2
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("productChart_sws2")
	public String productChart_sws2(HttpServletRequest req, Model model) throws Exception{
		logger.info("productChart_sws2");
		return "admin/chart/productChart2";
	}
	
	// 년별 차트
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("chartYear_sws")
	public String chartYear_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("chartYear_sws");

		service.chartList(req, model);
		
		return "admin/chart/chartYear";
	}
	
	// 월별 차트
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("chartMonth_sws")
	public String chartMonth_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("chartMonth_sws");

		service.chartList1(req, model);
		
		return "admin/chart/chartMonth";
	}
	
	// 일별 차트
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("chartDay_sws")
	public String chartDay_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("chartDay_sws");

		service.chartList2(req, model);
		
		return "admin/chart/chartDay";
	}

	// 안드로이드 로그인
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req) throws Exception{
		logger.info("androidSignIn()");

		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("id:" + id + " pwd:" + pwd);

		Map<String, String> in = new HashMap<String, String>();
		in.put("c_id", id);
		in.put("c_pwd", pwd);
		int cnt = dao.confirmIdPwd(in);

		Map<String, String> out = new HashMap<String, String>();
		if(cnt != 0) {
			out.put("c_id", id);
		} else {
			out.put("c_id", null);
		}

		return out;
	}

	// 안드로이드 메인페이지
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidMain")
	public Map<String, Object> androidMain(HttpServletRequest req) throws Exception{
		logger.info("androidMain()");

		String id = req.getParameter("id");
		UsersVO u = dao.getMemberInfo(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", u.getC_name());
		map.put("data2", u.getC_level());
		map.put("data3", 0);
		map.put("data4", 0);
		map.put("users", u);
		
		return map;
	}
	
	// 금융 상품 페이지
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidProduct")
	public Map<String, Object> androidProduct(HttpServletRequest req) throws Exception{
		logger.info("androidProduct()");

		String id = req.getParameter("id");
		List<CheqProductVO> c = dao.cheqProduct();
		List<SavProductVO> s = dao.savProduct();
		List<LoanProductVO> l = dao.loanProduct();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cheqProduct", c);
		map.put("savProduct", s);
		map.put("loanProduct", l);
		
		return map;
	}
	
	// 금융 상품 상세 페이지
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidProductContent")
	public Map<String, Object> androidProductContent(HttpServletRequest req) throws Exception{
		logger.info("androidProductContent()");
		
		String num = req.getParameter("item").split("\n")[0].substring(10);
		String name = req.getParameter("item").split("\n")[1].substring(9);
		
		Map<String, Object> in = new HashMap<String, Object>();
		in.put("num", num);
		in.put("name", name);

		Map<String, Object> out = new HashMap<String, Object>();
		if(dao.cheqProductContent(in) != null) {
			CheqProductVO c = dao.cheqProductContent(in);
			out.put("cheqProductContent", c);
		}else if(dao.savProductContent(in) != null) {
			SavProductVO s = dao.savProductContent(in);
			out.put("savProductContent", s);
		}else if(dao.loanProductContent(in) != null) {
			LoanProductVO l = dao.loanProductContent(in);
			out.put("loanProductContent", l);
		}
		return out;
	}
	
	// QR코드 로그인
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidQrcodeLogin")
	public Map<String, String> androidQrcodeLogin(HttpServletRequest req) throws Exception{
		logger.info("androidQrcodeLogin()");
		
		String item = req.getParameter("item");
		System.out.println("item == " + item);
		String id = req.getParameter("item").split("/")[0].split(":")[1];
		String pwd = req.getParameter("item").split("/")[1].split(":")[1];
		System.out.println("id = " + id + "pwd = " + pwd);
		
		Map<String, Object> in = new HashMap<String, Object>();
		in.put("id", id);
		in.put("pwd", pwd);
		
		System.out.println("id:" + id + "   pwd:" + pwd);

		int cnt = dao.qrConfirmIdPwd(in);

		Map<String, String> out = new HashMap<String, String>();
		if(cnt != 0) {
			out.put("c_id", id);
		} else {
			out.put("c_id", null);
		}

		return out;
	}
	
	// 앱 지갑 생성
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidCheq")
	public Map<String, Object> androidCheq(HttpServletRequest req) throws Exception{
		logger.info("androidCheq()");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String num = req.getParameter("num");
		System.out.println("id = " + id + "    pwd = " + pwd + "      num = " + num);
		
		//새 계정생성
		NewAccountIdentifier newAccount = admin.personalNewAccount(pwd).send();
		String account = newAccount.getAccountId();

		myCheqAccountVO vo = new myCheqAccountVO();
		vo.setC_id(id);
		vo.setCheq_num(num);
		vo.setPwd(pwd);
		vo.setMyCheq_account(account);
		
		int result = dao.insertWallet(vo);
		
		boolean success = false;
		if(result == 1) {
			success = true; 
			System.out.println("새로운 계정을 만드는 함수입니다.");
			System.out.println("새 계정의 입력받은 비밀번호 : " + pwd);
			System.out.println("성공여부 : " + success);

			//10이더 전송
			Credentials credentials = WalletUtils.loadCredentials("1234", "C:\\DEV43\\ether\\keystore\\UTC--2019-02-15T06-08-59.949370200Z--4aca841d5384d16bd0ade39037a14b338caf06c9");
			TransactionReceipt transfer = Transfer.sendFunds(web3j, credentials, account, BigDecimal.valueOf(10), Convert.Unit.ETHER).send();
			
			
		} else {
			System.out.println("실패");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", id);
		map.put("data2", num);
		map.put("data3", pwd);
		map.put("data4", account); 
		
		return map;
	}
	
	// 안드로이드 거래내역
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidTransDetail")
	public Map<String, Object> androidTransDetail(HttpServletRequest req) throws Exception{
		logger.info("androidTransDetail()");

		String id = req.getParameter("id");
		List<TransDetailVO> t = dao.TransDetail(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("TransDetail", t);
		
		return map;
	}
	
	// 안드로이드 예금계좌내역
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidMyCheqAccounts")
	public Map<String, Object> androidMyCheqAccounts(HttpServletRequest req) throws Exception{
		logger.info("androidMyCheqAccounts()");

		String id = req.getParameter("id");
		List<myCheqAccountVO> c = dao.myCheqAccounts(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myCheqAccount", c);
		
		return map;
	}
	
	// 안드로이드 적금계좌내역
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidMySavAccounts")
	public Map<String, Object> androidMySavAccounts(HttpServletRequest req) throws Exception{
		logger.info("androidMySavAccounts()");

		String id = req.getParameter("id");
		List<MySavAccountVO> s = dao.mySavAccounts(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mySavAccount", s);
		
		return map;
	}
	
	// 안드로이드 대출계좌내역
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping("androidMyLoanAccounts")
	public Map<String, Object> androidMyLoanAccounts(HttpServletRequest req) throws Exception{
		logger.info("androidMyLoanAccounts()");

		String id = req.getParameter("id");
		List<MyloanAccountVO> l = dao.myLoanAccounts(id);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myLoanAccount", l);
		
		return map;
	}
	
	// 아코디언 테스트
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("faq_sws2")
	public String faq_sws2() throws Exception {
		logger.info("faq_sws2");
		return "common/info/faq2";
	}
	
	// ATM
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("atm_sws")
	public String atm(HttpServletRequest req, Model model) throws Exception {
		logger.info("atm_sws");
		service.getMap(req, model);
		return "common/map/atm";
	}
}
	
