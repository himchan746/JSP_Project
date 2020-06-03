package productInfo;

import java.sql.Timestamp;

public class ProductInfoDTO {
	private String proId;
	private String proName;
	private int proCount;
	private int proPrice;
	private int proClick;
	private Timestamp proRegTime;
	private byte[] proImg;
	
	public byte[] getProImg() {
		return proImg;
	}
	public void setProImg(byte[] proImg) {
		this.proImg = proImg;
	}
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProCount() {
		return proCount;
	}
	public void setProCount(int proCount) {
		this.proCount = proCount;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getProClick() {
		return proClick;
	}
	public void setProClick(int proClick) {
		this.proClick = proClick;
	}
	public Timestamp getProRegTime() {
		return proRegTime;
	}
	public void setProRegTime(Timestamp proRegTime) {
		this.proRegTime = proRegTime;
	}
	
}
