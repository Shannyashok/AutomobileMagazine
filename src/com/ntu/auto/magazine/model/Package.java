package com.ntu.auto.magazine.model;

public class Package {

	private int packageId;
	private String code;
	private String name;
	private double price;
	private int expire;
	private String note;
	
	public Package() {
		this.packageId = 0;
		this.code = "";
		this.name = "";
		this.price = 0.;
		this.expire = 0;
		this.note = "";
	}
	public int getPackageId() {
		return packageId;
	}
	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getExpire() {
		return expire;
	}
	public void setExpire(int expire) {
		this.expire = expire;
	}
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Package [packageId=");
		builder.append(packageId);
		builder.append(", code=");
		builder.append(code);
		builder.append(", name=");
		builder.append(name);
		builder.append(", price=");
		builder.append(price);
		builder.append(", expire=");
		builder.append(expire);
		builder.append(", note=");
		builder.append(note);
		builder.append("]");
		return builder.toString();
	}
}
