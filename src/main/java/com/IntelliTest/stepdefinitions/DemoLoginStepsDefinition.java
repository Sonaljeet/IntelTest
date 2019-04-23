package com.IntelliTest.stepdefinitions;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import com.IntelliTest.config.AppConfigWeb;
import cucumber.api.java.en.Given;
import org.openqa.selenium.WebDriver;

@ContextConfiguration(classes = AppConfigWeb.class)
public class DemoLoginStepsDefinition {

@Autowired
private WebDriver driver;

@Value("${url}")
private String url;

@Given("^user is on login page$")
public void user_is_on_login_page() {
driver.manage().window().maximize();
driver.get(url);
if(driver.getCurrentUrl().equalsIgnoreCase("http://google.com"))
System.out.println("PASS");
else
System.out.println("FAIL");
}
}
