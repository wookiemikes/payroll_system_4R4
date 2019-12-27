package com.luv2code.jsf.jdbc;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


@ManagedBean
@SessionScoped
public class User implements Serializable {

	private UserDbUtil userDbUtil;
	
	private int id;
	private String username, password, firstname, lastname;
	public boolean isLogged = false;
	
	public User() throws Exception {
		userDbUtil = UserDbUtil.getInstance();
	}
	
	public User(int id, String username, String password , String firstname, String lastname) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	public String action() {
		try {
			isLogged = userDbUtil.getUser(this.username, this.password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		isLogged = true;
		System.out.print(isLogged);
		return "menu.xhtml?faces-redirect=true";
	}

	@Override
	public String toString() {
		return "User [userDbUtil=" + userDbUtil + ", id=" + id + ", username=" + username + ", password=" + password
				+ ", firstname=" + firstname + ", lastname=" + lastname + ", isLogged=" + isLogged + "]";
	}
	
	
	
	
	
}
