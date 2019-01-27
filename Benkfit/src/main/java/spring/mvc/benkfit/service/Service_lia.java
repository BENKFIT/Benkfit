package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import spring.mvc.benkfit.vo.Users;

public interface Service_lia {
	
	//id 중복 확인
	public void id_check(HttpServletRequest req, Model model);
	
	//실명확인
	public void nameCheck(HttpServletRequest req, Model model);
	
	//비밀번호 암호화
	public String encryptSHA256(String str);
	
	//회원가입 처리
	public void signInPro(HttpServletRequest req, Model model);
	
	//로그인
	public void loginPro(HttpServletRequest req, Model model);
}
