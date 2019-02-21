package spring.mvc.benkfit.service;

import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
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
import spring.mvc.benkfit.vo.TransDetailVO;

@Service
public class ScheduleT {
	
	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));
	Admin admin = Admin.build(new HttpService("http://localhost:8545"));

	final String path = "C:\\ether\\geth\\private_net\\keystore\\";
	int chkNum = 0;

	String fn = "0x";

	BigInteger gasPrice = BigInteger.valueOf(3000000);
	BigInteger gasLimit = BigInteger.valueOf(3000000);
	
	@Autowired
	DAOImpl_syk dao;
	
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
					String contract = ServiceImpl_syk.getBenkfit();
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
}
