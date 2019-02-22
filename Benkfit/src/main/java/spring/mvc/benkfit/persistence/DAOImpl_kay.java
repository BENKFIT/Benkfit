package spring.mvc.benkfit.persistence;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.benkfit.vo.*;

@Repository
public class DAOImpl_kay implements DAO_kay{
	
	@Autowired
	SqlSession sqlSession;
	
	//마이페이지
	@Override
	public UsersVO mypage_info(String id) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.mypage_info(id);
	}
	//예금관리//이체한도 조회
	@Override
	public List<myCheqAccountVO> myCheq_list(String id) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		List<myCheqAccountVO> cheq = dao.myCheq_list(id);
		return cheq;
	}
	//대출관리
	@Override
	public List<MyloanAccountVO> myloan_list(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		List<MyloanAccountVO> loan = dao.myloan_list(map);
		return loan;
	}	
	//적금관리
	@Override
	public List<MySavAccountVO> mysav_list(String id) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		List<MySavAccountVO> sav = dao.mysav_list(id);
		return sav;
	}
	//내정보
	@Override
	public UsersVO info(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.info(map);
	}
	
	//내정보- 수정처리
	@Override
	public int up_info(UsersVO vo) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.up_info(vo);
	}
	//id&pwd 체크
	@Override
	public int idPwdChk(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.idPwdChk(map);
	}
	//qr코드 생성
	@Override
	public UsersVO qrcode(String id){
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.qrcode(id);
	}
	//qr코드 상태코드변경
	@Override
	public int qrPro(String id){
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.qrPro(id);
	}
	//1.예금 잔액확인
	@Override
	public int chk_cheq(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.chk_cheq(map);
	}
	//2. 대출 잔액 확인
	@Override
	public int chk_loan(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.chk_loan(map);
	}
	//3. 적금 잔액 확인
	@Override
	public int chk_sav(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.chk_loan(map);
	}
	//4. 탈퇴처리
	@Override
	public int del_mem(String id) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.del_mem(id);
	}
	//이체한도 수정
	@Override
	public int limit_up(myCheqAccountVO vo) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.limit_up(vo);
	}
	//예금거래내역조회
	@Override
	public myCheqAccountVO selCheq(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.selCheq(map);
	}
	//입금합계
	@Override
	public int cheqIn(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.cheqIn(map);
	}
	//출금합계
	@Override
	public int cheqOut(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.cheqOut(map);
	}
	//거래내역 조회
	@Override
	public List<TransDetailVO> sel_cheq(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.sel_cheq(map);
	}
	//계좌잔액
	@Override
	public int delChe(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.delChe(map);
	}
	//계좌pw 체크
	@Override
	public int cheq_pw(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.cheq_pw(map);
	}
	//계좌탈퇴
	@Override
	public int del_cheq(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.del_cheq(map);
	}
	//서류등록처리
	@Override
	public int indocu(documentVO vo) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.indocu(vo);
	}
	//서류조회 - 목록
	@Override
	public List<documentVO> seldocu(String id) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.seldocu(id);
	}
	//서류조회 - 상세
	@Override
	public documentVO detaildocu(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.detaildocu(map);
	}
	//서류삭제 
	@Override
	public int deletedocu(Map<String, Object> map) {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.deletedocu(map);
	}
}
