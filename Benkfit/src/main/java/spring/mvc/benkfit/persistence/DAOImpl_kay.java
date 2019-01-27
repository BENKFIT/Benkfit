package spring.mvc.benkfit.persistence;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.benkfit.vo.*;

@Repository
public class DAOImpl_kay implements DAO_kay{
	
	@Autowired
	SqlSession sqlSession;

	//예금관리
	@Override
	public List<myCheqAccount_kay> myCheq_list() {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		List<myCheqAccount_kay> cheq = dao.myCheq_list();
		return cheq;
	}
	//대출관리
	@Override
	public List<MyloanAccount_kay> myloan_list() {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		List<MyloanAccount_kay> loan = dao.myloan_list();
		return loan;
	}
	
	//서류관리
	@Override
	public List<document_kay> docu_list() {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		List<document_kay> list1 = dao.docu_list();
		return list1;
	}
	
	//qr코드 생성
	@Override
	public users_tbl_kay qrcode() {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.qrcode();
	}
	
	//내정보
	@Override
	public users_tbl_kay info() {
		DAO_kay dao = sqlSession.getMapper(DAO_kay.class);
		return dao.info();
	}
	
}
