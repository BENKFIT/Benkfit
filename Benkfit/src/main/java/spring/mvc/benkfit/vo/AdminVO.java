/*2019-01-31 손유정*/

package spring.mvc.benkfit.vo;

public class AdminVO {
	private String admin_id;
	private String admin_pwd;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	
	
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_pwd=" + admin_pwd + "]";
	}
}
