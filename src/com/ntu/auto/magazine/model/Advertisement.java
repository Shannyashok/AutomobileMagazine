package com.ntu.auto.magazine.model;

import java.io.InputStream;
import java.sql.Blob;
import java.util.Date;

public class Advertisement {

	private long advId;
	private String name;
	private String email;
	private String contact;
	private String address;
	private String location;
	private String title;
	private String make;
	private String model;
	private String modelNumber;
	private String makeYear;
	private String registeredYear;
	private double price;
	private InputStream photo1;
	private InputStream photo2;
	private InputStream photo3;
	private InputStream photo4;
	private String additionalInfo;
	private int approved;
	private Date postedDate;
	private Date publishDate;
	private String category;
	private int engineCapacity;
	private String gear;
	private int mileage;
	
	public Advertisement() {
		this.advId = 0;
		this.name = "";
		this.email = "";
		this.contact = "";
		this.address = "";
		this.location = "";
		this.title = "";
		this.make = "";
		this.model = "";
		this.modelNumber = "";
		this.makeYear = "";
		this.registeredYear = "";
		this.price = 0;
		this.photo1 = null;
		this.photo2 = null;
		this.photo3 = null;
		this.photo4 = null;
		this.additionalInfo = "";
		this.approved = 0;
		this.postedDate = null;
		this.publishDate = null;
		this.category = "";
		this.engineCapacity = 0;
		this.gear = "";
		this.mileage = 0;
	}
	
	public long getAdvId() {
		return advId;
	}
	public void setAdvId(long advId) {
		this.advId = advId;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getModelNumber() {
		return modelNumber;
	}
	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}
	public String getMakeYear() {
		return makeYear;
	}
	public void setMakeYear(String makeYear) {
		this.makeYear = makeYear;
	}
	public String getRegisteredYear() {
		return registeredYear;
	}
	public void setRegisteredYear(String registeredYear) {
		this.registeredYear = registeredYear;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public InputStream getPhoto1() {
		return photo1;
	}
	public void setPhoto1(InputStream photo1) {
		this.photo1 = photo1;
	}
	public InputStream getPhoto2() {
		return photo2;
	}
	public void setPhoto2(InputStream photo2) {
		this.photo2 = photo2;
	}
	public InputStream getPhoto3() {
		return photo3;
	}
	public void setPhoto3(InputStream photo3) {
		this.photo3 = photo3;
	}
	public InputStream getPhoto4() {
		return photo4;
	}
	public void setPhoto4(InputStream photo4) {
		this.photo4 = photo4;
	}
	public String getAdditionalInfo() {
		return additionalInfo;
	}
	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}
	public int getApproved() {
		return approved;
	}
	public void setApproved(int approved) {
		this.approved = approved;
	}
	public Date getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getEngineCapacity() {
		return engineCapacity;
	}
	public void setEngineCapacity(int engineCapacity) {
		this.engineCapacity = engineCapacity;
	}
	public String getGear() {
		return gear;
	}
	public void setGear(String gear) {
		this.gear = gear;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Advertisement [advId=");
		builder.append(advId);
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
		builder.append(", title=");
		builder.append(title);
		builder.append(", make=");
		builder.append(make);
		builder.append(", model=");
		builder.append(model);
		builder.append(", modelNumber=");
		builder.append(modelNumber);
		builder.append(", makeYear=");
		builder.append(makeYear);
		builder.append(", registeredYear=");
		builder.append(registeredYear);
		builder.append(", price=");
		builder.append(price);
		builder.append(", photo1=");
		builder.append(photo1);
		builder.append(", photo2=");
		builder.append(photo2);
		builder.append(", photo3=");
		builder.append(photo3);
		builder.append(", photo4=");
		builder.append(photo4);
		builder.append(", additionalInfo=");
		builder.append(additionalInfo);
		builder.append(", approved=");
		builder.append(approved);
		builder.append(", postedDate=");
		builder.append(postedDate);
		builder.append(", publishDate=");
		builder.append(publishDate);
		builder.append(", category=");
		builder.append(category);
		builder.append(", engineCapacity=");
		builder.append(engineCapacity);
		builder.append(", gear=");
		builder.append(gear);
		builder.append(", mileage=");
		builder.append(mileage);
		builder.append("]");
		return builder.toString();
	}
}
