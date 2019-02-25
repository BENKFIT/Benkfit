package spring.mvc.benkfit.persistence;

import java.util.List;

import spring.mvc.benkfit.vo.LoanProductVO;

public interface DAO_bh {
	
	//대출상품리스트조회
	public List<LoanProductVO> loanList();
	//대출상품조회
	public LoanProductVO loanInfo(String num);
	//대출상품등록
	public int loanPro(LoanProductVO vo);
	//대출상품삭제
	public int loanDel(String num);
}
