package spring.mvc.benkfit.controller;

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
	
	@RequestMapping("home/homeMain")
	public String homeMain() {
		System.out.println("homeMain()");
		return "home/homeMain";
	}
	
	@RequestMapping("user/memberMain")
	public String memberMain() {
		System.out.println("memberMain()");
		return "user/memberMain";
	}
	
	@RequestMapping("admin/adminMain")
	public String adminMain() {
		System.out.println("adminMain()");
		return "admin/adminMain";
	}
	
}
