package spring.mvc.benkfit.persistence;

import java.util.List;
import java.util.Map;

import spring.mvc.benkfit.vo.AdminVO;
import spring.mvc.benkfit.vo.CardProductVO;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.MySavAccountVO;
import spring.mvc.benkfit.vo.MyloanAccount_kay;
import spring.mvc.benkfit.vo.SavProductVO;
import spring.mvc.benkfit.vo.TransDetailVO;
import spring.mvc.benkfit.vo.UsersVO;
import spring.mvc.benkfit.vo.myCheqAccount_kay;

public interface DAO_lia {

	// id 중복확인
	public int id_check(String strId);
	
	// 실명확인
	public int name_check(Map<String, Object> map);
	
	// 회원가입 처리
	public int insertMember(UsersVO vo);
	
	// 회원 로그인
	public UsersVO user_login(String id, String pwd);
	
	// 관리자 로그인
	public AdminVO admin_login(String id, String pwd);
	
	// 아이디 찾기
	public String findMyId(Map<String, String> map);
	
	// 비밀번호 찾기
	public int findMyPwd(Map<String, String> map);
	
	// 비밀번호 찾기(임시비밀번호 생성)
	public int setTempPwd(Map<String, String> map);

	// 상품 검색
	public int search_card_count(String keyword);
	public int search_cheq_count(String keyword);
	public int search_loan_count(String keyword);
	public int search_sav_count(String keyword);
	public List<CardProductVO> search_card(String keyword);
	public List<CheqProductVO> search_cheq(String keyword);
	public List<LoanProductVO> search_loan(String keyword);
	public List<SavProductVO> search_sav(String keyword);
	
	// 관리자메뉴 > 회원 조회
	public List<UsersVO> selectUsers();
	
	// 관리자메뉴 > 회원 삭제
	public int deleteUsers(String id);
	
	// 관리자메뉴 > 회원 등급 수정
	public int updateUsers(Map<String, String> map);
	
	// 관리자메뉴 > 계좌조회
	public List<myCheqAccount_kay> selectCheq(String id);
	public List<MySavAccountVO> selectSav(String id);
	public List<MyloanAccount_kay> selectLoan(String id);
	
	// 관리자메뉴 > 거래내역 조회
	public int getTransCnt(String account);
	public List<TransDetailVO> getCheqTrans(Map<String, Object> map);
	public List<TransDetailVO> getSavTrans(Map<String, Object> map);
	public List<TransDetailVO> getLoanTrans(Map<String, Object> map);
}
