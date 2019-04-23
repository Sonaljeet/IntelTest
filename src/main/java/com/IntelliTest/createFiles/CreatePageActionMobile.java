package com.IntelliTest.createFiles;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class CreatePageActionMobile {
	private static File action = null;
	private static FileWriter f;
	private static PrintWriter p;

 public static void createFile(String appType, String testCaseName, String[] annotation, String[] stepsDesc, String[] operation,
			String[] locator, String[] locatorDest, String[] validationType, String[] mouseAction, String[] inputText)
			throws IOException {
		action = new File("src/main/java/com/IntelliTest/stepdefinitions/"
				+ testCaseName + "Steps.java");
		action.createNewFile();
		f = new FileWriter(action);
		p = new PrintWriter(f);
		System.out.println("Inside create action file");
		addDataMobile(appType,testCaseName, annotation, stepsDesc, operation, locator, locatorDest, validationType,
				mouseAction, inputText);
	}

	public static void addDataMobile(String appType,String testCaseName, String[] annotation, String[] stepsDesc,
			String[] operation, String[] locator, String[] locatorDest, String[] validationType, String[] mouseAction,
			String[] inputText) {
		try {
			p.println("package com.IntelliTest.stepdefinitions;");
			p.println();
			p.println("import org.springframework.beans.factory.annotation.Autowired;");
			p.println("import org.springframework.beans.factory.annotation.Value;");
			p.println("import org.springframework.test.context.ContextConfiguration;");
			if(appType.equalsIgnoreCase("MobileWeb"))
				p.println("import com.IntelliTest.config.AppConfigMobileWeb;");
			else if(appType.equalsIgnoreCase("Native"))
				p.println("import com.IntelliTest.config.AppConfigNative;");
			p.println("import cucumber.api.java.en.Given;");
			p.println("import cucumber.api.java.en.When;");
			p.println("import cucumber.api.java.en.Then;");
			p.println("import cucumber.api.java.en.And;");
			p.println("import org.openqa.selenium.WebElement;");
			p.println("import org.openqa.selenium.WebDriver;");
			p.println("import org.openqa.selenium.By;");
			p.println();
			if(appType.equalsIgnoreCase("MobileWeb"))
				p.println("@ContextConfiguration(classes = AppConfigMobileWeb.class)");
			else if(appType.equalsIgnoreCase("Native"))
				p.println("@ContextConfiguration(classes = AppConfigNative.class)");
			p.println("public class " + testCaseName + "Steps {");
			p.println();
			p.println("@Autowired");
			p.println("private WebDriver driver;");
			p.println("@Value(\"${driver.path}\")");
			p.println("private String driverPath;");
			p.println();
			p.println();
			for (int i = 0; i < annotation.length; i++) {
				p.println("@" + annotation[i] + "(\"^" + stepsDesc[i] + "$\")");
				String description = stepsDesc[i].replace(" ", "_").toLowerCase();
				p.println("public static void " + description + "() throws Exception {");
				p.println("driver.manage().window().maximize();");
				String op = operation[i].toLowerCase();
				switch (op) {
				case "navigate":
					addCodeForNavigate(locator[i]);
					break;
				case "validate":
					addCodeForValidate(validationType[i],locator[i]);
					break;
				case "enter text":
					addCodeForEnterText(locator[i],inputText[i]);
					break;
				case "mouse events":
					addCodeForMouseEvents(mouseAction[i],locator[i],locatorDest[i]);
					break;
				}
				p.println("}");
			}
			p.println("}");
			p.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void addCodeForNavigate(String url) {
		try{
			p.printf("driver.get(\"%s\");",url);
			p.println();
			p.printf("if(driver.getCurrentUrl().equalsIgnoreCase(\"%s\"))",url);
			p.println();
			p.println("System.out.println(\"PASS\");");
			p.println("else");
			p.println("System.out.println(\"FAIL\");");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void addCodeForValidate(String type, String locator) {
		try{
			if(type.equalsIgnoreCase("IS DISPLAYED")){
				p.printf("WebElement validateElement1 = driver.findElement(By.xpath(\"%s\"));", locator);
				p.println();
				p.println("if(validateElement1.isDisplayed())");
				p.println();
				p.println("System.out.println(\"PASS\");");
				p.println("else");
				p.println("System.out.println(\"FAIL\");");
			} 
			else if(type.equalsIgnoreCase("ISN'T DISPLAYED")){
				p.printf("WebElement validateElement2 = driver.findElement(By.xpath(\"%s\"));", locator);
				p.println();
				p.println("if(validateElement2.isDisplayed())");
				p.println();
				p.println("System.out.println(\"FAIL\");");
				p.println("else");
				p.println("System.out.println(\"PASS\");");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void addCodeForEnterText(String locator,String text) {
		p.printf("WebElement enterTextElement = driver.findElement(By.xpath(\"%s\"));", locator);
		p.println();
		p.printf("enterTextElement.sendKeys(\"%s\")",text);
	}
	
	public static void addCodeForMouseEvents(String mouseAction,String locator, String locatorDest) {
		try{
			if(mouseAction.equalsIgnoreCase("click")){
				p.printf("WebElement mouseClickElement = driver.findElement(By.xpath(\"%s\"));", locator);
				p.println("Actions action = new Actions(driver);");
				p.println("action.moveToElement(mouseClickElement).click().build().perform();");
			}
			else if(mouseAction.equalsIgnoreCase("Drag and Drop")){
				p.printf("WebElement dragFromElement = driver.findElement(By.xpath(\"%s\"));", locator);
				p.printf("WebElement dragToElement = driver.findElement(By.xpath(\"%s\"));", locatorDest);
				p.println("Actions action = new Actions(driver);");
				p.println("action.dragAndDrop(dragFromElement,dragToElement).perform();");
			}

		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
