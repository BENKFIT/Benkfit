package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.web3j.protocol.http.HttpService;

public interface Service_bh {
	
	//계정 잔액 가져오기
	public void Balance(HttpServletRequest req, Model model);
	//계정생성하기
	public void createAccount(HttpServletRequest req, Model model);
	
	/*
	 * 슬롯머신
	 */
	public void slot(HttpServletRequest req, Model model);
	
	/*
	 * 대출
	 */
	//대출 신청
	public void loan(HttpServletRequest req, Model model);
	
	/*
	 * 송금
	 */
	//송금하기
	public void transferPro(HttpServletRequest req, Model model) throws Exception;
	
}
