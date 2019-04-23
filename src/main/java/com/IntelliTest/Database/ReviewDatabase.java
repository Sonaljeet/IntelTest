package com.IntelliTest.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@SuppressWarnings("unused")
public class ReviewDatabase {
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

}
