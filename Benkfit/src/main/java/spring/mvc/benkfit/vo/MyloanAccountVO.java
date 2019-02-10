package spring.mvc.benkfit.vo;

import java.sql.Date;

public class MyloanAccountVO {
	
	private String myLoan_account; /* 대출 계좌번호 */
	private int myLoan_amount; /* 금액 */
	private Date myLoan_date;/* 가입날짜 */
	private int myLoan_state;/* 상태코드 */
	private Date myLoan_late; /* 만기 */
	private int myLoan_type; /* 대출 승인여부 */
    private Date myLoan_over; /* 연체 기간 */  
	private String loan_num; /* 대출 상품번호 */
	private String c_id; /* 고객 아이디 */
	
	
	
	public String getMyLoan_account() {
		return myLoan_account;
	}
	public void setMyLoan_account(String myLoan_account) {
		this.myLoan_account = myLoan_account;
	}
	public int getMyLoan_amount() {
		return myLoan_amount;
	}
	public void setMyLoan_amount(int myLoan_amount) {
		this.myLoan_amount = myLoan_amount;
	}
	public Date getMyLoan_date() {
		return myLoan_date;
	}
	public void setMyLoan_date(Date myLoan_date) {
		this.myLoan_date = myLoan_date;
	}
	public int getMyLoan_state() {
		return myLoan_state;
	}
	public void setMyLoan_state(int myLoan_state) {
		this.myLoan_state = myLoan_state;
	}
	public Date getMyLoan_late() {
		return myLoan_late;
	}
	public void setMyLoan_late(Date myLoan_late) {
		this.myLoan_late = myLoan_late;
	}
	public int getMyLoan_type() {
		return myLoan_type;
	}
	public void setMyLoan_type(int myLoan_type) {
		this.myLoan_type = myLoan_type;
	}
	public Date getMyLoan_over() {
		return myLoan_over;
	}
	public void setMyLoan_over(Date myLoan_over) {
		this.myLoan_over = myLoan_over;
	}
	public String getLoan_num() {
		return loan_num;
	}
	public void setLoan_num(String loan_num) {
		this.loan_num = loan_num;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
}
