package spring.mvc.benkfit.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.benkfit.persistence.DAO_lia;
import spring.mvc.benkfit.vo.AdminVO;
import spring.mvc.benkfit.vo.CardProductVO;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.MySavAccountVO;
import spring.mvc.benkfit.vo.MyloanAccountVO;
import spring.mvc.benkfit.vo.PriceVO;
import spring.mvc.benkfit.vo.SavProductVO;
import spring.mvc.benkfit.vo.TransDetailVO;
import spring.mvc.benkfit.vo.UsersVO;
import spring.mvc.benkfit.vo.myCheqAccountVO;

@Service
public class ServiceImpl_lia implements Service_lia {

	@Autowired 
	DAO_lia dao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 파일 업로드 & 텍스트 인식
	@Override
	public void getText(String file, Model model) throws IOException {
		
		ProcessBuilder pb = new ProcessBuilder("python", "C:/DEV43/python/source/test.py", file);
		Process p = pb.start();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
		
		String line = "";
		
		StringBuilder sb = new StringBuilder();
		
		while((line = br.readLine()) != null) {
			sb.append(line + "\n");
		}
		
		String info = sb.toString();
		
		br.close();
		
		String name = "";
        String jumin = "";
        ArrayList<String> names = new ArrayList<String>();
        
		try{
            //파일 객체 생성
            File txt = new File("C:\\DEV43\\python\\output\\getText.txt");
            
           //스캐너로 파일 읽기
            ArrayList<String> list = new ArrayList<String>();
            Scanner scan = new Scanner(txt);
           
            while(scan.hasNextLine()){
            	list.add(scan.nextLine());
                //System.out.println(scan.nextLine());
            }
            
            /*for(String str : list) {
            	System.out.println(str + "..");
            }*/
            
            //이름 추출
            for(String str : list) {
            	if(str.contains("(")) {
            		if(str.length() <= 8) {
            			names.add(str.substring(0, 3));
            		}
            	}
            }
            name = names.get(0);
            System.out.println("name : " + name);
            
            //주민번호 추출
            for(String str : list) {
            	if(str.contains("-")) {
            		if(str.length()==14) {
            			jumin = str;
            			System.out.println("jumin : " + jumin);
            			model.addAttribute("jumin", jumin);
            		}
            	}
            }
            scan.close();
        } catch (Exception e) {
            e.printStackTrace();
        } 
		model.addAttribute("name", name);
	}
	
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
		// 입력값 받아오기
		String name = req.getParameter("name");
		String jumin = req.getParameter("jumin");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("jumin", jumin);

		// 실명확인
		int selectCnt = dao.name_check(map);
		//System.out.println("실명확인cnt : " + selectCnt);
		
