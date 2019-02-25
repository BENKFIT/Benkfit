package spring.mvc.benkfit.vo;

import java.sql.Date;

public class DateVO {
	
	private Date start_day;
	private Date end_day;
	
	public DateVO() {
	}
	public DateVO(Date start_day, Date end_day) {
		this.start_day = start_day;
		this.end_day = end_day;
	}
	public Date getStart_day() {
		return start_day;
	}
	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}
	public Date getEnd_day() {
		return end_day;
	}
	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}
	@Override
	public String toString() {
		return "DateVO [start_day=" + start_day + ", end_day=" + end_day + "]";
	}
	
	

}
