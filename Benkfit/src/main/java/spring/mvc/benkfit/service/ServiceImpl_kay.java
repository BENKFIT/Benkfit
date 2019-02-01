package spring.mvc.benkfit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.benkfit.persistence.DAOImpl_kay;
import spring.mvc.benkfit.vo.MyloanAccount_kay;
import spring.mvc.benkfit.vo.Users;
import spring.mvc.benkfit.vo.document_kay;
import spring.mvc.benkfit.vo.myCheqAccount_kay;

@Service
public class ServiceImpl_kay implements Service_kay{
	
	@Autowired
	DAOImpl_kay dao;
	
	//계좌관리 목록
	@Override
	public void myCheq_list(HttpServletRequest req, Model model) {
		/*	String strid = req.getParameter("c_id");*/
		List<myCheqAccount_kay> cheq = dao.myCheq_list();
		List<MyloanAccount_kay> loan = dao.myloan_list();
		
		/*model.addAttribute("strid", strid);*/
		model.addAttribute("cheq", cheq);
		model.addAttribute("loan", loan);
	}
	//내서류관리
	public void docu_list(HttpServletRequest req, Model model) {
		List<document_kay> docu = dao.docu_list();
		model.addAttribute("docu", docu);
	}
	//qr코드 생성
	@Override
	public void qrcode(HttpServletRequest req, Model model) {
		Users qrcode = dao.qrcode();
		model.addAttribute("qrcode", qrcode);
	}
	//내정보
	@Override
	public void info(HttpServletRequest req, Model model) {
		Users user = dao.info();
		model.addAttribute("user", user);
		
	}
}