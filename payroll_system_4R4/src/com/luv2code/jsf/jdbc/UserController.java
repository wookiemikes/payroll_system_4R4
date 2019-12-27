package com.luv2code.jsf.jdbc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class UserController {
	
	private List<User> users;
	private UserDbUtil userDbUtil;
	private Logger logger = Logger.getLogger(getClass().getName());
	
	public UserController() throws Exception {
		users = new ArrayList<>();
		userDbUtil = UserDbUtil.getInstance();
	}
	
	public List<User> getUsers() {
		return users;
	}
	
	public String addUser(User theUser) {
		System.out.println("Test");

		logger.info("Adding user: " + theUser);

		try {
			
			// add student to the database
			userDbUtil.addUser(theUser);
			
		} catch (Exception exc) {
			// send this to server logs
			logger.log(Level.SEVERE, "Error adding user", exc);
			
			// add error message for JSF page
			addErrorMessage(exc);

			return null;
		}
		
		return "login?faces-redirect=true";
	}
	
	public void loadUsers() {

		logger.info("Loading students");
		
		users.clear();

		try {
			
			// get all students from database
			users = userDbUtil.getUsers();
			
		} catch (Exception exc) {
			// send this to server logs
			logger.log(Level.SEVERE, "Error loading students", exc);
			
			// add error message for JSF page
			addErrorMessage(exc);
		}
	}
	
	public String updateUser(User theUser) {

		logger.info("updating User: " + theUser);
		
		try {
			
			// update student in the database
			userDbUtil.updateStudent(theUser);
			
		} catch (Exception exc) {
			// send this to server logs
			logger.log(Level.SEVERE, "Error updating user: " + theUser, exc);
			
			// add error message for JSF page
			addErrorMessage(exc);
			
			return null;
		}
		
		return "list-users?faces-redirect=true";		
	}
	
	public String loadUser(int UserId) {
		
		logger.info("loading User: " + UserId);
		
		try {
			// get student from database
			User theUser = userDbUtil.getUser(UserId);
			

			System.out.println(theUser.toString());
			
			// put in the request attribute ... so we can use it on the form page
			ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();		

			Map<String, Object> requestMap = externalContext.getRequestMap();
			requestMap.put("user", theUser);	
			
		} catch (Exception exc) {
			// send this to server logs
			logger.log(Level.SEVERE, "Error loading User id:" + UserId, exc);
			
			// add error message for JSF page
			addErrorMessage(exc);
			
			return null;
		}
		return "update-user-form.xhtml";
	}	
	
	public String deleteUser(int UserId) {

		logger.info("Deleting User id: " + UserId);
		
		try {

			// delete the student from the database
			userDbUtil.deleteUser(UserId);
			
		} catch (Exception exc) {
			// send this to server logs
			logger.log(Level.SEVERE, "Error deleting User id: " + UserId, exc);
			
			// add error message for JSF page
			addErrorMessage(exc);
			
			return null;
		}
		
		return "list-users?faces-redirect=true";	
	}	
	
	private void addErrorMessage(Exception exc) {
		FacesMessage message = new FacesMessage("Error: " + exc.getMessage());
		FacesContext.getCurrentInstance().addMessage(null, message);
	}
		

}
