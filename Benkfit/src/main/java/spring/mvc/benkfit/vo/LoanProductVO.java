package spring.mvc.benkfit.vo;

import java.sql.Date;

public class LoanProductVO {
	private String loan_num;
	private String loan_name;
	private int loan_amount;
	private String loan_period;
	private double loan_overrate;
	private double loan_rate;
	private int loan_moderate;
	private String loan_target;
	private String loan_remethod;
	private String loan_paymethod;
	private Date loan_regDate;
	
	public String getLoan_num() {
		return loan_num;
	}
	public void setLoan_num(String loan_num) {
		this.loan_num = loan_num;
	}
	public String getLoan_name() {
		return loan_name;
	}
	public void setLoan_name(String loan_name) {
		this.loan_name = loan_name;
	}
	public int getLoan_amount() {
		return loan_amount;
	}
	public void setLoan_amount(int loan_amount) {
		this.loan_amount = loan_amount;
	}
	public String getLoan_period() {
		return loan_period;
	}
	public void setLoan_period(String loan_period) {
		this.loan_period = loan_period;
	}
	public double getLoan_overrate() {
		return loan_overrate;
	}
	public void setLoan_overrate(double loan_overrate) {
		this.loan_overrate = loan_overrate;
	}
	public double getLoan_rate() {
		return loan_rate;
	}
	public void setLoan_rate(double loan_rate) {
		this.loan_rate = loan_rate;
	}
	public int getLoan_moderate() {
		return loan_moderate;
	}
	public void setLoan_moderate(int loan_moderate) {
		this.loan_moderate = loan_moderate;
	}
	public String getLoan_target() {
		return loan_target;
	}
	public void setLoan_target(String loan_target) {
		this.loan_target = loan_target;
	}
	public String getLoan_remethod() {
		return loan_remethod;
	}
	public void setLoan_remethod(String loan_remethod) {
		this.loan_remethod = loan_remethod;
	}
	public String getLoan_paymethod() {
		return loan_paymethod;
	}
	public void setLoan_paymethod(String loan_paymethod) {
		this.loan_paymethod = loan_paymethod;
	}
	
	public Date getLoan_regDate() {
		return loan_regDate;
	}
	public void setLoan_regDate(Date loan_regDate) {
		this.loan_regDate = loan_regDate;
	}
	
	@Override
	public String toString() {
		return "LoanProductVO [loan_num=" + loan_num + ", loan_name=" + loan_name + ", loan_amount=" + loan_amount
				+ ", loan_period=" + loan_period + ", loan_overrate=" + loan_overrate + ", loan_rate=" + loan_rate
				+ ", loan_moderate=" + loan_moderate + ", loan_target=" + loan_target + ", loan_remethod="
				+ loan_remethod + ", loan_paymethod=" + loan_paymethod + ", loan_regDate=" + loan_regDate + "]";
	}
}
