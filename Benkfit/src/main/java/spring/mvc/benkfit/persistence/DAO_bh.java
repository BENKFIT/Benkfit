package spring.mvc.benkfit.persistence;

import java.math.BigInteger;
import java.util.List;

import org.web3j.protocol.core.methods.response.EthAccounts;
import org.web3j.protocol.core.methods.response.EthBlockNumber;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.protocol.core.methods.response.EthGetTransactionCount;

public interface DAO_bh {
	
	//대출신청
	public int loan(int value);
}
