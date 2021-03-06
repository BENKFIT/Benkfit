package spring.mvc.benkfit.vo;

import java.sql.Date;

public class CheqProductVO {
	private String cheq_num;
	private String cheq_name;
	private double cheq_rate;
	private String cheq_type;
	private String cheq_target;
	private Date cheq_regDate;
	private int cheq_limit;
	private String cheq_period;
	
	public String getCheq_num() {
		return cheq_num;
	}
	public void setCheq_num(String cheq_num) {
		this.cheq_num = cheq_num;
	}
	public String getCheq_name() {
		return cheq_name;
	}
	public void setCheq_name(String cheq_name) {
		this.cheq_name = cheq_name;
	}
	public double getCheq_rate() {
		return cheq_rate;
	}
	public void setCheq_rate(double cheq_rate) {
		this.cheq_rate = cheq_rate;
	}
	public String getCheq_type() {
		return cheq_type;
	}
	public void setCheq_type(String cheq_type) {
		this.cheq_type = cheq_type;
	}
	public String getCheq_target() {
		return cheq_target;
	}
	public void setCheq_target(String cheq_target) {
		this.cheq_target = cheq_target;
	}
	
	public Date getCheq_regDate() {
		return cheq_regDate;
	}
	public void setCheq_regDate(Date cheq_regDate) {
		this.cheq_regDate = cheq_regDate;
	}
	
	public int getCheq_limit() {
		return cheq_limit;
	}
	public void setCheq_limit(int cheq_limit) {
		this.cheq_limit = cheq_limit;
	}
	public String getCheq_period() {
		return cheq_period;
	}
	public void setCheq_period(String cheq_period) {
		this.cheq_period = cheq_period;
	}
	@Override
	public String toString() {
		return "CheqProductVO [cheq_num=" + cheq_num + ", cheq_name=" + cheq_name + ", cheq_rate=" + cheq_rate
				+ ", cheq_type=" + cheq_type + ", cheq_target=" + cheq_target + ", cheq_regDate=" + cheq_regDate
				+ ", cheq_limit=" + cheq_limit + ", cheq_period=" + cheq_period + "]";
	}
}
