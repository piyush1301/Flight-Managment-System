package com.wipro.frs.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.frs.bean.CredentialsBean;

@Repository("authenticate")

public class AuthenticationImpl implements Authentication {

	@Autowired

	SessionFactory sessionFactory;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public boolean authenticate(CredentialsBean credentialsBean) {

		String userId = credentialsBean.getUserID();
		String password = credentialsBean.getPassword();
		if (userId == null || password == null) {
			return false;
		} else {
			CredentialsBean cbean = (CredentialsBean) sessionFactory.getCurrentSession().get(CredentialsBean.class,
					userId);
		

			if (cbean != null) {

				if (!cbean.getPassword().equals(credentialsBean.getPassword())) {
					return false;
				} else {

					return true;
				}
			} else {
				return false;
			}

		}

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public String authorize(String userId) {

		CredentialsBean cbean = (CredentialsBean) sessionFactory.getCurrentSession().get(CredentialsBean.class, userId);
		String uType = cbean.getUserType();
System.out.println("Authorize"+cbean.getLoginStatus());
		return uType;

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public boolean changeLoginStatus(CredentialsBean credentialsBean, int loginStatus) {
		CredentialsBean cbean = (CredentialsBean) sessionFactory.getCurrentSession().get(CredentialsBean.class,
				credentialsBean.getUserID());
		int lStatus = cbean.getLoginStatus();
		System.out.println("Status" + lStatus+"Login status"+credentialsBean.getLoginStatus());
	
		
		if (lStatus==1) {
			System.out.println("Already");
			return false;
		} else {
			System.out.println("Nt Already");
			credentialsBean.setLoginStatus(1);
			String uType = authorize(credentialsBean.getUserID());
			credentialsBean.setUserType(uType);
			Session s = sessionFactory.openSession();

			Transaction tx = s.beginTransaction();
			s.saveOrUpdate(credentialsBean);
			tx.commit();
			return true;
		}

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public boolean changeStatus(String id) {
		String qry="update FRS_TBL_User_Credentials set loginStatus="+0;
		int i= sessionFactory.getCurrentSession().createSQLQuery(qry).executeUpdate();
	return true;
	}

}
