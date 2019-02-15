package spring.mvc.benkfit.vo;

import java.sql.Date;

public class MySavAccountVO {
	private String mySav_account;
	private String mySav_name;  
	private Date mySav_date; 
	private int mySav_amount; 
	private double mySav_rate; 
	private int mySav_monSaving;
	private String mySav_method; 
	private String mySav_benefit; 
	private double mySav_taxRate; 
	private String c_id; 
	private String sav_num; 
	private String code;
	
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
	public double getMySav_rate() {
		return mySav_rate;
	}
	public void setMySav_rate(double mySav_rate) {
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
	public double getMySav_taxRate() {
		return mySav_taxRate;
	}
	public void setMySav_taxRate(double mySav_taxRate) {
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Override
	public String toString() {
		return "MySavAccountVO [mySav_account=" + mySav_account + ", mySav_name=" + mySav_name + ", mySav_date="
				+ mySav_date + ", mySav_amount=" + mySav_amount + ", mySav_rate=" + mySav_rate + ", mySav_monSaving="
				+ mySav_monSaving + ", mySav_method=" + mySav_method + ", mySav_benefit=" + mySav_benefit
				+ ", mySav_taxRate=" + mySav_taxRate + ", c_id=" + c_id + ", sav_num=" + sav_num + ", code=" + code
				+ "]";
	}
}
