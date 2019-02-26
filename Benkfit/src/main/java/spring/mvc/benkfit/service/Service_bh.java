package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.web3j.protocol.http.HttpService;

public interface Service_bh {

	/*
	 * 이더리움 간편 체험
	 */
	// 계정생성하기
	public void createAccount(HttpServletRequest req, Model model) throws Exception;

	// 계정 잔액 가져오기
	public void Balance(HttpServletRequest req, Model model) throws Exception;

	// 이더 송금하기
	public void transferPro(HttpServletRequest req, Model model) throws Exception;

	// 이더 예금
	public void deposit(HttpServletRequest req, Model model) throws Exception;

	// 이더 예금액확인하기
	public void bankBalance(HttpServletRequest req, Model model) throws Exception;

	// 이더 예금에서 인출하기
	public void bankWithdraw(HttpServletRequest req, Model model) throws Exception;

	/*
	 * 슬롯머신
	 */

	/*
	 * common
	 */
	// 슬롯머신플레이
	public void slot(HttpServletRequest req, Model model) throws Exception;

	// 슬롯머신 컨트랙트 삭제(해당 계정의 잔고는 address(0)으로 돌아오고 계정은 삭제된다.
	public void slotKill(HttpServletRequest req, Model model) throws Exception;

	/*
	 * admin
	 */
	// 슬롯잔고채우기
	public void slotStock(HttpServletRequest req, Model model) throws Exception;

	// 슬롯머신잔고확인
	public void slotStockBalance(HttpServletRequest req, Model model) throws Exception;

	/*
	 * 대출
	 */

	/*
	 * common
	 */
	// 대출상품목록
	public void loanList(HttpServletRequest req, Model model) throws Exception;

	// 대출상품조회
	public void loanInfo(HttpServletRequest req, Model model) throws Exception;

	// 대출신청
	public void loanApply(HttpServletRequest req, Model model) throws Exception;

	// 계정 대출 잔액 가져오기(한도)
	public void loanBalance(HttpServletRequest req, Model model) throws Exception;

	// 대출 잔액 가져오기
	public void loanleft(HttpServletRequest req, Model model) throws Exception;

	// 대출금거래하기
	public void loanTransfer(HttpServletRequest req, Model model) throws Exception;

	// 대출상환하기
	public void loanRepayment(HttpServletRequest req, Model model) throws Exception;

	/*
	 * admin
	 */
	// 대출상품등록
	public void loanRegiPro(HttpServletRequest req, Model model) throws Exception;

	// 대출상품수정
	public void loanEdit(HttpServletRequest req, Model model) throws Exception;

	// 대출상품수정처리
	public void loanEditPro(HttpServletRequest req, Model model) throws Exception;

	// 대출상품마감
	public void loanDel(HttpServletRequest req, Model model) throws Exception;

	// 대출신청리스트
	public void loanApproval(HttpServletRequest req, Model model) throws Exception;
	//대출신청허가
	public void loanApprovalPro(HttpServletRequest req, Model model) throws Exception;

	// 대출신청처리(거절)
	public void rejection(HttpServletRequest req, Model model) throws Exception;

	/*
	 * 거래검증소
	 */
	// 거래검증하기
	public void verify(HttpServletRequest req, Model model) throws Exception;

}
