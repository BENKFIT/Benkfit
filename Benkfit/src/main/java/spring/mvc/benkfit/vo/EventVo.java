package spring.mvc.benkfit.vo;

import java.sql.Timestamp;
import java.util.Date;

public class EventVo {

	private String eve_num;				// 이벤트 번호
	private String eve_title;  	 		// 이벤트 제목 
	private String eve_content; 		// 이벤트 내용 
	private Date eve_start;		// 이벤트 시작일 
	private Date eve_end; 			// 이벤트 종료일 
	private Timestamp eve_regDate;		// 이벤트 등록일
	private String eve_img;				// 이벤트 이미지
	
	public String getEve_img() {
		return eve_img;
	}
	public void setEve_img(String eve_img) {
		this.eve_img = eve_img;
	}
	public Timestamp getEve_regDate() {
		return eve_regDate;
	}
	public void setEve_regDate(Timestamp eve_regDate) {
		this.eve_regDate = eve_regDate;
	}
	public String getEve_num() {
		return eve_num;
	}
	public void setEve_num(String eve_num) {
		this.eve_num = eve_num;
	}
	public String getEve_title() {
		return eve_title;
	}
	public void setEve_title(String eve_title) {
		this.eve_title = eve_title;
	}
	public String getEve_content() {
		return eve_content;
	}
	public void setEve_content(String eve_content) {
		this.eve_content = eve_content;
	}
	public Date getEve_start() {
		return eve_start;
	}
	public void setEve_start(Date eve_start2) {
		this.eve_start = eve_start2;
	}
	public Date getEve_end() {
		return eve_end;
	}
	public void setEve_end(Date eve_end) {
		this.eve_end = eve_end;
	}
	
	
}
