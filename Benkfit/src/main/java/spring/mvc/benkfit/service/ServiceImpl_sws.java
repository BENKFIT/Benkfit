package spring.mvc.benkfit.service;

import java.io.*;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.multipart.*;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.http.HttpService;

import spring.mvc.benkfit.persistence.DAO_sws;
import spring.mvc.benkfit.vo.*;

@Service
public class ServiceImpl_sws implements Service_sws {

	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));

	final String path = "C:\\DEV43\\ether\\keystore\\";
	int chkNum = 0;

	String fn = "0x";

	BigInteger gasPrice = BigInteger.valueOf(3000000);
	BigInteger gasLimit = BigInteger.valueOf(3000000);
	
	@Autowired
	DAO_sws dao;

	// 이벤트 목록
	@Override
	public void eventList_sws(HttpServletRequest req, Model model) {
		
		int pageSize = 10;	
		int pageBlock = 3;  

		int cnt = 0;	
		int start = 0;		
		int end = 0;		
		int number = 0;		
		String pageNum = "";	
		int currentPage = 0;	

		int pageCount = 0;		
		int startPage = 0;		
		int endPage = 0;		
		
		String strId = (String) req.getSession().getAttribute("cId");

		cnt = dao.getEventCnt(strId);

		System.out.println("cnt : " + cnt);		

		pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1";		
		}
		currentPage = Integer.parseInt(pageNum);	

		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	

		start = (currentPage - 1) * pageSize + 1;

		end = start + pageSize - 1;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if(end > cnt) end = cnt;

		number = cnt - (currentPage - 1) * pageSize;	

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if(cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);

			List<EventVo> dtos = dao.getEventList(map);

			req.setAttribute("dtos", dtos);		
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);

		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("============================");

		req.setAttribute("cnt", cnt);			
		req.setAttribute("number", number);		
		req.setAttribute("pageNum", pageNum);	

		if(cnt > 0) {
			req.setAttribute("startPage", startPage);		
			req.setAttribute("endPage", endPage);			
			req.setAttribute("pageBlock", pageBlock);	  	
			req.setAttribute("pageCount", pageCount);   	
			req.setAttribute("currentPage", currentPage); 	
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

		String pageNum = req.getParameter("pageNum");
		String eve_num = req.getParameter("eve_num");

		EventVo vo = dao.getEvent(eve_num);

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

			req.setAttribute("eve_num", eve_num);
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

	@Override
	public void getMap(HttpServletRequest req, Model model) throws IOException {
		
		ProcessBuilder pb = new ProcessBuilder("python", "C:\\DEV43\\python\\output\\map.py");
		Process p  = pb.start();    // 프로세스 호출

		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));

		String line = "";

		StringBuilder sb = new StringBuilder();
		System.out.println("시작!");

		while((line = br.readLine()) != null) {
			sb.append(line + "\n");
			System.out.println("sdf: " + sb.append(line + "\n"));
		}
		String info = sb.toString();

		System.out.println(info);
		System.out.println("종료!");

		br.close();
		
		// 파일 읽기
		File file = new File("C:\\DEV43\\python\\output\\map.csv");
		
		BufferedReader br2 = new BufferedReader(new InputStreamReader(new FileInputStream(file),"MS949"));

		List<String> list = new ArrayList<String>();
		
		String line2 = "";
		while(br2.ready()) {
			line2 = br2.readLine();
			list.add(line2);
		}
		
		br2.close();
		list.remove(0);
		
		Map<String, String> map = new HashMap<String, String>();
		for(String str : list) {
			String add = str.split(",")[0];
			String ban = str.split(",")[1];
			
			map.put(add, ban);
		}
		req.setAttribute("map", map);
	}
}
