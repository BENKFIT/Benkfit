package spring.mvc.benkfit.vo;

import java.sql.Date;

public class CardProductVO {
	private String card_num;
	private String card_name;
	private Date card_regDate;
	private String card_content;
	
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public Date getCard_regDate() {
		return card_regDate;
	}
	public void setCard_regDate(Date card_regDate) {
		this.card_regDate = card_regDate;
	}
	public String getCard_content() {
		return card_content;
	}
	public void setCard_content(String card_content) {
		this.card_content = card_content;
	}
	
	@Override
	public String toString() {
		return "CardProductVO [card_num=" + card_num + ", card_name=" + card_name + ", card_regDate=" + card_regDate
				+ ", card_content=" + card_content + "]";
	}
}
