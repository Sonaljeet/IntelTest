package com.IntelliTest.common;

import java.util.concurrent.TimeUnit;

import org.awaitility.Awaitility;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;

public class CommonFunctions {
	
	public boolean wait(WebElement element) {
		try{
			Awaitility.await().atMost(30,TimeUnit.SECONDS).ignoreException(NoSuchElementException.class)
			.until(() -> element.isDisplayed());
			return true;	
		} catch(Exception e){
			return false;
		}
	}
	
	public static String createTestUID() {
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";
		StringBuilder sb = new StringBuilder(4);
		for (int i = 0; i < 4; i++) {
			int index = (int) (AlphaNumericString.length() * Math.random());
			sb.append(AlphaNumericString.charAt(index));
		}
		return sb.toString();
	}
}
