package com.jsf.test;

import com.jsf.controllerbean.StudentCrud;


import java.util.Scanner;
import java.sql.ResultSet;

public class TestCrud {
	public static void main(String[] args) {
		StudentCrud objTest = new StudentCrud();
		Scanner input = new Scanner(System.in);
		ResultSet result = null;
		int length = 0;
		
		Boolean running = true;
		
	    //objTest.insertStudent("jay", "jabla", "male", "CDO Mindanao", "1998-02-26", "09750458576", "Single", "Snacks");
	    //objTest.updateStudent(2, "Arch Jay", "Jabla", "Male", "Carmen CDO Mindanao", "1998-02-26", "09750458576", "Single", "Snack Jud");
//		objTest.selectStudent(2);
//		objTest.selectAllStudent();
		while (running) {
			System.out.println("Enter your option\n 1 - View all Students \n 2 - View a Student \n 3 - Insert a Student \n 4 - Delete a Student \n 5 - Exit");
			int option = input.nextInt();
			if (option > 5 && option < 0) {
				System.out.println("Error out of range");
			} else {
				if(option == 5) {
					running = false;
				}
				
				switch(option) {
				
				
				case 1 : objTest.selectAllStudent(); break;
				
				case 2 : 
					System.out.println("Enter the id of student");
					int id = input.nextInt();
					result = objTest.selectStudent(id);
					try {
						while (result.next()) {
							System.out.println("id - " + result.getString("id"));
							System.out.println("Firstname - " + result.getString("firstName"));
							System.out.println("Lastname - " + result.getString("lastName"));
							System.out.println("Gender - " + result.getString("gender"));
							System.out.println("Address - " + result.getString("address"));
							System.out.println("Birthday - " + result.getString("bday"));
							System.out.println("Contact No - " + result.getString("contactNo"));
							System.out.println("Civil Status - " + result.getString("civilStatus"));
							System.out.println("Favorite Subject - " + result.getString("favoriteSubject"));
						}
					} catch(Exception e) {
						System.out.println(e);
					}
					if (length == 0 ) {
						System.out.println("No student found");
					} 
					length = 0;
					result = null;
					break;
				
				case 3 : 
					//(String firstName, String lastName, String gender, String address, String bday, String contactNo, String civilStatus, String favoriteSubject)
					System.out.println("Enter First name");
					input.nextLine(); 
					String firstName = input.nextLine();
					System.out.println("Enter Last name");
//					input.nextLine(); 
					String lastName = input.nextLine();
					System.out.println("Enter Gender");
//					input.nextLine(); 
					String gender = input.nextLine();
					System.out.println("Enter Address");
//					input.nextLine(); 
					String address = input.nextLine();
					System.out.println("Enter Birthday");
//					input.nextLine(); 
					String bday = input.nextLine();
					System.out.println("Enter Contact Number");
//					input.nextLine(); 
					String contactNo = input.nextLine();
					System.out.println("Enter Civil Status");
//					input.nextLine(); 
					String civilStatus = input.nextLine();
					System.out.println("Enter favorite subject");
//					input.nextLine(); 
					String favoriteSubject = input.nextLine();
					
					Boolean res = objTest.insertStudent(firstName, lastName, gender, address, bday, contactNo, civilStatus, favoriteSubject);
					if (res) 
						System.out.println("Inserted Successfully");
					else 
						System.out.println("Error!");
					break;
				
				
				}
			}
		}
	}
}
