package spring.mvc.benkfit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import spring.mvc.benkfit.persistence.DAOImpl_syk;
import spring.mvc.benkfit.vo.CheqProductVO;

@Service
public class ServiceImpl_syk implements Service_syk {
	
	@Autowired
	DAOImpl_syk dao;
	
	//예금상품페이지
	@Override
	public void checkingRegi(HttpServletRequest req) {
		List<CheqProductVO> list = dao.checkingRegi();
		req.setAttribute("list", list);
	}
	
	//예금상품등록
	@Override
	public void cheqRegiPro(HttpServletRequest req) {
		String type = req.getParameter("product_kind");
		String name = req.getParameter("product_name");
		String target = req.getParameter("product_target");
		String limit = req.getParameter("product_limit");
		String period = req.getParameter("product_period");
		double rate = Double.parseDouble(req.getParameter("product_rate"));
		
		CheqProductVO vo = new CheqProductVO();
		vo.setCheq_type(type);
		vo.setCheq_name(name);
		vo.setCheq_target(target);
		vo.setCheq_limit(limit);
		vo.setCheq_period(period);
		vo.setCheq_rate(rate);
		
		int result = dao.cheqRegiPro(vo);
		
		System.out.println("cheqRegiPro-result = " + result);
		req.setAttribute("result", vo);
	}
}
