package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface Service_kay {
	
	//계좌관리 목록
	public void myCheq_list(HttpServletRequest req, Model model);
	
	//내서류 목록
	public void docu_list(HttpServletRequest req, Model model);
	
	//qr코드생성
	public void qrcode(HttpServletRequest req, Model model);
	
	//내정보
	public void info(HttpServletRequest req, Model model);
		
}
