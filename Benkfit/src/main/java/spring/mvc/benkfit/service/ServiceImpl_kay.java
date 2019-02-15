package spring.mvc.benkfit.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import spring.mvc.benkfit.persistence.DAOImpl_kay;
import spring.mvc.benkfit.vo.MyloanAccountVO;
import spring.mvc.benkfit.vo.TransdetailVO;
import spring.mvc.benkfit.vo.UsersVO;
import spring.mvc.benkfit.vo.documentVO;
import spring.mvc.benkfit.vo.myCheqAccountVO;
import spring.mvc.benkfit.vo.mySavAccountVO;

@Service
public class ServiceImpl_kay implements Service_kay{
	
	@Autowired
	DAOImpl_kay dao;
	
	//마이페이지 내 정보
	@Override
	public void mypage_info(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal(); 
	    String id = user.getUsername();
	    
	    UsersVO usVO = dao.mypage_info(id) ;
	    
	    model.addAttribute("usVO", usVO);
	}
	//예금 계좌 //이체한도 조회
	@Override
	public void myCheq_list(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal(); 
	    String id = user.getUsername();

		List<myCheqAccountVO> cheq = dao.myCheq_list(id);
		
		model.addAttribute("cheq", cheq);
	}
	//대출계좌
	@Override
	public void myloan_list(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal(); 
	    String id = user.getUsername();

	    System.out.println("세션 : " + id);
	    String option = req.getParameter("myLoan_account");
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("option", option);
	    map.put("id", id);
	    
		List<MyloanAccountVO> loan = dao.myloan_list(map);
		
		model.addAttribute("id", id);
		model.addAttribute("loan", loan);
	}
	//적금계좌
	@Override
	public void mysav_list(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal(); 
	    String id = user.getUsername();

	    System.out.println("세션 : " + id);
	    
		List<mySavAccountVO> sav = dao.mysav_list(id) ;
		
		model.addAttribute("id", id);
		model.addAttribute("sav", sav);
	}
	
	//내정보 - 화면
	@Override
	public void info(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    
	    String id = user.getUsername();
	    
		String pwd = (String) req.getParameter("pwd");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		int selCnt = dao.idPwdChk(map);
		
		System.out.println("selCnt :" + selCnt);
		
		//5-2단계 있으면 로그인한 id로 정보조회
		if(selCnt == 1) {
			 UsersVO vo = dao.info(map);
			 model.addAttribute("vo", vo);
		} 
		// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			model.addAttribute("selCnt", selCnt);	
	}
	//내정보 - 수정처리
	@Override
	public void up_info(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    
	    String id = user.getUsername();
		
		UsersVO vo = new UsersVO();
		
		vo.setC_id(id);
		vo.setC_pwd(req.getParameter("pwd"));
		
		vo.setC_address(req.getParameter("address"));
		vo.setC_post(req.getParameter("post"));
		vo.setC_hp(req.getParameter("hp"));
		vo.setC_email(req.getParameter("email"));
		
		int update = dao.up_info(vo);
		
		System.out.println("update :" + update);
		
		model.addAttribute("update", update);
	}
	//idpwChk
	@Override
	public void idpwChk(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    String id = user.getUsername();
	    String pwd = req.getParameter("pwd");
	    
	    Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("strpwd", pwd);
		
		int idChk = dao.idPwdChk(map);
		model.addAttribute("idChk", idChk);
	}
	//탈퇴
	@Override
	public void del_mem(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String pwd = req.getParameter("pwd");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);

