package com.ntu.auto.magazine.dao;

import java.util.List;

import com.ntu.auto.magazine.filter.SearchFilter;
import com.ntu.auto.magazine.model.AdvStatisticsHolder;
import com.ntu.auto.magazine.model.Advertisement;
import com.ntu.auto.magazine.model.Enquiry;
import com.ntu.auto.magazine.model.Seller;
import com.ntu.auto.magazine.model.Package;

public interface AutomobileDao {

	List<Advertisement> getAllAdvertisements();
	List<Advertisement> getLatestAdvertisements();
	Advertisement getAdvertisementById(long advId);
	void addAdvertisement(Advertisement adv);
	void updateAdvertisement(Advertisement adv);
	void deleteAdvertisement(long advId);
	long getNextAdvId();
	List<Advertisement> searchAdvertisements(SearchFilter filter, boolean isAdmin);
	void publishAdvertisement(long advId);
	void unPublishAdvertisement(long advId);
	AdvStatisticsHolder getAdvertisementStatistics();
	
	Seller getSellerById(int sellerId);
	Package getPackageById(int id);
	List<Package> getAllPackages();
	void addPackage(Package pkg);
	void updatePackage(Package pkg);
	void deletePackage(int id);
	
	void addSeller(Seller seller);
	void updateSeller(Seller seller);
	void deleteSeller(int id);
	
	void addEnquiry(Enquiry enq);
	int getNextSellerId();
	
	String getAdminLogin(String user);
}
