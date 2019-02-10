package spring.mvc.benkfit.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.benkfit.service.Service_lia;

@Controller
public class Controller_lia {

	private static final Logger logger = LoggerFactory.getLogger(Controller_lia.class);
	
	@Autowired
	Service_lia service;
	
	// 메인
	@RequestMapping("index")
	public String index(HttpServletRequest req) throws Exception {
		logger.info("index 호출중");
		return "Template/index";
	}
	
	// 로그인
	@RequestMapping("login")
	public String login() throws Exception {
		logger.info("login 호출중");
		return "common/login";
	}
	
	
	// 로그인 처리
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req, Model model) throws Exception {
		logger.info("loginPro 호출중");
		service.loginPro(req, model);
		return "common/loginPro";
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpServletRequest req) throws Exception {
		logger.info("logout 호출중");
		System.out.println("로그아웃");
		req.getSession().invalidate();
		return "Template/index";
	}
	
	// 회원가입 양식
	@RequestMapping("signIn")
	public String signIn() throws Exception {
		logger.info("signIn 호출중");
		return "common/signIn";
	}
	
	// 신분증 텍스트 인식
	@RequestMapping("getText") 
	public String getText(String file, Model model) throws IOException {
		logger.info("getText 호출중");
		service.getText(file, model);
		return "common/getText";
	}

	// id 중복확인
	@RequestMapping("idCheck") 
	public String idCheck(HttpServletRequest req, Model model) throws Exception { 
		logger.info("idCheck 호출중");
		service.id_check(req, model);
		return "common/idCheck";
	}
	
	// 실명확인
	@RequestMapping("nameCheck")
	public String nameCheck(HttpServletRequest req, Model model) throws Exception {
		logger.info("nameCheck 호출중");
		service.nameCheck(req, model);
		return "common/nameCheck";
	}
	
	// 이용약관 페이지
	@RequestMapping("terms")
	public String terms() throws Exception {
		logger.info("terms 호출중");
		return "common/terms";
	}
	
	// 회원가입 처리
	@RequestMapping("signInPro")
	public String signInPro(MultipartHttpServletRequest req, Model model) throws Exception {
		logger.info("signInPro 호출중");
		service.signInPro(req, model);
		return "common/signInPro";
	}
	
	// 마이페이지
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("myPageTest")
	public String myPageTest() throws Exception {
		logger.info("myPageTest 호출중");
		return "common/myPageTest";
	}
	
	// 로그인 실패
	@RequestMapping("loginFail")
	public String loginFail(HttpServletRequest req, Model model) throws Exception {
		//service.loginPro(req, model);
		return "common/loginFail";
	}
	
	// 아이디 찾기
	@RequestMapping("findMyId")
	public String findMyId() throws Exception {
		logger.info("findMyId 호출중");
		return "common/findMyId";
	}
	
	// 아이디 찾기 결과
	@RequestMapping("findAccount")
	public String findAccount(HttpServletRequest req, Model model) throws Exception {
		logger.info("findAccount");
		service.findMyId(req, model);
		return "common/findAccount";
	}
		
	// 비밀번호 찾기
	@RequestMapping("findMyPwd")
	public String findMyPwd() throws Exception {
		logger.info("findMyPwd 호출중");
		return "common/findMyPwd";
	}
	
	// 임시 비밀번호 이메일 보내기
	@RequestMapping("pwdEmail")
	public String pwdEmail(HttpServletRequest req, Model model) throws Exception {
		logger.info("pwdEmail 호출중");
		service.pwdEmail(req, model);
		return "common/login";
	}
	
	// 검색 결과
	@RequestMapping("search_pro")
	public String search(HttpServletRequest req, Model model) throws Exception {
		logger.info("search_pro 호출중");
		service.search_pro(req, model);
		return "common/search";
	}
	
	// 관리자 메뉴 > 회원 조회
	@Secured("ROLE_ADMIN")
	@RequestMapping("selectUsers")
	public String selectUsers(HttpServletRequest req, Model model) throws Exception {
		logger.info("selectUsers 호출중");
		service.selectUsers(req, model);
		return "admin/users/users";
	}
	
	// 관리자 메뉴 > 회원 삭제
	@Secured("ROLE_ADMIN")
	@RequestMapping("deleteUsers")
	public String deleteUsers(HttpServletRequest req, Model model) throws Exception {
		logger.info("deleteUsers 호출중");
		service.deleteUsers(req, model);
		return "admin/users/updateUsers";
	}
	
	// 관리자 메뉴 > 회원 등급 수정
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateUsers")
	public String updateUsers(HttpServletRequest req, Model model) throws Exception {
		logger.info("updateUsers 호출중");
		service.updateUsers(req, model);
		return "admin/users/updateUsers";
	}
}
