package com.ntu.auto.magazine.model;

public class Seller {

	private int sellerId;
	private String name;
	private String email;
	private String contact;
	private String address;
	private String location;
	private String nric;
	
	
	
	public Seller() {
		super();
		this.sellerId = 0;
		this.name = "";
		this.email = "";
		this.contact = "";
		this.address = "";
		this.location = "";
		this.nric = "";
	}
	public String getNric() {
		return nric;
	}
	public void setNric(String nric) {
		this.nric = nric;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Seller [sellerId=");
		builder.append(sellerId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", email=");
		builder.append(email);
		builder.append(", contact=");
		builder.append(contact);
		builder.append(", address=");
		builder.append(address);
		builder.append(", location=");
		builder.append(location);
		builder.append(", nric=");
		builder.append(nric);
		builder.append("]");
		return builder.toString();
	}
	
}
