package spring.mvc.benkfit.persistence;

import java.util.List;
import java.util.Map;

import spring.mvc.benkfit.vo.EventVo;

public interface DAO_sws {

	public int getEventCnt(String strId);
	
	public List<EventVo> getBookList(Map<String, Object> map);
	
	public EventVo getEvent(String eve_num);
	
	public int insertEvent(EventVo vo);
	
	public int updateEvent(EventVo vo);
}
