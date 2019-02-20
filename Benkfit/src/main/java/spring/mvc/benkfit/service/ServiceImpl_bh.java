package spring.mvc.benkfit.service;

import java.io.File;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tuples.generated.Tuple5;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;

import spring.mvc.benkfit.sol.Bank;
import spring.mvc.benkfit.sol.Slot;
import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.persistence.DAO_bh;

import spring.mvc.benkfit.model.Loan;

@Service
public class ServiceImpl_bh implements Service_bh {
	
	Web3j web3 = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));
	//테스트시 path 경로는 본인에게 맞게 변경해주어야한다.
	final String path = "/Users/banhun/2_net/keystore/";
	//유경 path
	//final String path = "C:\\ether\\geth\\private_net\\keystore\\";
	int chkNum = 0;
	
//	로그인하기위한 경로
//	String a = req.getParameter("from");
//	String b = a.substring(12); >> c://fakepath
//	String fileSource= path.concat(b);자르기
//	계정주소
//	String a1 = req.getParameter("from");
//	String b1 = a1.substring(a1.length()-45, a1.length()-5);
//	String c1 = "0x";
//	String from = c1.concat(b1);
	String fn = "0x";
	
	BigInteger gasPrice = BigInteger.valueOf(3000000);
	BigInteger gasLimit = BigInteger.valueOf(3000000);
	
	@Autowired
	DAO_bh dao;
	
	//계정잔액가져오기
	@Override
	public void Balance(HttpServletRequest req, Model model)throws Exception{
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		
//		String address = req.getParameter("address");
//		/* 계정주소 직접입력으로 잔액 조회하기 */
//		if(address != null) {
//			Balance = this.web3.ethGetBalance(address, DefaultBlockParameter.valueOf("latest")).sendAsync().get().getBalance();
//			model.addAttribute("Balance", Balance);	
//			System.out.println("계정 확인 :" + address);
//			System.out.println("==> 해당 계정의 잔액 : " + Balance);
//		}else {
		//키스토어파일로 계정주소 만들기
		String a1 = req.getParameter("from");
		String b1 = a1.substring(a1.length()-45, a1.length()-5);
		String c1 = "0x";
		String from = c1.concat(b1);
		System.out.println(">계정 주소 추출 : " + from);
		
		BigInteger Balance = this.web3.ethGetBalance(from, DefaultBlockParameter.valueOf("latest")).sendAsync().get().getBalance();
		model.addAttribute("Balance", Balance);	
		System.out.println(">계정 확인 :" + from);
		System.out.println(">해당 계정의 잔액 : " + Balance);
//		}
	}
	
	/*
	 * 계정생성하기
	 */
	@Override
	public void createAccount(HttpServletRequest req, Model model)throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		String password = req.getParameter("password");
		
		//키스토어로 계정만들기
		boolean success = false;
		String _newAccount = WalletUtils.generateNewWalletFile(password, new File(path));
		if(_newAccount != null) {
			success = true;
			String a = _newAccount.substring(_newAccount.length()-45, _newAccount.length()-5);
			String b = "0x";
			String newAccount = b.concat(a);
			System.out.println(">새로 만든 계정주소 : " + newAccount);
			model.addAttribute("newAccount", newAccount);
			
			if(success) {
				BigDecimal ether = BigDecimal.valueOf(10);
				Credentials credentials = WalletUtils.loadCredentials(password, "/Users/banhun/2_net/keystore/UTC--2019-02-14T07-51-00.079742000Z--d5cc7a592fa96a270aa2cb99bddd262982c57943.json");
				System.out.println("ether : " + ether);
				TransactionReceipt transfer = Transfer.sendFunds(web3, credentials, newAccount, ether, Convert.Unit.ETHER).send();
			}
		}
		System.out.println("\n==========>완료\n");
	}
	
	/*
	 * 슬롯머신
	 * 해당 컨트랙트 : 0xc43b4e39633fda5050e8faf18a5e23190cb2bd74
	 */
	//슬롯잔고채우기
	//관리자만가능하다
	@Override
	public void slotStock(HttpServletRequest req, Model model) throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");

		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		//BigInteger ether = BigInteger.valueOf(value);
		System.out.println("\n==========>지갑 로그인 중\n");
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		System.out.println("\n==========>해당 지갑 언락 중\n");
		if(admin.personalUnlockAccount(from, password).send().getResult()){
			System.out.println("\n==========>컨트랙트 진입 중\n");
			@SuppressWarnings("deprecation")
			//슬롯을 수정해서 새로 배포하면 해당 주소를 바꿔줘야함.
			Slot contract = Slot.load("0xc43b4e39633fda5050e8faf18a5e23190cb2bd74", web3, credentials, gasPrice, gasLimit);
			
			TransactionReceipt slotStock = contract.ownerInput(ether).send();
			
			if(slotStock.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
			}else {
				chkNum = 0;
				model.addAttribute("chkNum", chkNum);
			}
		}
		System.out.println("\n==========>완료\n");
	}
	//슬롯머신잔고확인
	//관리자만가능하다
	@Override
	public void slotStockBalance(HttpServletRequest req, Model model) throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		
		String password = req.getParameter("password");
		System.out.println("\n==========>지갑 로그인 중\n");
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		System.out.println("\n==========>해당 지갑 언락 중\n");
		if(admin.personalUnlockAccount(from, password).send().getResult()){
			System.out.println("\n==========>컨트랙트 진입 중\n");
			@SuppressWarnings("deprecation")
			//슬롯을 수정해서 새로 배포하면 해당 주소를 바꿔줘야함.
			Slot contract = Slot.load("0xc43b4e39633fda5050e8faf18a5e23190cb2bd74", web3, credentials, gasPrice, gasLimit);
			
			BigInteger slotStockBalance = contract.total().send();
			
			model.addAttribute("slotStockBalance", slotStockBalance);
		}
		System.out.println("\n==========>완료\n");
		
	}
	//슬롯머신플레이(gameStart)
	//유저만가능하다
	@Override
	public void slot(HttpServletRequest req, Model model) throws Exception{
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");

		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		//BigInteger ether = BigInteger.valueOf(value);
		System.out.println("\n==========>지갑 로그인 중\n");
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		System.out.println("\n==========>해당 지갑 언락 중\n");
		if(admin.personalUnlockAccount(from, password).send().getResult()){
			System.out.println("\n==========>컨트랙트 진입 중\n");
			@SuppressWarnings("deprecation")
			//슬롯을 수정해서 새로 배포하면 해당 주소를 바꿔줘야함.
			Slot contract = Slot.load("0xc43b4e39633fda5050e8faf18a5e23190cb2bd74", web3, credentials, gasPrice, gasLimit);
			//Slot contract = Slot.load("0xb824ebcb0A3cdDdC8bBFd2FFC636aB1067Ac74b8", web3, credentials, gasPrice, gasLimit);
			
			//몇번째 게임인지 카운트를 누르고 시작
			TransactionReceipt count = contract.count().send();
			BigInteger sendCount = contract.getCountLogEvents(count).get(0).count;
			System.out.println("sendCount : " + sendCount);
			//게임스타트
			TransactionReceipt gameStart = contract.gameStart(ether).send();
			//결과를 로그로 출력
			Tuple5<BigInteger, BigInteger, BigInteger, BigInteger, Boolean> sendResult = contract.sendResult(sendCount).send();
			BigInteger n1 = sendResult.getValue1();;
			BigInteger n2 = sendResult.getValue2();
			BigInteger n3 = sendResult.getValue3();
			//wei를 ether로 형변환
			//BigInteger reword = sendResult.getValue4();
			String reword_ = (String)sendResult.getValue4().toString();
			System.out.println("reword : " + reword_);
			BigInteger reword = Convert.toWei(reword_, Convert.Unit.ETHER).toBigInteger();
			Boolean result = sendResult.getValue5();
			//상금수령 - 당첨이 되지 않으면 해당 함수를 실행하지 않아서 가스를 낭비하지 않아도 되게끔 보완할 수 있다.
			TransactionReceipt withdraw = contract.withdraw().send();
			
			System.out.println("\n==========>결과 값 보내는중\n");
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("n1", n1);
			data.put("n2", n2);
			data.put("n3", n3);
			data.put("reword", reword);
			data.put("result", result);
			System.out.println("data : " + data.toString());
			model.addAttribute("data", data);
		}
		System.out.println("\n==========>완료\n");
	}
	//슬롯머신 컨트랙트 삭제(kill, 해당 계정의 잔고는 address(0)으로 돌아오고 계정은 삭제된다.)
	//관리자만 가능하게 해야한다.
	@Override
	public void slotKill(HttpServletRequest req, Model model) throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");

		String fileSource = path.concat(req.getParameter("from").substring(12));
		//훈이오빠
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		//유경
		//String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-37));
		
		String password = req.getParameter("password");
		System.out.println("\n==========>지갑 로그인 중\n");
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		System.out.println("\n==========>해당 지갑 언락 중\n");
		if(admin.personalUnlockAccount(from, password).send().getResult()){
			System.out.println("\n==========>컨트랙트 진입 중\n");
			@SuppressWarnings("deprecation")
			//슬롯을 수정해서 새로 배포하면 해당 주소를 바꿔줘야함.
			Slot contract = Slot.load("0xc43b4e39633fda5050e8faf18a5e23190cb2bd74", web3, credentials, gasPrice, gasLimit);
			
			TransactionReceipt kill = contract.kill().send();
			
			if(kill.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
			}else {
				chkNum = 0;
				model.addAttribute("chkNum", chkNum);
			}
		}
		System.out.println("\n==========>완료\n");
	}

	/*
	 * 송금
	 */
	@Override
	public void transferPro(HttpServletRequest req, Model model) throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		String password = req.getParameter("password");
		
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		
		int value = Integer.parseInt(req.getParameter("value"));
		String to = req.getParameter("to");
		BigDecimal ether = BigDecimal.valueOf(value);
		
		System.out.println("== 이더를 송금하는 함수 ==");
		System.out.println("> 보내는 계정 :" + from);
		System.out.println("> 송금계정 비밀번호 : " + password);
		System.out.println("> 받는 계정 : " + to);
		System.out.println("> 보내는 값(이더) : " + value +"("+ether+")");
		
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		TransactionReceipt transfer = Transfer.sendFunds(web3, credentials, to, ether, Convert.Unit.ETHER).send();
		
		if(transfer.getBlockNumber() != null) {
			chkNum = 1;
			model.addAttribute("chkNum", chkNum);
		}else {
			chkNum = 0;
			model.addAttribute("chkNum", chkNum);
		}
		System.out.println("\n==========>완료\n");
	}

	/*
	 * 예금
	 * 해당 컨트랙트 : 0xc26c509e6e1ba69356ac6ed54017ca21593960b5
	 */
	//예금하기
	@Override
	public void deposit(HttpServletRequest req, Model model) throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		//BigInteger ether = BigInteger.valueOf(value);
		System.out.println("\n==========>지갑 로그인 중\n");
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		System.out.println("\n==========>해당 지갑 언락 중\n");
		if(admin.personalUnlockAccount(from, password).send().getResult()){
			System.out.println("\n==========>컨트랙트 진입 중\n");
			@SuppressWarnings("deprecation")
			Bank contract = Bank.load("0xc26c509e6e1ba69356ac6ed54017ca21593960b5", web3, credentials, gasPrice, gasLimit);
			TransactionReceipt depositTx = contract.deposit(ether).send();
			
			String blockHash = depositTx.getBlockHash();
			BigInteger blockNumber = depositTx.getBlockNumber();
			String contractAddress = depositTx.getContractAddress();
			String getFrom = depositTx.getFrom();
			String getTo = depositTx.getTo();
			System.out.println("blockHash : " + blockHash);
			System.out.println("blockNumber :" + blockNumber);
			System.out.println("contractAddress :" + contractAddress);
			System.out.println("getFrom : " + getFrom);
			System.out.println("getTo :" + getTo);
			
			System.out.println("\n==========>결과 값 보내는중\n");
			
			if(depositTx.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
			}else {
				chkNum = 0;
				model.addAttribute("chkNum", chkNum);
			}
		}
		System.out.println("\n==========>완료\n");
	}
	//예금액 확인하기
	@Override
	public void bankBalance(HttpServletRequest req, Model model) throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		
		String password = req.getParameter("password");
		
		System.out.println("\n==========>지갑 로그인 중\n");
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		System.out.println("\n==========>해당 지갑 언락 중\n");
		if(admin.personalUnlockAccount(from, password).send().getResult()){
			System.out.println("\n==========>컨트랙트 진입 중\n");
			@SuppressWarnings("deprecation")
			Bank contract = Bank.load("0xc26c509e6e1ba69356ac6ed54017ca21593960b5", web3, credentials, gasPrice, gasLimit);
			BigInteger balance = contract.balance().send();
//			String balance_ = contract.balance().send().toString();
//			BigInteger balance = Convert.towei(balance_, Convert.Unit.WEI).toBigInteger();
			System.out.println("잔액 : " + balance);
			System.out.println("\n==========>결과 값 보내는중\n");
			
			model.addAttribute("balance", balance);
		}
		System.out.println("\n==========>완료\n");
		
	}

	//예금인출하기
	@Override
	public void bankWithdraw(HttpServletRequest req, Model model) throws Exception {
		System.out.println("\n==========>진입중\n");
		System.out.println("\n==========>받은값 검사 중\n");
		
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-45, req.getParameter("from").length()-5));
		
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		//BigInteger ether = BigInteger.valueOf(value);
		
		System.out.println("\n==========>지갑 로그인 중\n");
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		System.out.println("\n==========>해당 지갑 언락 중\n");
		if(admin.personalUnlockAccount(from, password).send().getResult()){
			System.out.println("\n==========>컨트랙트 진입 중\n");
			@SuppressWarnings("deprecation")
			Bank contract = Bank.load("0xc26c509e6e1ba69356ac6ed54017ca21593960b5", web3, credentials, gasPrice, gasLimit);
			TransactionReceipt withdraw = contract.withdraw(ether).send();
			
			String blockHash = withdraw.getBlockHash();
			BigInteger blockNumber = withdraw.getBlockNumber();
			String contractAddress = withdraw.getContractAddress();
			String getFrom = withdraw.getFrom();
			String getTo = withdraw.getTo();
			System.out.println("blockHash : " + blockHash);
			System.out.println("blockNumber :" + blockNumber);
			System.out.println("contractAddress :" + contractAddress);
			System.out.println("getFrom : " + getFrom);
			System.out.println("getTo :" + getTo);
			
			System.out.println("\n==========>결과 값 보내는중\n");
			
			if(withdraw.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
			}else {
				chkNum = 0;
				model.addAttribute("chkNum", chkNum);
			}
		}
		System.out.println("\n==========>완료\n");
	}

	/*
	 * 대출
	 */
	//대출상품목록
	@Override
	public void loanList(HttpServletRequest req, Model model) throws Exception {
		List<LoanProductVO> loan = dao.loanList();
		model.addAttribute("loan", loan);
		
	}

	//대출상품조회
	@Override
	public void loanInfo(HttpServletRequest req, Model model) throws Exception {
		String num = req.getParameter("num");

		LoanProductVO info = dao.loanInfo(num);
		req.setAttribute("type", "cheq");
		System.out.println("-----" + req.getAttribute("type"));
		model.addAttribute("info", info);		
	}

	//대출상품등록
	@Override
	public void loanRegiPro(HttpServletRequest req, Model model) throws Exception {
		int result = 0;

		String loan_name = req.getParameter("name");
		int loan_amount = Integer.parseInt(req.getParameter("amount"));
		String loan_period = req.getParameter("period");
		//double loan_overrate = Double.parseDouble(req.getParameter("overrate"));
		double loan_rate = Double.parseDouble(req.getParameter("rate"));
		String loan_target = req.getParameter("target");
		int loan_moderate = Integer.parseInt(req.getParameter("moderate"));
		String loan_remethod = req.getParameter("remethod");
		//String loan_paymethod = req.getParameter("paymethod");
		
		LoanProductVO vo = new LoanProductVO();
		vo.setLoan_name(loan_name);
		vo.setLoan_amount(loan_amount);
		vo.setLoan_period(loan_period);
		//vo.setLoan_overrate(loan_overrate);
		vo.setLoan_rate(loan_rate);
		vo.setLoan_target(loan_target);
		vo.setLoan_moderate(loan_moderate);
		vo.setLoan_reMethod(loan_remethod);
		//vo.setLoan_paymethod(loan_paymethod);

		result = dao.loanPro(vo);

		System.out.println("대출상품등록 : " + result);
		model.addAttribute("cnt", result);
		
	}

	//대출상품수정
	@Override
	public void loanEdit(HttpServletRequest req, Model model) throws Exception {
		String num = req.getParameter("loan_num");
		
		LoanProductVO vo = dao.loanInfo(num);
		model.addAttribute("vo", vo);
	}

	//대출상품마감
	@Override
	public void loanDel(HttpServletRequest req, Model model) throws Exception {
		String num = req.getParameter("loan_num");
		
		int result = dao.loanDel(num);
		model.addAttribute("num", num);
		model.addAttribute("result", result);
		
	}

