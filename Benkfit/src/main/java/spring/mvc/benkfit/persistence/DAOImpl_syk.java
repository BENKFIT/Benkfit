package spring.mvc.benkfit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import spring.mvc.benkfit.vo.CheqProductVO;

@Repository
public class DAOImpl_syk implements DAO_syk{
	
	@Autowired
	SqlSession sqlSession;

	//예금상품조회
	@Override
	public List<CheqProductVO> checkingRegi() {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_syk.checkingRegi");
	}
	
	//예금상품등록
	@Override
	public int cheqRegiPro(CheqProductVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_syk.cheqRegiPro", vo);
	}
}
