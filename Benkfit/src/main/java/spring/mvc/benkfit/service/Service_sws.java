package spring.mvc.benkfit.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface Service_sws {
	
	// 이벤트 목록
	public void eventList_sws(HttpServletRequest req, Model model);
	
	// 이벤트 상세 페이지
	public void eventContentForm_sws(HttpServletRequest req, Model model);
	
	// 이벤트 추가 처리
	public String event_addPro_sws(HttpServletRequest req, Model model);
	
	// 이벤트 수정 페이지  
	public void event_modifyForm_sws(HttpServletRequest req, Model model);
	
	// 이벤트 수정 처리
	public void event_modifyPro_sws(HttpServletRequest req, Model model);
	
	// 이벤트 삭제 처리
	public void event_deletePro_sws(HttpServletRequest req, Model model);
	
	// 연별 차트 
	public void chartList(HttpServletRequest req, Model model);
	
	// 월별 차트 
	public void chartList1(HttpServletRequest req, Model model);
	
	// 일별 차트 
	public void chartList2(HttpServletRequest req, Model model);
	
	// ATM
	public void getMap(HttpServletRequest req, Model model) throws IOException;
}
