package com.luv2code.jsf.jdbc;

import java.util.Arrays;
import java.util.List;

import javax.faces.bean.ManagedBean;


@ManagedBean
public class Student {
	
	private StudentDbUtil studentDbUtil;
	

	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String dateCreated;
	private String address;
	private String gender;
	private String birthday;
	private String contactNo;
	private String civilStatus;
	private String favoriteSubject;
	
	private List<String> selectedItems; // Note: List<String> and thus NOT String!
	private List<String> availableItems;
	
	public Student() throws Exception {
		studentDbUtil = StudentDbUtil.getInstance();
	}
	
	public Student(int id, String firstName, String lastName, String email, String dateCreated, String address, String gender, String birthday, String contactNo, String civilStatus, String favoriteSubject) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.dateCreated = dateCreated;
		this.address = address;
		this.gender = gender;
		this.birthday = birthday;
		this.contactNo = contactNo;
		this.civilStatus = civilStatus;
		this.favoriteSubject = favoriteSubject;
		
		
		try {
			availableItems = getAvailableItems();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void setSelectedItems(List<String> selectedItems) {
		this.selectedItems = selectedItems;
	}
	
	public List<String> getAvailableItems(){

		try {
			availableItems = studentDbUtil.getSubjects();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return availableItems;
	}
	
	public List<String> getSelectedItems() {
		return selectedItems;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getCivilStatus() {
		return civilStatus;
	}

	public void setCivilStatus(String civilStatus) {
		this.civilStatus = civilStatus;
	}

	public String getFavoriteSubject() {
		if (selectedItems == null) {
			return favoriteSubject;
		} else {
			return String.join(", ", selectedItems);
		}
	}

	public void setFavoriteSubject(String favoriteSubject) {
		if (favoriteSubject == null) {
		String result = String.join(", ", selectedItems);
		this.favoriteSubject = result;
		} else {
			this.favoriteSubject = favoriteSubject;
		}
	}


	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", dateCreated=" + dateCreated + ", address=" + address + ", gender=" + gender + ", birthday="
				+ birthday + ", contactNo=" + contactNo + ", civilStatus=" + civilStatus + ", favoriteSubject="
				+ favoriteSubject + "]";
	}

}
