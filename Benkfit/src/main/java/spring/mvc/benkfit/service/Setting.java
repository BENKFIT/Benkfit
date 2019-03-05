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

	final static String path = "C:/DEV43/ether/keystore";
	final static String owner = "0x4aca841d5384d16bd0ade39037a14b338caf06c9";
	final static String owner_pwd = "1234";
	final static String owner_file = "C:/DEV43/ether/keystore/UTC--2019-02-15T06-08-59.949370200Z--4aca841d5384d16bd0ade39037a14b338caf06c9";

}