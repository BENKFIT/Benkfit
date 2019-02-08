package spring.mvc.benkfit.persistence;
import java.util.List;

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
	
	//정보수정-목록
	public UsersVO info();
	
	//qr코드 카드 발급
	public UsersVO qrcode();
	
	//
	
	
}
