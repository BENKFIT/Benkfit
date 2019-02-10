package spring.mvc.benkfit.service;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.*;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.methods.response.EthAccounts;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;

import spring.mvc.benkfit.sol.Slot;

import spring.mvc.benkfit.persistence.DAO_bh;

@Service
public class ServiceImpl_bh implements Service_bh {
	
	Web3j web3 = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));
	
	@Autowired
	DAO_bh dao;
	
	//계정잔액가져오기
	@Override
	public void Balance(HttpServletRequest req, Model model){
		BigInteger Balance = null;
		String address = req.getParameter("address");
		
		try {
			Balance = this.web3.ethGetBalance(address, DefaultBlockParameter.valueOf("latest")).sendAsync().get().getBalance();
			model.addAttribute("Balance", Balance);	
			System.out.println("계정의 잔액을 가져오는 함수를 실행합니다.");
			System.out.println("계정 확인 :" + address);
			System.out.println("==> 해당 계정의 잔액 : " + Balance);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 계정생성하기
	 */
	@Override
	public void createAccount(HttpServletRequest req, Model model) {
		String password = req.getParameter("password");
		boolean success = false;
		try {
			String newAccount = WalletUtils.generateNewWalletFile(password, new File("/Users/banhun/geth/private_net/keystore"));
			if(newAccount != null) {
				success = true;
				model.addAttribute("success",success);
				System.out.println("새로운 계정을 만드는 함수입니다.");
				System.out.println("새 계정의 입력받은 비밀번호 : " + password);
				System.out.println("성공여부 : " + success);
			}
			System.out.println("newAccount : " + newAccount);
		} catch (InvalidAlgorithmParameterException | NoSuchAlgorithmException | NoSuchProviderException
				| CipherException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*
	 * 슬롯머신
	 */
	@Override
	public void slot(HttpServletRequest req, Model model) {
		BigInteger gasPrice = BigInteger.valueOf(200000);
		BigInteger gasLimit = BigInteger.valueOf(200000);
		
		//아이디 비밀번호 체크
		String address = req.getParameter("address");
		String pass = req.getParameter("pass");
		double bet_amount = Double.parseDouble((req.getParameter("bet_amount")));
		BigInteger ether = BigInteger.valueOf((long) bet_amount);
		System.out.println("amount : " + bet_amount);
		System.out.println("ether :" + ether);
		
		try {
			//private key위치
			//유경위치
			//Credentials credentials = WalletUtils.loadCredentials("password", "C:/ether/geth/private_net/keystore/UTC--2019-01-25T06-33-33.541838900Z--565d241fd2f30474bae822254a6ccc03cc45df0e");
			//훈위치
			Credentials credentials = WalletUtils.loadCredentials("password", "/Users/banhun/geth/private_net/keystore/UTC--2019-01-24T03-37-23.877487000Z--ba444a48a264e7fcadd9a60951623e607fee385a");
			
			//트랜잭션 주소
			@SuppressWarnings("deprecation")
			//유경주소
			//Slot contract = Slot.load("0xb824ebcb0A3cdDdC8bBFd2FFC636aB1067Ac74b8", web3, credentials, gasPrice, gasLimit);
			//훈주소
			Slot contract = Slot.load("0x23dAcd3Fef0c4E270b8F9545A762fDfbf1e7d394", web3, credentials, gasPrice, gasLimit);
			//계정언락
			if(admin.personalUnlockAccount(address, pass).send().getResult()) {
				contract.bet(ether);
			}
			
			//slot - bet 실행구문
			TransactionReceipt transactionReceipt = contract.bet(ether).send();
			BigInteger blockNumber = transactionReceipt.getBlockNumber();
			
			//sendResult받아오기
			System.out.println("=============   L         O         G   ===========");
			System.out.println(contract.getSendResultEvents(transactionReceipt).get(0).log);
		
			BigInteger amount = contract.getSendResultEvents(transactionReceipt).get(0).amount;
			Boolean win = contract.getSendResultEvents(transactionReceipt).get(0).win;
			BigInteger n1 = contract.getSendResultEvents(transactionReceipt).get(0).n1;
			BigInteger n2 = contract.getSendResultEvents(transactionReceipt).get(0).n2;
			BigInteger n3 = contract.getSendResultEvents(transactionReceipt).get(0).n3;
			
			System.out.println("blockNumber = " + blockNumber);
			req.setAttribute("blockNumber", blockNumber);
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("amount", amount);
			data.put("n1", n1);
			data.put("n2", n2);
			data.put("n3", n3);
			data.put("win", win);
			System.out.println("data :" + data.toString());
			
			model.addAttribute("data", data);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 대출
	 */
	//대출신청
	@Override
	public void loan(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void accounts(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	}

	
}


	
	
	
	

