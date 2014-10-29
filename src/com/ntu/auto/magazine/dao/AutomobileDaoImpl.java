package com.ntu.auto.magazine.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ntu.auto.magazine.filter.SearchFilter;
import com.ntu.auto.magazine.model.Advertisement;
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
				pst = con.prepareStatement("SELECT adv_id,name,email,contact,address,location,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available FROM advertisement order by post_dt desc");
				rst = pst.executeQuery();
				while(rst.next()){
					Advertisement adv = new Advertisement();
					adv.setAdvId(rst.getLong("adv_id"));
					adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));
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
	public List<Advertisement> getLatestAdvertisements() {
		List<Advertisement> advList = new ArrayList<Advertisement>();
		con = DataSourceUtil.getConnection();
		if(con != null){
			try{
				pst = con.prepareStatement("SELECT adv_id,name,email,contact,address,location,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available FROM advertisement  WHERE publish_dt is not null order by publish_dt limit 0,4");
				rst = pst.executeQuery();
				while(rst.next()){
					Advertisement adv = new Advertisement();
					adv.setAdvId(rst.getLong("adv_id"));
					adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));
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
	public Advertisement getAdvertisementById(long advId) {
		con = DataSourceUtil.getConnection();
		Advertisement adv = new Advertisement();
		if(con != null){
			try{
				pst = con.prepareStatement("SELECT adv_id,name,email,contact,address,location,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available FROM advertisement WHERE adv_id=?");
				pst.setLong(1, advId);
				rst = pst.executeQuery();
				while(rst.next()){
					adv.setAdvId(rst.getLong("adv_id"));
					adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));
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
		String sql ="INSERT INTO advertisement(adv_id,name,email,contact,address,location,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,category,engine_capacity,gear,mileage,available)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),?,?,?,?,?)";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setLong(1, adv.getAdvId());
				pst.setString(2, adv.getName());
				pst.setString(3, adv.getEmail());
				pst.setString(4, adv.getContact());
				pst.setString(5, adv.getAddress());
				pst.setString(6, adv.getLocation());
				pst.setString(7, adv.getTitle());
				pst.setString(8, adv.getMake());
				pst.setString(9, adv.getModel());
				pst.setString(10, adv.getModelNumber());
				pst.setString(11, adv.getMakeYear());
				pst.setString(12, adv.getRegisteredYear());
				pst.setDouble(13, adv.getPrice());
				pst.setString(14, adv.getAdditionalInfo());
				pst.setInt(15, 0);
				pst.setString(16, adv.getCategory());
				pst.setInt(17, adv.getEngineCapacity());
				pst.setString(18, adv.getGear());
				pst.setInt(19, adv.getMileage());
				pst.setInt(20, adv.getAvailable());
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
		String sql = "update advertisement set name=?, email=?, contact=?, address=?, location=?, title=?, make=?, model=?, model_no=?, make_year=?, reg_year=?, price=?, additional_info=?, "
				+ "category=?, engine_capacity=?, gear=?, mileage=?, available=? where adv_id =?";
		if(con != null){
			try{
				pst = con.prepareStatement(sql);
				pst.setString(1, adv.getName());
				pst.setString(2, adv.getEmail());
				pst.setString(3, adv.getContact());
				pst.setString(4, adv.getAddress());
				pst.setString(5, adv.getLocation());
				pst.setString(6, adv.getTitle());
				pst.setString(7, adv.getMake());
				pst.setString(8, adv.getModel());
				pst.setString(9, adv.getModelNumber());
				pst.setString(10, adv.getMakeYear());
				pst.setString(11, adv.getRegisteredYear());
				pst.setDouble(12, adv.getPrice());
				pst.setString(13, adv.getAdditionalInfo());
				pst.setString(14, adv.getCategory());
				pst.setInt(15, adv.getEngineCapacity());
				pst.setString(16, adv.getGear());
				pst.setInt(17, adv.getMileage());
				pst.setInt(18, adv.getAvailable());
				pst.setLong(19, adv.getAdvId());
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
		long advId = 0;
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
		sql.append("SELECT adv_id,name,email,contact,address,location,title,make,model,model_no,make_year,reg_year,price,additional_info,approved,post_dt,publish_dt,category,engine_capacity,gear,mileage,available FROM advertisement ");
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
					adv.setName(rst.getString("name"));
					adv.setEmail(rst.getString("email"));
					adv.setContact(rst.getString("contact"));
					adv.setAddress(rst.getString("address"));
					adv.setLocation(rst.getString("location"));
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

}
