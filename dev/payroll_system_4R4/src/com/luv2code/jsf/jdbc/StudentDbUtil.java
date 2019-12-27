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

public class StudentDbUtil {

	private static StudentDbUtil instance;
	private DataSource dataSource;
	private String jndiName = "java:comp/env/jdbc/student_tracker";
	
	public static StudentDbUtil getInstance() throws Exception {
		if (instance == null) {
			instance = new StudentDbUtil();
		}
		
		return instance;
	}
	
	private StudentDbUtil() throws Exception {		
		dataSource = getDataSource();
	}

	private DataSource getDataSource() throws NamingException {
		Context context = new InitialContext();
		
		DataSource theDataSource = (DataSource) context.lookup(jndiName);
		
		return theDataSource;
	}
	
	public List<String> getSubjects() throws Exception {

		List<String> subjects = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = getConnection();

			String sql = "select * from subjects";

			myStmt = myConn.createStatement();

			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String subject_name = myRs.getString("subject_name");
				
				
				// create new student object
				// add it to the list of students
				System.out.println(subject_name);
				subjects.add(subject_name);
				}
			return subjects;	
			
		}
		finally {
			close (myConn, myStmt, myRs);
		}
			
		}
		
	public List<Student> getStudents() throws Exception {

		List<Student> students = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = getConnection();

			String sql = "select * from student order by id asc";

			myStmt = myConn.createStatement();

			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				String timestamp = myRs.getString("dateCreated");
				String address = myRs.getString("address");
				String gender = myRs.getString("gender");
				String birthday = myRs.getString("birthday");
				String contactNo = myRs.getString("contactNo");
				String civilStatus = myRs.getString("civilStatus");
				String favoriteSubject = myRs.getString("favoriteSubject");
				
				
				// create new student object
				Student tempStudent = new Student(id, firstName, lastName,
						email, timestamp, address, gender, birthday, contactNo, civilStatus, favoriteSubject);

				// add it to the list of students
				students.add(tempStudent);
			}
			return students;		
			
		}
		finally {
			close (myConn, myStmt, myRs);
		}
	}

	public void addStudent(Student theStudent) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();

			String sql = "insert into student (first_name, last_name, email, address, gender, birthday, contactNo, civilStatus, favoriteSubject) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getEmail());
			myStmt.setString(4, theStudent.getAddress());
			myStmt.setString(5, theStudent.getGender());
			myStmt.setString(6, theStudent.getBirthday());
			myStmt.setString(7, theStudent.getContactNo());
			myStmt.setString(8, theStudent.getCivilStatus());
			myStmt.setString(9, theStudent.getFavoriteSubject());
			
			myStmt.execute();			
		}
		finally {
			close (myConn, myStmt);
		}
		
	}
	
	public void addSubject(String subject_name) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();

			String sql = "insert into subjects (subject_name) values (?)";

			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setString(1, subject_name);
			
			myStmt.execute();			
		}
		finally {
			close (myConn, myStmt);
		}
		
	}
	
	public Student getStudent(int studentId) throws Exception {
	
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = getConnection();

			String sql = "select * from student where id=?";

			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, studentId);
			
			myRs = myStmt.executeQuery();

			Student theStudent = null;
			
			// retrieve data from result set row
			if (myRs.next()) {
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				String timestamp = myRs.getString("dateCreated");
				String address = myRs.getString("address");
				String gender = myRs.getString("gender");
				String birthday = myRs.getString("birthday");
				String contactNo = myRs.getString("contactNo");
				String civilStatus = myRs.getString("civilStatus");
				String favoriteSubject = myRs.getString("favoriteSubject");

				// create new student object
				theStudent = new Student(id, firstName, lastName,
						email, timestamp, address, gender, birthday, contactNo, civilStatus, favoriteSubject);
			}
			else {
				throw new Exception("Could not find student id: " + studentId);
			}

			return theStudent;
		}
		finally {
			close (myConn, myStmt, myRs);
		}
	}
	
	public void updateStudent(Student theStudent) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();

			String sql = "update student "
					+ " set first_name=?, last_name=?, email=?, address=?, gender=?, birthday=?, contactNo=?, civilStatus=?, favoriteSubject=?"
					+ " where id=?";

		myStmt = myConn.prepareStatement(sql);

		// set params
		myStmt.setString(1, theStudent.getFirstName());
		myStmt.setString(2, theStudent.getLastName());
		myStmt.setString(3, theStudent.getEmail());
		myStmt.setString(4, theStudent.getAddress());
		myStmt.setString(5, theStudent.getGender());
		myStmt.setString(6, theStudent.getBirthday());
		myStmt.setString(7, theStudent.getContactNo());
		myStmt.setString(8, theStudent.getCivilStatus());
		myStmt.setString(9, theStudent.getFavoriteSubject());
		myStmt.setInt(10, theStudent.getId());
			
			
			myStmt.execute();
		}
		finally {
			close (myConn, myStmt);
		}
		
	}
	
	public void deleteStudent(int studentId) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();

			String sql = "delete from student where id=?";

			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, studentId);
			
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
