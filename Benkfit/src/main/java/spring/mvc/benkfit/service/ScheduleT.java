package spring.mvc.benkfit.service;

import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;

import spring.mvc.benkfit.persistence.DAOImpl_syk;
import spring.mvc.benkfit.sol.Benkfit;
import spring.mvc.benkfit.vo.AutoTransferVO;
import spring.mvc.benkfit.vo.MySavAccountVO;
import spring.mvc.benkfit.vo.TransDetailVO;
import spring.mvc.benkfit.vo.myCheqAccountVO;

@Service
public class ScheduleT {
	
	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));

	final String path = Setting.path;
	final String owner = Setting.owner;
	final String owner_file = Setting.owner_file;
	final String owner_pwd = Setting.owner_pwd;
	
	int chkNum = Setting.chkNum;

	String fn = Setting.fn;

	BigInteger gasPrice = Setting.gasPrice;
	BigInteger gasLimit = Setting.gasLimit;
	
	@Autowired
	DAOImpl_syk dao;
	
	@Transactional(rollbackFor=Exception.class)
	@Scheduled(cron="0 0 12 * * ?")
	public void auto() {
		System.out.println("========= 자동이체 실행 =========");
		
		Date today = new Date();
		SimpleDateFormat data = new SimpleDateFormat("yyyy/MM/dd");
		
		System.out.println("현재 날짜 : " + data.format(today));
		int day = Integer.parseInt(data.format(today).split("/")[2]);
		System.out.println("오늘 일 : " + day);
		
		int result = dao.autoCnt(day);
		if(result < 1) {
			System.out.println("자동이체 할 내역이 없습니다.");
		}else {
			List<AutoTransferVO> vo = dao.autoList(day);
			for(AutoTransferVO list : vo) {
				String id = list.getC_id();
				String from = list.getAuto_from();
				String to = list.getAuto_to();
				int amount = list.getAuto_value();
				BigInteger value = BigInteger.valueOf(amount);
				String file = list.getAuto_file();
				file = path.concat(file);
				String password = list.getAuto_pwd();
				
				String blockHash = "";
				try {
					Credentials credentials = WalletUtils.loadCredentials(password, file);
					String contract = dao.getBenkfit();
					@SuppressWarnings("deprecation")
					Benkfit auto = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
					
					TransactionReceipt transactionReceipt = auto.transfer(to, value).send();
					Log log = auto.getTransferEvents(transactionReceipt).get(0).log;
					
					blockHash = transactionReceipt.getBlockHash();
					System.out.println(log);
			
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				if(blockHash != null) {
					TransDetailVO db = new TransDetailVO();
					db.setTran_account(from);
					db.setTran_out(from);
					db.setTran_in(to);
					db.setTran_amount(amount);
					db.setC_id(id);
					db.setTran_type("자동이체");
					db.setTran_code("A");
					db.setTran_blockHash(blockHash);
				}
				
			}
		}
	}
	
	//예금이자
	@Transactional(rollbackFor=Exception.class)
	@Scheduled(cron="0 0 13 * * ?")
	public void cheqInterest() {
		System.out.println("========= 예금 이자 계산 =========");
		
		int cnt = dao.cheqCnt();
		if(cnt <= 1) {
			List<myCheqAccountVO> list = dao.cheqInterest();
			for(myCheqAccountVO vo : list) {
				String account = vo.getMyCheq_account();
				int amount = vo.getMyCheq_amount();
				double rate = vo.getCheq_rate();
				String c_id = vo.getC_id();
				
				BigInteger interest = BigInteger.valueOf((long) (amount * rate / 12));
				amount += interest.intValue();
				try {
					Credentials credentials = WalletUtils.loadCredentials(owner_pwd, owner_file);
					
					String contract = dao.getBenkfit();
					@SuppressWarnings("deprecation")
					Benkfit cheqInterest = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
					TransactionReceipt transfer = cheqInterest.output(account, interest).send();
					
					String blockHash = transfer.getBlockHash();
					System.out.println("blockHash == > " + blockHash);
					
					TransDetailVO vo2 = new TransDetailVO();
					vo2.setTran_account(account);
					vo2.setTran_out(owner);
					vo2.setTran_in(account);
					vo2.setTran_amount(amount);
					vo2.setC_id(c_id);
					vo2.setTran_type("예금이자");
					vo2.setTran_code("I");
					vo2.setTran_blockHash(blockHash);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//적금이자
	@Transactional(rollbackFor=Exception.class)
	@Scheduled(cron="0 0 14 * * ?")
	public void savInterest() {
		System.out.println("========= 적금 이자 계산 =========");
		
		int cnt = dao.savCnt();
		if(cnt >= 1) {
			List<MySavAccountVO> vo = dao.savInterest();
			for(MySavAccountVO list : vo) {
				String account = list.getMySav_account();
				int amount = list.getMySav_amount();
				double rate = list.getMySav_rate();
				String c_id = list.getC_id();
				
				BigInteger interest = BigInteger.valueOf((long) (amount * rate / 12));
				amount += interest.intValue();
				
				try {
					Credentials credentials = WalletUtils.loadCredentials(owner_pwd, owner_file);
					
					String contract = dao.getBenkfit();
					@SuppressWarnings("deprecation")
					Benkfit cheqInterest = Benkfit.load(contract, web3j, credentials, gasPrice, gasLimit);
					TransactionReceipt transfer = cheqInterest.output(account, interest).send();
					
					String blockHash = transfer.getBlockHash();
					System.out.println("blockHash == > " + blockHash);
					
					TransDetailVO vo2 = new TransDetailVO();
					vo2.setTran_account(account);
					vo2.setTran_out(owner);
					vo2.setTran_in(account);
					vo2.setTran_amount(amount);
					vo2.setC_id(c_id);
					vo2.setTran_type("적금이자");
					vo2.setTran_code("I");
					vo2.setTran_blockHash(blockHash);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
