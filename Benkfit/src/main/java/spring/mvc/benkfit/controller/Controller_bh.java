package spring.mvc.benkfit.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.web3j.protocol.http.HttpService;

import spring.mvc.benkfit.service.Service_bh;

@Controller
public class Controller_bh {
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_kay.class);
	
	@Autowired
	Service_bh service;
	
	@RequestMapping("slot")
	public String slot(HttpServletRequest req, Model model) throws Exception{
		logger.info("slot");
		return "common/event/slot";
	}
	
	@RequestMapping("slotBalance")
	public String slotBalance(HttpServletRequest req, Model model) throws Exception{
		logger.info("slotBalance");
		service.slotBalance(req, model);
		return "common/event/slotBalance";
	}
	
	@RequestMapping("slotResult")
	public String slotResult(HttpServletRequest req, Model model) throws Exception{
		logger.info("slotResult");
		service.slot(req, model);
		return "common/event/slotResult";
	}
	
	

}
