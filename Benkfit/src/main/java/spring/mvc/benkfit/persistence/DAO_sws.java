package spring.mvc.benkfit.persistence;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import spring.mvc.benkfit.vo.AndroidVO;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.EventVo;
import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.MySavAccountVO;
import spring.mvc.benkfit.vo.MyloanAccountVO;
import spring.mvc.benkfit.vo.SavProductVO;
import spring.mvc.benkfit.vo.TransDetailVO;
import spring.mvc.benkfit.vo.UsersVO;
import spring.mvc.benkfit.vo.myCheqAccountVO;

public interface DAO_sws {

	public int getEventCnt(String strId);
	
	public List<EventVo> getEventList(Map<String, Object> map);
	
	public EventVo getEvent(String eve_num);
	
	public int insertEvent(EventVo vo);
	
	public int updateEvent(EventVo vo);

	public UsersVO getMemberInfo(String id);
	
	public JSONObject getYearChat();
	
	public JSONObject getMonthChat();
	
	public JSONObject getDayChat();
	
	public int deleteEvent(String eve_num);
	
	public int confirmIdPwd(Map<String, String> map);
	
	public List<CheqProductVO> cheqProduct();
	
	public List<SavProductVO> savProduct();
	
	public List<LoanProductVO> loanProduct();
	
	public CheqProductVO cheqProductContent(Map<String, Object> map);
	
	public SavProductVO savProductContent(Map<String, Object> map);
	
	public LoanProductVO loanProductContent(Map<String, Object> map);
	
	public int insertWallet(myCheqAccountVO vo);
	
	public List<TransDetailVO> TransDetail(String id);
	
	public int qrConfirmIdPwd(Map<String, Object> map);
	
	public List<myCheqAccountVO> myCheqAccounts(String id);
	
	public List<MySavAccountVO> mySavAccounts(String id);
	
	public List<MyloanAccountVO> myLoanAccounts(String id);
	
	/*public AndroidVO selectWallet(String id);*/
}
