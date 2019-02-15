package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.web3j.protocol.http.HttpService;

public interface Service_bh {
	
	//계정 잔액 가져오기
	public void Balance(HttpServletRequest req, Model model)throws Exception;
	
	//계정생성하기
	public void createAccount(HttpServletRequest req, Model model)throws Exception;
	
	/*
	 * 슬롯머신
	 */
	//슬롯잔고채우기
	public void slotStock(HttpServletRequest req, Model model) throws Exception;
	//슬롯머신잔고확인
	public void slotStockBalance(HttpServletRequest req, Model model) throws Exception;
	//슬롯머신플레이
	public void slot(HttpServletRequest req, Model model) throws Exception; 
	//슬롯머신 컨트랙트 삭제(해당 계정의 잔고는 address(0)으로 돌아오고 계정은 삭제된다.
	public void slotKill(HttpServletRequest req, Model model) throws Exception;

	/*
	 * 송금
	 */
	//송금하기
	public void transferPro(HttpServletRequest req, Model model) throws Exception;
	
	/*
	 * 예금
	 */
	//예금
	public void deposit(HttpServletRequest req, Model model) throws Exception;
	//예금액확인하기
	public void bankBalance(HttpServletRequest req, Model model) throws Exception;
	//예금에서 인출하기
	public void bankWithdraw(HttpServletRequest req, Model model) throws Exception;
	
}
