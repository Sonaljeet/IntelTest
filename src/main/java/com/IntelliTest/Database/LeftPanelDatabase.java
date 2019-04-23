package com.IntelliTest.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class LeftPanelDatabase {
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

	public static int getDashBoardCount() {

		int total = 0;
		String sql = "Select SUM((api_pass+api_fail+api_inprogress+web_pass+web_fail+web_inprogress+android_pass+android_fail+android_inprogress+ios_pass+ios_fail+ios_inprogress)) as Total from Dashboard";
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

	public static int getAPICount() {

		int total = 0;
		String sql = "Select count(Type) as Total from TestCase where Type='API';";
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

	public static int getWebCount() {

		int total = 0;
		String sql = "Select count(Type) as Total from TestCase where Type='Web';";
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

	public static int getMobileCount() {

		int total = 0;
		String sql = "Select count(Type) as Total from TestCase where Type='Mobile';";
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
	
	public static int getBugCount() {
		int total = 0;
		String sql = "Select Count(BugUID) as Total from Bug;";
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
}
