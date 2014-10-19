package com.ntu.auto.magazine.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataSourceUtil {

	private static Connection con = getConnection();
	
	public static Connection getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/automag","root","ROOT");
		}catch(Exception e){
			
		}
		return con;
	}
}
