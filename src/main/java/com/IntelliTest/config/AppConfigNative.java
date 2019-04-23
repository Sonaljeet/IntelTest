package com.IntelliTest.config;

import java.net.URL;

import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.remote.MobileCapabilityType;

@Configuration
@PropertySource("classpath:env/common.properties")
public class AppConfigNative {

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@SuppressWarnings("rawtypes")
	@Bean(destroyMethod = "quit")
	@Autowired
	public static WebDriver androidDriverHybrid(@Value("${driver.path}") String driverPath,@Value("${appiumserver}") String appiumServerURL) {
		try {
			URL url = new URL(appiumServerURL);
			return new AndroidDriver(url,capabilities(driverPath));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	@SuppressWarnings("deprecation")
	public static DesiredCapabilities capabilities(String driverPath) {
		DesiredCapabilities capabilities=new DesiredCapabilities();
        capabilities.setCapability("BROWSER_NAME", "Android");
        capabilities.setCapability(MobileCapabilityType.PLATFORM, Platform.ANDROID);
        capabilities.setCapability("app", "C:/Users/jfundes/Desktop/Workplace/myworkplace.apk"); //need to update apk path
        capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "My mobile");
 		return capabilities;
	}
}
