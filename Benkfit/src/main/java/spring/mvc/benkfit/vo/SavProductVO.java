package spring.mvc.benkfit.vo;

import java.sql.Date;

public class SavProductVO {
	private String sav_num;
	private String sav_name;
	private int sav_limit;
	private Date sav_regDate;
	private String sav_period;
	private String sav_target;
	private String sav_autotrans;
	private int sav_autoamount;
	private Date sav_autodate;
	private Date sav_autoend;
	
	public String getSav_num() {
		return sav_num;
	}
	public void setSav_num(String sav_num) {
		this.sav_num = sav_num;
	}
	public String getSav_name() {
		return sav_name;
	}
	public void setSav_name(String sav_name) {
		this.sav_name = sav_name;
	}
	public int getSav_limit() {
		return sav_limit;
	}
	public void setSav_limit(int sav_limit) {
		this.sav_limit = sav_limit;
	}
	public Date getSav_regDate() {
		return sav_regDate;
	}
	public void setSav_regDate(Date sav_regDate) {
		this.sav_regDate = sav_regDate;
	}
	public String getSav_period() {
		return sav_period;
	}
	public void setSav_period(String sav_period) {
		this.sav_period = sav_period;
	}
	public String getSav_target() {
		return sav_target;
	}
	public void setSav_target(String sav_target) {
		this.sav_target = sav_target;
	}
	public String getSav_autotrans() {
		return sav_autotrans;
	}
	public void setSav_autotrans(String sav_autotrans) {
		this.sav_autotrans = sav_autotrans;
	}
	public int getSav_autoamount() {
		return sav_autoamount;
	}
	public void setSav_autoamount(int sav_autoamount) {
		this.sav_autoamount = sav_autoamount;
	}
	public Date getSav_autodate() {
		return sav_autodate;
	}
	public void setSav_autodate(Date sav_autodate) {
		this.sav_autodate = sav_autodate;
	}
	public Date getSav_autoend() {
		return sav_autoend;
	}
	public void setSav_autoend(Date sav_autoend) {
		this.sav_autoend = sav_autoend;
	}
	
	@Override
	public String toString() {
		return "SavProductVO [sav_num=" + sav_num + ", sav_name=" + sav_name + ", sav_limit=" + sav_limit
				+ ", sav_regDate=" + sav_regDate + ", sav_period=" + sav_period + ", sav_target=" + sav_target
				+ ", sav_autotrans=" + sav_autotrans + ", sav_autoamount=" + sav_autoamount + ", sav_autodate="
				+ sav_autodate + ", sav_autoend=" + sav_autoend + "]";
	}
}