		// 결과 저장
		model.addAttribute("selectCnt", selectCnt);
	}
	
	// 비밀번호, 주민번호 뒷자리 암호화
	@Override
	public String encryptSHA256(String str) {
		String pwd = "";
		try {
	    	MessageDigest md = MessageDigest.getInstance("SHA-256"); 
	    	md.update(str.getBytes()); 
	        byte byteData[] = md.digest();
	        StringBuffer buffer = new StringBuffer(); 
	        for(int i=0; i<byteData.length; i++){
	        	buffer.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
	        }
	
	        pwd = buffer.toString();
	        
	      } catch(NoSuchAlgorithmException e){
	        e.printStackTrace(); 
	        pwd = null; 
	      }
	     return pwd;
	}
	// 회원가입 처리
	@Override
	public void signInPro(MultipartHttpServletRequest req, Model model) {
		// 이미지 파일
		MultipartFile file = req.getFile("idCard");
		
		String saveDir = req.getRealPath("/resources/img/idcard/"); 
        String realDir = "C:\\DEV43\\git\\benkfit\\Benkfit\\src\\main\\webapp\\resources\\img\\idcard\\"; 
        
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
			UsersVO vo =  new UsersVO();
			
			vo.setC_id(req.getParameter("id"));
			//vo.setC_pwd(encryptSHA256(req.getParameter("pwd")));
			vo.setC_pwd(req.getParameter("pwd"));
			vo.setC_name(req.getParameter("name"));
			vo.setC_jumin1(req.getParameter("jumin1"));
			vo.setC_jumin2(encryptSHA256(req.getParameter("jumin2")));
			//vo.setC_jumin2(req.getParameter("jumin2"));
			vo.setC_hp(req.getParameter("hp"));
			vo.setC_email(req.getParameter("email"));
			vo.setC_post(req.getParameter("post"));
			String addr1 = req.getParameter("addr1");
			String addr2 = req.getParameter("addr2");
			vo.setC_address(addr1 + " " + addr2);
			vo.setC_idCard(file.getOriginalFilename());
			
			// 회원가입 처리
			int insertCnt = dao.insertMember(vo);
			
			model.addAttribute("insertCnt", insertCnt);
        } catch(IOException e) {
        	e.printStackTrace();
        }
	}

	// 로그인, 비밀번호 확인
	@Override
	public void loginPro(HttpServletRequest req, Model model) {
		String id = req.getParameter("username");
		String pwd = req.getParameter("password");
		
		// 로그인 처리
		int selectCnt = 0;
		UsersVO vo = new UsersVO();
		AdminVO avo = new AdminVO();
		
		vo = dao.user_login(id, pwd);
		avo = dao.admin_login(id, pwd);
		
		// 아이디 없을 때
		if(vo == null && avo == null) {
			selectCnt = 3;
		// 고객 로그인
		} else if(vo != null && avo == null) {
			// 비밀번호 일치
			if(encryptSHA256(pwd).equals(vo.getC_pwd())) {
				selectCnt = 1;
				req.getSession().setAttribute("userId", id);
			// 비밀번호 불일치
			} else {
				selectCnt = -1;
			}
		// 관리자 로그인
		} else if(vo == null && avo != null) {
			// 비밀번호 일치
			if(pwd.equals(avo.getAdmin_pwd())) {
				selectCnt = 2;
				req.getSession().setAttribute("adminId", id);
			// 비밀번호 불일치
			} else {
				selectCnt = -2;
			}
		}
		
		model.addAttribute("selectCnt", selectCnt);
	}

	// 아이디 찾기
	@Override
	public void findMyId(HttpServletRequest req, Model model) {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
 
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		
		String id = dao.findMyId(map);
		
		if(id == null) {
			model.addAttribute("id", "0");
		} else {
			model.addAttribute("id", id);
		}
	}

	// 임시 비밀번호 이메일 보내기
	@Override
	public void pwdEmail(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		
		System.out.println(id + " / " + email);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		
		int selectCnt = dao.findMyPwd(map);
		System.out.println("조회 : " + selectCnt);
		// 일치정보 있으면
		if(selectCnt == 1) {
			// 임시 비밀번호 생성
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			map.put("pwd", pwd);
			
			// 비밀번호 DB 업데이트
			int updateCnt = dao.setTempPwd(map);
			System.out.println("비번업데이트 : " + updateCnt);
			if(updateCnt == 1) {
				// 메일 발송
				sendEmail(map);
			} 
		}
	}
	// 임시 비밀번호 이메일 보내기
	@Override
	public void sendEmail(Map<String, String> map) {
		try{
            MimeMessage message = mailSender.createMimeMessage();

          String txt = map.get("id") + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요." 
          				+ "<br/>임시 비밀번호 : " + map.get("pwd")
          				+ "<br><a href='http://localhost/benkfit/login'>로그인하러 가기</a>";

          message.setSubject("benkfit 임시 비밀번호가 발급되었습니다.");
          message.setText(txt, "UTF-8", "html");
          message.setFrom(new InternetAddress("admin@benkfit.com"));
          message.addRecipient(RecipientType.TO, new InternetAddress(map.get("email")));
          mailSender.send(message);

      }catch(Exception e){
          e.printStackTrace();
      }   
	}
	// 검색
	@Override
	public void search_pro(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("search");
		System.out.println("keyword : " + keyword);
		
		int cardCnt = dao.search_card_count(keyword);
		int cheqCnt = dao.search_cheq_count(keyword);
		int loanCnt = dao.search_loan_count(keyword);
		int savCnt = dao.search_sav_count(keyword);
		
		if(cardCnt > 0) {
			List<CardProductVO> card = dao.search_card(keyword);
			model.addAttribute("card", card);
		}
		
		if(cheqCnt > 0) {
			List<CheqProductVO> cheq = dao.search_cheq(keyword);
			model.addAttribute("cheq", cheq);
		}
		
		if(loanCnt > 0) {
			List<LoanProductVO> loan = dao.search_loan(keyword);
			model.addAttribute("loan", loan);
		}
		
		if(savCnt > 0) {
			List<SavProductVO> sav = dao.search_sav(keyword);
			model.addAttribute("sav", sav);
		}
		
		model.addAttribute("cardCnt", cardCnt);
		model.addAttribute("cheqCnt", cheqCnt);
		model.addAttribute("loanCnt", loanCnt);
		model.addAttribute("savCnt", savCnt);
	}
	
	// 관리자메뉴 > 회원 조회
	@Override
	public void selectUsers(HttpServletRequest req, Model model) {
		// 페이징
		int pageSize = 10;	 //한 페이지당 출력할 회원 수
		int pageBlock = 3;   //한 블럭당 페이지 개수
		
		int ucnt = 0; 		 //회원수
		int start = 0;		 //현재 페이지 시작 번호
		int end = 0;		 //현재 페이지 마지막 번호
		String pageNum = ""; //페이지 번호
		int currentPage = 0; //현재 페이지
		
		int pageCount = 0;	//페이지 개수
		int startPage = 0;  //시작 페이지
		int endPage = 0;  	//마지막 페이지
		
		ucnt = dao.howManyUsers();
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("undefined")) {
			pageNum = "1";	//첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		
		pageCount = (ucnt / pageSize) + (ucnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		
		end = start + pageSize - 1;
		
		if(end > ucnt) {
			end = ucnt;
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
			
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("ucnt", ucnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);  	  
		model.addAttribute("pageBlock", pageBlock);   
		model.addAttribute("pageCount", pageCount);  
		model.addAttribute("currentPage", currentPage);
		
		if(ucnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<UsersVO> users = dao.selectUsers(map);
			model.addAttribute("users", users);
		}
	}

	// 관리자메뉴 > 회원 삭제
	@Override
	public void deleteUsers(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int cnt  = dao.deleteUsers(id);
		model.addAttribute("cnt", cnt);
	}
	
	// 관리자메뉴 > 회원 등급 수정
	@Override
	public void updateUsers(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		String level = req.getParameter("level");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("level", level);
		
		int cnt  = dao.updateUsers(map);
		model.addAttribute("cnt", cnt);
		model.addAttribute("level", level);
	}

	// 관리자메뉴 > 계좌조회
	@Override
	public void selAccount(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		List<myCheqAccountVO> cheq = dao.selectCheq(id);
		List<MySavAccountVO> sav = dao.selectSav(id);
		List<MyloanAccountVO> loan = dao.selectLoan(id);
		
		model.addAttribute("id", id);
		if(cheq.size() == 0) {
			model.addAttribute("cnt", 0);
		} else {
			model.addAttribute("cnt", 1);
			model.addAttribute("cheq", cheq);
		}
		
		if(sav.size() == 0) {
			model.addAttribute("scnt", 0);
		} else {
			model.addAttribute("scnt", 1);
			model.addAttribute("sav", sav);
		}
		
		if(loan.size() == 0) {
			model.addAttribute("lcnt", 0);
		} else {
			model.addAttribute("lcnt", 1);
			model.addAttribute("loan", loan);
		}
	}

	// 관리자 메뉴 > 회원 거래내역 조회
	@Override
	public void selTransaction(HttpServletRequest req, Model model) {
		String account = req.getParameter("account");
		String code = req.getParameter("code");
		List<TransDetailVO> transaction = new ArrayList<>();
		 
		// 페이징
		int pageSize = 10;	 //한 페이지당 출력할 개수
		int pageBlock = 3;   //한 블럭당 페이지 개수
		
		int tcnt = 0; 		 //내역 건수
		int start = 0;		 //현재 페이지 시작 거래번호
		int end = 0;		 //현재 페이지 마지막 거래번호
		String pageNum = ""; //페이지 번호
		int currentPage = 0; //현재 페이지
		
		int pageCount = 0;	//페이지 개수
		int startPage = 0;  //시작 페이지
		int endPage = 0;  	//마지막 페이지
		
		tcnt = dao.getTransCnt(account);
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("undefined")) {
			pageNum = "1";	//첫페이지를 1페이지로 지정
		}
		
		currentPage = Integer.parseInt(pageNum);
		
		pageCount = (tcnt / pageSize) + (tcnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		
		end = start + pageSize - 1;
		if(end > tcnt) {
			end = tcnt;
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
			
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("account", account);
		model.addAttribute("code", code);
		model.addAttribute("tcnt", tcnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);  	  
		model.addAttribute("pageBlock", pageBlock);   
		model.addAttribute("pageCount", pageCount);  
		model.addAttribute("currentPage", currentPage);
		
		if(tcnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("account", account);
				
			if(code.equals("A")) {
				transaction = dao.getCheqTrans(map);
				model.addAttribute("transaction", transaction);
			} else if (code.equals("B")) {
				transaction = dao.getSavTrans(map);
				model.addAttribute("transaction", transaction);
			} else {
				transaction = dao.getLoanTrans(map);
				model.addAttribute("transaction", transaction);
			}
		} 
	}

	// 코인 시세
	@Override
	public void marketprice(Model model) throws IOException {
		// Process : 자바에서 외부프로그램을 호출할때 사용
		ProcessBuilder pb = new ProcessBuilder("python", "C:/DEV43/python/source/coin.py");
		Process p = pb.start();   //프로세스 호출
		
		// 프로세서의 실행결과를 스트림으로 리턴
		BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
		String line = "";
		StringBuilder sb = new StringBuilder();
		
		ArrayList<String> list = new ArrayList<>();

		while((line = br.readLine()) != null) {
			list.add(line.toString());
		}
		
		ArrayList<ArrayList> set = new ArrayList<ArrayList>();
		
		for(String str : list) {
			String[] coin = str.substring(1, str.length()-1).split(",");
			ArrayList<String> subset = new ArrayList<>();
			
			for(int i=0; i<coin.length; i++) {
				subset.add(coin[i].replace("'", "").trim());
			}
			set.add(subset);
			Map<String, String> name = new HashMap<String, String>();
			name.put("name", subset.get(0));
			/*dao.insertCoins(name);*/
		}
		
		// 변동값 업데이트
		for(int i=0; i<set.size(); i++) {
			Map<String, Object> vals = new HashMap<String, Object>();
			vals.put("name", set.get(i).get(0).toString());
			vals.put("marketprice", set.get(i).get(1));
			vals.put("changeNum", set.get(i).get(2).toString().trim());
			vals.put("changePer", set.get(i).get(3).toString().trim());
			vals.put("sort_amount", set.get(i).get(4));
			vals.put("total", set.get(i).get(5).toString().replace("JO", "조").replace("UCK", "억"));
			dao.updateCoins(vals);
		}
		List<PriceVO> price = dao.selectCoins();
		
		//자원해제
		br.close();
		
		model.addAttribute("price", price);
	}
}
