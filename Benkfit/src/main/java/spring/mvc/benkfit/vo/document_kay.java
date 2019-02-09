package spring.mvc.benkfit.vo;

import java.util.Date;

public class document_kay {
	private String doc_num;/* 서류 번호 */
	private String doc_name; /* 서류 명 */
	private String doc_content; /* 서류 내용 */
	private Date doc_date; /* 서류 날짜 */
	private String c_id; /* 고객 아이디 */
	private String doc_img; /*서류 이미지*/
	
	
	public String getDoc_img() {
		return doc_img;
	}
	public void setDoc_img(String doc_img) {
		this.doc_img = doc_img;
	}
	public String getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(String doc_num) {
		this.doc_num = doc_num;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	public Date getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(Date doc_date2) {
		this.doc_date = doc_date2;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

}
