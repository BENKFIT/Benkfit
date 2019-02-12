package spring.mvc.benkfit.persistence;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import spring.mvc.benkfit.vo.EventVo;
import spring.mvc.benkfit.vo.UsersVO;

public interface DAO_sws {

	public int getEventCnt(String strId);
	
	public List<EventVo> getEventList(Map<String, Object> map);
	
	public EventVo getEvent(String eve_num);
	
	public int insertEvent(EventVo vo);
	
	public int updateEvent(EventVo vo);
	
	public int deleteEvent(String eve_num);
	
	public int confirmIdPwd(Map<String, String> map);

	public UsersVO getMemberInfo(String id);
	
	public JSONObject getYearChat();
	
	public JSONObject getMonthChat();
	
	public JSONObject getDayChat();
}
