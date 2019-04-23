package com.IntelliTest.Database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.IntelliTest.createFiles.CreateFeatureFileWeb;
import com.IntelliTest.createFiles.CreateJunitRunnerFile;
import com.IntelliTest.createFiles.CreatePageActionMobile;
import com.IntelliTest.createFiles.CreatePageActionWeb;

import static com.IntelliTest.common.CommonFunctions.createTestUID;

public class AddTestCaseServletMobile extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static Connection con = null;
	private static Statement st = null;

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
	//will update later
//	public static String createWebTestID() {
//		
//	}
	private static String testUID = createTestUID();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
//		String testID = createWebTestID();
		System.out.println("Inside servlet");
		String testCaseName = request.getParameter("testCaseName");
		String description = request.getParameter("testCaseDesc");
		String appType = request.getParameter("appType");
		String [] annotation = request.getParameterValues("annotations");
		String [] operation = request.getParameterValues("operations");
		String [] stepsDesc = request.getParameterValues("stepsDesc");
		String [] locator = request.getParameterValues("locator");
		String [] locatorDest = request.getParameterValues("locatorDestination");
		String [] inputText = request.getParameterValues("userText");
		String [] validationType = request.getParameterValues("validationType");
		String [] mouseAction = request.getParameterValues("mouseType");
		String date = LocalDate.now().toString();
		System.out.println(testCaseName+testUID);
		String sqlOne = "Insert into TestCase values('"+testUID+"','"+testCaseName+"','"+description+"','Mobile','NA',0,0,0,0,0,0,0,0,'Eminem',0,'Vennommmm','N','email@email.com','VX','"+date+"','"+date+"');";
		String sqlTwo = "CREATE TABLE "+testCaseName+testUID+"stepsweb (TestUID varchar(4) Foreign Key References TestCase(TestUID), Annotation varchar(10) NOT NULL, Description varchar(2000) NOT NULL, Operation varchar(25) NOT NULL, ValidationType varchar(200),Locators varchar(200), LocatorsDestination varchar(200), UserText varchar(500), MouseAction varchar(100), Status varchar(10), StartTime date NOT NULL, EndTime date NOT NULL);";
		try {
			st = con.createStatement();
			st.executeUpdate(sqlOne);
			st.executeUpdate(sqlTwo);
			for(int i=0;i<annotation.length;i++){
			String sqlThree = "Insert into "+testCaseName+testUID+"stepsweb values('"+testUID+"','"+annotation[i]+"','"+stepsDesc[i]+"','"+operation[i]+"','"+validationType[i]+"','"+locator[i]+"','"+locatorDest[i]+"','"+inputText[i]+"','"+mouseAction[i]+"','N','"+date+"','"+date+"');";
			st.executeUpdate(sqlThree);
			}
			response.sendRedirect("AddWebTC.jsp");
			System.out.println("Inside servlet");
			CreateJunitRunnerFile.createJunitRunnerFile(testCaseName);
			CreateFeatureFileWeb.createFeatureFile(testCaseName,description,annotation,stepsDesc);
			CreatePageActionMobile.createFile(appType,testCaseName, annotation, stepsDesc,operation,locator,locatorDest,validationType,mouseAction,inputText);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

}
