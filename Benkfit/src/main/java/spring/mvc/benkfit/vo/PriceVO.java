package spring.mvc.benkfit.vo;

public class PriceVO {
	private String name;
	private double marketprice;
	private String changeNum;
	private String changePer;
	private long sort_amount;
	private String total;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getMarketprice() {
		return marketprice;
	}
	public void setMarketprice(double marketprice) {
		this.marketprice = marketprice;
	}
	public String getChangeNum() {
		return changeNum;
	}
	public void setChangeNum(String changeNum) {
		this.changeNum = changeNum;
	}
	public String getChangePer() {
		return changePer;
	}
	public void setChangePer(String changePer) {
		this.changePer = changePer;
	}
	public long getSort_amount() {
		return sort_amount;
	}
	public void setSort_amount(long sort_amount) {
		this.sort_amount = sort_amount;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	
	@Override
	public String toString() {
		return "PriceVO [name=" + name + ", marketprice=" + marketprice + ", changeNum=" + changeNum + ", changePer="
				+ changePer + ", sort_amount=" + sort_amount + ", total=" + total + "]";
	}
	
}
