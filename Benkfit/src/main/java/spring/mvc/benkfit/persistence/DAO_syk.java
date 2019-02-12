package spring.mvc.benkfit.persistence;

import java.util.*;

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
	
	//적금계좌생상
	public int createSav(Map<String, Object> map);
}
