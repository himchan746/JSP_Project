package buy;

public class BuyDTO {
	private String cus_id;
	private int pro_id;
	private String pro_name;
	private int pro_count;
	private int price;
	
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getPro_count() {
		return pro_count;
	}
	public void setPro_count(int pro_count) {
		this.pro_count = pro_count;
	}
	
	@Override
	public String toString() {
		return "BuyDTO [cus_id=" + cus_id + ", pro_id=" + pro_id + ", pro_name=" + pro_name + ", pro_count=" + pro_count
				+ ", price=" + price + "]";
	}
}