//	//대출신청
//	@Override
//	public void req_loan(HttpServletRequest req, Model model) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}
//
//	//대출계산
//	@Override
//	public void rtype(HttpServletRequest req, Model model) throws Exception {
//		String amountStr = req.getParameter("amount"); // 대출원금
//		String rateStr = req.getParameter("rate"); // 대출이율
//		String periodStr = req.getParameter("period"); // 대출기간
//		String typeStr = req.getParameter("type"); // 대출유형
//
//		// 전달받은 파라미터를 숫자로 형변환
//		int amount = Integer.parseInt(amountStr);
//		double rateDouble = Double.parseDouble(rateStr);
//		rateDouble /= 100; // 금리를 %로 바꿔주는 작업
//		rateDouble /= 12; // 금리를 월금리로 바꾸는 작업
//		int period = Integer.parseInt(periodStr);
//		int type = Integer.parseInt(typeStr);
//		int repayMonth;
//
//		// 원리금 / 원금 선택에 따른 조건검사
//		if (type == 2) { // 원리금 균등 상환
//			repayMonth = (int) (amount * rateDouble * Math.pow((double) (1 + rateDouble), (double) period)
//					/ (Math.pow((double) (1 + rateDouble), (double) period) - 1));
//		} else { // 원금 균등 상환
//			repayMonth = amount / period;
//		}
//
//		ArrayList<Loan> data = new ArrayList<Loan>();
//		int remainAmount = amount; // 잔액
//		for (int i = 0; i < period; i++) {
//			Loan loan = new Loan();
//			loan.index = i + 1;
//			loan.interestRepay = (int) (remainAmount * rateDouble);
//			if (type == 1) {// 원리금 균등
//
//				loan.originRepay = repayMonth;
//				loan.totalRepay = loan.originRepay + loan.interestRepay;
//			}
//
//			else {// 원금균등
//				loan.totalRepay = repayMonth;
//				loan.originRepay = loan.totalRepay - loan.interestRepay;
//			}
//			remainAmount -= loan.originRepay;
//			loan.remainAmount = remainAmount;
//			data.add(loan);
//		}
//		model.addAttribute("data", data);
//	}
}



	
	
	
	

