package com.luv2code.jsf.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDbUtil {

	private static UserDbUtil instance;
	private DataSource dataSource;
	private String jndiName = "java:comp/env/jdbc/student_tracker";
	
	public static UserDbUtil getInstance() throws Exception {
		if (instance == null) {
			instance = new UserDbUtil();
		}
		
		return instance;
	}
	
	private UserDbUtil() throws Exception {		
		dataSource = getDataSource();
	}

	private DataSource getDataSource() throws NamingException {
		Context context = new InitialContext();
		
		DataSource theDataSource = (DataSource) context.lookup(jndiName);
		
		return theDataSource;
	}
	
	public void addUser(User theUser) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();

			String sql = "insert into user (firstname, lastname, username, password) values (?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setString(1, theUser.getFirstname());
			myStmt.setString(2, theUser.getLastname());
			myStmt.setString(3, theUser.getUsername());
			myStmt.setString(4, theUser.getPassword());
			
			myStmt.execute();			
		}
		finally {
			close (myConn, myStmt);
		}
		
	}
	
	public List<User> getUsers() throws Exception {

		List<User> users = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = getConnection();

			String sql = "select * from user order by id asc";

			myStmt = myConn.createStatement();

			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String username = myRs.getString("username");
				String password = myRs.getString("password");
				String firstname = myRs.getString("firstname");
				String lastname = myRs.getString("lastname");
				
				
				// create new student object
				User tempUser = new User(id, username, password, firstname, lastname);

				// add it to the list of students
				users.add(tempUser);
			}
			return users;		
			
		}
		finally {
			close (myConn, myStmt, myRs);
		}
	}
	
	public boolean getUser(String username, String password) throws Exception {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		boolean result = false;
		
		System.out.println("FINDING");
		
		try {
			myConn = getConnection();

			String sql = "select * from user where username=? AND password=?";

			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setString(1, username);
			myStmt.setString(2, password);
			
			myRs = myStmt.executeQuery();

			
			if (myRs.next()) {
				result = true;
			} 
			else {
				result = false;
				throw new Exception("Could not find user");
			}

			return result;
		}
		finally {
			close (myConn, myStmt, myRs);
		}
	}
	
	public void updateStudent(User theUser) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();

			String sql = "update user "
					+ " set firstname=?, lastname=?, username=?, password=?"
					+ " where id=?";

		myStmt = myConn.prepareStatement(sql);

		// set params
		myStmt.setString(1, theUser.getFirstname());
		myStmt.setString(2, theUser.getLastname());
		myStmt.setString(3, theUser.getUsername());
		myStmt.setString(4, theUser.getPassword());
		myStmt.setInt(5, theUser.getId());
			
			
			myStmt.execute();
		}
		finally {
			close (myConn, myStmt);
		}
		
	}
	
	public User getUser(int UserId) throws Exception {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = getConnection();

			String sql = "select * from user where id=?";

			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, UserId);
			
			myRs = myStmt.executeQuery();

			User theUser = null;
			
			// retrieve data from result set row
			if (myRs.next()) {
				int id = myRs.getInt("id");
				String username = myRs.getString("username");
				String password = myRs.getString("password");
				String firstname = myRs.getString("firstname");
				String lastname = myRs.getString("lastname");

				// create new student object
				theUser = new User(id, username, password, firstname, lastname);
			}
			else {
				throw new Exception("Could not find user id: " + UserId);
			}

			return theUser;
		}
		finally {
			close (myConn, myStmt, myRs);
		}
	}
	
	public void deleteUser(int UserId) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();

			String sql = "delete from user where id=?";

			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, UserId);
			
			myStmt.execute();
		}
		finally {
			close (myConn, myStmt);
		}		
	}	
	
	
	
	private Connection getConnection() throws Exception {

		Connection theConn = dataSource.getConnection();
		
		return theConn;
	}
	
	private void close(Connection theConn, Statement theStmt) {
		close(theConn, theStmt, null);
	}
	
	private void close(Connection theConn, Statement theStmt, ResultSet theRs) {

		try {
			if (theRs != null) {
				theRs.close();
			}

			if (theStmt != null) {
				theStmt.close();
			}

			if (theConn != null) {
				theConn.close();
			}
			
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}	
}