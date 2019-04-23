package com.IntelliTest.runner;

import org.junit.runner.RunWith;
import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features = "classpath:features/DemoLogin.feature", glue = "com.IntelliTest.stepdefinitions", plugin = {"pretty", "html:build/reports"})
public class IntelliTestRunner {
}
