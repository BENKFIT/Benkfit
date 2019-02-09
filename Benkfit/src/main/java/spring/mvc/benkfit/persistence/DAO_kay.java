package spring.mvc.benkfit.persistence;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import spring.mvc.benkfit.vo.MyloanAccount_kay;
import spring.mvc.benkfit.vo.UsersVO;
import spring.mvc.benkfit.vo.document_kay;
import spring.mvc.benkfit.vo.myCheqAccount_kay;

public interface DAO_kay {
	
	//예금계좌관리
	public List<myCheqAccount_kay> myCheq_list();
	
	//대출계좌관리
	public List<MyloanAccount_kay> myloan_list();
	
	//서류관리
	public List<document_kay> docu_list();
	
	//서류등록
	public int docu_upload(document_kay doc);
	
	//내정보
	public UsersVO info();

/*	//정보수정-목록
	public UsersVO info();*/
	
	//qr코드 카드 발급
	public UsersVO qrcode();
	
	//이체한도 조회
	public myCheqAccount_kay limit_sel();
	
	//이체한도 수정
	public int limit_up(int acount_lim);
	
	
}
