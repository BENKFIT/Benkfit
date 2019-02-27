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

import javax.annotation.PostConstruct;
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
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.Request;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;
import org.web3j.utils.Convert.Unit;

import spring.mvc.benkfit.persistence.DAOImpl_syk;
import spring.mvc.benkfit.sol.Bank;
import spring.mvc.benkfit.sol.Benkfit;
import spring.mvc.benkfit.sol.Slot;
import spring.mvc.benkfit.vo.AutoTransferVO;
import spring.mvc.benkfit.vo.CheqProductVO;
import spring.mvc.benkfit.vo.ContractVO;
import spring.mvc.benkfit.vo.SavProductVO;
import spring.mvc.benkfit.vo.TransDetailVO;

@Service
public class ServiceImpl_syk implements Service_syk {

	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));

	final String path = "C:\\ether\\geth\\private_net\\keystore\\";
	final String owner = "0x565d241fd2f30474bae822254a6ccc03cc45df0e";
	final String owner_file = "C:\\ether\\geth\\private_net\\keystore\\UTC--2019-01-25T06-33-33.541838900Z--565d241fd2f30474bae822254a6ccc03cc45df0e";
	final String owner_pwd = "password";

	int chkNum = 0;

	String fn = "0x";

	final BigInteger gasPrice = BigInteger.valueOf(3000000);
	final BigInteger gasLimit = BigInteger.valueOf(3000000);
	final BigInteger initialWeiValue = BigInteger.valueOf(0);

	@Autowired
	DAOImpl_syk dao;

	/*
	 * 배포 : 톰캣서버가 열릴 때 한번만 배포
	 */
	private static String benkfit;
	private static String bank;
	private static String slot;
	
	//배포된 contract의 주소
	public static String getBenkfit() {
		return benkfit;
	}
	
	public static String getBank() {
		return bank;
	}
	
	public static String getSlot() {
		return slot;
	}


	/*
	 * 상품
	 */

	// 예금상품리스트조회
	@Override
	public void cheqSavList(HttpServletRequest req) {
		List<CheqProductVO> cheq = dao.cheqList();
		List<SavProductVO> sav = dao.savList();

		req.setAttribute("cheq", cheq);
		req.setAttribute("sav", sav);
	}

	// 예금상품조회
	@Override
	public void cheqInfo(HttpServletRequest req) {
		String num = req.getParameter("num");

		CheqProductVO info = dao.cheqInfo(num);
		req.setAttribute("type", "cheq");
		System.out.println("-----" + req.getAttribute("type"));
		req.setAttribute("info", info);
	}

	// 적금상품조회
	@Override
	public void savInfo(HttpServletRequest req) {
		String num = req.getParameter("num");

		SavProductVO info = dao.savInfo(num);
		req.setAttribute("type", "sav");
		System.out.println("-----" + req.getAttribute("type"));
		req.setAttribute("info", info);
	}

	// 예금상품등록
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

	// 적금상품등록
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

	// 예금계좌생성
	@Override
	public void createCheq(HttpServletRequest req, Model model) throws Exception {
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();

		String id = user.getUsername();
		String num = req.getParameter("num");
		String password = req.getParameter("password");

		boolean success = false;
		int result = 0;
		// 새 계정생성
		NewAccountIdentifier newAccount = admin.personalNewAccount(password).send();
		String account = newAccount.getAccountId();
		if (newAccount != null) {
			success = true;
			model.addAttribute("success", success);
			System.out.println("새로운 계정을 만드는 함수입니다.");
			System.out.println("새 계정의 입력받은 비밀번호 : " + password);
			System.out.println("성공여부 : " + success);

			// 10이더 전송
			Credentials credentials = WalletUtils.loadCredentials(owner_pwd, owner_file);
			
			String contract = getBenkfit();
			@SuppressWarnings("deprecation")
			Benkfit createCheq = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
			TransactionReceipt transfer = createCheq.transfer(account, BigInteger.valueOf(10)).send();

			Log log = createCheq.getTransferEvents(transfer).get(0).log;
			System.out.println("createCheq : " + log);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("num", num);
			map.put("pwd", password);
			map.put("account", account);

			result = dao.createCheq(map);
		}
		System.out.println("newAccount : " + account);
		req.setAttribute("Accountcnt", result);
		req.setAttribute("num", num);
	}

	// 적금계좌생성
	@Override
	public void createSav(HttpServletRequest req, Model model) throws Exception {
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();

		String id = user.getUsername();
		String num = req.getParameter("num");
		String password = req.getParameter("password");
		String period = req.getParameter("period");

		boolean success = false;
		int result = 0;
		// 새 계정생성
		NewAccountIdentifier newAccount = admin.personalNewAccount(password).send();
		String account = newAccount.getAccountId();
		if (newAccount != null) {
			success = true;
			model.addAttribute("success", success);
			System.out.println("새로운 계정을 만드는 함수입니다.");
			System.out.println("새 계정의 입력받은 비밀번호 : " + password);
			System.out.println("성공여부 : " + success);

			// 10이더 전송
			Credentials credentials = WalletUtils.loadCredentials(owner_pwd, owner_file);
			
			String contract = getBenkfit();
			@SuppressWarnings("deprecation")
			Benkfit createSav = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
			TransactionReceipt transfer = createSav.transfer(account, BigInteger.valueOf(10)).send();
			
			Log log = createSav.getTransferEvents(transfer).get(0).log;
			System.out.println("createSav : " + log);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("num", num);
			map.put("pwd", password);
			map.put("account", account);
			map.put("period", period);
			map.put("amount", 10);

			result = dao.createSav(map);
		}
		req.setAttribute("Accountcnt", result);
	}

	// 예금상품수정
	@Override
	public void cheqEdit(HttpServletRequest req) {
		String num = req.getParameter("cheq_num");

		CheqProductVO vo = dao.cheqInfo(num);
		req.setAttribute("vo", vo);
	}

	// 적금상품수정
	@Override
	public void savEdit(HttpServletRequest req) {
		String num = req.getParameter("sav_num");

		SavProductVO vo = dao.savInfo(num);
		req.setAttribute("vo", vo);
	}

	// 예금상품삭제
	@Override
	public void cheqDel(HttpServletRequest req) {
		String num = req.getParameter("cheq_num");

		int result = dao.cheqDel(num);
		req.setAttribute("num", num);
		req.setAttribute("result", result);
	}

	// 적금상품삭제
	@Override
	public void savDel(HttpServletRequest req) {
		String num = req.getParameter("sav_num");

		int result = dao.savDel(num);
		req.setAttribute("num", num);
		req.setAttribute("result", result);
	}
	
	//적금만기, 해지
	@Override
	public void savExpire(HttpServletRequest req) throws Exception{
		String contract = getBenkfit();
		String password = req.getParameter("password");
		String file = req.getParameter("file");
		String account = req.getParameter("account");
		
		//가입했던 적금의 금액과 이율 검색
		int amount = dao.savExpire(account);
		int rate = 0;
		amount = amount * rate;
		
		BigInteger value = BigInteger.valueOf(amount);
		
		Credentials credential = WalletUtils.loadCredentials(password, file);
		@SuppressWarnings("deprecation")
		Benkfit savExpire = Benkfit.load(contract, web3j, credential, gasPrice, gasLimit);
		TransactionReceipt transactionReceipt =  savExpire.output(account, value).send();
		String blockhash = transactionReceipt.getBlockHash();

		Log log = savExpire.getTransferEvents(transactionReceipt).get(0).log;
		System.out.println("savExpire : " + log);
		
		req.setAttribute("blockhash", blockhash);
	}

	/*
	 * 이체
	 */

	// 이체페이지
	@Override
	public void trans(HttpServletRequest req) {
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();

		String id = user.getUsername();

		List<String> accounts = dao.userAccounts(id);
		req.setAttribute("accounts", accounts);
	}

	// 이체
	@Override
	public void transPro(HttpServletRequest req) throws Exception {
		System.out.println("== 이체 ==");
		
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String password = req.getParameter("pwd");
		System.out.println("password : " + password);

		String fileSource = path.concat(req.getParameter("file"));
		String from = fn.concat(req.getParameter("file").substring(37));
		System.out.println("from : " + from);
		
		int value = Integer.parseInt(req.getParameter("amount"));
		String to = req.getParameter("to");
		BigInteger ether = BigInteger.valueOf(value);

		//지갑로드
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		
		//contract 부르기
		String contract = getBenkfit();
		@SuppressWarnings("deprecation")
		Benkfit transfer = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
		
		//transfer실행
		TransactionReceipt transactionReceipt = transfer.transfer(to, ether).send();
		String blockHash = transactionReceipt.getBlockHash();
		
		//event 실행
		Log log = transfer.getTransferEvents(transactionReceipt).get(0).log;
		
		System.out.println("transPro : " + log);
		
		if (blockHash != null) {
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
		} else {
			chkNum = 0;
		}
		req.setAttribute("chkNum", chkNum);
	}

	// 적금이체
	public void savTrans(HttpServletRequest req) throws Exception{
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		
		long value = Long.parseLong(req.getParameter("value"));
		BigInteger ether = BigInteger.valueOf(value);
		String file = req.getParameter("file");
		String pwd = req.getParameter("pwd");
		String account = req.getParameter("account");
		
		String contract = getBenkfit();
		
		//지갑 로드
		Credentials credentials = WalletUtils.loadCredentials(pwd, file);
		
		//contract 연결
		@SuppressWarnings("deprecation")
		Benkfit savTrans = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
		
		//input함수 실행
		TransactionReceipt input = savTrans.input(ether).send();
		
		//event 실행
		String from = savTrans.getTransferEvents(input).get(0).from;
		Log log = savTrans.getTransferEvents(input).get(0).log;
		String to = savTrans.getTransferEvents(input).get(0).to;
		BigInteger amount = savTrans.getTransferEvents(input).get(0).value;
		
		System.out.println("savTrans : " + log);
		
		//DB-INSERT
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("from", from);
		map.put("amount", amount);
		map.put("account", account);
		
		dao.savTrans(map);
	}
	
	//잔액확인
	@Override
	public void getBalance(HttpServletRequest req) throws Exception{
		System.out.println("========잔액확인=========");
		String account = req.getParameter("account");
		String file = req.getParameter("file").substring(12);
		file = path.concat(file);
		String pwd = req.getParameter("password");
		
		String contract = getBenkfit();
		
		//지갑로드
		Credentials credentials = WalletUtils.loadCredentials(pwd, file);
		@SuppressWarnings("deprecation")
		Benkfit getBalance = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
		BigInteger balance = getBalance.balanceOf(account).send();
		System.out.println("balance ==>" + balance);
		req.setAttribute("balance", balance);
	}
	
	//입금
	@Override
	public void depositPro(HttpServletRequest req) throws Exception{
		System.out.println("============입금============");
		String password = req.getParameter("password");
		String from = req.getParameter("from");
		String file = req.getParameter("file");
		file = path.concat(file);
		int amount = Integer.parseInt(req.getParameter("amount"));
		BigInteger value = BigInteger.valueOf(amount);
		
		//지갑로드
		String benkfit = getBenkfit();
		Credentials credential = WalletUtils.loadCredentials(password, file);
		@SuppressWarnings("deprecation")
		Benkfit depositPro = Benkfit.load(benkfit, web3j, credential, gasPrice, gasLimit);
		TransactionReceipt transactionReceipt = depositPro.input(value).send();
		Log log = depositPro.getTransferEvents(transactionReceipt).get(0).log;
		
		System.out.println("depositPro : " + log);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("account", from);
		map.put("value", value);
		
		//int result = dao.depositPro(map);
		//System.out.println("입금결과 : " + result);
	}
	
	/*//출금
	@Override
	public void withdraw(HttpServletRequest req) throws Exception{
		System.out.println("===== 출금 =====");
		String account = req.getParameter("from");
		String file = req.getParameter("file");
		file = path.concat(file);
		String pwd = req.getParameter("pwd");
		BigInteger value = BigInteger.valueOf(Integer.parseInt(req.getParameter("amount")));
		
		String contract = getBenkfit();
		
		System.out.println("from : " + account + "\nfile : " + file + "\npwd : " + pwd + "\nvalue : " + value);
		
		//지갑로드
		Credentials credential = WalletUtils.loadCredentials(pwd, file);
		@SuppressWarnings("deprecation")
		Benkfit withdraw = Benkfit.load(contract, web3j, credential, gasPrice, gasLimit);
		TransactionReceipt transactionReceipt = withdraw.output(account, value).send();
		String blockHash = transactionReceipt.getBlockHash();
		System.out.println("blockhash : " + blockHash);
		
		req.setAttribute("blockhash", blockHash);
	}
	*/
	/*// 잔액확인
	@Override
	public void getBalance(HttpServletRequest req) {
		String account = req.getParameter("account");
		System.out.println("account ===> " + account);
		BigInteger balance = null;

		try {
			balance = this.web3j.ethGetBalance(account, DefaultBlockParameter.valueOf("latest")).sendAsync().get()
					.getBalance();
		} catch (InterruptedException | ExecutionException e) {
			e.getMessage();
		}
		req.setAttribute("balance", balance);
	}*/
	
	/*
	 * 자동이체
	 */
	//자동이체 페이지
	public void autoTrans(HttpServletRequest req) throws Exception{
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		
		List<AutoTransferVO> auto = dao.autoSearch(id);
		List<String> accounts = dao.userAccounts(id);
		
		req.setAttribute("auto", auto);
		req.setAttribute("accounts", accounts);
	}

	//자동이체 등록
	@Override
	public void autoAdd(HttpServletRequest req) throws Exception {
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		int value = Integer.parseInt(req.getParameter("value"));
		int number = Integer.parseInt(req.getParameter("date"));
		String file = req.getParameter("file");
		file = path.concat(file);
		String password = req.getParameter("password");
		
		AutoTransferVO vo = new AutoTransferVO();
		vo.setAuto_from(from);
		vo.setAuto_to(to);
		vo.setAuto_value(value);
		vo.setAuto_date(number);
		vo.setC_id(id);
		vo.setAuto_file(file);
		vo.setAuto_pwd(password);
		
		int result = dao.autoAdd(vo);
		
		req.setAttribute("autoAdd", result);
	}

	//자동이체 삭제
	@Override
	public void autoDel(HttpServletRequest req) throws Exception {
		int num = Integer.parseInt(req.getParameter("auto_num"));
		
		int result = dao.autoDel(num);
		req.setAttribute("result", result);
	}
	
	//배포페이지
	@Override
	public void deploy(HttpServletRequest req) throws Exception {
		List<ContractVO> vo = dao.deploy();
		req.setAttribute("contract", vo);
	}
	
	//배포
	@Override
	public void deployPro(HttpServletRequest req) throws Exception {
		String name = req.getParameter("name");
		System.out.println("===== " + name + " contract 배포중 =====");
		//coinbase 계정으로 배포
		Credentials owner = WalletUtils.loadCredentials(owner_pwd, owner_file);
		ContractVO vo = new ContractVO();
		
		if(name.equals("Benkfit")) {
			@SuppressWarnings("deprecation")
			Benkfit benkfit = Benkfit.deploy(web3j, owner, gasPrice, gasLimit).send();
			ServiceImpl_syk.benkfit = benkfit.getContractAddress();
			System.out.println("Contract benkfit ==> " + this.benkfit);
			
		}else if(name.equals("Bank")) {
			@SuppressWarnings("deprecation")
			Bank bank = Bank.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			ServiceImpl_syk.bank = bank.getContractAddress();
			System.out.println("Contract bank ==> " + this.bank);
		}else if(name.equals("Slot")) {
			@SuppressWarnings("deprecation")
			Slot slot = Slot.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			ServiceImpl_syk.slot = slot.getContractAddress();
			System.out.println("Contract slot ==> " + this.slot);
		}
		vo.setCon_name(name);
		vo.setCon_address(ServiceImpl_syk.benkfit);
		
		int result = dao.deployAdd(vo);
		req.setAttribute("result", result);
	}

	@Override
	public void reDeploy(HttpServletRequest req) throws Exception {
		String name = req.getParameter("contract");
		ContractVO vo = new ContractVO();
		
		Credentials owner = WalletUtils.loadCredentials(owner_pwd, owner_file);
		
		if(name.equals("Benkfit")) {
			@SuppressWarnings("deprecation")
			Benkfit benkfit = Benkfit.deploy(web3j, owner, gasPrice, gasLimit).send();
			ServiceImpl_syk.benkfit = benkfit.getContractAddress();
			System.out.println("Contract benkfit ==> " + this.benkfit);
			
		}else if(name.equals("Bank")) {
			@SuppressWarnings("deprecation")
			Bank bank = Bank.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			ServiceImpl_syk.bank = bank.getContractAddress();
			System.out.println("Contract bank ==> " + this.bank);
		}else if(name.equals("Slot")) {
			@SuppressWarnings("deprecation")
			Slot slot = Slot.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			ServiceImpl_syk.slot = slot.getContractAddress();
			System.out.println("Contract slot ==> " + this.slot);
		}
		vo.setCon_name(name);
		vo.setCon_address(ServiceImpl_syk.benkfit);
		
		int result = dao.reDeploy(vo);
		req.setAttribute("result", result);
	}
}
