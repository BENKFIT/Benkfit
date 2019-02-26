package spring.mvc.benkfit.service;

import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.multipart.*;

import spring.mvc.benkfit.persistence.DAO_sws;
import spring.mvc.benkfit.vo.*;

@Service
public class ServiceImpl_sws implements Service_sws {

	@Autowired
	DAO_sws dao;

	// 이벤트 목록
	@Override
	public void eventList_sws(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징
		int pageSize = 10;	// 한 페이지당 출력할 글 갯수
		int pageBlock = 3;  // 한 블럭당 페이지 갯수

		int cnt = 0;		// 글갯수
		int start = 0;		// 햔재 페이지 시작 글번호
		int end = 0;		// 현재 페이지 마지막 글번호
		int number = 0;		// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지

		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지

		String strId = (String) req.getSession().getAttribute("cId");

		// 5-1단계. 글갯수 구하기
		cnt = dao.getEventCnt(strId);

		System.out.println("cnt : " + cnt);		// 먼저 테이블에 30건을 insert

		pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1";		// 첫페이지를 1페이지로 지정
		}

		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum);	// 현재 페이지 : 1
		System.out.println("currentPage : " + currentPage);

		// 페이지 갯수 구하기 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	// 페이지 갯수 + 나머지 있으면 1

		// 햔재 페이지 시작 글번호 1 (페이지별)
		// 1 = (1 - 1) * 5 + 1
		start = (currentPage - 1) * pageSize + 1;

		// 현재 페이지 마지막 글번호 (페이지별)
		// 5 = 1 +  -1;
		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if(end > cnt) end = cnt;

		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if(cnt > 0) {
			// 5-2. 게시글 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);

			List<EventVo> dtos = dao.getEventList(map);

			req.setAttribute("dtos", dtos);		// 큰 바구니 : 게시글 목록   cf) 작은바구니 : 게시글 1건
		}

		// 6단계. request나 session에 처리 결과를 저장 (jsp에 전달하기 위함)


		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);

		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("============================");

		req.setAttribute("cnt", cnt);			// 글 갯수
		req.setAttribute("number", number);		// 출력용 글번호
		req.setAttribute("pageNum", pageNum);	// 페이지 번호

		if(cnt > 0) {
			req.setAttribute("startPage", startPage);		// 시작페이지
			req.setAttribute("endPage", endPage);			// 마지막 페이지
			req.setAttribute("pageBlock", pageBlock);	  	// 출력할 페이지 갯수
			req.setAttribute("pageCount", pageCount);   	// 페이지 갯수
			req.setAttribute("currentPage", currentPage); 	// 현재 페이지
		}
	}

	// 이벤트 상세 페이지
	@Override
	public void eventContentForm_sws(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String eve_num = req.getParameter("eve_num");


		EventVo vo = dao.getEvent(eve_num);

		vo = dao.getEvent(eve_num);

		req.setAttribute("dto", vo);
		req.setAttribute("pageNum", pageNum);	 
	}

	@SuppressWarnings("deprecation")
	@Override
	public String event_addPro_sws(HttpServletRequest req, Model model) {

		MultipartFile file = ((MultipartRequest) req).getFile("eve_img");

		String saveDir = req.getRealPath("resources/img/event/");
		String realDir = "C:\\DEV43\\git2\\Benkfit\\src\\main\\webapp\\resources\\img\\event\\";
		System.out.println("saveDir : " + saveDir);
		System.out.println("realDir : " + realDir);

		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));

			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;
			while((data = fis.read()) != -1) {
				fos.write(data);
			}

			fis.close();
			fos.close();

			String eve_num = req.getParameter("eve_num");
			String eve_title = req.getParameter("eve_title");
			String fileName = file.getOriginalFilename();
			String eve_content = req.getParameter("eve_content");
			String start = req.getParameter("eve_start");
			String end = req.getParameter("eve_end");

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date eve_start = format.parse(start);
			Date eve_end = format.parse(end);
				
			eve_content.replace("\r\n", "<br>");

			EventVo vo = new EventVo();
			
			vo.setEve_num(eve_num);
			vo.setEve_title(eve_title);
			vo.setEve_content(eve_content);
			vo.setEve_start(eve_start);
			vo.setEve_end(eve_end);
			vo.setEve_img(fileName);

			int insertCnt = dao.insertEvent(vo);

			model.addAttribute("insertCnt", insertCnt);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "event_list_sws";
	}

	@Override
	public void event_modifyForm_sws(HttpServletRequest req, Model model) {

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String eve_num = req.getParameter("eve_num");


		EventVo vo = dao.getEvent(eve_num);

		vo = dao.getEvent(eve_num);

		req.setAttribute("dto", vo);
		req.setAttribute("pageNum", pageNum);	 
	}

	@Override
	public void event_modifyPro_sws(HttpServletRequest req, Model model) {
		MultipartFile file = ((MultipartRequest) req).getFile("eve_img");

		String saveDir = req.getRealPath("resources/img/event/");
		String realDir = "C:\\DEV43\\git2\\Benkfit\\src\\main\\webapp\\resources\\img\\event\\";
		System.out.println("saveDir : " + saveDir);
		System.out.println("realDir : " + realDir);

		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));

			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

			int data = 0;
			while((data = fis.read()) != -1) {
				fos.write(data);
			}

			fis.close();
			fos.close();

			String eve_num = req.getParameter("eve_num");
			String eve_title = req.getParameter("eve_title");
			String fileName = file.getOriginalFilename();
			String eve_content = req.getParameter("eve_content");
			String start = req.getParameter("eve_start");
			String end = req.getParameter("eve_end");
			String pageNum = req.getParameter("pageNum");

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date eve_start = format.parse(start);
			Date eve_end = format.parse(end);

			eve_content.replace("\r\n", "<br>");

			EventVo vo = new EventVo();
			vo.setEve_num(eve_num);
			vo.setEve_title(eve_title);
			vo.setEve_content(eve_content);
			vo.setEve_start(eve_start);
			vo.setEve_end(eve_end);
			vo.setEve_img(fileName);

			int updateCnt = dao.updateEvent(vo);

			req.setAttribute("updateCnt", updateCnt);
			req.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void event_deletePro_sws(HttpServletRequest req, Model model) {
		
		String pageNum = req.getParameter("pageNum");
		String eve_num = req.getParameter("eve_num");
		
		int deleteCnt = dao.deleteEvent(eve_num);
		
		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("pageNum", pageNum);
	}
	
	@Override
	public void chartList(HttpServletRequest req, Model model) {
		JSONObject map = (JSONObject)dao.getYearChat();
		String chart = map.toString();
		req.setAttribute("YearChat", chart);
	}
	@Override
	public void chartList1(HttpServletRequest req, Model model) {
		JSONObject map = (JSONObject)dao.getMonthChat();
		String chart = map.toString();
		req.setAttribute("MonthChat", chart);
	}
	@Override
	public void chartList2(HttpServletRequest req, Model model) {
		JSONObject map = (JSONObject)dao.getDayChat();
		String chart = map.toString();
		req.setAttribute("DayChat", chart);
	}
}
