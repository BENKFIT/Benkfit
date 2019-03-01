package spring.mvc.benkfit.persistence;
/* 손리아 */
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.benkfit.vo.*;

@Repository
public class DAOImpl_lia implements DAO_lia {
	
	@Autowired
	SqlSession sqlSession;
	
	// id 중복확인
	@Override
	public int id_check(String strId) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.id_check", strId);
	}
	// 실명 확인
	@Override
	public int name_check(Map<String, Object> map) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.name_check", map);
	}

	// 회원가입 처리
	@Override
	public int insertMember(UsersVO vo) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_lia.insertMember", vo);
	}

	// 회원 로그인
	@Override
	public UsersVO user_login(String id, String pwd) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.user_login", id);
	}

	// 관리자 로그인
	@Override
	public AdminVO admin_login(String id, String pwd) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.admin_login", id);
	}

	// 아이디 찾기
	@Override
	public String findMyId(Map<String, String> map) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.findMyId", map);
	}

	// 비밀번호 찾기(조회)
	@Override
	public int findMyPwd(Map<String, String> map) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.findMyPwd", map);
	}

	// 비밀번호 찾기(임시비밀번호 생성)
	@Override
	public int setTempPwd(Map<String, String> map) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_lia.setTempPwd", map);
	}

	// 상품 검색 - 카드(건수)
	@Override
	public int search_card_count(String keyword) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.search_card_count", keyword);
	}
	
	// 상품 검색 - 예금(건수)
	@Override
	public int search_cheq_count(String keyword) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.search_cheq_count", keyword);
	}
	
	// 상품 검색 - 대출(건수)
	@Override
	public int search_loan_count(String keyword) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.search_loan_count", keyword);
	}
	
	// 상품 검색 - 적금(건수)
	@Override
	public int search_sav_count(String keyword) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.search_sav_count", keyword);
	}
	
	// 상품 검색 - 카드
	@Override
	public List<CardProductVO> search_card(String keyword) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.search_card", keyword);
	}

	// 상품 검색 - 예금
	@Override
	public List<CheqProductVO> search_cheq(String keyword) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.search_cheq", keyword);
	}

	// 상품 검색 - 대출
	@Override
	public List<LoanProductVO> search_loan(String keyword) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.search_loan", keyword);
	}

	// 상품 검색 - 적금
	@Override
	public List<SavProductVO> search_sav(String keyword) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.search_sav", keyword);
	}

	// 관리자메뉴 > 회원 수
	@Override
	public int howManyUsers() {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.howManyUsers");
	}
	
	// 관리자메뉴 > 회원 조회
	@Override
	public List<UsersVO> selectUsers(Map<String, Object> map) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.selectUsers", map);
	}

	// 관리자메뉴 > 회원 삭제
	@Override
	public int deleteUsers(String id) {
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_lia.deleteUsers", id);
	}

	// 관리자메뉴 > 회원 등급 수정
	@Override
	public int updateUsers(Map<String, String> map) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_lia.updateUsers", map);
	}

	// 관리자메뉴 > 회원별 예금 조회
	@Override
	public List<myCheqAccountVO> selectCheq(String id) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.selectCheq", id);
	}
	
	// 관리자메뉴 > 회원별 적금 조회
	@Override
	public List<MySavAccountVO> selectSav(String id) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.selectSav", id);
	}

	// 관리자메뉴 > 회원별 대출 조회
	@Override
	public List<MyloanAccountVO> selectLoan(String id) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.selectLoan", id);
	}

	// 관리자메뉴 > 계좌 거래내역 건수
	@Override
	public int getTransCnt(String account) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.getTransCnt", account);
	}

	// 관리자메뉴 > 예금 거래내역 조회
	@Override
	public List<TransDetailVO> getCheqTrans(Map<String, Object> map) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.getCheqTrans", map);
	}

	// 관리자메뉴 > 적금 거래내역 조회
	@Override
	public List<TransDetailVO> getSavTrans(Map<String, Object> map) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.getSavTrans", map);
	}
	
	// 관리자메뉴 > 대출 거래내역 조회
	@Override
	public List<TransDetailVO> getLoanTrans(Map<String, Object> map) {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.getLoanTrans", map);
	}

	// 코인 종류 세팅
	@Override
	public int insertCoins(Map<String, String> name) {
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_lia.insertCoins", name);
	}

	// 코인 시세 업데이트
	@Override
	public int updateCoins(Map<String, Object> vals) {
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_lia.updateCoins", vals);
	}

	// 코인 정보
	@Override
	public List<PriceVO> selectCoins() {
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_lia.selectCoins");
	}
	
}
