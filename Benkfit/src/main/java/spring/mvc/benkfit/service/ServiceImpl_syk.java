package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.*;

import spring.mvc.benkfit.vo.CheqProductVO;

@Service
public class ServiceImpl_syk implements Service_syk {
	
	//예금상품등록
	@Override
	public void cheqRegiPro(HttpServletRequest req) {
		String type = req.getParameter("product_kind");
		String name = req.getParameter("product_name");
		String target = req.getParameter("product_target");
		String limit = req.getParameter("product_limit");
		String period = req.getParameter("product_period");
		String rate = req.getParameter("product_rate");
		
		CheqProductVO vo = new CheqProductVO();
		
	}

}
