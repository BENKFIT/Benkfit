package spring.mvc.benkfit.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.benkfit.service.Service_sws;

@Controller
public class Controller_sws {
	
	@Autowired
	Service_sws service;
	
	private static final Logger logger = LoggerFactory.getLogger(Controller_sws.class);
	
	/*// 인덱스
	@RequestMapping("index")
	public String index(HttpServletRequest req) {
		req.getSession().setAttribute("cId", "id1234");
		
		return "Template/index1";
	}*/
	
	// 첫방문 고객 안내
	@RequestMapping("firstVisit_sws")
	public String firstVisit_sws() throws Exception {
		logger.info("firstVisit_sws");
		return "common/info/firstVisit";
	}
	
	// FAQ
	@RequestMapping("faq_sws")
	public String faq_sws() throws Exception {
		logger.info("faq_sws");
		return "common/info/faq";
	}
	
	// 이용 시간 안내
	@RequestMapping("hoursOfUse_sws")
	public String hoursOfUse_sws() throws Exception {
		logger.info("hoursOfUse_sws");
		return "common/info/hoursOfUse";
	}
	
	// 이용 수수료 안내
	@RequestMapping("useFee_sws")
	public String useFee_sws() throws Exception {
		logger.info("useFee_sws");
		return "common/info/useFee";
	}
	
	// **********************************************************************************
	
	// 이벤트 목록
	@RequestMapping("eventList_sws")
	public String eventList_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("eventList_sws");
		
		service.eventList_sws(req, model);
		
		return "common/event/eventList";
	}
	
	// 이벤트 상세 페이지
	@RequestMapping("eventContentForm_sws")
	public String eventContentForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("eventContentForm_sws");
		String eve_num = req.getParameter("eve_num");
		
		service.eventContentForm_sws(req, model);
		if (eve_num.equals("23")) {
			return "common/event/slot";
		}
		
		return "common/event/eventContentForm";
	}
	
	// 관리자 - 이벤트 목록
	@RequestMapping("event_list_sws")
	public String event_list_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_list_sws");
		
		service.eventList_sws(req, model);
		
		return "admin/event/event_list";
	}
	
	// 관리자 - 이벤트 상세 페이지
	@RequestMapping("event_contentForm_sws")
	public String event_contentForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_contentForm_sws");
		String eve_num = req.getParameter("eve_num");
		
		service.eventContentForm_sws(req, model);
		if (eve_num.equals("23")) {
			return "common/event/slot";
		}
	
		return "admin/event/event_contentForm";
	}
	
	// 관리자 - 이벤트 추가 폼
	@RequestMapping("event_addForm_sws")
	public String event_addForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_addForm_sws");
		
		return "admin/event/event_addForm";
	}
	
	// 관리자 - 이벤트 추가 처리
	@RequestMapping("event_addPro_sws")
	public String event_addPro_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_addPro_sws");
		
		service.event_addPro_sws(req, model);
		
		return "admin/event/event_addPro";
	}
	
	// 관리자 - 이벤트 수정 폼
	@RequestMapping("event_modifyForm_sws")
	public String event_modifyForm_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_modifyForm_sws");
		
		service.event_modifyForm_sws(req, model);
		
		return "admin/event/event_modifyForm";
	}
	
	// 관리자 - 이벤트 수정 처리
	@RequestMapping("event_modifyPro_sws")
	public String event_modifyPro_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_modifyPro_sws");
		
		service.event_modifyPro_sws(req, model);
		
		return "admin/event/event_modifyPro";
	}
	
	// 관리자 - 이벤트 삭체 처리
	@RequestMapping("event_deletePro_sws")
	public String event_deletePro_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("event_deletePro_sws");
		
		service.event_deletePro_sws(req, model);
		
		return "admin/event/event_deletePro";
	}
	
	// 다음지도 ATM
	@RequestMapping("map_sws")
	public String map_sws(HttpServletRequest req, Model model) throws Exception {
		logger.info("map_sws");
		
		return "common/map/atmMap";
	}
}