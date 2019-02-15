package spring.mvc.benkfit.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import spring.mvc.benkfit.vo.*;

@Repository
public class DAOImpl_syk implements DAO_syk{
	
	@Autowired
	SqlSession sqlSession;

	//예금상품리스트조회
	@Override
	public List<CheqProductVO> cheqList() {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_syk.cheqList");
	}
	
	//적금상품리스트조회
	@Override
	public List<SavProductVO> savList(){
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_syk.savList");
	}
	
	//예금상품조회
	@Override
	public CheqProductVO cheqInfo(String num) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_syk.cheqInfo", num);
	}
	
	//적금상품조회
	public SavProductVO savInfo(String num) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_syk.savInfo", num);
	}

	//예금계좌생성
	@Override
	public int createCheq(Map<String, Object> map) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_syk.createCheq", map);
	}
	
	//적금계좌생성
	@Override
	public int createSav(Map<String, Object> map) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_syk.createSav", map);
	}
	
	//적금상품등록
	@Override
	public int RegiSaving(SavProductVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_syk.RegiSaving", vo);
	}

	//예금상품등록
	@Override
	public int RegiCheq(CheqProductVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_syk.RegiCheq", vo);
	}
	
	//예금상품삭제
	@Override
	public int cheqDel(String num) {
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_syk.cheqDel", num);
	}

	//적금상품삭제
	@Override
	public int savDel(String num) {
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_syk.savDel", num);
	}
	
}
