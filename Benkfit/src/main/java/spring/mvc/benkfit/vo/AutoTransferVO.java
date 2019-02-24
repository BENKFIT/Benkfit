package spring.mvc.benkfit.vo;

public class AutoTransferVO {
	
	private String auto_from;	//받는 계정
	private String auto_to;		//보내는 계정
	private int auto_value;		//금액
	private String c_id;		//등록한 id
	private int auto_date;		//자동이체 날짜
	private int auto_num; 		//시퀀스
	private String auto_file; 	//privateKey 파일
	private String auto_pwd; 		//비밀번호
	
	public String getAuto_from() {
		return auto_from;
	}
	public void setAuto_from(String auto_from) {
		this.auto_from = auto_from;
	}
	public String getAuto_to() {
		return auto_to;
	}
	public void setAuto_to(String auto_to) {
		this.auto_to = auto_to;
	}
	public int getAuto_value() {
		return auto_value;
	}
	public void setAuto_value(int auto_value) {
		this.auto_value = auto_value;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getAuto_date() {
		return auto_date;
	}
	public void setAuto_date(int auto_date) {
		this.auto_date = auto_date;
	}
	public int getAuto_num() {
		return auto_num;
	}
	public void setAuto_num(int auto_num) {
		this.auto_num = auto_num;
	}
	public String getAuto_file() {
		return auto_file;
	}
	public void setAuto_file(String auto_file) {
		this.auto_file = auto_file;
	}
	public String getAuto_pwd() {
		return auto_pwd;
	}
	public void setAuto_pwd(String auto_pwd) {
		this.auto_pwd = auto_pwd;
	}
	@Override
	public String toString() {
		return "AutoTransferVO [auto_from=" + auto_from + ", auto_to=" + auto_to + ", auto_value=" + auto_value
				+ ", c_id=" + c_id + ", auto_date=" + auto_date + ", auto_num=" + auto_num + ", auto_file=" + auto_file
				+ ", auto_pwd=" + auto_pwd + "]";
	}
	
	
}
