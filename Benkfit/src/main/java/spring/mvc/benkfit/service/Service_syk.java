package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Service_syk {
	
	//예-적금상품리스트조회
	public void cheqSavList(HttpServletRequest req);
	
	//예금상품조회
	public void cheqInfo(HttpServletRequest req);
	
	//적금상품조회
	public void savInfo(HttpServletRequest req);
	
	//예금상품등록
	public void cheqRegiPro(HttpServletRequest req);
	
	//적금상품등록
	public void savRegiPro(HttpServletRequest req);
	
	//예금계좌생성
	public void createCheq(HttpServletRequest req, Model model);
	
	//적금계좌생성
	public void createSav(HttpServletRequest req, Model model);
	
	//예금상품수정
	public void cheqEdit(HttpServletRequest req);
	
	//적금상품수정
	public void savEdit(HttpServletRequest req);
	
	//예금상품삭제
	public void cheqDel(HttpServletRequest req);
	
	//적금상품삭제
	public void savDel(HttpServletRequest req);
}
