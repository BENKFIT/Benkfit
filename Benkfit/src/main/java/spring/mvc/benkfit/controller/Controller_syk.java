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
	
	
	@RequestMapping("index")
	public String index() {
		return "Template/index";
	}
	
	/* ==================1차발표================== */
	@RequestMapping("mypage")
	public String mypage() {
		return "common/mypage";
	}
	
	@RequestMapping("chat")
	public String chat() {
		return "common/chat";
	}
	
	@RequestMapping("check")
	public String check() {
		return "common/check";
	}
	
	@RequestMapping("event")
	public String event() {
		return "common/event";
	}
	
	@RequestMapping("loan")
	public String loan() {
		return "common/loan";
	}
	
	@RequestMapping("info")
	public String info() {
		return "common/info";
	}
	
	@RequestMapping("login")
	public String login() {
		return "common/login";
	}
	
	@RequestMapping("signIn")
	public String signIn() {
		return "common/signIn";
	}
	/* ==================1차발표================== */
}
