package com.wipro.frs.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "FRS_TBL_User_Profile")
public class ProfileBean {

	@Id
	private String userID;
	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z ]{2,}+$", message = "First Name must be of alphabets only and of atleast two characters")
	@Size(max = 32, message = "Size must be less then 32 char")

	private String firstName;
	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z ]{2,}+$", message = "Last name must be of alphabets only and of atleast two characters")
	@Size(max = 32, message = "Size must be less then 32 char")

	private String lastName;

	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Past(message = "Date of Birth can not be greater then current date")

	private Date dateOfBirth;

	@NotEmpty(message = "Please select your gender")

	private String gender;

	@NotNull(message = "Value can not be null")

	private String street;

	@Pattern(regexp = "^[a-zA-Z ]+$", message = "Value must be of alphabets only")
	@Size(max = 32, message = "Size must be less then 32 char")

	private String location;
	@Pattern(regexp = "^[a-zA-Z ]+$", message = "Value must be of alphabets only")

	@Size(max = 32, message = "Size must be less then 32 char")
	private String city;
	@Pattern(regexp = "^[a-zA-Z ]+$", message = "Value must be of alphabets only")

	@Size(max = 32, message = "Size must be less then 32 char")

	private String state;

	@NotEmpty
	@Pattern(regexp = "^[1-9][0-9]{5}$", message = "Pincode must not start with 0")
	@Size(min = 6, max = 6, message = "Length should be 6 ")

	private String pincode;

	@NotEmpty
	@Pattern(regexp = "^[7-9][0-9]{9}$", message = "Mobile no must start with 7,8,9")
	@Size(min = 10, max = 10, message = "Mobile no must be 10 digits")

	private String mobileNo;

	@NotEmpty
	@Pattern(regexp = "^[A-Za-z_][A-z0-9]{1,}[@]{1}[A-Za-z]{2,}[.]{1}[A-z]{0,3}$", message = " Enter Valid Email Id Eg.(xyz@gmail.com) ")

	private String emailID;

	@NotEmpty

	@Size(min = 8, max = 10, message = "The size must be bw 8-10 digits")

	private String password;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
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

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
