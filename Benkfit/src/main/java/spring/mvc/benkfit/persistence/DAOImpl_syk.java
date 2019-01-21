package spring.mvc.benkfit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

@Repository
public class DAOImpl_syk {
	
	@Autowired
	SqlSession sqlSession;
}
