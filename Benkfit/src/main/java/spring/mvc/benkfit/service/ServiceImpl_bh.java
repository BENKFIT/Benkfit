package spring.mvc.benkfit.service;

import java.io.IOException;
import java.math.BigInteger;
import java.util.*;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.web3j.crypto.*;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.methods.response.*;
import org.web3j.protocol.http.HttpService;
import spring.mvc.benkfit.sol.Slot;

import spring.mvc.benkfit.persistence.DAO_bh;

@Service
public class ServiceImpl_bh implements Service_bh {
	
	Web3j web3 = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));
	
	@Autowired
	DAO_bh dao;
	
	@Override
	public void accounts(HttpServletRequest req, Model model) {
//		List<String> result = dao.getEthAccounts().getResult();
		BigInteger result2 = dao.getEthBalance();
//		String result3 = dao.getBlockNymber().getResult();
//		String result4 = dao.getTransactionCount().getResult();
//		System.out.println("result : " + result);
		System.out.println("result2 : " + result2);
//		System.out.println("result3 : " + result3);
//		System.out.println("result4 : " + result4);
//		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
//		model.addAttribute("result3", result3);
//		model.addAttribute("result4", result4);
	}

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
			Credentials credentials = WalletUtils.loadCredentials("password", "C:/ether/geth/private_net/keystore/UTC--2019-01-25T06-33-33.541838900Z--565d241fd2f30474bae822254a6ccc03cc45df0e");
			
			//트랜잭션 주소
			@SuppressWarnings("deprecation")
			Slot contract = Slot.load("0xb824ebcb0A3cdDdC8bBFd2FFC636aB1067Ac74b8", web3, credentials, gasPrice, gasLimit);
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

	//계정잔액가져오기
	@Override
	public void slotBalance(HttpServletRequest req, Model model) {
		BigInteger slotBalance = null;
		String address = req.getParameter("address");
		
		try {
			slotBalance = this.web3.ethGetBalance(address, DefaultBlockParameter.valueOf("latest")).sendAsync().get().getBalance();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
		System.out.println("slotBalance : " + slotBalance );
		model.addAttribute("slotBalance", slotBalance);
		
	}
	
}
