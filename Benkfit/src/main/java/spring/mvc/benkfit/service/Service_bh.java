package spring.mvc.benkfit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.web3j.protocol.http.HttpService;

public interface Service_bh {
	
	public void accounts(HttpServletRequest req, Model model);
	public void slot(HttpServletRequest req, Model model);
	public void slotBalance(HttpServletRequest req, Model model);
}
