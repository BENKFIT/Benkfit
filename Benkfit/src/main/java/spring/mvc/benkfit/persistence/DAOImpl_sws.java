package spring.mvc.benkfit.persistence;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import spring.mvc.benkfit.vo.*;

@Repository
public class DAOImpl_sws implements DAO_sws {
	
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

	@Override
	public int updateEvent(EventVo vo) {
		
		return sqlSession.update("spring.mvc.benkfit.persistence.DAO_sws.updateEvent", vo);
	}

	@Override
	public int deleteEvent(String eve_num) {
		
		return sqlSession.delete("spring.mvc.benkfit.persistence.DAO_sws.deleteEvent", eve_num);
	}
	
	@Override
	public int confirmIdPwd(Map<String, String> map) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		int cnt = mapper.confirmIdPwd(map);
		return cnt;
	}

	@Override
	public UsersVO getMemberInfo(String id) {
		DAO_sws mapper = sqlSession.getMapper(DAO_sws.class);
		UsersVO u = mapper.getMemberInfo(id);
		return u;
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
	
	/*	@SuppressWarnings("unchecked")
		// 적금 계좌 차트
		@Override
		public JSONObject getSecondChat() {
			Map<String, Integer> m = new HashMap<String, Integer>();
			
			JSONObject responseObj = new JSONObject();
		    List<JSONObject> barlist = new LinkedList<JSONObject>();
			
			List<ChartVO> cvo = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getSecondChat");
			
			for(ChartVO chart : cvo) {
				String mySav_date = chart.getMySav_date();
				String mySav_date2 = mySav_date.split(" ")[0];
				int value = chart.getValue();
				
				JSONObject barObj = new JSONObject();
				
				barObj.put("day", mySav_date2);
				barObj.put("value2", value);
				barlist.add(barObj);
			}
			responseObj.put("barlist", barlist);
			return responseObj;
		}
		
		@SuppressWarnings("unchecked")
		// 대출 계좌 차트
		@Override
		public JSONObject getThirdChat() {
			Map<String, Integer> m = new HashMap<String, Integer>();
			
			JSONObject responseObj = new JSONObject();
		    List<JSONObject> barlist = new LinkedList<JSONObject>();
			
			List<ChartVO> cvo = sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getThirdChat");
			
			for(ChartVO chart : cvo) {
				String myLoan_date = chart.getMyLoan_date();
				String myLoan_date2 = myLoan_date.split(" ")[0];
				int value = chart.getValue();
				
				JSONObject barObj = new JSONObject();
				
				barObj.put("day", myLoan_date2);
				barObj.put("value3", value);
				barlist.add(barObj);
			}
			responseObj.put("barlist", barlist);
			return responseObj;
		}*/
}
