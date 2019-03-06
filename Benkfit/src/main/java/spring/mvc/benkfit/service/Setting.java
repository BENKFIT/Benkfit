package spring.mvc.benkfit.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.benkfit.persistence.DAOImpl_syk;
import spring.mvc.benkfit.vo.ContractVO;

public class Setting {
	
	/*
	 * 배포
	 */
	final static int chkNum = 0;
	final static String fn = "0x";
	
	// 유경
//	final static String path = "C:\\ether\\geth\\private_net\\keystore\\";
//	final static String owner = "0x565d241fd2f30474bae822254a6ccc03cc45df0e";
//	final static String owner_file = "C:\\ether\\geth\\private_net\\keystore\\UTC--2019-01-25T06-33-33.541838900Z--565d241fd2f30474bae822254a6ccc03cc45df0e";
//	final static String owner_pwd = "password";
	
	final static BigInteger gasPrice = BigInteger.valueOf(3000000);
	final static BigInteger gasLimit = BigInteger.valueOf(3000000);
	final static BigInteger initialWeiValue = BigInteger.valueOf(0);
	
	/*
	 * 훈 전역 설정
	 */

	final static String path = "/Users/banhun/2_net/keystore/";
	final static String owner = "0xd5cc7a592fa96a270aa2cb99bddd262982c57943";
	final static String owner_pwd = "password";
	final static String owner_file = "/Users/banhun/2_net/keystore/UTC--2019-02-14T07-51-00.079742000Z--d5cc7a592fa96a270aa2cb99bddd262982c57943";

}