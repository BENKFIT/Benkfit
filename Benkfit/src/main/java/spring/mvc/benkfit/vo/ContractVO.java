package spring.mvc.benkfit.vo;

public class ContractVO {
	private String con_name;
	private String con_address;
	private String con_deployDate;
	
	public String getCon_name() {
		return con_name;
	}
	public void setCon_name(String con_name) {
		this.con_name = con_name;
	}
	public String getCon_address() {
		return con_address;
	}
	public void setCon_address(String con_address) {
		this.con_address = con_address;
	}
	public String getCon_deployDate() {
		return con_deployDate;
	}
	public void setCon_deployDate(String con_deployDate) {
		this.con_deployDate = con_deployDate;
	}
	
	@Override
	public String toString() {
		return "ContractVO [con_name=" + con_name + ", con_address=" + con_address + ", con_deployDate="
				+ con_deployDate + "]";
	}
}
