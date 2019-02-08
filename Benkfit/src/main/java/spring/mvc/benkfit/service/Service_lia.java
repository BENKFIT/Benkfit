package spring.mvc.benkfit.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.benkfit.vo.UsersVO;

public interface Service_lia {
	
	// 파일 업로드 & 텍스트 인식
	public void getText(String file, Model model) throws IOException;
	
	// id 중복 확인
	public void id_check(HttpServletRequest req, Model model);
	
	// 실명확인
	public void nameCheck(HttpServletRequest req, Model model);
	
	// 비밀번호, 주민번호 뒷자리 암호화
	public String encryptSHA256(String str);
	
	// 회원가입 처리
	public void signInPro(MultipartHttpServletRequest req, Model model);
	
	// 로그인
	public void loginPro(HttpServletRequest req, Model model);
	
	// 아이디 찾기
	public void findMyId(HttpServletRequest req, Model model);
	
	// 임시 비밀번호 이메일 보내기
	public void pwdEmail(HttpServletRequest req, Model model);
	public void sendEmail(Map<String, String> map);
	
	// 검색
	public void search_pro(HttpServletRequest req, Model model);
	
	// 관리자메뉴 > 회원 조회
	public void selectUsers(HttpServletRequest req, Model model);
}
