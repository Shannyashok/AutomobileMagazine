package com.ntu.auto.magazine.dao;

import java.util.List;

import com.ntu.auto.magazine.filter.SearchFilter;
import com.ntu.auto.magazine.model.Advertisement;

public interface AutomobileDao {

	List<Advertisement> getAllAdvertisements();
	List<Advertisement> getLatestAdvertisements();
	Advertisement getAdvertisementById(long advId);
	void addAdvertisement(Advertisement adv);
	void updateAdvertisement(Advertisement adv);
	void deleteAdvertisement(long advId);
	long getNextAdvId();
	List<Advertisement> searchAdvertisements(SearchFilter filter);
	
}
