package spring.mvc.benkfit.persistence;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Repository;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.methods.response.EthAccounts;
import org.web3j.protocol.core.methods.response.EthBlockNumber;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.protocol.core.methods.response.EthGetTransactionCount;
import org.web3j.protocol.core.methods.response.Web3ClientVersion;
import org.web3j.protocol.http.HttpService;

@Repository
public class DAOImpl_bh implements DAO_bh {
	
	//ganache 서버 연결포트
	//Web3j web3j = Web3j.build(new HttpService("http://localhost:7545"));
	
//	geth 서버 연결 포트
	Web3j web3j = Web3j.build(new HttpService("http://localhost:8545"));

	//계정전체확인
//	@Override
//	public EthAccounts getEthAccounts() {
//		EthAccounts result = new EthAccounts();
//		try {
//			result = this.web3j.ethAccounts().sendAsync().get();
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ExecutionException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return result;		
//	}
//	
//	//계정의 잔액 확인
	@Override
	public BigInteger getEthBalance() {
		BigInteger result = null;
		try {
			result = this.web3j.ethGetBalance("0xba444a48a264e7fcadd9a60951623e607fee385a", DefaultBlockParameter.valueOf("latest")).sendAsync().get().getBalance();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
//
//	//블럭번호 반환
//	@Override
//	public EthBlockNumber getBlockNymber() {
//		EthBlockNumber result = new EthBlockNumber();
//		try {
//			result = this.web3j.ethBlockNumber().sendAsync().get();
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ExecutionException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return result;
//	}
//
//	//계정트랜잭션 수
//	@Override
//	public EthGetTransactionCount getTransactionCount() {
//		EthGetTransactionCount result = new EthGetTransactionCount();
//		try {
//			result = this.web3j.ethGetTransactionCount("0xD5BE18b40bC8924909a7107823162EDCa849868c", 
//					DefaultBlockParameter.valueOf("latest")).sendAsync().get();
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ExecutionException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return result;
//	}
	
//	Web3j web3 = Web3j.build(new HttpService("http://localhost:8545"));
//	Web3ClientVersion web3ClientVersion = web3.web3ClientVersion().send();
//	String clientVersion = web3ClientVersion.getWeb3ClientVersion();
	
}