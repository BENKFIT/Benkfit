package spring.mvc.benkfit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.benkfit.vo.LoanProductVO;

@Repository
public class DAOImpl_bh implements DAO_bh {
	
	@Autowired
	SqlSession sqlSession;

	//대출상품리스트조회
	@Override
	public List<LoanProductVO> loanList() {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_bh.loanList");
	}

	//대출상품조회
	@Override
	public LoanProductVO loanInfo(String num) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_bh.loanInfo", num);
	}

	//대출상품등록
	@Override
	public int loanPro(LoanProductVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_bh.loanPro", vo);
	}
	
	//대출상품삭제
	@Override
	public int loanDel(String num) {
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_bh.loanDel", num);
	}

	
}