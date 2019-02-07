package spring.mvc.benkfit.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Controller_syk {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_syk.class);
	
	/*
	 * @RequestMapping("index_syk")
	 * public String index_syk(){
	 * 		return "Template/index"; 
	 * }
	 */
	
	@RequestMapping("checkingList")
	public String checkingList() {
		logger.info("예금상품목록이동");
		
		return "common/product/checking/productList";
	}
	
	@RequestMapping("checkingInfo")
	public String checkingInfo(HttpServletRequest req) {
		logger.info("예금상품상세페이지");
		
		String kind = req.getParameter("kind");
		req.setAttribute("kind", kind);
		
		return "common/product/checking/productInfo";
	}
}
