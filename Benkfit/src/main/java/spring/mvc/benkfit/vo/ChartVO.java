package spring.mvc.benkfit.vo;

public class ChartVO {

	private int myCheq_account;	// 예금 상품 가입자 수
	private int mySav_account;		// 적금 상품 가입자 수
	private int myLoan_account;		// 대출 상품 가입자 수 
	private String value;				// 가입 날짜
	
	public int getMyCheq_account() {
		return myCheq_account;
	}
	public void setMyCheq_account(int myCheq_account) {
		this.myCheq_account = myCheq_account;
	}
	public int getMySav_account() {
		return mySav_account;
	}
	public void setMySav_account(int mySav_account) {
		this.mySav_account = mySav_account;
	}
	public int getMyLoan_account() {
		return myLoan_account;
	}
	public void setMyLoan_account(int myLoan_account) {
		this.myLoan_account = myLoan_account;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
