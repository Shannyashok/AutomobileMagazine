package com.ntu.auto.magazine.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ntu.auto.magazine.filter.SearchFilter;
import com.ntu.auto.magazine.model.AdvStatisticsHolder;
import com.ntu.auto.magazine.model.Advertisement;
import com.ntu.auto.magazine.model.Enquiry;
import com.ntu.auto.magazine.model.Package;
import com.ntu.auto.magazine.model.Seller;
import com.ntu.auto.magazine.util.DataSourceUtil;

public class AutomobileDaoImpl implements AutomobileDao {

	private Connection con;
	private PreparedStatement pst;
	private ResultSet rst;
	
	public Connection getCon() {
		if(con == null){
			con = DataSourceUtil.getConnection();
		}
		return con;
	}

	@Override
	public List<Advertisement> getAllAdvertisements() {
		List<Advertisement> advList = new ArrayList<Advertisement>();
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement("SELECT adv_id,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available,seller_id,package_code FROM advertisement order by post_dt desc");
				rst = pst.executeQuery();
				while(rst.next()){
					Advertisement adv = new Advertisement();
					adv.setAdvId(rst.getLong("adv_id"));
					/*adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));*/
					adv.setTitle(rst.getString("title"));
					adv.setMake(rst.getString("make"));
					adv.setModel(rst.getString("model"));
					adv.setModelNumber(rst.getString("model_no"));
					adv.setMakeYear(rst.getString("make_year"));
					adv.setRegisteredYear(rst.getString("reg_year"));
					adv.setPrice(rst.getDouble("price"));
					adv.setAdditionalInfo(rst.getString("additional_info"));
					adv.setApproved(rst.getInt("approved"));
					adv.setPostedDate(rst.getDate("post_dt"));
					adv.setPublishDate(rst.getDate("publish_dt"));
					adv.setCategory(rst.getString("category"));
					adv.setGear(rst.getString("gear"));
					adv.setEngineCapacity(rst.getInt("engine_capacity"));
					adv.setMileage(rst.getInt("mileage"));
					adv.setAvailable(rst.getInt("available"));
					adv.setSellerId(rst.getInt("seller_id"));
					adv.setCode(rst.getString("package_code"));
					advList.add(adv);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return advList;
	}

	@Override
	public List<Advertisement> getLatestAdvertisements() {
		List<Advertisement> advList = new ArrayList<Advertisement>();
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement("SELECT adv_id,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available,seller_id,package_code FROM advertisement  WHERE publish_dt is not null order by publish_dt limit 0,4");
				rst = pst.executeQuery();
				while(rst.next()){
					Advertisement adv = new Advertisement();
					adv.setAdvId(rst.getLong("adv_id"));
					/*adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));*/
					adv.setTitle(rst.getString("title"));
					adv.setMake(rst.getString("make"));
					adv.setModel(rst.getString("model"));
					adv.setModelNumber(rst.getString("model_no"));
					adv.setMakeYear(rst.getString("make_year"));
					adv.setRegisteredYear(rst.getString("reg_year"));
					adv.setPrice(rst.getDouble("price"));
					adv.setAdditionalInfo(rst.getString("additional_info"));
					adv.setApproved(rst.getInt("approved"));
					adv.setPostedDate(rst.getDate("post_dt"));
					adv.setPublishDate(rst.getDate("publish_dt"));
					adv.setCategory(rst.getString("category"));
					adv.setGear(rst.getString("gear"));
					adv.setEngineCapacity(rst.getInt("engine_capacity"));
					adv.setMileage(rst.getInt("mileage"));
					adv.setAvailable(rst.getInt("available"));
					adv.setSellerId(rst.getInt("seller_id"));
					adv.setCode(rst.getString("package_code"));
					advList.add(adv);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return advList;
	}

	@Override
	public Advertisement getAdvertisementById(long advId) {
		con = DataSourceUtil.getConnection();
		Advertisement adv = new Advertisement();
		if(con != null){
			try{
				pst = con.prepareStatement("SELECT adv_id,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available,seller_id,package_code FROM advertisement WHERE adv_id=?");
				pst.setLong(1, advId);
				rst = pst.executeQuery();
				while(rst.next()){
					adv.setAdvId(rst.getLong("adv_id"));
					/*adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));*/
					adv.setTitle(rst.getString("title"));
					adv.setMake(rst.getString("make"));
					adv.setModel(rst.getString("model"));
					adv.setModelNumber(rst.getString("model_no"));
					adv.setMakeYear(rst.getString("make_year"));
					adv.setRegisteredYear(rst.getString("reg_year"));
					adv.setPrice(rst.getDouble("price"));
					adv.setAdditionalInfo(rst.getString("additional_info"));
					adv.setApproved(rst.getInt("approved"));
					adv.setPostedDate(rst.getDate("post_dt"));
					adv.setPublishDate(rst.getDate("publish_dt"));
					adv.setCategory(rst.getString("category"));
					adv.setGear(rst.getString("gear"));
					adv.setEngineCapacity(rst.getInt("engine_capacity"));
					adv.setAvailable(rst.getInt("available"));
					adv.setMileage(rst.getInt("mileage"));
					adv.setSellerId(rst.getInt("seller_id"));
					adv.setCode(rst.getString("package_code"));
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		
		}
		return adv;
	}

	@Override
	public void addAdvertisement(Advertisement adv) {
		con = DataSourceUtil.getConnection();
		//long advId = getNextAdvId();
		String sql ="INSERT INTO advertisement(adv_id,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,category,engine_capacity,gear,mileage,available,seller_id,package_code)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,NOW(),?,?,?,?,?,?,?)";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setLong(1, adv.getAdvId());
				/*pst.setString(2, adv.getName());
				pst.setString(3, adv.getEmail());
				pst.setString(4, adv.getContact());
				pst.setString(5, adv.getAddress());
				pst.setString(6, adv.getLocation());*/
				pst.setString(2, adv.getTitle());
				pst.setString(3, adv.getMake());
				pst.setString(4, adv.getModel());
				pst.setString(5, adv.getModelNumber());
				pst.setString(6, adv.getMakeYear());
				pst.setString(7, adv.getRegisteredYear());
				pst.setDouble(8, adv.getPrice());
				pst.setString(9, adv.getAdditionalInfo());
				pst.setInt(10, 0);
				pst.setString(11, adv.getCategory());
				pst.setInt(12, adv.getEngineCapacity());
				pst.setString(13, adv.getGear());
				pst.setInt(14, adv.getMileage());
				pst.setInt(15, adv.getAvailable());
				pst.setInt(16, adv.getSellerId());
				pst.setString(17, adv.getCode());
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void updateAdvertisement(Advertisement adv) {
		con = DataSourceUtil.getConnection();
		String sql = "update advertisement set title=?, make=?, model=?, model_no=?, make_year=?, reg_year=?, price=?, additional_info=?, "
				+ "category=?, engine_capacity=?, gear=?, mileage=?, available=?, seller_id= ?, package_code= ? where adv_id =?";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				/*pst.setString(1, adv.getName());
				pst.setString(2, adv.getEmail());
				pst.setString(3, adv.getContact());
				pst.setString(4, adv.getAddress());
				pst.setString(5, adv.getLocation());*/
				pst.setString(1, adv.getTitle());
				pst.setString(2, adv.getMake());
				pst.setString(3, adv.getModel());
				pst.setString(4, adv.getModelNumber());
				pst.setString(5, adv.getMakeYear());
				pst.setString(6, adv.getRegisteredYear());
				pst.setDouble(7, adv.getPrice());
				pst.setString(8, adv.getAdditionalInfo());
				pst.setString(9, adv.getCategory());
				pst.setInt(10, adv.getEngineCapacity());
				pst.setString(11, adv.getGear());
				pst.setInt(12, adv.getMileage());
				pst.setInt(13, adv.getAvailable());
				pst.setInt(14, adv.getSellerId());
				pst.setString(15, adv.getCode());
				pst.setLong(16, adv.getAdvId());
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void deleteAdvertisement(long advId) {
		con = DataSourceUtil.getConnection();
		String sql = "delete from advertisement where adv_id=?";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setLong(1, advId);
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}

	}
	
	public long getNextAdvId(Connection con){
		long advId = 0;
		if(con != null){
			try {
				pst = con.prepareStatement("SELECT max(adv_id) + 1 as advid from advertisement");
				rst = pst.executeQuery();
				while(rst.next()){
					advId = rst.getLong("advid");
				}
				pst.close();
				rst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return advId;
	}
	
	public long getNextAdvId(){
		long advId = 1;
		con = DataSourceUtil.getConnection();
		if(con != null){
			try {
				pst = con.prepareStatement("SELECT max(adv_id) + 1 as advid from advertisement");
				rst = pst.executeQuery();
				while(rst.next()){
					advId = rst.getLong("advid");
				}
				pst.close();
				rst.close();
				if(advId == 0){
					advId = 1;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return advId;
	}

	@Override
	public List<Advertisement> searchAdvertisements(SearchFilter filter, boolean isAdmin) {
		List<Advertisement> advList = new ArrayList<Advertisement>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT adv_id,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available FROM advertisement ");
		if(isAdmin){
			sql.append(" WHERE title is not null ");
		}else{
			sql.append(" WHERE publish_dt is not null ");
		}
		if(filter!=null){
			//sql.append(" WHERE publish_dt is not null ");
			if(!"".equals(filter.getCategory())){
				sql.append(" AND category="+"'"+filter.getCategory()+"'");
			}
			if(!"".equals(filter.getMake())){
				sql.append(" AND make="+"'"+filter.getMake()+"'");
			}
			if(!"".equals(filter.getModel())){
				sql.append(" AND model="+"'"+filter.getModel()+"'");
			}
			if(!"".equals(filter.getMakeYear())){
				sql.append(" AND make_year="+"'"+filter.getMakeYear()+"'");
			}
			if(!"".equals(filter.getRegisteredYear())){
				sql.append(" AND reg_year="+"'"+filter.getRegisteredYear()+"'");
			}
			if(!"".equals(filter.getEngineCapacity())){
				sql.append(" AND engine_capacity <="+"'"+filter.getEngineCapacity()+"'");
			}
			if(!"".equals(filter.getPrice())){
				sql.append(" AND price <="+"'"+filter.getPrice()+"'");
			}
			if(!"".equals(filter.getMileage())){
				sql.append(" AND mileage <="+"'"+filter.getMileage()+"'");
			}
			if(!"".equals(filter.getGear())){
				sql.append(" AND gear ="+"'"+filter.getGear()+"'");
			}
			if(!"".equals(filter.getApproved())){
				sql.append(" AND approved ="+"'"+filter.getApproved()+"'");
			}
			if(!"".equals(filter.getStatus())){
				sql.append(" AND available ="+"'"+filter.getStatus()+"'");
			}
			if(!"".equals(filter.getPostDate())){
				sql.append(" AND post_dt BETWEEN "+"STR_TO_DATE('"+filter.getPostDate()+" 00:00:00','%m/%d/%Y %H:%i:%s') AND STR_TO_DATE('"+filter.getPostDate()+" 23:59:59','%m/%d/%Y %H:%i:%s')");
			}
		}
		sql.append(" order by post_dt desc");
		System.out.println(sql.toString());
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement(sql.toString());
				rst = pst.executeQuery();
				while(rst.next()){
					Advertisement adv = new Advertisement();
					adv.setAdvId(rst.getLong("adv_id"));
					/*adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));*/
					adv.setTitle(rst.getString("title"));
					adv.setMake(rst.getString("make"));
					adv.setModel(rst.getString("model"));
					adv.setModelNumber(rst.getString("model_no"));
					adv.setMakeYear(rst.getString("make_year"));
					adv.setRegisteredYear(rst.getString("reg_year"));
					adv.setPrice(rst.getDouble("price"));
					adv.setAdditionalInfo(rst.getString("additional_info"));
					adv.setApproved(rst.getInt("approved"));
					adv.setPostedDate(rst.getDate("post_dt"));
					adv.setPublishDate(rst.getDate("publish_dt"));
					adv.setCategory(rst.getString("category"));
					adv.setGear(rst.getString("gear"));
					adv.setEngineCapacity(rst.getInt("engine_capacity"));
					adv.setMileage(rst.getInt("mileage"));
					adv.setAvailable(rst.getInt("available"));
					advList.add(adv);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return advList;
	}

	@Override
	public void publishAdvertisement(long advId) {
		con = DataSourceUtil.getConnection();
		String sql = "update advertisement set approved=1, publish_dt = now() where adv_id=?";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setLong(1, advId);
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void unPublishAdvertisement(long advId) {
		con = DataSourceUtil.getConnection();
		String sql = "update advertisement set approved=0, publish_dt = null where adv_id=?";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setLong(1, advId);
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public AdvStatisticsHolder getAdvertisementStatistics() {
		AdvStatisticsHolder holder = new AdvStatisticsHolder();
		con = DataSourceUtil.getConnection();
		String sql = "select approved, count(1) as count from advertisement group by approved";
		if(con != null){
			try {
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				Map<String, Integer> approved = new HashMap<String, Integer>();
				while(rst.next()){
					approved.put(rst.getString("approved"), rst.getInt("count"));
				}
				pst.close();
				rst.close();
				sql = "select available, count(1) as count from advertisement group by available";
				Map<String, Integer> available = new HashMap<String, Integer>();
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					available.put(rst.getString("available"), rst.getInt("count"));
				}
				pst.close();
				rst.close();
				sql = "select category, count(1) as count from advertisement group by category order by category";
				Map<String, Integer> category = new HashMap<String, Integer>();
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					category.put(rst.getString("category"), rst.getInt("count"));
				}
				pst.close();
				rst.close();
				sql = "select make, count(1) as count from advertisement group by make order by make";
				Map<String, Integer> make = new HashMap<String, Integer>();
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					make.put(rst.getString("make"), rst.getInt("count"));
				}
				pst.close();
				rst.close();
				sql = "select gear, count(1) as count from advertisement group by gear order by gear";
				Map<String, Integer> gear = new HashMap<String, Integer>();
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					gear.put(rst.getString("gear"), rst.getInt("count"));
				}
				pst.close();
				rst.close();
				sql = "select count(*) from advertisement";
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					holder.setTotalAdsCount(rst.getInt(1));
				}
				pst.close();
				rst.close();
				sql = "select count(*) from enquiry";
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					holder.setEnquiryCount(rst.getInt(1));
				}
				pst.close();
				rst.close();
				sql = "select SUM(PKG.PRICE) from advertisement adv inner join package pkg on adv.package_code = pkg.code";
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					holder.setTotalRevenue(rst.getDouble(1));
				}
				pst.close();
				rst.close();
				holder.setCategory(category);
				holder.setGear(gear);
				holder.setMake(make);
				holder.setPublish(approved);
				holder.setStatus(available);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return holder;
	}

	@Override
	public Seller getSellerById(int sellerId) {
		Seller seller = new Seller();
		con = DataSourceUtil.getConnection();
		String sql = "SELECT seller_id,name,email,contact,address,location,nric FROM seller where seller_id=?";
		if(con !=null ){
			try{
				pst = con.prepareStatement(sql);
				pst.setInt(1, sellerId);
				rst = pst.executeQuery();
				while(rst.next()){
					seller.setSellerId(rst.getInt("seller_id"));
					seller.setName(rst.getString("name"));
					seller.setEmail(rst.getString("email"));
					seller.setContact(rst.getString("contact"));
					seller.setAddress(rst.getString("address"));
					seller.setLocation(rst.getString("location"));
					seller.setNric(rst.getString("nric"));
				}
				pst.close();
				rst.close();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return seller;
	}

	@Override
	public Package getPackageById(int id) {
		Package pkg = new Package();
		con = DataSourceUtil.getConnection();
		String sql = "SELECT package_id,code,name,price,active,note FROM package where package_id = ?";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setInt(1, id);
				rst = pst.executeQuery();
				while(rst.next()){
					pkg.setPackageId(rst.getInt("package_id"));
					pkg.setCode(rst.getString("code"));
					pkg.setName(rst.getString("name"));
					pkg.setPrice(rst.getDouble("price"));
					pkg.setExpire(rst.getInt("active"));
					pkg.setNote(rst.getString("note"));
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return pkg;
	}

	@Override
	public List<Package> getAllPackages() {
		List<Package> list = new ArrayList<Package>();
		String sql = "SELECT package_id,code,name,price,active FROM package where active = 1";
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					Package pkg = new Package();
					pkg.setPackageId(rst.getInt("package_id"));
					pkg.setCode(rst.getString("code"));
					pkg.setName(rst.getString("name"));
					pkg.setPrice(rst.getDouble("price"));
					pkg.setExpire(rst.getInt("active"));
					list.add(pkg);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public void addPackage(Package pkg) {
		String sql = "INSERT INTO package (package_id,code,name,price,active,created_dt)VALUES(?,?,?,?,1,now())";
		String sql1 = "SELECT MAX(package_id) + 1 as next from package";
		int nextId = 1;
		con = DataSourceUtil.getConnection();
		if(con != null){
			try {
				pst = con.prepareStatement(sql1);
				rst = pst.executeQuery();
				while(rst.next()){
					nextId = rst.getInt("next");
				}
				pst.close();
				rst.close();
				pst = con.prepareStatement(sql);
				pst.setInt(1, nextId);
				pst.setString(2, pkg.getCode());
				pst.setString(3, pkg.getName());
				pst.setDouble(4, pkg.getPrice());
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void updatePackage(Package pkg) {
		String sql = "UPDATE package SET name = ?, price = ?, note= ? WHERE package_id = ?";
		con = DataSourceUtil.getConnection();
		if(con != null){
			try {
				pst = con.prepareStatement(sql);
				pst.setString(1, pkg.getName());
				pst.setDouble(2, pkg.getPrice());
				pst.setString(3, pkg.getNote());
				pst.setInt(4, pkg.getPackageId());
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public void deletePackage(int id) {
		String sql = "UPDATE package SET active=0 WHERE package_id = ?";
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setInt(1, id);
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void addSeller(Seller seller) {
		String sql = "select max(seller_id) + 1 as next from seller";
		String sql1 = "INSERT INTO seller(seller_id,name,email,contact,address,location, nric) VALUES (?,?,?,?,?,?,?)";
		int nextId = 1;
		con = DataSourceUtil.getConnection();
		if(con != null){
			try {
				/*pst = con.prepareStatement(sql);
				rst = pst.executeQuery();
				while(rst.next()){
					nextId = rst.getInt("next");
				}
				pst.close();
				rst.close();*/
				pst = con.prepareStatement(sql1);
				pst.setInt(1, seller.getSellerId());
				//pst.setInt(1, nextId);
				pst.setString(2, seller.getName());
				pst.setString(3, seller.getEmail());
				pst.setString(4, seller.getContact());
				pst.setString(5, seller.getAddress());
				pst.setString(6, seller.getLocation());
				pst.setString(7, seller.getNric());
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void updateSeller(Seller seller) {
		String sql ="UPDATE seller SET name = ?, email = ?, contact = ?, address = ?, location = ?, nric = ? WHERE seller_id = ?";
		con = DataSourceUtil.getConnection();
		if(con != null){
			try {
				pst = con.prepareStatement(sql);
				pst.setString(1, seller.getName());
				pst.setString(2, seller.getEmail());
				pst.setString(3, seller.getContact());
				pst.setString(4, seller.getAddress());
				pst.setString(5, seller.getLocation());
				pst.setString(6, seller.getNric());
				pst.setInt(7, seller.getSellerId());
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void deleteSeller(int id) {
		String sql = "DELETE FROM seller where seller_id=?";
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setInt(1, id);
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void addEnquiry(Enquiry enq) {
		String sql = "INSERT INTO enquiry (id, nature, name, email, contact, comments, created_dt) VALUES (?, ?, ?, ?, ?, ?, now())";
		String sql1 = "SELECT MAX(id) +1 as next from enquiry";
		int nextId =1;
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement(sql1);
				rst = pst.executeQuery();
				while(rst.next()){
					nextId = rst.getInt("next");
				}
				pst.close();
				rst.close();
				pst = con.prepareStatement(sql);
				pst.setInt(1, nextId);
				pst.setString(2, enq.getNature());
				pst.setString(3, enq.getName());
				pst.setString(4, enq.getEmail());
				pst.setString(5, enq.getContact());
				pst.setString(6, enq.getComments());
				pst.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public int getNextSellerId() {
		int nextId = 1;
		con = DataSourceUtil.getConnection();
		if(con != null){
			try {
				pst = con.prepareStatement("select max(seller_id) + 1 as next from seller");
				rst = pst.executeQuery();
				while(rst.next()){
					nextId = rst.getInt("next");
				}
				pst.close();
				rst.close();
				if(nextId == 0){
					nextId = 1;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return nextId;
	}

	@Override
	public String getAdminLogin(String user) {
		String sql = "SELECT password from login where user=? and role='admin'";
		String pwd = null;
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setString(1, user);
				rst = pst.executeQuery();
				while(rst.next()){
					pwd = rst.getString(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return pwd;
	}
}
