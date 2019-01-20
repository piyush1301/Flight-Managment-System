package com.wipro.frs.util;

import com.wipro.frs.bean.CredentialsBean;

public interface User {
	
	
	String login(CredentialsBean credentialsBean);
	boolean logout(String userId);
	String changePassword(CredentialsBean credentialsBean, String newPassword);
boolean changeStatus(String id);
	

}
