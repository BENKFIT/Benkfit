package spring.mvc.benkfit.vo;

import java.sql.Date;

public class TransDetailVO {
	private String tran_num;	 	 // 거래 번호
	private String tran_account;	 // 거래 계좌
	private String tran_out;		 // 보낸 사람
	private String tran_in;			 // 받은 사람
	private Date tran_date;			 // 거래날짜
	private int tran_amount;		 // 거래 금액
	private String tran_bank;		 // 거래 은행
	private String c_id;		 	 // 고객 아이디
	private String tran_type; 		 // 입출금 여부
	private String tran_code; 	 	 // 계좌 종류
	private int tran_afterAmount;	 // 거래후 잔액, 대출 잔금
	private int tran_loanAmount;	 // 대출원금
	private Date tran_due;			 // 적금 만기, 대출 만기
	
	public String getTran_num() {
		return tran_num;
	}
	public void setTran_num(String tran_num) {
		this.tran_num = tran_num;
	}
	public String getTran_account() {
		return tran_account;
	}
	public void setTran_account(String tran_account) {
		this.tran_account = tran_account;
	}
	public String getTran_out() {
		return tran_out;
	}
	public void setTran_out(String tran_out) {
		this.tran_out = tran_out;
	}
	public String getTran_in() {
		return tran_in;
	}
	public void setTran_in(String tran_in) {
		this.tran_in = tran_in;
	}
	public Date getTran_date() {
		return tran_date;
	}
	public void setTran_date(Date tran_date) {
		this.tran_date = tran_date;
	}
	public int getTran_amount() {
		return tran_amount;
	}
	public void setTran_amount(int tran_amount) {
		this.tran_amount = tran_amount;
	}
	public String getTran_bank() {
		return tran_bank;
	}
	public void setTran_bank(String tran_bank) {
		this.tran_bank = tran_bank;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getTran_type() {
		return tran_type;
	}
	public void setTran_type(String tran_type) {
		this.tran_type = tran_type;
	}
	public String getTran_code() {
		return tran_code;
	}
	public void setTran_code(String tran_code) {
		this.tran_code = tran_code;
	}
	public int getTran_afterAmount() {
		return tran_afterAmount;
	}
	public void setTran_afterAmount(int tran_afterAmount) {
		this.tran_afterAmount = tran_afterAmount;
	}
	public int getTran_loanAmount() {
		return tran_loanAmount;
	}
	public void setTran_loanAmount(int tran_loanAmount) {
		this.tran_loanAmount = tran_loanAmount;
	}
	public Date getTran_due() {
		return tran_due;
	}
	public void setTran_due(Date tran_due) {
		this.tran_due = tran_due;
	}
	
	@Override
	public String toString() {
		return "TransDetail [tran_num=" + tran_num + ", tran_account=" + tran_account + ", tran_out=" + tran_out
				+ ", tran_in=" + tran_in + ", tran_date=" + tran_date + ", tran_amount=" + tran_amount + ", tran_bank="
				+ tran_bank + ", c_id=" + c_id + ", tran_type=" + tran_type + ", tran_code=" + tran_code
				+ ", tran_afterAmount=" + tran_afterAmount + ", tran_loanAmount=" + tran_loanAmount + ", tran_due="
				+ tran_due + "]";
	}
}
