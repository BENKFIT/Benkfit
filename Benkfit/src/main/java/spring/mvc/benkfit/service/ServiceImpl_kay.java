package spring.mvc.benkfit.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.benkfit.persistence.DAOImpl_kay;
import spring.mvc.benkfit.vo.*;

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
		String account = req.getParameter("account");

		List<myCheqAccountVO> cheq = dao.myCheq_list(id);
		System.out.println("계좌선택 : "+ account);
	
		model.addAttribute("account", account);
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
		String account = req.getParameter("account");

		System.out.println("계좌선택 : "+ account);
		
		List<MySavAccountVO> sav = dao.mysav_list(id) ;
		
		model.addAttribute("account", account);
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
		String account = req.getParameter("account");
		String start_date = req.getParameter("start_date");
		String end_date= req.getParameter("end_date");
		String type = req.getParameter("type");
		String order = req.getParameter("order");
		int start = 1;
		int end = Integer.parseInt(req.getParameter("end"));
		
		String delCheq = req.getParameter("delCheq");
		System.out.println("계좌선택 : " + delCheq);
		System.out.println("====cheq_info====");

		if(type.equals("undefined")) {
			type = "";
		}
		if(order.equals("undefined")) {
			order = "";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("account", account);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("type", type);
		map.put("order", order);
		map.put("start", start);
		map.put("end", end);

		myCheqAccountVO cheqinfo = dao.selCheq(map);//계좌정보
		int CheqIn = dao.cheqIn(map);//입금합계
		int CheqOut	= dao.cheqOut(map);//출금합계
		List<TransDetailVO> cheq = dao.sel_cheq(map); //거래내역
		
		model.addAttribute("cheqinfo", cheqinfo);
		model.addAttribute("CheqIn", CheqIn);
		model.addAttribute("CheqOut", CheqOut);
		model.addAttribute("cheq", cheq);
	}
	//대출계좌 상세 조회
	@Override
	public void sel_loan(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String account = req.getParameter("account");
		String start_date = req.getParameter("start_date");
		String end_date= req.getParameter("end_date");
		String type = req.getParameter("type");
		String order = req.getParameter("order");
		int start = 1;
		int end = Integer.parseInt(req.getParameter("end"));
		String delCheq = req.getParameter("delCheq");
		
		System.out.println("계좌선택 : " + delCheq);
		System.out.println("====cheq_info====");

		if(type.equals("undefined")) {
			type = "";
		}if(order.equals("undefined")) {
			order = "";
		} if(start_date.equals("undefined")) {
			start_date = " ";
		}  if(end_date.equals("undefined")) {
			end_date = " ";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("account", account);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("type", type);
		map.put("order", order);
		map.put("start", start);
		map.put("end", end);

		MyloanAccountVO loaninfo = dao.seloan(map);//계좌정보
		List<TransDetailVO> loan = dao.sel_loan(map); //거래내역
		
		model.addAttribute("loaninfo", loaninfo);//계좌정보
		model.addAttribute("loan", loan); //거래내역
	
	}
	//적금계좌 상세 조회
	@Override
	public void sel_sav(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String account = req.getParameter("account");
		String start_date = req.getParameter("start_date");
		String end_date= req.getParameter("end_date");
		String order = req.getParameter("order");
		int start = 1;
		int end = Integer.parseInt(req.getParameter("end"));
		String delCheq = req.getParameter("delCheq");
		
		System.out.println("계좌선택 : " + delCheq);
		System.out.println("====cheq_info====");

		if(order.equals("undefined")) {
			order = "";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("account", account);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("order", order);
		map.put("start", start);
		map.put("end", end);

		MySavAccountVO savinfo = dao.selSav(map);//계좌정보
		int CheqIn = dao.cheqIn(map);//입금합계
		int CheqOut	= dao.cheqOut(map);//출금합계
		List<TransDetailVO> sav = dao.sel_sav(map); //거래내역
		
		model.addAttribute("savinfo", savinfo);
		model.addAttribute("CheqIn",CheqIn);
		model.addAttribute("CheqOut",CheqOut);
		model.addAttribute("sav",sav); 
	}
	//예금해지 - 체크
	@Override
	public void sls(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String account = req.getParameter("account");

		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("account", account);

		model.addAttribute("id", id);
		model.addAttribute("account", account);
	}
	//예금계좌해지
	@Override
	public void del_cheq(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String account = req.getParameter("account");
		String pwd =  req.getParameter("pwd");

		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("account", account);
		map.put("pwd", pwd);

		int cheqPw = dao.cheq_pw(map); //비밀번호 체크
		int cheq = 0; //잔액체크
		int del_cheq = 0; //해지처리

		if(cheqPw != 0) {//비밀번호 체크 
			cheq = dao.delChe(map); //잔액체크
			model.addAttribute("cheq",cheq);
			if(cheq == 0) { //잔액이 0이면 
				del_cheq = dao.del_cheq(map); //해지처리
				model.addAttribute("del_cheq",del_cheq);
			} 
		}
		model.addAttribute("cheqPw",cheqPw);
		model.addAttribute("id", id);
		model.addAttribute("account", account);
	}
	//적금해지
	@Override
	public void del_sav(HttpServletRequest req, Model model) throws Exception {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String account = req.getParameter("account");
		String pwd =  req.getParameter("pwd");
		
		System.out.println("적금계좌: "+ account);
		
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("account", account);
		map.put("pwd", pwd);

		int savPw = dao.sav_pw(map); //비밀번호 체크
		int sav = 0; //잔액체크
		int del_sav = 0; //해지처리
		System.out.println("savPw :"+ savPw);
		
		if(savPw != 0) {//비밀번호 체크 
			sav = dao.delSav(map); //잔액체크
			System.out.println("sav"+sav);
			model.addAttribute("sav",sav);
			
			if(sav == 0) { //잔액이 0이면 
				del_sav = dao.del_sav(map); //탈퇴처리
				System.out.println("del_sav"+del_sav);
				model.addAttribute("del_sav",del_sav);
			} 
		}
		model.addAttribute("savPw", savPw);
		model.addAttribute("id", id);
		model.addAttribute("account", account);
	}
	
	// 파일 업로드 & 텍스트 인식
	@Override
	public void getText(String file, Model model) throws IOException {

		//ProcessBuilder pb = new ProcessBuilder("python", "C:\\DEV43\\python\\source\\benkfit.py", file);
		ProcessBuilder pb = new ProcessBuilder("python", "/Users/banhun/tesseract/source/benkfit.py", file);
		Process p = pb.start();

		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));

		String line = " ";

		StringBuilder sb = new StringBuilder();
		System.out.println("start");

		while((line = br.readLine()) != null) {
			sb.append(line + "\n");
			System.out.println("sdf: "+sb.append(line + "\n"));
		}

		String info = sb.toString();

		System.out.println(info);
		System.out.println("end");

		br.close();	

		//파일 객체 생성
		//Path path = Paths.get("C:\\DEV43\\python\\output\\get.txt");
		Path path = Paths.get("/Users/banhun/tesseract/output/get.txt");
		// 캐릭터셋 지정
		Charset cs = StandardCharsets.UTF_8;
		//파일 내용담을 리스트
		List<String> list = new ArrayList<String>();
		try{
			list = Files.readAllLines(path,cs);
			System.out.println("list:"+ list);

			//서류명
			String title = list.get(0);	
			model.addAttribute("title",title);
			System.out.println("title"+title);
			//이름
			String a = list.get(16).replaceAll("\\p{Z}", ""); 
			String name =a.substring(2);
			model.addAttribute("name",name);
			System.out.println("name"+name);
			//주소
			String b = list.get(19);
			String perAddress = b.substring(2).trim();
			model.addAttribute("perAddress", perAddress);
			System.out.println("perAddress"+ perAddress);
			//주민
			String[] c = list.get(17).split("-"); 
			String jumin1 = c[0].substring(6).replaceAll("\\p{Z}", "");
			String jumin2 = c[1].replaceAll("\\p{Z}", "");
			model.addAttribute("jumin1",jumin1);
			model.addAttribute("jumin2",jumin2);
			System.out.println("jumin1"+jumin1);
			System.out.println("jumin2"+jumin2);
			//회사명
			String[] h = list.get(42).split(":");
			String comName = h[1].trim();
			model.addAttribute("comName",comName);
			System.out.println("comName"+comName);
			//부서 
			String d = list.get(21).replaceAll("\\p{Z}", ""); 
			String department = d.substring(2);
			model.addAttribute("department",department);
			System.out.println("department"+department);
			//직위 25
			String e = list.get(23).replaceAll("\\p{Z}", ""); 
			String position = e.substring(2);
			model.addAttribute("position",position);
			System.out.println("position"+position);

			//회사주소39 + 40
			String[] f = list.get(39).split(":");
			String comAddress = f[1].trim()+list.get(40);
			model.addAttribute("comAddress",comAddress);
			System.out.println("comAddress"+comAddress);
			// 재직기간
			String[] t = list.get(25).replaceAll("\\p{Z}", "").split("~");
			String period_from= t[0].substring(2);//시작일
			String period_to = t[1];//종료일
			model.addAttribute("period_from",period_from);
			model.addAttribute("period_to",period_to);

			System.out.println("period_from"+period_from);
			System.out.println("period_to" + period_to);
			System.out.println("=====================");

		}catch(IOException e){
			e.printStackTrace();
		}
	}
	//서류등록처리
	@SuppressWarnings("deprecation")
	@Override
	public void signInPro(MultipartHttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();

		// 이미지 파일
		MultipartFile file = req.getFile("doc_img");
		String saveDir = req.getRealPath("/resources/img/doc/"); 
		String realDir = "C:\\DEV43\\benkfit\\Benkfit\\src\\main\\webapp\\resources\\img\\doc\\"; 
		//String realDir = "C:\\Users\\322sy\\git\\benkfit\\Benkfit\\src\\main\\webapp\\resources\\img\\doc";
		//String realDir = "C:\\DEV43\\benkfit\\Benkfit\\src\\main\\webapp\\resources\\img\\doc\\"; 
		//String realDir = "C:\\Users\\322sy\\git\\benkfit\\Benkfit\\src\\main\\webapp\\resources\\img\\doc";
		//String realDir = "/Users/banhun/git/benkfit/Benkfit/src/main/webapp/resources/img/doc/";

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

			// 바구니 생성, 입력받은 값 받아오기
			documentVO vo = new documentVO();

			vo.setDoc_title(req.getParameter("doc_title"));
			vo.setDoc_name(req.getParameter("doc_name"));
			vo.setDoc_jumin1(req.getParameter("doc_jumin1"));
			vo.setDoc_jumin2(req.getParameter("doc_jumin2"));
			vo.setDoc_img(file.getOriginalFilename());
			vo.setDoc_comAddress(req.getParameter("doc_comAddress"));
			vo.setDoc_perAddress(req.getParameter("doc_perAddress"));
			vo.setDoc_department(req.getParameter("doc_department"));
			vo.setDoc_position(req.getParameter("doc_position"));
			vo.setDoc_period_to(req.getParameter("doc_period_to"));
			vo.setDoc_period_from(req.getParameter("doc_period_from"));
			vo.setDoc_comName(req.getParameter("doc_comName"));
			vo.setC_id(id);

			//서류등록처리
			int result = dao.indocu(vo);

			model.addAttribute("result", result);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	//서류조회
	@Override
	public void seldocu(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		
		List<documentVO> docu = dao.seldocu(id);
		System.out.println("docu : "+ docu);
		model.addAttribute("docu", docu);
	}
	//서류조회 -상세
	@Override
	public void detaildocu(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String doc_num = req.getParameter("doc_num");
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("doc_num", doc_num);
		
		documentVO vo = dao.detaildocu(map);
		
		model.addAttribute("vo",vo);
	}
	//서류삭제
	@Override
	public void deletedocu(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String doc_num = req.getParameter("doc_num");
		System.out.println("아이디 : "+ id);
		System.out.println("doc_num : "+ doc_num);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("doc_num", doc_num);
		
		int del = dao.deletedocu(map);
		
		model.addAttribute("del",del);
	}
	//자산관리 - 예산chart
	@Override
	public void budget(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String num = req.getParameter("num");
		System.out.println("num : "+ num);
		model.addAttribute("num", num);
		
		DateVO vo = dao.day();
		DateVO vo1 = dao.day1();
		DateVO vo2 = dao.day2();
		DateVO vo3 = dao.day3();

		if(vo1 != null ) {
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("start_day", vo1.getStart_day());
			map.put("end_day",vo1.getEnd_day());
			int budget1 = dao.budget(map);
			model.addAttribute("budget1" ,budget1);
		}
		if(vo2 !=null) {
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("start_day", vo2.getStart_day());
			map.put("end_day",vo2.getEnd_day());
			int budget2 = dao.budget(map);
			model.addAttribute("budget2" ,budget2);
		}	
		if(vo3 != null) {
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("start_day", vo3.getStart_day());
			map.put("end_day",vo3.getEnd_day());
			int budget3 = dao.budget(map);
			model.addAttribute("budget3" ,budget3);
		}
		if(vo != null) {
			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("start_day", vo.getStart_day());
			map.put("end_day",vo.getEnd_day());
			int budget = dao.budget(map);
			model.addAttribute("budget" ,budget);
		}
	
	}
	@Override
	public void downdocu(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		 String dFile = "재직증명서-양식.docx";
		  String upDir = "C:\\Users\\82109\\Desktop";
		  String path = upDir+File.separator+dFile;
		  
		  File file = new File(path);

		  String userAgent = req.getHeader("User-Agent");
		  boolean ie = userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("rv:11") > -1;
		  String fileName = null;
		   
		  if (ie) {
		   fileName = URLEncoder.encode(file.getName(), "utf-8");
		  } else {
		   fileName = new String(file.getName().getBytes("utf-8"),"iso-8859-1");
		  }
		  
		  res.setContentType("application/octet-stream");
		  res.setHeader("Content-Disposition","attachment;filename=\"" +fileName+"\";");
		  
		  FileInputStream fis=new FileInputStream(file);
		  BufferedInputStream bis=new BufferedInputStream(fis);
		  ServletOutputStream so=res.getOutputStream();
		  BufferedOutputStream bos=new BufferedOutputStream(so);
		  
		  byte[] data=new byte[2048];
		  int input=0;
		  while((input=bis.read(data))!=-1){
		   bos.write(data,0,input);
		   bos.flush();
		  }
		  
		  if(bos!=null) bos.close();
		  if(bis!=null) bis.close();
		  if(so!=null) so.close();
		  if(fis!=null) fis.close();
		 }
	
	
	
		
}