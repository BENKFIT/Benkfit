package spring.mvc.benkfit.persistence;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import spring.mvc.benkfit.vo.*;

public interface DAO_syk {
	
	//예금상품리스트조회
	public List<CheqProductVO> cheqList();
	
	//적금상품리스트조회
	public List<SavProductVO> savList();
	
	//예금상품조회
	public CheqProductVO cheqInfo(String num);
	
	//적금상품조회
	public SavProductVO savInfo(String num);
	
	//적금상품등록
	public int RegiSaving(SavProductVO vo);
	
	//예금상품등록
	public int RegiCheq(CheqProductVO vo);
	
	//예금계좌생성
	public int createCheq(Map<String, Object> map);
	
	//적금계좌생성
	public int createSav(Map<String, Object> map);
	
	//예금상품삭제
	public int cheqDel(String num);
	
	//적금상품 삭제
	public int savDel(String num);
	
	//적금만기
	public int savExpire(String account);
	
	//계좌조회
	public List<String> userAccounts(String id);
	
	//이체
	public int transPro(TransDetailVO vo);
	
	//적금이체
	public int savTrans(Map<String, Object> map);
	
	//입금
	public int depositPro(Map<String, Object> map);
	
	//자동이체 조회
	public List<AutoTransferVO> autoSearch(String id);
	
	//자동이체 등록
	public int autoAdd(AutoTransferVO vo);
	
	//자동이체 삭제
	public int autoDel(int num);
	
	//자동이체 갯수
	public int autoCnt(int day);
	
	//자동이체 목록
	public List<AutoTransferVO> autoList(int day);
	
	//예금이자갯수
	public int cheqCnt();
	
	//예금리스트
	public List<myCheqAccountVO> cheqInterest();
	
	//적금이자갯수
	public int savCnt();
	
	//적금리스트
	public List<MySavAccountVO> savInterest();
	
	//배포리스트
	public List<ContractVO> deploy();
	
	//배포
	public int deployAdd(ContractVO vo);
	
	//재배포
	public int reDeploy(ContractVO vo);
	
	//contract읽기
	public List<ContractVO> contract();
	
	//contract - benkfit
	public String getBenkfit();
	
	//contract - bank
	public String getBank();
	
	//contract - slot
	public String getSlot();
}
