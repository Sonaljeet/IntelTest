package com.IntelliTest.createFiles;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class CreateJunitRunnerFile {

	public static void createJunitRunnerFile(String testCaseName) {
		try {
			File runner = new File(
					"src/test/java/com/IntelliTest/runner/IntelliTestRunner.java");
			runner.createNewFile();
			FileWriter f = new FileWriter(runner);
			PrintWriter p = new PrintWriter(f);
			p.println("package com.IntelliTest.runner;");
			p.println();
			p.println("import org.junit.runner.RunWith;");
			p.println("import cucumber.api.CucumberOptions;");
			p.println("import cucumber.api.junit.Cucumber;");
			p.println();
			p.println("@RunWith(Cucumber.class)");
			p.printf("@CucumberOptions(features = \"classpath:features/%s.feature\", glue = \"com.IntelliTest.stepdefinitions\", plugin = {\"pretty\", \"html:build/reports\",\"json-pretty:build/reports/cucumber.json\"})",testCaseName);
			p.println();
			p.println("public class IntelliTestRunner {");
			p.println("}");
			p.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
