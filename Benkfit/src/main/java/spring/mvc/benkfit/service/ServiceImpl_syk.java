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
import org.web3j.protocol.geth.Geth;
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
	
	@Autowired
	DAOImpl_syk dao;

	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));
	Geth geth = Geth.build(new HttpService("http://localhost:8545"));

	int chkNum = Setting.chkNum;
	final String path = Setting.path;
	private final String owner = Setting.owner;
	private final String owner_pwd = Setting.owner_pwd;
	private final String owner_file = Setting.owner_file;
	private final String fn = Setting.fn;

	final BigInteger gasPrice = Setting.gasPrice;
	final BigInteger gasLimit = Setting.gasLimit;
	final BigInteger initialWeiValue = Setting.initialWeiValue;

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
		req.setAttribute("info", info);
	}

	// 적금상품조회
	@Override
	public void savInfo(HttpServletRequest req) {
		String num = req.getParameter("num");

		SavProductVO info = dao.savInfo(num);
		req.setAttribute("type", "sav");
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
		NewAccountIdentifier _newAccount = admin.personalNewAccount(password).send();
		String newAccount = _newAccount.getAccountId();
		if (_newAccount != null) {
			success = true;
			model.addAttribute("success", success);

			if (success) {
				BigDecimal ether = BigDecimal.valueOf(10);
				Credentials credentials = WalletUtils.loadCredentials(owner_pwd, owner_file);
				TransactionReceipt transfer = Transfer.sendFunds(web3j, credentials, newAccount, ether, Convert.Unit.ETHER).send();

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", id);
				map.put("num", num);
				map.put("pwd", password);
				map.put("account", newAccount);

				result = dao.createCheq(map);
				System.out.println("newAccount : " + newAccount);
				req.setAttribute("Accountcnt", result);
				req.setAttribute("num", num);
			}
		}
		req.setAttribute("Accountcnt", result);
		req.setAttribute("id", id);
		req.setAttribute("Accountcnt", result);
		req.setAttribute("num", num);
		req.setAttribute("password", password);
		req.setAttribute("account", newAccount);
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
		NewAccountIdentifier _newAccount = admin.personalNewAccount(password).send();
		String newAccount = _newAccount.getAccountId();
		if (_newAccount != null) {
			success = true;
			model.addAttribute("success", success);

			if (success) {
				BigDecimal ether = BigDecimal.valueOf(10);
				Credentials credentials = WalletUtils.loadCredentials(owner_pwd, owner_file);
				TransactionReceipt transfer = Transfer.sendFunds(web3j, credentials, newAccount, ether, Convert.Unit.ETHER).send();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", id);
				map.put("num", num);
				map.put("pwd", password);
				map.put("account", newAccount);
				map.put("period", period);
				map.put("amount", 10);

				result = dao.createSav(map);
				req.setAttribute("Accountcnt", result);
			}
		}
		req.setAttribute("cnt", result);
		req.setAttribute("num", num);
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

	// 적금만기, 해지
	@Override
	public void savExpire(HttpServletRequest req) throws Exception {
		String password = req.getParameter("password");
		String file = req.getParameter("file");
		String account = req.getParameter("account");

		// 가입했던 적금의 금액과 이율 검색
		int amount = dao.savExpire(account);
		int rate = 0;
		amount = amount * rate;

		BigInteger value = BigInteger.valueOf(amount);

		Credentials credential = WalletUtils.loadCredentials(password, file);
		String benkfit = dao.getBenkfit();
		@SuppressWarnings("deprecation")
		Benkfit savExpire = Benkfit.load(benkfit, web3j, credential, gasPrice, gasLimit);
		TransactionReceipt transactionReceipt = savExpire.output(account, value).send();
		String blockhash = transactionReceipt.getBlockHash();

		Log log = savExpire.getTransferEvents(transactionReceipt).get(0).log;

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
		req.setAttribute("cheq", accounts);
	}

	// 이체
	@Override
	public void transPro(HttpServletRequest req) throws Exception {
		System.out.println("== 이체 ==");

		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		String password = req.getParameter("password");

		String fileSource = path.concat(req.getParameter("file"));
		String from = fn.concat(req.getParameter("file").substring(37));

		int value = Integer.parseInt(req.getParameter("amount"));
		String to = req.getParameter("to");
		BigInteger ether = BigInteger.valueOf(value);

		// 지갑로드
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);

		String benkfit = dao.getBenkfit();
		@SuppressWarnings("deprecation")
		Benkfit transfer = Benkfit.load(benkfit, web3j, credentials, gasPrice, gasLimit);

		// transfer실행
		TransactionReceipt transactionReceipt = transfer.transfer(to, ether).send();
		String blockHash = transactionReceipt.getBlockHash();

		// event 실행
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
	public void savTrans(HttpServletRequest req) throws Exception {
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();

		long value = Long.parseLong(req.getParameter("value"));
		BigInteger ether = BigInteger.valueOf(value);
		String file = req.getParameter("file");
		String pwd = req.getParameter("pwd");
		String account = req.getParameter("account");

		// 지갑 로드
		Credentials credentials = WalletUtils.loadCredentials(pwd, file);

		String benkfit = dao.getBenkfit();
		// contract 연결
		@SuppressWarnings("deprecation")
		Benkfit savTrans = Benkfit.load(benkfit, web3j, credentials, gasPrice, gasLimit);

		// input함수 실행
		TransactionReceipt input = savTrans.input(ether).send();

		// event 실행
		String from = savTrans.getTransferEvents(input).get(0).from;
		Log log = savTrans.getTransferEvents(input).get(0).log;
		String to = savTrans.getTransferEvents(input).get(0).to;
		BigInteger amount = savTrans.getTransferEvents(input).get(0).value;

		// DB-INSERT
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("from", from);
		map.put("amount", amount);
		map.put("account", account);

		dao.savTrans(map);
	}

	// 잔액확인
	@Override
	public void getBalance(HttpServletRequest req) {
		System.out.println("========잔액확인=========");
		String account = fn.concat(req.getParameter("file").split("--")[2]);
		String file = req.getParameter("file");
		if(file.contains("fakepath")) {
			file = file.substring(12);
		}
		file = path.concat(file);
		String pwd = req.getParameter("password");
		BigInteger balance = null;
		System.out.println(req.getParameter("file") + "\t" + account + "\t" + file);

		// 지갑로드
		Credentials credentials = null;
		try {
			credentials = WalletUtils.loadCredentials(pwd, file);
			String benkfit = dao.getBenkfit();
			@SuppressWarnings("deprecation")
			Benkfit getBalance = Benkfit.load(benkfit, web3j, credentials, gasPrice, gasLimit);
			try {
				balance = getBalance.balanceOf(account).send();
			} catch (Exception e) {
				balance = BigInteger.valueOf(0);
			}
			if(balance == null) balance = BigInteger.valueOf(0);
			System.out.println("balance ==>" + balance);
			req.setAttribute("balance", balance);
		} catch (IOException | CipherException e) {
			e.printStackTrace();
		}
	}

	// 입금
	@Override
	public void depositPro(HttpServletRequest req) throws Exception {
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();
		
		String password = req.getParameter("password");
		//String from = req.getParameter("from");
		String from = fn.concat(req.getParameter("file").split("--")[2]);
		String file = req.getParameter("file");
		if(file.contains("fakepath")) {
			file = file.substring(12);
		}
		file = path.concat(file);
		int amount = Integer.parseInt(req.getParameter("amount"));
		BigInteger value = BigInteger.valueOf(amount);
		Credentials credential = WalletUtils.loadCredentials(password, file);
		String benkfit = dao.getBenkfit();
		@SuppressWarnings("deprecation")
		Benkfit depositPro = Benkfit.load(benkfit, web3j, credential, gasPrice, gasLimit);
		TransactionReceipt transactionReceipt = depositPro.input(value).send();
		String blockHash = transactionReceipt.getBlockHash();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("account", from);
		map.put("amount", value);
		map.put("blockHash", blockHash);
		map.put("c_id", id);
		
		int result = dao.depositPro(map);
	}
	

	/*
	 * 자동이체
	 */
	
	// 자동이체 페이지
	public void autoTrans(HttpServletRequest req) throws Exception {
		Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) securityContext.getPrincipal();
		String id = user.getUsername();

		List<AutoTransferVO> auto = dao.autoSearch(id);
		List<String> accounts = dao.userAccounts(id);

		req.setAttribute("auto", auto);
		req.setAttribute("accounts", accounts);
	}

	// 자동이체 등록
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

	// 자동이체 삭제
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
		
		String address = "";
		if(name.equals("Benkfit")) {
			@SuppressWarnings("deprecation")
			Benkfit benkfit = Benkfit.deploy(web3j, owner, gasPrice, gasLimit).send();
			address = benkfit.getContractAddress();
			vo.setCon_address(address);
			
		}else if(name.equals("Bank")) {
			@SuppressWarnings("deprecation")
			Bank bank = Bank.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			address = bank.getContractAddress();
			vo.setCon_address(address);
			
		}else if(name.equals("Slot")) {
			@SuppressWarnings("deprecation")
			Slot slot = Slot.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			address = slot.getContractAddress();
			vo.setCon_address(address);
		}
		vo.setCon_name(name);
		
		int result = dao.deployAdd(vo);
		req.setAttribute("deployPro", result);
	}

	//재배포
	@Override
	public void reDeploy(HttpServletRequest req) throws Exception {
		String name = req.getParameter("contract");
		ContractVO vo = new ContractVO();
		Credentials owner = WalletUtils.loadCredentials(owner_pwd, owner_file);
		String address = "";
		if(name.equals("Benkfit")) {
			@SuppressWarnings("deprecation")
			Benkfit benkfit = Benkfit.deploy(web3j, owner, gasPrice, gasLimit).send();
			address = benkfit.getContractAddress();
			vo.setCon_address(address);
			
		}else if(name.equals("Bank")) {
			@SuppressWarnings("deprecation")
			Bank bank = Bank.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			address = bank.getContractAddress();
			vo.setCon_address(address);
			
		}else if(name.equals("Slot")) {
			@SuppressWarnings("deprecation")
			Slot slot = Slot.deploy(web3j, owner, gasPrice, gasLimit, initialWeiValue).send();
			address = slot.getContractAddress();
			vo.setCon_address(address);
		}
		vo.setCon_name(name);
		
		int result = dao.reDeploy(vo);
		req.setAttribute("reDeploy", vo.getCon_address());
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
		
		System.out.println("from : " + account + "\nfile : " + file + "\npwd : " + pwd + "\nvalue : " + value);
		Credentials credential = WalletUtils.loadCredentials(pwd, file);
		@SuppressWarnings("deprecation")
		Benkfit withdraw = Benkfit.load(benkfit, web3j, credential, gasPrice, gasLimit);
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

		// int result = dao.depositPro(map);
		// System.out.println("입금결과 : " + result);
	}*/
}
