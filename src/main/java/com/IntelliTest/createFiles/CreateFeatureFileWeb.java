package com.IntelliTest.createFiles;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class CreateFeatureFileWeb {
	
	// create feature file based on testID
	public static void createFeatureFile(String testCaseName,String testCaseDesc,String [] annotation,String [] stepsDesc) throws Exception {
			File feature = new File("C:\\IntelliTest\\intellitest\\src\\test\\resources\\features\\"+testCaseName+".feature");
			feature.createNewFile();
			System.out.println("Inside create feature file");
			addDataToFile(feature,testCaseName,testCaseDesc,annotation,stepsDesc);
		} 
	
	public static void addDataToFile(File feature,String testCaseName, String testCaseDesc, String [] annotation,String [] stepsDesc) {
		try{
			FileWriter f = new FileWriter(feature);
			PrintWriter p = new PrintWriter(f);
			p.println("@default");
			p.printf("Feature: %s",testCaseName);
			p.println();
			p.printf("Scenario: %s",testCaseDesc);
			p.println();
			for(int i=0;i<annotation.length;i++){
				p.printf("%s ", annotation[i]);
				p.printf("%s", stepsDesc[i]);
			}
			p.println();
			System.out.println("Inside create feature file");
			p.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
