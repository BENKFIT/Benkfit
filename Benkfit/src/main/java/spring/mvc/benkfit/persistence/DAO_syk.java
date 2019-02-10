package spring.mvc.benkfit.persistence;

import java.util.*;

import spring.mvc.benkfit.vo.*;

public interface DAO_syk {
	
	//예금상품조회
	public List<CheqProductVO> checkingRegi();
	
	//예금상품등록
	public int cheqRegiPro(CheqProductVO vo);

}
