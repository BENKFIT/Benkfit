package spring.mvc.benkfit.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface Service_kay {
	
	//마이페이지  내정보
	/*public void mypage_info(HttpServletRequest req, Model model)throws Exception;*/
	
	//예금계좌 //이체한도 조회
	public void myCheq_list(HttpServletRequest req, Model model)throws Exception;
	
	//대출계좌
	public void myloan_list(HttpServletRequest req, Model model)throws Exception;
	
	//적금계좌
	public void mysav_list(HttpServletRequest req, Model model)throws Exception;
	
	//idpw체크
	public void idpwChk(HttpServletRequest req, Model model)throws Exception;
	
	//내정보 -화면
	public void info(HttpServletRequest req, Model model)throws Exception;
	
	//내정보 수정처리
	public void up_info(HttpServletRequest req, Model model)throws Exception;
		
	//탈퇴
	public void del_mem(HttpServletRequest req, Model model)throws Exception;
	
	//qr코드생성
	public void qrcode(HttpServletRequest req, Model model)throws Exception;
	
	//qr코드생성후 코드변경
	public void qrPro(HttpServletRequest req, Model model)throws Exception;
	
	//이체한도 수정
	public void limit_up(HttpServletRequest req, Model model)throws Exception;
	
	//예금계좌 상세 조회
	public void sel_cheq(HttpServletRequest req, Model model)throws Exception;
	
	//대출계좌 상세조회
	public void sel_loan(HttpServletRequest req, Model model)throws Exception;
	
	//적금계좌 상세조회
	public void sel_sav(HttpServletRequest req, Model model)throws Exception;
	
	//예금해지
	public void del_cheq(HttpServletRequest req, Model model)throws Exception;
	
	//적금해지
	public void del_sav(HttpServletRequest req, Model model)throws Exception;
	
	//해지
	public void sls(HttpServletRequest req, Model model)throws Exception;
	
	// 파일 업로드 & 텍스트 인식
	public void getText(String file, Model model) throws IOException;

	//서류등록처리
	public void signInPro(MultipartHttpServletRequest req, Model model)throws Exception;
	
	//서류조회
	public void seldocu(HttpServletRequest req, Model model)throws Exception;
	
	//서류조회 -상세
	public void detaildocu(HttpServletRequest req, Model model)throws Exception;
	
	//서류삭제 
	public void deletedocu(HttpServletRequest req, Model model)throws Exception;
	
	//서류 양식 다운로드 
	public void downdocu(HttpServletRequest req, HttpServletResponse res,Model model) throws Exception;
	
	//자산관리 - 예산chart
	public void budget(HttpServletRequest req, Model model)throws Exception;

	void mypage_info(HttpServletRequest req, Model model, Authentication authentication);
}
