package spring.mvc.benkfit.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import spring.mvc.benkfit.persistence.DAOImpl_syk;
import spring.mvc.benkfit.vo.ContractVO;

public class Setting {
	
	@Autowired
	DAOImpl_syk dao;
	
	public Setting() {
		List<ContractVO> vo = dao.contract();
		for(ContractVO con : vo) {
			if(con.getCon_name().equals("Bank")) {
				setBank(con.getCon_address());
				this.bank = con.getCon_address();
				
			}else if(con.getCon_name().equals("Benkfit")) {
				setBenkfit(con.getCon_address());
				this.benkfit = con.getCon_address();
				
			}else if(con.getCon_name().equals("Slot")) {
				setSlot(con.getCon_address());
				this.slot = con.getCon_address();
			}
		}
	}
	
	/*
	 * 배포
	 */
	private static String benkfit ="0x0b18181f4dfd119f831189a7ff3f5a208654273e";
	private static String bank ="0x2a90ba9747e42bb85a788d1054d4f50ab62455f3";
	private static String slot ="0x2496c784d09831aa00aa154996a526a6a3d11072";

	final static int chkNum = 0;
	final static String fn = "0x";
	
	// 유경
//	final static String path = "C:\\ether\\geth\\private_net\\keystore\\";
//	final static String owner = "0x565d241fd2f30474bae822254a6ccc03cc45df0e";
//	final static String owner_file = "C:\\ether\\geth\\private_net\\keystore\\UTC--2019-01-25T06-33-33.541838900Z--565d241fd2f30474bae822254a6ccc03cc45df0e";
//	final static String owner_pwd = "password";
	
	/*
	 * 훈 전역 설정
	 */

	final static String path = "/Users/banhun/2_net/keystore/";
	final static String owner = "0xd5cc7a592fa96a270aa2cb99bddd262982c57943";
	final static String owner_pwd = "password";
	final static String owner_file = "/Users/banhun/2_net/keystore/UTC--2019-02-14T07-51-00.079742000Z--d5cc7a592fa96a270aa2cb99bddd262982c57943";


	final static BigInteger gasPrice = BigInteger.valueOf(3000000);
	final static BigInteger gasLimit = BigInteger.valueOf(3000000);
	final static BigInteger initialWeiValue = BigInteger.valueOf(0);
	
	public static String getBenkfit() {
		return benkfit;
	}
	public static void setBenkfit(String benkfit) {
		Setting.benkfit = benkfit;
	}
	public static String getBank() {
		return bank;
	}
	public static void setBank(String bank) {
		Setting.bank = bank;
	}
	public static String getSlot() {
		return slot;
	}
	public static void setSlot(String slot) {
		Setting.slot = slot;
	}
	
	@Override
	public String toString() {
		return "Setting [chkNum=" + chkNum + ", path=" + path + ", owner=" + owner + ", owner_pwd=" + owner_pwd
				+ ", owner_file=" + owner_file + ", fn=" + fn + ", gasPrice=" + gasPrice + ", gasLimit=" + gasLimit
				+ ", initialWeiValue=" + initialWeiValue + "]";
	}
}
