package spring.mvc.benkfit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.MyloanAccountVO;

@Repository
public class DAOImpl_bh implements DAO_bh {

	@Autowired
	SqlSession sqlSession;

	/*
	 * 대출
	 */

	/*
	 * common
	 */
	// 대출상품리스트조회
	@Override
	public List<LoanProductVO> loanList() {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_bh.loanList");
	}

	// 대출상품조회
	@Override
	public LoanProductVO loanInfo(String num) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_bh.loanInfo", num);
	}

	// 대출 잔액 조회
	@Override
	public int loanleft(String myLoan_account) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_bh.loanleft", myLoan_account);
	}

	// 대출신청
	@Override
	public int loanApply(MyloanAccountVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_bh.loanApply", vo);
	}
	
	// 계정체크
	@Override
	public int account_chenk(String myLoan_account) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_bh.account_chenk", myLoan_account);
	}

	// 대출금리
//	@Override
//	public int loanRate(int loan_num) {
//		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_bh.loanRate", loan_num);
//	}
	// 대출상환
	@Override
	public int loanRepayment(MyloanAccountVO vo1) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_bh.loanRepayment", vo1);
	}

	/*
	 * admin
	 */
	// 대출상품등록
	@Override
	public int loanPro(LoanProductVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_bh.loanPro", vo);
	}

	// 대출상품수정
	@Override
	public int loanEditPro(LoanProductVO vo) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_bh.loanEditPro", vo);
	}

	// 대출상품삭제
	@Override
	public int loanDel(String loan_num) {
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_bh.loanDel", loan_num);
	}

	// 대출신청리스트-전체
	@Override
	public List<MyloanAccountVO> loanApproval() {
		System.out.println("===================전체목록d");
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_bh.loanApproval");
	}
	
	// 대출신청리스트-승인
	@Override
	public List<MyloanAccountVO> loanApproval1() {
		System.out.println("===================승인목록d");
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_bh.loanApproval1");
	}

	// 대출신청리스트-대기
	@Override
	public List<MyloanAccountVO> loanApproval2() {
		System.out.println("===================대기목록d");
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_bh.loanApproval2");
	}

	// 대출신청리스트-거절
	@Override
	public List<MyloanAccountVO> loanApproval3() {
		System.out.println("===================거절목록d");
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_bh.loanApproval3");
	}

	// 계정에맞는대출상품가져오기
	@Override
	public List<MyloanAccountVO> loanApprovalPro_info(String myLoan_account) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_bh.loanApprovalPro_info", myLoan_account);
	}

	// 대출신청처리(승인)
	@Override
	public int loanApprovalPro(String myLoan_account) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_bh.loanApprovalPro", myLoan_account);
	}

	// 대출신청처리(거절)
	@Override
	public int rejection(String myLoan_account) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_bh.rejection", myLoan_account);
	}




}