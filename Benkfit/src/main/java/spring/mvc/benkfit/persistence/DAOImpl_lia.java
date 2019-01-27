package spring.mvc.benkfit.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.benkfit.vo.*;

@Repository
public class DAOImpl_lia implements DAO_lia {
	
	@Autowired
	SqlSession sqlSession;
	
	// id 중복확인
	@Override
	public int id_check(String strId) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.id_check", strId);
	}

	// 실명 확인
	@Override
	public int name_check(Map<String, Object> map) {
		return sqlSession.selectOne("spring.mvc.benkfit.persistence.DAO_lia.name_check", map);
	}

}
