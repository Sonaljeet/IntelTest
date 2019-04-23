package com.IntelliTest.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class GetFeatureFileDataWebDatabase {
	private static Connection con = null;
	private static Statement st = null;
	private static ResultSet rs = null;

	static {
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String connectionURL = "jdbc:sqlserver://SONU\\SQLEXPRESS;"
				+ "databaseName=template_it;integratedSecurity=true";
		try {
			System.load("C:/IntelliTest/intellitest/sqljdbc_6.2/enu/auth/x64/sqljdbc_auth.dll");
			Class.forName(driverName);
			con = DriverManager.getConnection(connectionURL);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//Get Test Case Name and Description
	public static Map<String,String> getNameAndDesc(String testID) {
		Map<String,String> data = new HashMap<String,String>();
		String sql = "select * from testcase where TestUID='"+testID+"'";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				data.put(rs.getString("Name"), rs.getString("Description"));
			}
			return data;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	//Get Test Steps Data for particular test case
	public static ResultSet getTestStepsDetails(String testID) {
		String sql = "Select * from "+testID+"stepsweb";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
