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
	
	//적금만기
	@Override
	public int savExpire(String account) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_syk.savExpire", account);
	}

	//계좌조회
	@Override
	public List<String> userAccounts(String id) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_syk.userAccounts", id);
	}
	
	//이체
	@Override
	public int transPro(TransDetailVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_syk.transPro", vo);
	}

	//적금이체
	@Override
	public int savTrans(Map<String, Object> map) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_syk.savTrans", map);
	}
	
	//입금
	public int depositPro(Map<String, Object> map) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_syk.depositPro", map);
	}

	//자동이체 조회
	@Override
	public List<AutoTransferVO> autoSearch(String id) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_syk.autoSearch", id);
	}

	//자동이체 추가
	@Override
	public int autoAdd(AutoTransferVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_syk.autoAdd", vo);
	}

	//자동이체 삭제
	@Override
	public int autoDel(int num) {
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_syk.autoDel", num);
	}

	//자동이체 갯수
	@Override
	public int autoCnt(int day) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_syk.autoCnt", day);
	}

	//자동이체 목록
	@Override
	public List<AutoTransferVO> autoList(int day) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_syk.autoList", day);
	}
}
