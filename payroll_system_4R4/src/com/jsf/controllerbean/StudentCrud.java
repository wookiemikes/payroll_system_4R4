package com.jsf.controllerbean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jsf.demo.*;

public class StudentCrud {
	private String firstName, lastName, gender,address,bday,contactNo,civilStatus,favoriteSubject;
	
	// view all students
	public void selectAllStudent() {
		DB_Connection dbConnect = new DB_Connection();
		Connection connect = dbConnect.get_connection();
		PreparedStatement preStmt = null;
		ResultSet resSet = null;
		
		try {
			String query = "select * from students";
			preStmt = connect.prepareStatement(query);
			resSet = preStmt.executeQuery();
			
			while(resSet.next()) {
				System.out.println("id - " + resSet.getString("id"));
				System.out.println("Firstname - " + resSet.getString("firstName"));
				System.out.println("Lastname - " + resSet.getString("lastName"));
				System.out.println("Gender - " + resSet.getString("gender"));
				System.out.println("Address - " + resSet.getString("address"));
				System.out.println("Birthday - " + resSet.getString("bday"));
				System.out.println("Contact No - " + resSet.getString("contactNo"));
				System.out.println("Civil Status - " + resSet.getString("civilStatus"));
				System.out.println("Favorite Subject - " + resSet.getString("favoriteSubject"));
			}
		} catch (Exception e) {
			System.out.println("Error Message: "+ e);
		}
		
	}
	
	
	// List Specific Student
	public ResultSet selectStudent(int id) {
		DB_Connection dbConnect = new DB_Connection();
		Connection connect = dbConnect.get_connection();
		PreparedStatement preStmt = null;
		ResultSet resSet = null;
		
		try {
			String query = "select * from students where id = '" + id + "'";
			preStmt = connect.prepareStatement(query);
			resSet = preStmt.executeQuery();
		} catch (Exception e) {
			System.out.println("Error Message: "+ e);
		}

		return resSet;
	}
	
	// Insert Student
	public boolean insertStudent(String firstName, String lastName, String gender, String address, String bday, String contactNo, String civilStatus, String favoriteSubject) {
		DB_Connection dbConnect = new DB_Connection();
		Connection connect = dbConnect.get_connection();
		PreparedStatement preStmt = null;
		try {
			String query = "insert into students(firstName,lastName,gender,address,bday,contactNo,civilStatus,favoriteSubject) values (?,?,?,?,?,?,?,?)";
			preStmt = connect.prepareStatement(query);
			preStmt.setString(1,firstName);
			preStmt.setString(2,lastName);
			preStmt.setString(3,gender);
			preStmt.setString(4, address);
			preStmt.setString(5, bday);
			preStmt.setString(6, contactNo);
			preStmt.setString(7, civilStatus);
			preStmt.setString(8, favoriteSubject);
			System.out.println(preStmt);
			preStmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("Error Message: "+ e);
			return false;
		}
	}
	
	// Update Student
		public void updateStudent(int id,String firstName, String lastName, String gender, String address, String bday, String contactNo, String civilStatus, String favoriteSubject) {
			DB_Connection dbConnect = new DB_Connection();
			Connection connect = dbConnect.get_connection();
			PreparedStatement preStmt = null;
			try {
				String query = "update students set firstName = ?, lastname = ?, gender = ? , address = ? , bday = ? , contactNo = ? , civilStatus = ? , favoriteSubject = ? where id = ?";
				preStmt = connect.prepareStatement(query);
				preStmt.setString(1,firstName);
				preStmt.setString(2,lastName);
				preStmt.setString(3,gender);
				preStmt.setString(4, address);
				preStmt.setString(5, bday);
				preStmt.setString(6, contactNo);
				preStmt.setString(7, civilStatus);
				preStmt.setString(8, favoriteSubject);
				preStmt.setInt(9, id);
				System.out.println(preStmt);
				preStmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("Error Message: "+ e);
			}
		}
		
		// Delete Student
			public void deleteStudent(int id) {
				DB_Connection dbConnect = new DB_Connection();
				Connection connect = dbConnect.get_connection();
				PreparedStatement preStmt = null;
				try {
					String query = "delete from students where id = ?";
					preStmt = connect.prepareStatement(query);
					preStmt.setInt(1, id);
					System.out.println(preStmt);
					preStmt.executeUpdate();
						
				} catch (Exception e) {
					System.out.println("Error Message: "+ e);
				}
			}
	
	
}
