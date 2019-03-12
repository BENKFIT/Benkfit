package spring.mvc.benkfit.persistence;

import java.math.BigInteger;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.http.HttpService;

import spring.mvc.benkfit.vo.*;

@Repository
public class DAOImpl_sws implements DAO_sws {
	
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));

	final String path = "C:\\ether\\geth\\private_net\\keystore\\";
	int chkNum = 0;

	String fn = "0x";

	BigInteger gasPrice = BigInteger.valueOf(3000000);
	BigInteger gasLimit = BigInteger.valueOf(3000000);

	
	@Autowired
	SqlSession sqlSession;

	// 이벤트 목록 갯수
	@Override
	public int getEventCnt(String strId) {
			
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_sws.getEventCnt", strId);
	}

	// 이벤트 목록
	@Override
	public List<EventVo> getEventList(Map<String, Object> map) {
		
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getEventList", map);
	}

	// 이벤트 상세 페이지
	@Override
	public EventVo getEvent(String eve_num) {
		
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_sws.getEvent", eve_num);
	}
	
	// 이벤트 추가 처리
	@Override
	public int insertEvent(EventVo vo) {
       
		return sqlSession.insert("spring.mvc.benkfit.persistence.DAO_sws.insertEvent", vo);
	}

	// 이벤트 수정
	@Override
	public int updateEvent(EventVo vo) {
		
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_sws.updateEvent", vo);
	}

	// 이벤트 삭제
	@Override
	public int deleteEvent(String eve_num) {
		
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_sws.deleteEvent", eve_num);
	}
	
	// 연별 차트
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getYearChat() {
		
	    JSONObject responseObj = new JSONObject();
	    List<JSONObject> barlist = new LinkedList<JSONObject>();
	    
		List<ChartVO> cvo1 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getYearFirstChat");
		List<ChartVO> cvo2 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getYearSecondChat");
		List<ChartVO> cvo3 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getYearThirdChat");
		
		for(ChartVO chart : cvo1) {
			int myCheq_account = chart.getMyCheq_account();
			String value = chart.getValue();
			int value2 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value1", myCheq_account);
			barObj.put("day", value2);
			barlist.add(barObj);
		}
		
		for(ChartVO chart : cvo2) {
			int mySav_account = chart.getMySav_account();
			String value = chart.getValue();
			int value2 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value2", mySav_account);
			barObj.put("day", value2);
			barlist.add(barObj);
		}
		
		for(ChartVO chart : cvo3) {
			int myLoan_account = chart.getMyLoan_account();
			String value = chart.getValue();
			int value3 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value3", myLoan_account);
			barObj.put("day", value3);
			barlist.add(barObj);
		}
		
		responseObj.put("barlist", barlist);
		return responseObj;
	}

	// 월별 차트
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getMonthChat() {

	    JSONObject responseObj = new JSONObject();
	    List<JSONObject> barlist = new LinkedList<JSONObject>();
	    
		List<ChartVO> cvo1 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getMonthFirstChat");
		List<ChartVO> cvo2 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getMonthSecondChat");
		List<ChartVO> cvo3 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getMonthThirdChat");
		
		for(ChartVO chart : cvo1) {
			int myCheq_account = chart.getMyCheq_account();
			String value = chart.getValue();
			int value2 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value1", myCheq_account);
			barObj.put("day", value2);
			barlist.add(barObj);
		}
		
		for(ChartVO chart : cvo2) {
			int mySav_account = chart.getMySav_account();
			String value = chart.getValue();
			int value2 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value2", mySav_account);
			barObj.put("day", value2);
			barlist.add(barObj);
		}
		
		for(ChartVO chart : cvo3) {
			int myLoan_account = chart.getMyLoan_account();
			String value = chart.getValue();
			int value3 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value3", myLoan_account);
			barObj.put("day", value3);
			barlist.add(barObj);
		}
		
		responseObj.put("barlist", barlist);
		return responseObj;
	}

	// 일별 차트
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getDayChat() {
		JSONObject responseObj = new JSONObject();
	    List<JSONObject> barlist = new LinkedList<JSONObject>();
	    
		List<ChartVO> cvo1 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getDayFirstChat");
		List<ChartVO> cvo2 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getDaySecondChat");
		List<ChartVO> cvo3 = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getDayThirdChat");
		
		for(ChartVO chart : cvo1) {
			int myCheq_account = chart.getMyCheq_account();
			String value = chart.getValue();
			int value2 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value1", myCheq_account);
			barObj.put("day", value2);
			barlist.add(barObj);
		}
		
		for(ChartVO chart : cvo2) {
			int mySav_account = chart.getMySav_account();
			String value = chart.getValue();
			int value2 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value2", mySav_account);
			barObj.put("day", value2);
			barlist.add(barObj);
		}
		
		for(ChartVO chart : cvo3) {
			int myLoan_account = chart.getMyLoan_account();
			String value = chart.getValue();
			int value3 = Integer.parseInt(value.split(" ")[0]);
			
			JSONObject barObj = new JSONObject();
			
			barObj.put("value3", myLoan_account);
			barObj.put("day", value3);
			barlist.add(barObj);
		}
		
		responseObj.put("barlist", barlist);
		return responseObj;
	}
	
	// 안드로이드 아이디 비밀번호 체크
	@Override
	public String confirmIdPwd(Map<String, String> map) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		String password = mapper.confirmIdPwd(map);
		return password;
	}

	// 안드로이드 로그인 정보 select
	@Override
	public UsersVO getMemberInfo(String id) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		UsersVO u = mapper.getMemberInfo(id);
		return u;
	}
	
	// 예금 상품 리스트 조회
	@Override
	public List<CheqProductVO> cheqProduct() {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		List<CheqProductVO> c = mapper.cheqProduct();
		return c;
	}
	
	// 적금 상품 리스트 조회
	@Override
	public List<SavProductVO> savProduct() {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		List<SavProductVO> s = mapper.savProduct();
		return s;
	}
	
	// 대출 상품 리스트 조회
	@Override
	public List<LoanProductVO> loanProduct() {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		List<LoanProductVO> l = mapper.loanProduct();
		return l;
	}
	
	// 예금 상품 상세페이지
	@Override
	public CheqProductVO cheqProductContent(Map<String, Object> map) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		CheqProductVO c = mapper.cheqProductContent(map);
		return c;
	}
	
	// 적금 상품 상세페이지
	@Override
	public SavProductVO savProductContent(Map<String, Object> map) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		SavProductVO s = mapper.savProductContent(map);
		return s;
	}
	
	// 대출 상품 상세페이지
	@Override
	public LoanProductVO loanProductContent(Map<String, Object> map) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		LoanProductVO l = mapper.loanProductContent(map);
		return l;
	}
	
	// 지갑생성
	@Override
	public int insertWallet(myCheqAccountVO vo){
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		int result = mapper.insertWallet(vo);
		return result;
	}
	
	// 거래내역
	@Override
	public List<TransDetailVO> TransDetail(String id) {
		
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		List<TransDetailVO> t = mapper.TransDetail(id);
		return t;
	}

	// qr코드 로그인
	@Override
	public int qrConfirmIdPwd(Map<String, Object> map) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		int cnt = mapper.qrConfirmIdPwd(map);
		return cnt;
	}
	
	// 예금계좌내역
	@Override
	public List<myCheqAccountVO> myCheqAccounts(String id) {
		
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		List<myCheqAccountVO> t = mapper.myCheqAccounts(id);
		return t;
	}
	
	// 적금계좌내역
	@Override
	public List<MySavAccountVO> mySavAccounts(String id) {
		
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		List<MySavAccountVO> s = mapper.mySavAccounts(id);
		return s;
	}
	
	// 대출계좌내역
	@Override
	public List<MyloanAccountVO> myLoanAccounts(String id) {
		
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		List<MyloanAccountVO> l = mapper.myLoanAccounts(id);
		return l;
	}

/*	@Override
	public AndroidVO selectWallet(String id) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		AndroidVO a = mapper.selectWallet(id);
		return a;
	}*/
}
