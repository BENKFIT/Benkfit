package spring.mvc.benkfit.vo;

import java.sql.Date;

public class TransdetailVO {
	
	public String tran_num ; //거래번호 
	public String tran_account; //계좌번호
	public String tran_out ; //보내는이
	public String tran_in; //받는이
	public Date tran_date;  //거래일
	public int tran_amount; //거래금액
	public String tran_bank; //거래은행
	public String c_id; 	//id
	public String tran_type; //입.출금타입
	public String tran_code; //예금, 적금, 대출 코드
	
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
	
}
