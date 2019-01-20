package com.wipro.frs.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.frs.bean.CredentialsBean;
@Service("user")
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class UserImpl implements User {
	@Autowired
	Authentication authentication;

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String login(CredentialsBean credentialsBean) {

		if (authentication.authenticate(credentialsBean)) {
			if (authentication.changeLoginStatus(credentialsBean, 1)) {

				if (authentication.authorize(credentialsBean.getUserID()).equals("A")) {
					return "Admin";
				} else {
					return "Customer";
				}

			} else

				return "User Already Logged In";
		}
		else
		{
			return "Invalid values";
		}
	}

	@Override
	public boolean logout(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String changePassword(CredentialsBean credentialsBean, String newPassword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)

	public boolean changeStatus(String id) {
authentication.changeStatus(id);
return true;
	}

}
