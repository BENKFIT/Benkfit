package spring.mvc.benkfit.service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.admin.methods.response.NewAccountIdentifier;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.Request;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;
import org.web3j.utils.Convert.Unit;

import spring.mvc.benkfit.persistence.DAOImpl_syk;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.SavProductVO;
import spring.mvc.benkfit.vo.TransDetailVO;

@Service
public class ServiceImpl_syk implements Service_syk {

	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));
	
	final String path = "C:\\ether\\geth\\private_net\\keystore\\";
	int chkNum = 0;
	
	String fn = "0x";
	
	BigInteger gasPrice = BigInteger.valueOf(3000000);
	BigInteger gasLimit = BigInteger.valueOf(3000000);

	@Autowired
	DAOImpl_syk dao;

	/*
	 * 상품
	 */
	
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
		req.setAttribute("num", num);
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

	//예금상품수정
	@Override
	public void cheqEdit(HttpServletRequest req) {
		String num = req.getParameter("cheq_num");
		
		CheqProductVO vo = dao.cheqInfo(num);
		req.setAttribute("vo", vo);
	}

	//적금상품수정
	@Override
	public void savEdit(HttpServletRequest req) {
		String num = req.getParameter("sav_num");
		
		SavProductVO vo = dao.savInfo(num);
		req.setAttribute("vo", vo);
	}
	
	//예금상품삭제
	@Override
	public void cheqDel(HttpServletRequest req) {
		String num = req.getParameter("cheq_num");
		
		int result = dao.cheqDel(num);
		req.setAttribute("num", num);
		req.setAttribute("result", result);
	}
	
	//적금상품삭제
	@Override
	public void savDel(HttpServletRequest req) {
		String num = req.getParameter("sav_num");
		
		int result = dao.savDel(num);
		req.setAttribute("num", num);
		req.setAttribute("result", result);
	}

	/*
	 * 이체
	 */
	
	//이체페이지
	@Override
	public void trans(HttpServletRequest req) {
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) securityContext.getPrincipal();
		
        String id = user.getUsername();
        
        List<String> accounts = dao.userAccounts(id);
        req.setAttribute("accounts", accounts);
	}

	@Override
	public void transPro(HttpServletRequest req) throws Exception{
		Authentication  securityContext = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) securityContext.getPrincipal();
		
        String id = user.getUsername();
		
        System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		String password = req.getParameter("pwd");
		
		String fileSource = path.concat(req.getParameter("file"));
		System.out.println("fileSource = " + fileSource);
		String from = fn.concat(req.getParameter("file").substring(37));
		
		int value = Integer.parseInt(req.getParameter("amount"));
		String to = req.getParameter("to");
		BigDecimal ether = BigDecimal.valueOf(value);
		
		System.out.println("== 이더를 송금하는 함수 ==");
		System.out.println("> 보내는 계정 :" + from);
		System.out.println("> 송금계정 비밀번호 : " + password);
		System.out.println("> 받는 계정 : " + to);
		System.out.println("> 보내는 값(이더) : " + value +"("+ether+")");
		
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		TransactionReceipt transfer = Transfer.sendFunds(web3j, credentials, to, ether, Convert.Unit.ETHER).send();
		String blockHash = transfer.getBlockHash();
			
		if(transfer.getBlockNumber() != null) {
			TransDetailVO vo = new TransDetailVO();
			vo.setTran_account(from);
			vo.setTran_out(from);
			vo.setTran_in(to);
			vo.setTran_amount(value);
			vo.setC_id(id);
			vo.setTran_type("이체");
			vo.setTran_code("A");
			vo.setTran_blockHash(blockHash);
			
			chkNum = dao.transPro(vo);
		}else {
			chkNum = 0;
		}
		req.setAttribute("chkNum", chkNum);
	}
	
	//잔액확인
	@Override
	public void getBalance(HttpServletRequest req) {
		String account = req.getParameter("account");
		System.out.println("account ===> " + account);
		BigInteger balance = null;
		
		try {
			balance = this.web3j.ethGetBalance(account, DefaultBlockParameter.valueOf("latest")).sendAsync().get().getBalance();
		} catch (InterruptedException | ExecutionException e) {
			e.getMessage();
		}
		req.setAttribute("balance", balance);
	}
}
