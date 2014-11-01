package com.ntu.auto.magazine.model;

import java.util.Map;

public class AdvStatisticsHolder {

	private Map<String, Integer> status;
	private Map<String, Integer> publish;
	private Map<String, Integer> category;
	private Map<String, Integer> make;
	private Map<String, Integer> gear;
	private int enquiryCount;
	private int totalAdsCount;
	private double totalRevenue;
	
	public Map<String, Integer> getStatus() {
		return status;
	}
	public void setStatus(Map<String, Integer> status) {
		this.status = status;
	}
	public Map<String, Integer> getPublish() {
		return publish;
	}
	public void setPublish(Map<String, Integer> publish) {
		this.publish = publish;
	}
	public Map<String, Integer> getCategory() {
		return category;
	}
	public void setCategory(Map<String, Integer> category) {
		this.category = category;
	}
	public Map<String, Integer> getMake() {
		return make;
	}
	public void setMake(Map<String, Integer> make) {
		this.make = make;
	}
	public Map<String, Integer> getGear() {
		return gear;
	}
	public void setGear(Map<String, Integer> gear) {
		this.gear = gear;
	}
	public int getEnquiryCount() {
		return enquiryCount;
	}
	public void setEnquiryCount(int enquiryCount) {
		this.enquiryCount = enquiryCount;
	}
	
	public int getTotalAdsCount() {
		return totalAdsCount;
	}
	public void setTotalAdsCount(int totalAdsCount) {
		this.totalAdsCount = totalAdsCount;
	}
	public double getTotalRevenue() {
		return totalRevenue;
	}
	public void setTotalRevenue(double totalRevenue) {
		this.totalRevenue = totalRevenue;
	}
}
