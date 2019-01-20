package com.wipro.frs.dao;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.frs.bean.RouteBean;

@Repository("route")
public class RouteDAOImpl implements RouteDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public String createRoute(RouteBean routeBean) {
		if (routeBean == null) {
			return "ERROR";
		}

		try {
			sessionFactory.getCurrentSession().saveOrUpdate(routeBean);
			return "SUCCESS";
		} catch (HibernateException h) {
			return "ERROR";
		}
	}

	public String getComputedId(RouteBean routeBean, String seqName) {
		if (routeBean == null || seqName == null || routeBean.getSource() == null || routeBean.getDestination() == null)
			return "FAIL";

		if (routeBean.getSource().length() < 2 || routeBean.getDestination() == null)
			return "INVALID_INPUT";

		for (int p = 0; p < routeBean.getSource().length(); p++) {
			if (routeBean.getSource().charAt(p) < 65
					|| (routeBean.getSource().charAt(p) > 90 && routeBean.getSource().charAt(p) < 97)
					|| routeBean.getSource().charAt(p) > 122)
				return "INVALID_INPUT";
		}
		for (int p = 0; p < routeBean.getDestination().length(); p++) {
			if (routeBean.getDestination().charAt(p) < 65
					|| (routeBean.getDestination().charAt(p) > 90 && routeBean.getDestination().charAt(p) < 97)
					|| routeBean.getDestination().charAt(p) > 122)
				return "INVALID_INPUT";
		}

		if (!seqName.equalsIgnoreCase("FRS_SEQ_ROUTE_ID")) {
			return "INVALID_INPUT";
		}

		String code = "";
		String sql = "select " + seqName + ".nextval from dual";
		String i = sessionFactory.getCurrentSession().createSQLQuery(sql).uniqueResult().toString();

		if (i.length() != 4)
			return "INVALID_INPUT";
		String ch = routeBean.getSource().substring(0, 2).toUpperCase();
		String ch2 = routeBean.getDestination().substring(0, 2).toUpperCase();

		code = ch + ch2 + i;
		return code;

	}

	public RouteBean viewByRouteId(String routeId) {
		RouteBean rb = (RouteBean) sessionFactory.getCurrentSession().get(RouteBean.class, routeId);
		System.out.println(rb.getDestination());
		return rb;

	}

	public ArrayList<RouteBean> viewByAllRoute() {
		return (ArrayList<RouteBean>) sessionFactory.getCurrentSession().createCriteria(RouteBean.class).list();
	}

	public boolean updateRoute(RouteBean routeBean) {

		if (routeBean == null) {
			System.out.println("null");
			return false;
		}

		try {
			System.out.println(routeBean.getRouteID() + " " + routeBean.getSource() + " " + routeBean.getDestination()
					+ " " + routeBean.getDistance() + " " + routeBean.getFare());
			sessionFactory.getCurrentSession().saveOrUpdate(routeBean);
			return true;
		} catch (HibernateException h) {
			System.out.println("null in catch");
			return false;
		}
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public int deleteroute(RouteBean routeId) {
		if (routeId == null)
			return 0;
		try {

			sessionFactory.getCurrentSession().delete(routeId);
			System.out.println(routeId.getRouteID());
			return 1;
		}

		catch (Exception h) {
			System.out.println("null in catch");
			return 0;
		}

	}

	@Override
	public boolean updateSeatstatus(int SeatingCapacity,String fId) {

		String qry="update FRS_TBL_FLIGHT set SEATINGCAPACITY="+SeatingCapacity+ " where FLIGHTID='"+fId+"'";
		try{
		sessionFactory.getCurrentSession().createSQLQuery(qry).executeUpdate();
		return true;
		}
		catch(Exception e){
				return false;
	}}
}
