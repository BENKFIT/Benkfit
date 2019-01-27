package spring.mvc.benkfit.persistence;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
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
	public List<EventVo> getBookList(Map<String, Object> map) {
		
		return sqlSession.selectList("spring.mvc.benkfit.persistence.DAO_sws.getBookList", map);
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
}
