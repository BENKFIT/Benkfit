package spring.mvc.benkfit.vo;

import java.util.Date;

public class documentVO {
	
	private String doc_title; // 서류명
	private String doc_num ; //서류번호
	private Date doc_date ; // 서류등록일
	private String doc_name ; //이름
	private String doc_jumin1 ; // 주민번호1
	private String doc_jumin2 ; // 주민번호1
	private String doc_perAddress;// 개인주소
	private String doc_department ; // 부서(소속)
	private String doc_position; //직위
	private String doc_period_from ;//시작일
	private String doc_period_to ; //종료일
	private String doc_comName ; // 회사명
	private String doc_comAddress ; //회사주소
	private String doc_img; //서류이미지
	private String c_id ;
	
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getDoc_img() {
		return doc_img;
	}
	public void setDoc_img(String doc_img) {
		this.doc_img = doc_img;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	public String getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(String doc_num) {
		this.doc_num = doc_num;
	}
	public Date getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(Date doc_date) {
		this.doc_date = doc_date;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_jumin1() {
		return doc_jumin1;
	}
	public void setDoc_jumin1(String doc_jumin1) {
		this.doc_jumin1 = doc_jumin1;
	}
	public String getDoc_jumin2() {
		return doc_jumin2;
	}
	public void setDoc_jumin2(String doc_jumin2) {
		this.doc_jumin2 = doc_jumin2;
	}
	public String getDoc_perAddress() {
		return doc_perAddress;
	}
	public void setDoc_perAddress(String doc_perAddress) {
		this.doc_perAddress = doc_perAddress;
	}
	public String getDoc_department() {
		return doc_department;
	}
	public void setDoc_department(String doc_department) {
		this.doc_department = doc_department;
	}
	public String getDoc_position() {
		return doc_position;
	}
	public void setDoc_position(String doc_position) {
		this.doc_position = doc_position;
	}
	public String getDoc_period_from() {
		return doc_period_from;
	}
	public void setDoc_period_from(String doc_period_from) {
		this.doc_period_from = doc_period_from;
	}
	public String getDoc_period_to() {
		return doc_period_to;
	}
	public void setDoc_period_to(String doc_period_to) {
		this.doc_period_to = doc_period_to;
	}
	public String getDoc_comName() {
		return doc_comName;
	}
	public void setDoc_comName(String doc_comName) {
		this.doc_comName = doc_comName;
	}
	public String getDoc_comAddress() {
		return doc_comAddress;
	}
	public void setDoc_comAddress(String doc_comAddress) {
		this.doc_comAddress = doc_comAddress;
	}

}