		int idChk = dao.idPwdChk(map);
		System.out.println("idChk"+ idChk);
		int check = 0;
		if(idChk == 1) {//idpwd 값이 있으면.
			int cheq = dao.chk_cheq(map);//예금잔액 조회
			if(cheq == 0) {// 예금잔액이 0이면,
				int loan = dao.chk_loan(map);//대출잔액 조회
				if(loan == 0) {// 대출잔액이 0이면,
					int sav = dao.chk_sav(map);//적금잔액 조회
					if(sav == 0) {// 적금잔액이 0이면,
						int delCnt = dao.del_mem(id);//탈퇴처리.	
						System.out.println("탈퇴  : "+ delCnt);
						model.addAttribute("delCnt", delCnt);
					}else {// 적금잔액이 0이 아니면,
						check = 8;
						System.out.println("상태 : " + check);
						model.addAttribute("check",check);
					}
				}else {// 대출잔액이 0이 아니면,
					check = 7;
					System.out.println("상태 : " + check);
					model.addAttribute("check",check);
				}
			} else {// 예금잔액이 0이 아니면,
				check = 6;
				System.out.println("상태 : " + check);
				model.addAttribute("check",check);
			}
		} else {//idpwd 값이 없으면.
			check = 5;
			System.out.println("상태 : " + check);
			model.addAttribute("check",check);
		}
		model.addAttribute("check",check);
		model.addAttribute("id", id);
		model.addAttribute("idChk: ", idChk);
	}
	//qr코드 생성
	@Override
	public void qrcode(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    String id = user.getUsername();
	    
		System.out.println("==qr코드==");
		
		UsersVO qrcode = dao.qrcode(id);
		
		model.addAttribute("id", id);
		model.addAttribute("qr", qrcode);
	}
	//qr코드 생성후 코드변경
	@Override
	public void qrPro(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    String id = user.getUsername();
	    
	    int qrCnt = dao.qrPro(id);
	    
	    model.addAttribute("qrCnt", qrCnt);
	}
	//이체한도 수정
	@Override
	public void limit_up(HttpServletRequest req, Model model) {
	    String tdArr[] = req.getParameterValues("account_limit");
		int limCnt= 0;
		for(String a : tdArr){		
			Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		    User user = (User) securityContext.getPrincipal();
		    String id = user.getUsername();
	
			int ass = Integer.parseInt(a.split("/")[0]);
			String myCheq_account = a.split("/")[1];
			
			myCheqAccountVO vo = new myCheqAccountVO();
			
			vo.setMyCheq_account(myCheq_account); //select된값
			vo.setMyCheq_limit(Integer.parseInt(req.getParameter("acount_lim")));//입력값
			vo.setC_id(id);
			
			limCnt = dao.limit_up(vo);
			System.out.println("limCnt :"+ limCnt);
			model.addAttribute("vo"+ vo);
			model.addAttribute("limCnt", limCnt);
		}
		model.addAttribute("tdArr", tdArr);
	}
	//예금계좌 상세 조회
	@Override
	public void sel_cheq(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    String id = user.getUsername();
		String cheq_account = req.getParameter("account");
		String start_date = req.getParameter("start_date");
		String end_date= req.getParameter("end_date");
		String type = req.getParameter("type");
		String order = req.getParameter("order");
		
		System.out.println("====cheq_info====");
		
		if(type.equals("undefined")) {
			type = "";
		}
		if(order.equals("undefined")) {
			order = "";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("cheq_account", cheq_account);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("type", type);
		map.put("order", order);
		
		myCheqAccountVO cheq = dao.selCheq(map);//계좌정보
		int CheqIn = dao.cheqIn(map);//입금합계
		int CheqOut	= dao.cheqOut(map);//출금합계
		List<TransdetailVO> list_Ts = dao.sel_cheq(map);//거래내역
		
		model.addAttribute("list_Ts",list_Ts);
		model.addAttribute("chch", cheq);
		model.addAttribute("CheqIn",CheqIn);
		model.addAttribute("CheqOut",CheqOut);
		
	}
	//대출계좌 상세 조회
	@Override
	public void sel_loan(HttpServletRequest req, Model model) {
		
	}
	//적금계좌 상세 조회
	@Override
	public void sel_sav(HttpServletRequest req, Model model) {
		
	}
/*	//계좌해지
	@Override
	public void del_cheq(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    String id = user.getUsername();
	    String delCheq = req.getParameter("delCheq");
	    
	    Map<String,Object> map = new HashMap<>();
	    map.put("id", id);
		map.put("delCheq", delCheq);
		System.out.println("===해지====");
		System.out.println("delCheq : "+ delCheq);
	}*/
	//내서류관리
	public void docu_list(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    String id = user.getUsername();
	    
		List<documentVO> docu = dao.docu_list(id);
		model.addAttribute("id", id);
		model.addAttribute("docu", docu);
	}
	//서류등록
	@Override
	public void addimg(HttpServletRequest req, Model model){
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
	    User user = (User) securityContext.getPrincipal();
	    String id = user.getUsername();
	    
		MultipartFile file = (MultipartFile) ((MultipartRequest) req).getFile("img");
		String saveDir = req.getRealPath("C:\\Users\\82109\\Desktop\\image\\");
		String realDir = "C:\\DEV43\\benkfit\\Benkfit\\src\\main\\webapp\\resources\\img\\doc\\";
		
		try{
			 file.transferTo(new File(saveDir+file.getOriginalFilename()));
			 FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
		     FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
		        
		    int data = 0;
		    
		    while((data = fis.read()) != -1) {
		        fos.write(data);
		    }
		    fis.close();
		    fos.close();
							
		    documentVO doc = new documentVO();
		    
			doc.setC_id(id);
			doc.setDoc_content(req.getParameter("doc_content"));
			doc.setDoc_name(req.getParameter("doc_name"));
			doc.setDoc_img(file.getOriginalFilename());
			
			String imgfile = file.getOriginalFilename();
			int result = dao.docu_upload(doc);
			System.out.println("파일명 : "+ imgfile);
			req.setAttribute("imgfile", imgfile);
			model.addAttribute("result", result);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//서류인식.
	@Override
	public void readDoc(String imgfile, Model model) throws IOException {

	}
}