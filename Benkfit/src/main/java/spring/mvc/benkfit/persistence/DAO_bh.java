package spring.mvc.benkfit.persistence;

import java.util.List;

import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.MyloanAccountVO;

public interface DAO_bh {

	/*
	 * 대출
	 */

	/*
	 * common
	 */
	// 대출상품리스트조회
	public List<LoanProductVO> loanList();

	// 대출상품조회
	public LoanProductVO loanInfo(String num);

	// 대출잔액조회
	public int loanleft(String myLoan_account);

	// 대출신청
	public int loanApply(MyloanAccountVO vo);

	// 대출금리
	// public LoanProductVO loanRate(int loan_num);
	// 대출상환
	public int loanRepayment(MyloanAccountVO vo1);

	/*
	 * admin
	 */
	// 대출상품등록
	public int loanPro(LoanProductVO vo);

	// 대출상품수정
	public int loanEditPro(LoanProductVO vo);

	// 대출상품삭제
	public int loanDel(String loan_num);

	// 대출신청리스트
	public List<MyloanAccountVO> loanApproval();

	// 계정에맞는대출상품가져오기
	public List<MyloanAccountVO> loanApprovalPro_info(String myLoan_account);

	// 대출신청처리(승인)
	public int loanApprovalPro(String myLoan_account);

	// 대출신청처리(거절)
	public int rejection(String myLoan_account);
	
}
