/*2019-01-25 손유정*/

package spring.mvc.benkfit.vo;

import java.sql.Date;

// 2019-01-25 
public class UsersVO {
	private String c_id; 	 	/* 고객 아이디 */
	private String c_pwd;		/* 고객 비밀번호 */
	private String c_name; 		/* 고객 이름 */
	private String c_address;   /* 고객 주소 */
	private String c_post; 		/* 고객 우편번호 */
	private String c_hp; 		/* 고객 폰번호 */
	private String c_jumin1; 	/* 고객 주민번호1 */
	private String c_jumin2; 	/* 고객 주민번호2 */
	private String c_email; 	/* 고객 이메일 */
	private Date c_regDate; 	/* 고객 가입날짜 */
	private String c_level; 	/* 고객 등급 */
	private String c_idCard;    /* 신분증 */
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pwd() {
		return c_pwd;
	}
	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_post() {
		return c_post;
	}
	public void setC_post(String c_post) {
		this.c_post = c_post;
	}
	public String getC_hp() {
		return c_hp;
	}
	public void setC_hp(String c_hp) {
		this.c_hp = c_hp;
	}
	public String getC_jumin1() {
		return c_jumin1;
	}
	public void setC_jumin1(String c_jumin1) {
		this.c_jumin1 = c_jumin1;
	}
	public String getC_jumin2() {
		return c_jumin2;
	}
	public void setC_jumin2(String c_jumin2) {
		this.c_jumin2 = c_jumin2;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public Date getC_regDate() {
		return c_regDate;
	}
	public void setC_regDate(Date c_regDate) {
		this.c_regDate = c_regDate;
	}
	public String getC_level() {
		return c_level;
	}
	public void setC_level(String c_level) {
		this.c_level = c_level;
	}
	public String getC_idCard() {
		return c_idCard;
	}
	public void setC_idCard(String c_idCard) {
		this.c_idCard = c_idCard;
	}
	
	@Override
	public String toString() {
		return "Users [c_id=" + c_id + ", c_pwd=" + c_pwd + ", c_name=" + c_name + ", c_address=" + c_address
				+ ", c_post=" + c_post + ", c_hp=" + c_hp + ", c_jumin1=" + c_jumin1 + ", c_jumin2=" + c_jumin2
				+ ", c_email=" + c_email + ", c_regDate=" + c_regDate
				+ ", c_level=" + c_level + ", c_idCard=" + c_idCard + "]";
	}
}
