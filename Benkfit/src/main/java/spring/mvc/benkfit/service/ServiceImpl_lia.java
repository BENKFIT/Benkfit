package spring.mvc.benkfit.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.benkfit.persistence.DAO_lia;
import spring.mvc.benkfit.vo.Users;

@Service
public class ServiceImpl_lia implements Service_lia {

	@Autowired 
	DAO_lia dao;
	
	// id중복확인
	@Override
	public void id_check(HttpServletRequest req, Model model) {
		//입력값 받아오기
		String strId = req.getParameter("id");
		//중복확인
		int selectCnt = dao.id_check(strId);
		//결과 저장
		model.addAttribute("selectCnt", selectCnt);
		System.out.println("selectCnt: " + selectCnt);
		model.addAttribute("id", strId);
	}

	// 실명확인
	@Override
	public void nameCheck(HttpServletRequest req, Model model) {
		//입력값 받아오기
		String name = req.getParameter("name");
		String jumin = req.getParameter("jumin");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("jumin", jumin);
		System.out.println("name : " + name + "\n jumin : " + jumin);
		//실명확인
		int selectCnt = dao.name_check(map);
		System.out.println("실명확인cnt : " + selectCnt);
		//결과 저장
		model.addAttribute("selectCnt", selectCnt);
	}
	
	@Override
	public String encryptSHA256(String str) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void signInPro(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void loginPro(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	
}
