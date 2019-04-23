package com.IntelliTest.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;

public class AddTestCase_Database extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
	
	public static String createWebTestID() {
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";
		StringBuilder sb = new StringBuilder(4);
		for (int i = 0; i < 4; i++) {
			int index = (int) (AlphaNumericString.length() * Math.random());
			sb.append(AlphaNumericString.charAt(index));
		}
		return sb.toString();
	}
	
	public static int insertWebData(String testID) {
		String sql = "Select Count(TestID) as Total from TestCase;";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}	

}
