package spring.mvc.benkfit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.benkfit.persistence.DAO_sws;
import spring.mvc.benkfit.service.Service_sws;
import spring.mvc.benkfit.vo.UsersVO;

@Controller
public class Controller_sws {

	@Autowired
	Service_sws service;
	
	@Autowired
	DAO_sws dao;

	private static final Logger logger = LoggerFactory.getLogger(Controller_sws.class);

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

		if (eve_num.equals("23")) {
			return "common/event/slotAdmin";
		}
		service.eventContentForm_sws(req, model);


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
	// 결산 차트
	@RequestMapping("productChart_sws")
	public String productChart_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("productChart_sws");
		return "admin/chart/productChart";
	}
	// 년별 차트
	@RequestMapping("chartYear_sws")
	public String chartYear_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("chartYear_sws");

		service.chartList(req, model);
		
		return "admin/chart/chartYear";
	}
	
	// 월별 차트
	@RequestMapping("chartMonth_sws")
	public String chartMonth_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("chartMonth_sws");

		service.chartList1(req, model);
		
		return "admin/chart/chartMonth";
	}
	
	// 일별 차트
	@RequestMapping("chartDay_sws")
	public String chartDay_sws(HttpServletRequest req, Model model) throws Exception{
		logger.info("chartDay_sws");

		service.chartList2(req, model);
		
		return "admin/chart/chartDay";
	}

	// 앱 로그인
	@ResponseBody// 웹에서 안드로이드로 값을 전달하기 위한 어노테이션
	@RequestMapping("androidSignIn")
	public Map<String, String> androidSignIn(HttpServletRequest req){
		logger.info("androidSignIn()");

		// 안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("id:" + id + " pwd:" + pwd);

		Map<String, String> in = new HashMap<String, String>();
		in.put("c_id", id);
		in.put("c_pwd", pwd);
		int cnt = dao.confirmIdPwd(in);

		// 웹에서 전달할 값
		Map<String, String> out = new HashMap<String, String>();
		if(cnt != 0) {
			out.put("c_id", id);
		} else {
			out.put("c_id", null);
		}

		return out;
	}

	// 앱 메인페이지
	@ResponseBody
	@RequestMapping("androidMain")
	public Map<String, Object> androidMain(HttpServletRequest req) {
		logger.info("androidMain()");
		String strId = (String) req.getSession().getAttribute("id");

		// 회원 정보
		String id = req.getParameter("id");
		UsersVO u = dao.getMemberInfo(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", u.getC_name());
		map.put("data2", u.getC_level());
		map.put("data3", 0);
		map.put("data4", 0);
		map.put("users", u);
		
		return map;
	}
	
/*	// 앱 마이페이지
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		logger.info("androidMyPageMain()");

		// 회원 정보
		String id = req.getParameter("id");
		UsersVO u = dao.getMemberInfo2(id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", u.getC_name());
		map.put("data2", 0);
		map.put("data3", 0);
		map.put("data4", 0);
		map.put("users", u);

		return map;
	}*/
}
	
