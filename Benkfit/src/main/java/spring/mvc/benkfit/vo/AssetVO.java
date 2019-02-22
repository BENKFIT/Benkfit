package spring.mvc.benkfit.vo;

public class AssetVO {
	
	private String tran_account;
	private int tran_count;
	
	public String getTran_account() {
		return tran_account;
	}
	public void setTran_account(String tran_account) {
		this.tran_account = tran_account;
	}
	public int getTran_count() {
		return tran_count;
	}
	public void setTran_count(int tran_count) {
		this.tran_count = tran_count;
	}
	public AssetVO(String tran_account, int tran_count) {
		this.tran_account = tran_account;
		this.tran_count = tran_count;
	}
	public AssetVO() {
	}
	
	@Override
	public String toString() {
		return "AssetVO [tran_account=" + tran_account + ", tran_count=" + tran_count + "]";
	}
	

}
