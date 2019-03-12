package spring.mvc.benkfit.controller;
/* 손리아 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.benkfit.persistence.DAO_lia;
import spring.mvc.benkfit.service.Service_lia;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.SavProductVO;

@Controller
public class Controller_lia {

	private static final Logger logger = LoggerFactory.getLogger(Controller_lia.class);
	
	@Autowired
	Service_lia service;
	@Autowired
	DAO_lia dao;
	
	// 메인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("index")
	public String index(HttpServletRequest req) throws Exception {
		logger.info("index 호출중");
		return "Template/index";
	}
	
	// 로그인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("login")
	public String login(HttpServletRequest req) throws Exception {
		logger.info("login 호출중");
		return "common/login";
	}
	
	/*// 로그인 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("loginPro 호출중");
		service.loginPro(req, model);
		 세션id 구하기
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal(); 
		String sessionId = user.getUsername();
		System.out.println("세션 : " + sessionId); 
		return "common/loginPro";
	}*/
	
	// 로그아웃
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception {
		logger.info("logout 호출중");
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 양식
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("signIn")
	public String signIn() throws Exception {
		logger.info("signIn 호출중");
		return "common/signIn";
	}
	
	// 신분증 텍스트 인식
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("getText") 
	public String getText(String file, Model model) throws IOException {
		logger.info("getText 호출중");
		service.getText(file, model);
		return "common/getText";
	}
	
	// id 중복확인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("idCheck") 
	public String idCheck(HttpServletRequest req, Model model) throws Exception { 
		logger.info("idCheck 호출중");
		service.id_check(req, model);
		return "common/idCheck";
	}
	
	// 실명확인
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("nameCheck")
	public String nameCheck(HttpServletRequest req, Model model) throws Exception {
		logger.info("nameCheck 호출중");
		service.nameCheck(req, model);
		return "common/nameCheck";
	}
	
	// 이용약관 페이지
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("terms")
	public String terms() throws Exception {
		logger.info("terms 호출중");
		return "common/terms";
	}
	
	// 회원가입 처리
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("signInPro")
	public String signInPro(MultipartHttpServletRequest req, Model model) throws Exception {
		logger.info("signInPro 호출중");
		service.signInPro(req,  model);
		return "common/signInPro";
	}
	
	// 로그인 실패
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("loginFail")
	public String loginFail(HttpServletRequest req, Model model) throws Exception {
		//service.loginPro(req, model);
		return "common/loginFail";
	}
	
	// 아이디 찾기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("findMyId")
	public String findMyId() throws Exception {
		logger.info("findMyId 호출중");
		return "common/findMyId";
	}
	
	// 아이디 찾기 결과
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("findAccount")
	public String findAccount(HttpServletRequest req, Model model) throws Exception {
		logger.info("findAccount");
		service.findMyId(req, model);
		return "common/findAccount";
	}
		
	// 비밀번호 찾기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("findMyPwd")
	public String findMyPwd() throws Exception {
		logger.info("findMyPwd 호출중");
		return "common/findMyPwd";
	}
	
	// 임시 비밀번호 이메일 보내기
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("pwdEmail")
	public String pwdEmail(HttpServletRequest req, Model model) throws Exception {
		logger.info("pwdEmail 호출중");
		service.pwdEmail(req, model);
		return "common/login";
	}
	
	// 검색 결과
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("search_pro")
	public String search(HttpServletRequest req, Model model) throws Exception {
		logger.info("search_pro 호출중");
		service.search_pro(req, model);
		return "common/search";
	}
	
	// 관리자 메뉴 > 회원 조회
	@Transactional(rollbackFor=Exception.class)
	@Secured("ROLE_ADMIN")
	@RequestMapping("selectUsers")
	public String selectUsers(HttpServletRequest req, Model model) throws Exception {
		logger.info("selectUsers 호출중");
		service.selectUsers(req, model);
		return "admin/users/users";
	}
	
	// 관리자 메뉴 > 회원 삭제
	@Transactional(rollbackFor=Exception.class)
	@Secured("ROLE_ADMIN")
	@RequestMapping("deleteUsers")
	public String deleteUsers(HttpServletRequest req, Model model) throws Exception {
		logger.info("deleteUsers 호출중");
		service.deleteUsers(req, model);
		return "admin/users/updateUsers";
	}
	
	// 관리자 메뉴 > 회원 등급 수정
	@Transactional(rollbackFor=Exception.class)
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateUsers")
	public String updateUsers(HttpServletRequest req, Model model) throws Exception {
		logger.info("updateUsers 호출중");
		service.updateUsers(req, model);
		return "admin/users/updateUsers";
	}
	
	// 관리자 메뉴 > 회원 계좌 조회
	@Transactional(rollbackFor=Exception.class)
	@Secured("ROLE_ADMIN")
	@RequestMapping("selAccount")
	public String selAccount(HttpServletRequest req, Model model) throws Exception {
		logger.info("selAccount 호출중");
		service.selAccount(req, model);
		return "admin/users/selAccount";
	}
	
	// 관리자 메뉴 > 회원 거래내역 조회
	@Transactional(rollbackFor=Exception.class)
	@Secured("ROLE_ADMIN")
	@RequestMapping("selTransaction")
	public String selTransaction(HttpServletRequest req, Model model) throws Exception {
		logger.info("selTransaction 호출중");
		service.selTransaction(req, model);
		return "admin/users/selTransaction";
	}
	
	// 챗봇
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("chatbot")
	public String chatbot() throws Exception {
		logger.info("chatbot 호출중");
		return "common/chatbot";
	}
	
	// 코인 시세
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("marketprice")
	public String marketprice(Model model) throws Exception {
		logger.info("marketprice 호출중");
		service.marketprice(model);
		return "common/marketprice";
	}
	
	// 안드로이드 검색
	@Transactional(rollbackFor=Exception.class)
	@ResponseBody
	@RequestMapping(value="/android/androidSearch", method=RequestMethod.POST)
	public Map<String, Object> androidSearch(HttpServletRequest req){
		logger.info("androidSearch 호출중");
		
		String keyword = req.getParameter("search");
		
		Map<String, String> in = new HashMap<String, String>();
		in.put("keyword", keyword);
		
		ArrayList<CheqProductVO> clist = (ArrayList<CheqProductVO>) dao.search_cheq(keyword);
		List<SavProductVO> slist = dao.search_sav(keyword);
		List<LoanProductVO> llist = dao.search_loan(keyword);
		
		Map<String, Object> out = new HashMap<String, Object>();
		out.put("clist", clist);
		out.put("slist", slist);
		out.put("llist", llist);
		return out;
	}
}
