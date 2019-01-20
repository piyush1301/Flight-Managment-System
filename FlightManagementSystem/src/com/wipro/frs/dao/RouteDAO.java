package com.wipro.frs.dao;

import java.util.ArrayList;

import com.wipro.frs.bean.RouteBean;

public interface RouteDAO {
	
	String createRoute(RouteBean routeBean) ;
	int deleteroute(RouteBean routeId);
	boolean updateRoute(RouteBean routeBean);
	//BeanObject findByID(String)
	//ArrayList<BeanObject> findAll();
	RouteBean viewByRouteId(String routeId);
	ArrayList<RouteBean> viewByAllRoute();
	String getComputedId(RouteBean routeBean,String seqName);
	boolean updateSeatstatus(int SeatingCapacity,String rID);
	
}
