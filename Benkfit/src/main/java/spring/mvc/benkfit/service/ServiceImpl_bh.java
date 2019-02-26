package spring.mvc.benkfit.service;

import java.io.File;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.event.TransactionalEventListener;
import org.springframework.ui.Model;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.Request;
import org.web3j.protocol.core.methods.request.Transaction;
import org.web3j.protocol.core.methods.response.EthBlock;
import org.web3j.protocol.core.methods.response.EthBlock.Block;
import org.web3j.protocol.core.methods.response.EthBlock.TransactionResult;
import org.web3j.protocol.core.methods.response.EthMining;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.MinerStartResponse;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tuples.generated.Tuple5;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;

import io.reactivex.Flowable;
import spring.mvc.benkfit.sol.Bank;
import spring.mvc.benkfit.sol.Benkfit;
import spring.mvc.benkfit.sol.Slot;
import spring.mvc.benkfit.vo.LoanProductVO;
import spring.mvc.benkfit.vo.MyloanAccountVO;
import spring.mvc.benkfit.vo.documentVO;
import spring.mvc.benkfit.persistence.DAO_bh;

import spring.mvc.benkfit.model.Loan;

@Service
public class ServiceImpl_bh implements Service_bh {

	Web3j web3 = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));
	Web3j web3_4 = Web3j.build(new HttpService("http://localhost:8547"));
	Admin admin_4 = Admin.build(new HttpService("http://localhost:8547"));
	// 테스트시 path 경로는 본인에게 맞게 변경해주어야한다.
	// 유경 path
	// final String path = "C:\\ether\\geth\\private_net\\keystore\\";

	/*
	 * 훈 전역 설정
	 */
	// 체크넘버
	int chkNum = 0;
	// 경로
	final String path = "/Users/banhun/2_net/keystore/";
	// benkfit 컨트랙트
	private final String BenkfitAddress = "0xe540e40a2ccaaadf7c142a94c9a05c6858ac4836";
	// bank 컨트랙트
	private final String BankAddress = "0x62cef7fe54af475d459b2bea520646363b9010d4";
	// slot 컨트랙트
	private final String SlotAddress = "0x0d554d4586dd91953252fd98a329576658f45def";
	// 훈 address[0]
	private final String owner = "0xd5cc7a592fa96a270aa2cb99bddd262982c57943";
	// 훈 address[0] 키스토어
	private final String owner_file = "/Users/banhun/2_net/keystore/UTC--2019-02-14T07-51-00.079742000Z--d5cc7a592fa96a270aa2cb99bddd262982c57943.json";
	// 지갑주소 맨 앞자리
	private final String fn = "0x";

	// 가스 임의 설정
	BigInteger gasPrice = BigInteger.valueOf(3000000);
	BigInteger gasLimit = BigInteger.valueOf(3000000);

	@Autowired
	DAO_bh dao;

	/*
	 * 이더리움 간편 체험
	 */
	// 계정생성
	// 계정생성시 owner가 10이더를 자동으로 보내준다.
	@Override
	public void createAccount(HttpServletRequest req, Model model) throws Exception {
		String password = req.getParameter("password");

		// 키스토어로 계정만들기
		boolean success = false;
		String _newAccount = WalletUtils.generateNewWalletFile(password, new File(path));
		if (_newAccount != null) {
			success = true;
			String a = _newAccount.substring(_newAccount.length() - 45, _newAccount.length() - 5);
			String b = "0x";
			String newAccount = b.concat(a);
			model.addAttribute("newAccount", newAccount);

			// 계정이 성공적으로 생성되면 owner계정에서 자동으로 10이더를 보내준다.
			if (success) {
				// 10이더 설정
				BigDecimal ether = BigDecimal.valueOf(10);
				// 자격증명
				Credentials credentials = WalletUtils.loadCredentials(password, owner_file);
				// 이더전송
				TransactionReceipt transfer = Transfer
						.sendFunds(web3, credentials, newAccount, ether, Convert.Unit.ETHER).send();
			}
		}
	}

	// 계정잔액가져오기(이더)
	@Override
	public void Balance(HttpServletRequest req, Model model) throws Exception {
		// 지갑파일에서 계정주소 가져오기
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		// 해당 계정 이더 잔액
		BigInteger Balance = this.web3.ethGetBalance(from, DefaultBlockParameter.valueOf("latest")).sendAsync().get()
				.getBalance();
		// 잔액보내기
		model.addAttribute("Balance", Balance);
	}

	// 이더 송금
	@Override
	public void transferPro(HttpServletRequest req, Model model) throws Exception {
		System.out.println("===============================");
		// 값 받기
		String password = req.getParameter("password");
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		int value = Integer.parseInt(req.getParameter("value"));
		String to = req.getParameter("to");
		// value 값 형변환
		BigDecimal ether = BigDecimal.valueOf(value);
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 이더전송
		TransactionReceipt transfer = Transfer.sendFunds(web3, credentials, to, ether, Convert.Unit.ETHER).send();
		String Tx_hash = transfer.getTransactionHash();
		System.out.println("거래 해시 :" + Tx_hash);
		// 거래가 제대로 성사되었는지 체크
		if (transfer.getBlockNumber() != null) {
			chkNum = 1;
			model.addAttribute("chkNum", chkNum);
			model.addAttribute("Tx_hash", Tx_hash);
		} else {
			chkNum = 0;
			model.addAttribute("chkNum", chkNum);
		}
	}

	/*
	 * 이더 예금
	 */
	// 예금하기
	@Override
	public void deposit(HttpServletRequest req, Model model) throws Exception {
		// 값받기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		// 형변환
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 성공시
			@SuppressWarnings("deprecation")
			// Bank 컨트랙트 로드
			Bank contract = Bank.load(BankAddress, web3, credentials, gasPrice, gasLimit);
			// 예금함수 불러오기
			TransactionReceipt depositTx = contract.deposit(ether).send();
			String Tx_hash = depositTx.getTransactionHash();
			System.out.println("거래해시 : " + Tx_hash);
			// 거래가 완료되었는지 체크
			if (depositTx.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
				model.addAttribute("Tx_hash", Tx_hash);
			} else {
				chkNum = 0;
				model.addAttribute("chkNum", chkNum);
			}
		}
	}

	// 이더 예금액 확인하기
	@Override
	public void bankBalance(HttpServletRequest req, Model model) throws Exception {
		// 값 받기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 성공시
			@SuppressWarnings("deprecation")
			// Bank 컨트랙트 로드
			Bank contract = Bank.load(BankAddress, web3, credentials, gasPrice, gasLimit);
			// 잔액함수 불러오기
			BigInteger balance = contract.balance().send();
			// 값 반환
			model.addAttribute("balance", balance);
		}
	}

	// 이더 예금인출하기
	@Override
	public void bankWithdraw(HttpServletRequest req, Model model) throws Exception {
		// 값받기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		// 형변환
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 성공시
			@SuppressWarnings("deprecation")
			// Bank 컨트랙트 로드
			Bank contract = Bank.load(BankAddress, web3, credentials, gasPrice, gasLimit);
			// 인출함수실행
			TransactionReceipt withdraw = contract.withdraw(ether).send();
			String Tx_hash = withdraw.getTransactionHash();
			System.out.println("거래해시 : " + Tx_hash);
			// 거래 정상종료 체크
			if (withdraw.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
				model.addAttribute("Tx_hash", Tx_hash);
			} else {
				chkNum = 0;
				model.addAttribute("chkNum", chkNum);
			}
		}
	}

	/*
	 * 슬롯머신
	 */

	/*
	 * common
	 */
	// 슬롯머신플레이(gameStart)
	// 유저만가능하다
	@Override
	public void slot(HttpServletRequest req, Model model) throws Exception {
		// 값받기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		// 형변환
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 성공시
			@SuppressWarnings("deprecation")
			// Slot 컨트랙트 로드
			Slot contract = Slot.load(SlotAddress, web3, credentials, gasPrice, gasLimit);

			// 몇번째 게임인지 카운트를 누르고 시작
			TransactionReceipt count = contract.count().send();
			// 카운트값을 가져온다.
			BigInteger sendCount = contract.getCountLogEvents(count).get(0).count;
			// 게임스타트
			TransactionReceipt gameStart = contract.gameStart(ether).send();
			// 결과를 로그로 출력
			Tuple5<BigInteger, BigInteger, BigInteger, BigInteger, Boolean> sendResult = contract.sendResult(sendCount)
					.send();
			BigInteger n1 = sendResult.getValue1();
			BigInteger n2 = sendResult.getValue2();
			BigInteger n3 = sendResult.getValue3();
			BigInteger reword = sendResult.getValue4();
			Boolean result = sendResult.getValue5();
			// 상금수령 - 당첨이 되지 않으면 해당 함수를 실행하지 않아서 가스를 낭비하지 않아도 되게끔 보완할 수 있다.
			TransactionReceipt withdraw = contract.withdraw().send();
			// 값반환
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("n1", n1);
			data.put("n2", n2);
			data.put("n3", n3);
			data.put("reword", reword);
			data.put("result", result);
			model.addAttribute("data", data);
		}
	}

	// 슬롯머신 컨트랙트 삭제(kill, 해당 계정의 잔고는 address(0)으로 돌아오고 계정은 삭제된다.)
	// 관리자만 가능하게 해야한다.
	@Override
	public void slotKill(HttpServletRequest req, Model model) throws Exception {
		// 값받기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		// 훈이오빠
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		// 유경
		// String from =
		// fn.concat(req.getParameter("from").substring(req.getParameter("from").length()-37));
		String password = req.getParameter("password");
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 성공시
			@SuppressWarnings("deprecation")
			// Slot 컨트랙트 로드
			Slot contract = Slot.load(SlotAddress, web3, credentials, gasPrice, gasLimit);
			// 킬 함수
			TransactionReceipt kill = contract.kill().send();
			// 정상종료 체크
			if (kill.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
			} else {
				chkNum = 0;
				model.addAttribute("chkNum", chkNum);
			}
		}
	}

	/*
	 * admin
	 */
	// 슬롯잔고채우기
	// 관리자만가능하다
	@Override
	public void slotStock(HttpServletRequest req, Model model) throws Exception {
		// 값받기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		String value = req.getParameter("value");
		// 형변환
		BigInteger ether = Convert.toWei(value, Convert.Unit.ETHER).toBigInteger();
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 성공시
			@SuppressWarnings("deprecation")
			// Slot 컨트랙트 로드
			Slot contract = Slot.load(SlotAddress, web3, credentials, gasPrice, gasLimit);
			// 슬롯 잔고 채우는 함수 실행
			TransactionReceipt slotStock = contract.ownerInput(ether).send();
			// 정상종료 체크
			if (slotStock.getBlockNumber() != null) {
				chkNum = 1;
				model.addAttribute("chkNum", chkNum);
			}
		}
	}

	// 슬롯머신잔고확인
	// 관리자만가능하다
	@Override
	public void slotStockBalance(HttpServletRequest req, Model model) throws Exception {
		// 값받기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 성공시
			@SuppressWarnings("deprecation")
			// Slot 컨트랙트 로드
			Slot contract = Slot.load(SlotAddress, web3, credentials, gasPrice, gasLimit);
			// 잔액반환함수 실행
			BigInteger slotStockBalance = contract.total().send();
			// 값반환
			model.addAttribute("slotStockBalance", slotStockBalance);
		}
	}

	/*
	 * 대출 address[0]에 100억을 넣는다.
	 */

	/*
	 * common
	 */
	// 대출상품목록
	// 모든 대출 상품을 불러온다.
	@Override
	public void loanList(HttpServletRequest req, Model model) throws Exception {
		List<LoanProductVO> loan = dao.loanList();
		model.addAttribute("loan", loan);
	}

	// 대출상품조회
	// 해당번호의 상품정보를 본다
	@Override
	public void loanInfo(HttpServletRequest req, Model model) throws Exception {
		String num = req.getParameter("num");
		LoanProductVO info = dao.loanInfo(num);
		req.setAttribute("type", "cheq");
		model.addAttribute("info", info);
	}

	// 대출상품신청
	@Override
	public void loanApply(HttpServletRequest req, Model model) throws Exception {
		int result;
		// String fileSource = path.concat(req.getParameter("from").substring(12)); ==>
		// fakepath가 사라짐.
		String fileSource = path.concat(req.getParameter("from"));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		String num = req.getParameter("num");

		int myLoan_amount = Integer.parseInt(req.getParameter("amount"));
		int myLoan_left = Integer.parseInt(req.getParameter("amount"));
		double myLoan_rate = Double.parseDouble(req.getParameter("rate"));
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			Benkfit contract = Benkfit.load(BenkfitAddress, web3, credentials, gasPrice, gasLimit);
			// 해당계정의 잔액을 부르고
			BigInteger balance = contract.balanceOf(from).send();
			int balanceInt = balance.intValue();
			// 해당 상품의 금리를 불러서
			LoanProductVO info = dao.loanInfo(num);
			double rate = info.getLoan_rate();
			// 초기 이자금을 계산 한 후
			int f_rate = (int) (myLoan_amount * (rate / 100));
			BigInteger f_rate_b = BigInteger.valueOf(f_rate);

			// 해당계정의 잔액이 초기 이자금보다 크면 진행
			if (balanceInt > f_rate) {
				Authentication securityContext = SecurityContextHolder.getContext().getAuthentication();
				User user = (User) securityContext.getPrincipal();

				// 신청시 초기 이자금을 납부한다.
				TransactionReceipt transfer = contract.transfer(owner, f_rate_b).send();

				String c_id = user.getUsername();
				MyloanAccountVO vo = new MyloanAccountVO();
				vo.setC_id(c_id);
				vo.setLoan_num(num);
				vo.setMyLoan_amount(myLoan_amount);
				vo.setMyLoan_account(from);
				vo.setMyLoan_rate(myLoan_rate);
				vo.setMyLoan_left(myLoan_left);

				result = dao.loanApply(vo);
				model.addAttribute("result", result);
				// 잔액이 부족하면
			} else {
				result = -2;
				model.addAttribute("result", result);
			}
			// 언락이 풀리지 않으면 비밀번호가 다르므로 -1 리턴
		} else {
			result = -1;
			model.addAttribute("result", result);
		}
	}

	// 대출액가져오기(한도)
	@Override
	public void loanBalance(HttpServletRequest req, Model model) throws Exception {
		// 지갑파일, 계정주소, 비밀번호 가져오기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정 언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 컨트랙트 불러오기
			Benkfit contract = Benkfit.load(BenkfitAddress, web3, credentials, gasPrice, gasLimit);
			// allowance(대출잔액)가져오기
			BigInteger allowance = contract.allowance(owner, from).send();
			model.addAttribute("allowance", allowance);
		}
	}

	// 대출잔액가져오기
	@Override
	public void loanleft(HttpServletRequest req, Model model) throws Exception {
		String myLoan_account = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		int result = dao.loanleft(myLoan_account);
		System.out.println("result :" + result);
		model.addAttribute("loanleft", result);
	}

	// 대출금 거래하기
	@Override
	public void loanTransfer(HttpServletRequest req, Model model) throws Exception {
		int result;
		// 지갑파일, 계정주소, 비밀번호 가져오기
		String fileSource = path.concat(req.getParameter("from").substring(12));
		String from = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		String password = req.getParameter("password");
		String to = req.getParameter("to");
		String value_ = req.getParameter("value");
		BigInteger value = Convert.toWei(value_, Convert.Unit.ETHER).toBigInteger();
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials(password, fileSource);
		// 계정 언락
		if (admin.personalUnlockAccount(from, password).send().getResult()) {
			// 컨트랙트 불러오기
			Benkfit contract = Benkfit.load(BenkfitAddress, web3, credentials, gasPrice, gasLimit);
			TransactionReceipt transferFrom = contract.transferFrom(owner, to, value).send();
			result = 1;
			model.addAttribute("result", result);
		} else {
			result = 0;
			model.addAttribute("result", result);
		}
	}

	// 대출상환하기
	@Override
	public void loanRepayment(HttpServletRequest req, Model model) throws Exception {
		// 값받기
		String myLoan_account = fn.concat(req.getParameter("from").substring(req.getParameter("from").length() - 45,
				req.getParameter("from").length() - 5));
		int amount = Integer.parseInt(req.getParameter("amount"));
		// 해당계정의 대출정보를 가져온다.
		List<MyloanAccountVO> vo = dao.loanApprovalPro_info(myLoan_account);
		// 현재 대출 잔액 = 대출잔액 - 갚은돈.
		int Loan_left = vo.get(0).getMyLoan_left();
		int myLoan_left = Loan_left - amount;
		MyloanAccountVO vo1 = new MyloanAccountVO();
		vo1.setMyLoan_account(myLoan_account);
		vo1.setMyLoan_left(myLoan_left);
		int result = dao.loanRepayment(vo1);
		model.addAttribute("loanRepayment_result", result);
	}

	/*
	 * admin
	 */
	// 대출상품등록
	@Override
	public void loanRegiPro(HttpServletRequest req, Model model) throws Exception {
		int result = 0;

		String loan_name = req.getParameter("name");
		int loan_amount = Integer.parseInt(req.getParameter("amount"));
		String loan_period = req.getParameter("period");
		// double loan_overrate = Double.parseDouble(req.getParameter("overrate"));
		double loan_rate = Double.parseDouble(req.getParameter("rate"));
		String loan_target = req.getParameter("target");
		int loan_moderate = Integer.parseInt(req.getParameter("moderate"));
		String loan_remethod = req.getParameter("remethod");
		// String loan_paymethod = req.getParameter("paymethod");

		LoanProductVO vo = new LoanProductVO();
		vo.setLoan_name(loan_name);
		vo.setLoan_amount(loan_amount);
		vo.setLoan_period(loan_period);
		// vo.setLoan_overrate(loan_overrate);
		vo.setLoan_rate(loan_rate);
		vo.setLoan_target(loan_target);
		vo.setLoan_moderate(loan_moderate);
		vo.setLoan_reMethod(loan_remethod);
		// vo.setLoan_paymethod(loan_paymethod);

		result = dao.loanPro(vo);

		System.out.println("대출상품등록 : " + result);
		model.addAttribute("cnt", result);
	}

	// 대출상품수정
	@Override
	public void loanEdit(HttpServletRequest req, Model model) throws Exception {
		String num = req.getParameter("loan_num");

		LoanProductVO vo = dao.loanInfo(num);
		model.addAttribute("vo", vo);
	}

	// 대출상품수정처리
	@Override
	public void loanEditPro(HttpServletRequest req, Model model) throws Exception {
		String loan_num = req.getParameter("loan_num");
		System.out.println(loan_num);
		String loan_name = req.getParameter("name");
		int loan_amount = Integer.parseInt(req.getParameter("amount"));
		double loan_rate = Double.parseDouble(req.getParameter("rate"));
		String loan_period = req.getParameter("period");
		String loan_target = req.getParameter("target");
		String loan_remethod = req.getParameter("remethod");

		LoanProductVO vo = new LoanProductVO();
		vo.setLoan_num(loan_num);
		vo.setLoan_name(loan_name);
		vo.setLoan_amount(loan_amount);
		vo.setLoan_period(loan_period);
		vo.setLoan_rate(loan_rate);
		vo.setLoan_target(loan_target);
		vo.setLoan_reMethod(loan_remethod);

		int result;
		result = dao.loanEditPro(vo);

		System.out.println("대출상품수정 : " + result);
		model.addAttribute("cnt", result);
	}

	// 대출상품마감
	@Override
	public void loanDel(HttpServletRequest req, Model model) throws Exception {
		String loan_num = req.getParameter("loan_num");

		int result = dao.loanDel(loan_num);
		model.addAttribute("num", loan_num);
		model.addAttribute("result", result);
	}

	// 대출신청리스트
	@Override
	public void loanApproval(HttpServletRequest req, Model model) throws Exception {
		// 전체리스트를 가져온다
		List<MyloanAccountVO> dtos = dao.loanApproval();
		model.addAttribute("dtos", dtos);
	}

	// 대출신청처리(승인)
	@Override
	public void loanApprovalPro(HttpServletRequest req, Model model) throws Exception {
		int result;
		// 주소값가져오기
		String myLoan_account = req.getParameter("myLoan_account");
		// 주소값으로 해당 대출 계정의 정보 불러오기
		List<MyloanAccountVO> vo = dao.loanApprovalPro_info(myLoan_account);
		// 위에서 받아온 해당 대출 상품의 대출금가져오기
		BigInteger value = BigInteger.valueOf(vo.get(0).getMyLoan_amount());
		// 자격증명
		Credentials credentials = WalletUtils.loadCredentials("password", owner_file);
		// 계정 언락
		if (admin.personalUnlockAccount(owner, "password").send().getResult()) {
			// 컨트랙트로드
			Benkfit contract = Benkfit.load(BenkfitAddress, web3, credentials, gasPrice, gasLimit);
			// 대출관리계정(address[0])에서 대출금만큼 권한을부여함.
			TransactionReceipt approve = contract.approve(myLoan_account, value).send();
			// 대출신청리스트에서 해당 대출을 승인으로 update함.
			result = dao.loanApprovalPro(myLoan_account);
			model.addAttribute("result", result);
		}
	}

	// 대출신청처리(거절)
	@Override
	public void rejection(HttpServletRequest req, Model model) throws Exception {
		int result;
		// 주소값가져오기
		String myLoan_account = req.getParameter("myLoan_account");
		// 주소값으로 해당 대출 계정의 정보 불러오기
		List<MyloanAccountVO> vo = dao.loanApprovalPro_info(myLoan_account);
		// 신청시 미리 납부한 이자를 돌려주어야 한다.
		// 신청한 대출금을 가져온다.
		int amount = vo.get(0).getMyLoan_amount();
		// 신청한 대출의 금리를 가져온다.
		double rate = vo.get(0).getMyLoan_rate();
		// 위 두개를 계산한다.
		int val = (int) (amount * (rate / 100));
		// BigInteger로 형변환
		BigInteger value = BigInteger.valueOf(val);

		// 주소값으로 해당 대출 계정의 정보 불러오기
		Credentials credentials = WalletUtils.loadCredentials("password", owner_file);
		if (admin.personalUnlockAccount(owner, "password").send().getResult()) {
			// 컨트랙트로드
			Benkfit contract = Benkfit.load(BenkfitAddress, web3, credentials, gasPrice, gasLimit);
			// 위에서 계산한 값을 다시 돌려준다.
			TransactionReceipt transfer = contract.transfer(myLoan_account, value).send();
			result = dao.rejection(myLoan_account);
			model.addAttribute("result", result);
		}

	}

	/*
	 * 거래검증소
	 */

	// 거래검증
	@Override
	public void verify(HttpServletRequest req, Model model) throws Exception {
		// 트랜잭션값받기
		String value = req.getParameter("value");
		// 해당트랜잭션으로 서로 다른 노드의 블럭번호 받아오기
		BigInteger bn_node2 = web3.ethGetTransactionReceipt(value).send().getResult().getBlockNumber();
		BigInteger bn_node4 = web3_4.ethGetTransactionReceipt(value).send().getResult().getBlockNumber();
		// 서로의 블럭번호가 일치하면
		if (bn_node2.equals(bn_node4)) {
			String from = web3.ethGetTransactionReceipt(value).send().getResult().getFrom();
			String to = web3.ethGetTransactionReceipt(value).send().getResult().getTo();

			// 값을 보낸다.
			model.addAttribute("from", from);
			model.addAttribute("to", to);
			model.addAttribute("bn", bn_node2);
			chkNum = 1;
			model.addAttribute("chkNum", chkNum);
		} else {
			chkNum = 0;
			model.addAttribute("chkNum", chkNum);
		}
	}

}
