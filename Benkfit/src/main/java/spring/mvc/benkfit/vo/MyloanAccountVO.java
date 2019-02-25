package spring.mvc.benkfit.vo;

import java.sql.Date;

public class MyloanAccountVO {
	
	private String myloan_account; /* 대출 계좌번호 */
	private int myloan_amount; /* 대출금액 */
	private Date myloan_date;/* 가입날짜 */
	private int myloan_state;/* 상태코드 */
	private Date myloan_late; /* 만기 */
	private int myloan_type; /* 대출 승인여부 */
    private Date myloan_over; /* 연체 기간 */  
	private String loan_num; /* 대출 상품번호 */
	private String c_id; /* 고객 아이디 */
	private double myloan_rate; /* 연이율 */
	private int myloan_left; /*대출 잔금*/
	private String code; /* 계좌 종류 */
	
	public String getmyloan_account() {
		return myloan_account;
	}
	public void setmyloan_account(String myloan_account) {
		this.myloan_account = myloan_account;
	}
	public int getmyloan_amount() {
		return myloan_amount;
	}
	public void setmyloan_amount(int myloan_amount) {
		this.myloan_amount = myloan_amount;
	}
	public Date getmyloan_date() {
		return myloan_date;
	}
	public void setmyloan_date(Date myloan_date) {
		this.myloan_date = myloan_date;
	}
	public int getmyloan_state() {
		return myloan_state;
	}
	public void setmyloan_state(int myloan_state) {
		this.myloan_state = myloan_state;
	}
	public Date getmyloan_late() {
		return myloan_late;
	}
	public void setmyloan_late(Date myloan_late) {
		this.myloan_late = myloan_late;
	}
	public int getmyloan_type() {
		return myloan_type;
	}
	public void setmyloan_type(int myloan_type) {
		this.myloan_type = myloan_type;
	}
	public Date getmyloan_over() {
		return myloan_over;
	}
	public void setmyloan_over(Date myloan_over) {
		this.myloan_over = myloan_over;
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
	public double getmyloan_rate() {
		return myloan_rate;
	}
	public void setmyloan_rate(double myloan_rate) {
		this.myloan_rate = myloan_rate;
	}
	
	public int getmyloan_left() {
		return myloan_left;
	}
	public void setmyloan_left(int myloan_left) {
		this.myloan_left = myloan_left;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Override
	public String toString() {
		return "myloanAccount_kay [myloan_account=" + myloan_account + ", myloan_amount=" + myloan_amount
				+ ", myloan_date=" + myloan_date + ", myloan_state=" + myloan_state + ", myloan_late=" + myloan_late
				+ ", myloan_type=" + myloan_type + ", myloan_over=" + myloan_over + ", loan_num=" + loan_num + ", c_id="
				+ c_id + ", myloan_rate=" + myloan_rate + ", myloan_left=" + myloan_left + ", code=" + code + "]";
	}
}
