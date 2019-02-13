package spring.mvc.benkfit.service;

import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.admin.methods.response.NewAccountIdentifier;
import org.web3j.protocol.core.Request;
import org.web3j.protocol.http.HttpService;

import spring.mvc.benkfit.persistence.DAOImpl_syk;
import spring.mvc.benkfit.sol.Basic;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.SavProductVO;

@Service
public class ServiceImpl_syk implements Service_syk {

	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));

	@Autowired
	DAOImpl_syk dao;

	//예금상품리스트조회
	@Override
	public void cheqSavList(HttpServletRequest req) {
		List<CheqProductVO> cheq = dao.cheqList();
		List<SavProductVO> sav = dao.savList();

		req.setAttribute("cheq", cheq);
		req.setAttribute("sav", sav);
	}

	//예금상품조회
	@Override
	public void cheqInfo(HttpServletRequest req) {
		String num = req.getParameter("num");

		CheqProductVO info = dao.cheqInfo(num);
		req.setAttribute("type", "cheq");
		System.out.println("-----" + req.getAttribute("type"));
		req.setAttribute("info", info);		
	}

	//적금상품조회
	@Override
	public void savInfo(HttpServletRequest req) {
		String num = req.getParameter("num");

		SavProductVO info = dao.savInfo(num);
		req.setAttribute("type", "sav");
		System.out.println("-----" + req.getAttribute("type"));
		req.setAttribute("info", info);
	}

	//예금상품등록
	@Override
	public void cheqRegiPro(HttpServletRequest req) {
		int result = 0;

		String name = req.getParameter("name");
		double rate = Double.parseDouble(req.getParameter("rate"));
		String type = req.getParameter("type");
		String target = req.getParameter("target");
		int limit = Integer.parseInt(req.getParameter("limit"));
		String period = req.getParameter("period");

		CheqProductVO vo = new CheqProductVO();
		vo.setCheq_type(type);
		vo.setCheq_name(name);
		vo.setCheq_target(target);
		vo.setCheq_limit(limit);
		vo.setCheq_period(period);
		vo.setCheq_rate(rate);

		result = dao.RegiCheq(vo);

		System.out.println("예금상품등록 : " + result);
		req.setAttribute("cnt", result);
	}

	//적금상품등록
	@Override
	public void savRegiPro(HttpServletRequest req) {
		int result = 0;

		String name = req.getParameter("name");
		double rate = Double.parseDouble(req.getParameter("rate"));
		String type = req.getParameter("type");
		String target = req.getParameter("target");
		int limit = Integer.parseInt(req.getParameter("limit"));
		String period = req.getParameter("period");
		String auto = req.getParameter("auto");

		SavProductVO vo = new SavProductVO();
		vo.setSav_type(type);
		vo.setSav_name(name);
		vo.setSav_target(target);
		vo.setSav_limit(limit);
		vo.setSav_period(period);
		vo.setSav_rate(rate);
		vo.setSav_autotrans(auto);

		result = dao.RegiSaving(vo);

		System.out.println("적금상품등록 : " + result);
		req.setAttribute("cnt", result);
	}

	//예금계좌생성
	@Override
	public void createCheq(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) securityContext.getPrincipal();
       
        String id = user.getUsername();
		String num = req.getParameter("num");
		String password = req.getParameter("password");

		boolean success = false;
		int result = 0;
		try {
			NewAccountIdentifier newAccount = admin.personalNewAccount(password).send();
			String account = newAccount.getAccountId();
			System.out.println("newAccount =====> " + newAccount.getAccountId());
			if(newAccount != null) {
				success = true;
				model.addAttribute("success",success);
				System.out.println("새로운 계정을 만드는 함수입니다.");
				System.out.println("새 계정의 입력받은 비밀번호 : " + password);
				System.out.println("성공여부 : " + success);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", id);
				map.put("num", num);
				map.put("pwd", password);
				map.put("account", account);

				result = dao.createCheq(map);
			}
			System.out.println("newAccount : " + account);
		} catch (Exception e) {
			e.printStackTrace();
		}

		req.setAttribute("Accountcnt", result);	
	}

	//적금계좌생성
	@Override
	public void createSav(HttpServletRequest req, Model model) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) securityContext.getPrincipal();
		
        String id = user.getUsername();
		String num = req.getParameter("num");
		String password = req.getParameter("password");
		String amount = req.getParameter("amount");

		boolean success = false;
		int result = 0;
		try {
			String newAccount = WalletUtils.generateNewWalletFile(password, new File("C:\\ether\\geth\\private_net\\keystore"));
			if(newAccount != null) {
				success = true;
				model.addAttribute("success",success);
				System.out.println("새로운 계정을 만드는 함수입니다.");
				System.out.println("새 계정의 입력받은 비밀번호 : " + password);
				System.out.println("성공여부 : " + success);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", id);
				map.put("num", num);
				map.put("pwd", password);
				map.put("amount", amount);
				map.put("account", newAccount);

				result = dao.createSav(map);
			}
			System.out.println("newAccount : " + newAccount);
		} catch (InvalidAlgorithmParameterException | NoSuchAlgorithmException | NoSuchProviderException
				| CipherException | IOException e) {
			e.printStackTrace();
		}

		req.setAttribute("cnt", result);	
	}

	//이체
	public String trasfer(HttpServletRequest req) {
		return "";
	}

	//admin
	public void admin(HttpServletRequest req) {
		String password = req.getParameter("pwd");
		admin.personalNewAccount(password);
	}

	//예금상품수정
	@Override
	public void cheqEdit(HttpServletRequest req) {
		String num = req.getParameter("cheq_num");
		
		System.out.println("num === " + num);
		
		CheqProductVO vo = dao.cheqInfo(num);
		req.setAttribute("vo", vo);
	}
}
