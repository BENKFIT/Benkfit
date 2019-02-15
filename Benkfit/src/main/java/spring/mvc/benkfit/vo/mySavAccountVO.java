package spring.mvc.benkfit.vo;

import java.sql.Date;

public class mySavAccountVO {
	private String mySav_account; /* 적금 계좌번호 */
	private String mySav_name ;/* 적금 명 */
	private Date mySav_date ;/* 적금 일 */
	private int mySav_amount; /* 적금 금액 */
	private int mySav_rate; /* 적금 연이율 */
	private int mySav_monSaving; /* 월 저축 금액 */
	private String mySav_method; /* 이자 지급방식 */
	private String mySav_benefit ; /* 세금 혜택 */
	private int mySav_taxRate;/* 적금 세율 */
	private String c_id ; /* 고객 아이디 */
	private String  sav_num ;/* 적금 상품번호 */
	
	
	public String getMySav_account() {
		return mySav_account;
	}
	public void setMySav_account(String mySav_account) {
		this.mySav_account = mySav_account;
	}
	public String getMySav_name() {
		return mySav_name;
	}
	public void setMySav_name(String mySav_name) {
		this.mySav_name = mySav_name;
	}
	public Date getMySav_date() {
		return mySav_date;
	}
	public void setMySav_date(Date mySav_date) {
		this.mySav_date = mySav_date;
	}
	public int getMySav_amount() {
		return mySav_amount;
	}
	public void setMySav_amount(int mySav_amount) {
		this.mySav_amount = mySav_amount;
	}
	public int getMySav_rate() {
		return mySav_rate;
	}
	public void setMySav_rate(int mySav_rate) {
		this.mySav_rate = mySav_rate;
	}
	public int getMySav_monSaving() {
		return mySav_monSaving;
	}
	public void setMySav_monSaving(int mySav_monSaving) {
		this.mySav_monSaving = mySav_monSaving;
	}
	public String getMySav_method() {
		return mySav_method;
	}
	public void setMySav_method(String mySav_method) {
		this.mySav_method = mySav_method;
	}
	public String getMySav_benefit() {
		return mySav_benefit;
	}
	public void setMySav_benefit(String mySav_benefit) {
		this.mySav_benefit = mySav_benefit;
	}
	public int getMySav_taxRate() {
		return mySav_taxRate;
	}
	public void setMySav_taxRate(int mySav_taxRate) {
		this.mySav_taxRate = mySav_taxRate;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getSav_num() {
		return sav_num;
	}
	public void setSav_num(String sav_num) {
		this.sav_num = sav_num;
	}
	
}
