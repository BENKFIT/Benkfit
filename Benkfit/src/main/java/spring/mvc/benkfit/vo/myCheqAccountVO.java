package spring.mvc.benkfit.vo;

import java.sql.Date;

public class myCheqAccountVO {

	private String myCheq_account; /* 예금 계좌번호 */
	private int myCheq_amount; /* 금액 */
	private Date myCheq_regDate; /* 가입 날짜 */
	private int myCheq_limit; /* 이체 한도 */
	private int myCheq_card; /* 카드 연결 여부 */
	private int myCheq_taxRate; /* 예금 세율 */
	private String cheq_num; /* 예금 상품번호 */
	private String c_id; /* 고객 아이디 */
	private double cheq_rate; /* 연이율 */
	private String code; /* 계좌 종류 */
	private String pwd;  /* 계좌생성할때 받는 비밀번호 */
	
	public String getMyCheq_account() {
		return myCheq_account;
	}
	public void setMyCheq_account(String myCheq_account) {
		this.myCheq_account = myCheq_account;
	}
	public int getMyCheq_amount() {
		return myCheq_amount;
	}
	public void setMyCheq_amount(int myCheq_amount) {
		this.myCheq_amount = myCheq_amount;
	}
	public Date getMyCheq_regDate() {
		return myCheq_regDate;
	}
	public void setMyCheq_regDate(Date myCheq_regDate) {
		this.myCheq_regDate = myCheq_regDate;
	}
	public int getMyCheq_limit() {
		return myCheq_limit;
	}
	public void setMyCheq_limit(int myCheq_limit) {
		this.myCheq_limit = myCheq_limit;
	}
	public int getMyCheq_card() {
		return myCheq_card;
	}
	public void setMyCheq_card(int myCheq_card) {
		this.myCheq_card = myCheq_card;
	}
	public int getMyCheq_taxRate() {
		return myCheq_taxRate;
	}
	public void setMyCheq_taxRate(int myCheq_taxRate) {
		this.myCheq_taxRate = myCheq_taxRate;
	}
	public String getCheq_num() {
		return cheq_num;
	}
	public void setCheq_num(String cheq_num) {
		this.cheq_num = cheq_num;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public double getCheq_rate() {
		return cheq_rate;
	}
	public void setCheq_rate(double cheq_rate) {
		this.cheq_rate = cheq_rate;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	@Override
	public String toString() {
		return "myCheqAccount_kay [myCheq_account=" + myCheq_account + ", myCheq_amount=" + myCheq_amount
				+ ", myCheq_regDate=" + myCheq_regDate + ", myCheq_limit=" + myCheq_limit + ", myCheq_card="
				+ myCheq_card + ", myCheq_taxRate=" + myCheq_taxRate + ", cheq_num=" + cheq_num + ", c_id=" + c_id
				+ ", cheq_rate=" + cheq_rate + ", code=" + code + "]";
	}
}
