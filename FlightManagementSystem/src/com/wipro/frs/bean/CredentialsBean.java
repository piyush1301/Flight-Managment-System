package com.wipro.frs.bean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "FRS_TBL_User_Credentials")
public class CredentialsBean {

	@Id
	private String userID;
	@NotNull
	private String password;
	private String userType;
	private int loginStatus;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userID")
	private ProfileBean profileBean;

	

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(int loginStatus) {
		this.loginStatus = loginStatus;
	}

	public ProfileBean getProfileBean() {
		return profileBean;
	}

	public void setProfileBean(ProfileBean profileBean) {
		this.profileBean = profileBean;
	}
	
	
}
