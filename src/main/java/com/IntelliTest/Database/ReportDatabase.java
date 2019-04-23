package com.IntelliTest.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReportDatabase {
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
			// System.out.println("Connecting");
			con = DriverManager.getConnection(connectionURL);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static int getTestCaseCount() {
		int total = 0;
		String sql = "Select Count(TestID) as Total from TestCase;";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt("Total");
			}
			return total;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static List<String> getTestCaseID() {
		List<String> testCaseID = new ArrayList<String>();
		String sql = "Select TestID from TestCase;";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				testCaseID.add(rs.getString("TestID"));
			}
			return testCaseID;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static int getNumberOfTestSteps(String id) {
		int total = 0;
		String sql = "Select SUM(Pass+Fail+Unknown+Info+Skip+Fatal+Error+Warning) as TotalSteps from TestCase where TestID='"+id+"';";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt("TotalSteps");
			}
			return total;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static String getLastRunDate(String id) {
		String date = null;
		String sql = "Select EndTime from TestCase where TestID='"+id+"';";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				date = rs.getString("EndTime");
			}
			return date;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static int getPassCount(String id) {
		int pass = 0;
		String sql = "Select Pass from TestCase where TestID='"+id+"';";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				pass = rs.getInt("Pass");
			}
			return pass;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int getFailCount(String id) {
		int pass = 0;
		String sql = "Select Fail from TestCase where TestID='"+id+"';";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				pass = rs.getInt("Fail");
			}
			return pass;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static int getSkipCount(String id) {
		int pass = 0;
		String sql = "Select Skip from TestCase where TestID='"+id+"';";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				pass = rs.getInt("Skip");
			}
			return pass;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public static String getDescription(String id) {
		String description = null;
		String sql = "Select Description from TestCase where TestID='"+id+"';";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				description = rs.getString("Description");
			}
			return description;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String getTCName(String id) {
		String name = null;
		String sql = "Select Name from TestCase where TestID='"+id+"';";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				name = rs.getString("Name");
			}
			return name;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
