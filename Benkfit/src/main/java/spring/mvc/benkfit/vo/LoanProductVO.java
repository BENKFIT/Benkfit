package spring.mvc.benkfit.vo;

import java.sql.Date;

public class LoanProductVO {
	private String loan_num;				//대출상품번호
	private String loan_name;				//대출이름
	private int loan_amount;				//대출금액
	private String loan_period;				//대출기간
	private double loan_overrate;			//대출연체금리
	private double loan_rate;				//대출금리
	private int loan_moderate;				//중도상환
	private String loan_target;				//가입대상
	private String loan_reMethod;			//상환방법
	private String loan_payMethod;			//이자납입방법
	private Date loan_regDate;				//가입날짜
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
	public String getLoan_reMethod() {
		return loan_reMethod;
	}
	public void setLoan_reMethod(String loan_reMethod) {
		this.loan_reMethod = loan_reMethod;
	}
	public String getLoan_payMethod() {
		return loan_payMethod;
	}
	public void setLoan_payMethod(String loan_payMethod) {
		this.loan_payMethod = loan_payMethod;
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
				+ ", loan_moderate=" + loan_moderate + ", loan_target=" + loan_target + ", loan_reMethod="
				+ loan_reMethod + ", loan_payMethod=" + loan_payMethod + ", loan_regDate=" + loan_regDate + "]";
	}
	

}
