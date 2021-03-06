package spring.mvc.benkfit.persistence;

import java.util.List;
import java.util.Map;

import spring.mvc.benkfit.vo.*;

public interface DAO_kay {
	
	//마이페이지 
	public UsersVO mypage_info(String id);
	
	//예금계좌관리//이체한도 조회
	public List<myCheqAccountVO> myCheq_list(String id);
	
	//대출계좌관리
	public List<MyloanAccountVO> myloan_list(Map<String, Object> map);
	
	//적금계좌관리
	public List<MySavAccountVO> mysav_list(String id);
	
	//id&pwd 체크
	public int idPwdChk(Map<String, Object> map);
	
	//내정보 - 폼
	public UsersVO info(Map<String, Object> map);
	
	//내정보- 수정처리
	public int up_info(UsersVO vo);
	
	//1.예금계좌 잔액 확인
	public int chk_cheq(Map<String, Object> map);
	
	//2.대출계좌 잔액 확인
	public int chk_loan(Map<String, Object> map);
	
	//3.적금계좌 잔액 확인
	public int chk_sav(Map<String, Object> map);
	
	//4.탈퇴
	public int del_mem(String id);
	
	//qr코드 카드 발급할 user정보
	public UsersVO qrcode(String id);
	
	//qr코드 발급후 상태코드변경
	public int qrPro(String id);
	
	//이체한도 수정
	public int limit_up(myCheqAccountVO vo);
	
	//입금합계
	public int cheqIn(Map<String, Object> map);
	
	//출금합계
	public int cheqOut(Map<String, Object> map);
	
	//예금계좌 상세 조회
	public myCheqAccountVO selCheq(Map<String, Object> map);
	
	//거래내역조회 -예금
	public List<TransDetailVO> sel_cheq(Map<String, Object> map);
	
	//대출계좌 상세 조회
	public MyloanAccountVO seloan(Map<String, Object> map);
	
	//거래내역조회 -대출
	public List<TransDetailVO> sel_loan(Map<String, Object> map);
	
	//적금계좌 상세 조회
	public MySavAccountVO selSav(Map<String, Object> map);
	
	//거래내역조회 -적금
	public List<TransDetailVO> sel_sav(Map<String, Object> map);
	
	//예금 계좌잔액
	public int delChe(Map<String, Object> map);
	
	//계좌pw 체크
	public int cheq_pw(Map<String, Object> map);
	
	//예금해지
	public int del_cheq(Map<String, Object> map);
	
	//적금 계좌잔액
	public int delSav(Map<String, Object> map);
	
	//적금계좌pw 체크
	public int sav_pw(Map<String, Object> map);
	
	//적금해지
	public int del_sav(Map<String, Object> map);
	
	//서류등록처리
	public int indocu(documentVO vo);
	
	//서류조회 - 목록
	public List<documentVO> seldocu(String id);
	
	//서류조회 - 상세
	public documentVO detaildocu(Map<String, Object> map);
	
	//서류삭제 
	public int deletedocu(Map<String, Object> map);

	//자산관리 - 예산chart
	public int budget(Map<String, Object> map);
	
	//자산관리 - 예산chart - 날짜 조회
	public DateVO day();
	
	//자산관리 - 예산chart - 날짜 조회
	public DateVO day1();
	
	//자산관리 - 예산chart - 날짜 조회
	public DateVO day2();
	
	//자산관리 - 예산chart - 날짜 조회
	public DateVO day3();
	
}
