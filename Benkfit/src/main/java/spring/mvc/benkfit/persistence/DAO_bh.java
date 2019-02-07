package spring.mvc.benkfit.persistence;

import java.math.BigInteger;
import java.util.List;

import org.web3j.protocol.core.methods.response.EthAccounts;
import org.web3j.protocol.core.methods.response.EthBlockNumber;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.protocol.core.methods.response.EthGetTransactionCount;

public interface DAO_bh {
	
//	public EthAccounts getEthAccounts();
	public BigInteger getEthBalance();
//	public EthBlockNumber getBlockNymber();
//	public EthGetTransactionCount getTransactionCount();

}
