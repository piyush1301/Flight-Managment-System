package com.wipro.frs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.frs.bean.FlightBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.ReservationBean;
import com.wipro.frs.bean.RouteBean;
import com.wipro.frs.bean.ScheduleBean;


@Repository("flightDao")
public class FlightDAOImpl implements FlightDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String GetID(FlightBean flightBean) {
		
		String id=sessionFactory.getCurrentSession().createSQLQuery("select FRS_SEQ_FLIGHT_ID.nextval from dual").uniqueResult().toString();
		return flightBean.getFlightName().substring(0, 2).toUpperCase()+id;
	}

	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String createFlight(FlightBean flightBean) {
		try{
		sessionFactory.getCurrentSession().save(flightBean);
		return "Success";
		}
		catch(Exception e)
		{
			return "Fail";
		}
	}

	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList<FlightBean> findAll() {
		List<FlightBean> list=sessionFactory.getCurrentSession().createQuery("From FlightBean").list();
		return (ArrayList<FlightBean>) list;
	}

	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public FlightBean DisplayByID(String flightID) {
		return (FlightBean) sessionFactory.getCurrentSession().get(FlightBean.class, flightID);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public int DeleteFlight(FlightBean flightBean) {
		try{
			sessionFactory.getCurrentSession().delete(flightBean);
			
			return 1;
			
			}
			catch(Exception e)
			{
				return 0;
			}
	}


	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public boolean updateFlight(FlightBean flightBean) {
		try{
		sessionFactory.getCurrentSession().saveOrUpdate(flightBean);
		return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
//___________________________________________________________________________________________	
	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String createScheduleBean(ScheduleBean scheduleBean) {	
	try{
		sessionFactory.getCurrentSession().saveOrUpdate(scheduleBean);
		return "SUCCESS";
	}
	catch(Exception e)
	{
		return "Fail";
	}
	}
	

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String getScheduleID() {
		String id=sessionFactory.getCurrentSession().createSQLQuery("select FRS_SEQ_SCHEDULE_ID.nextval from dual").uniqueResult().toString();
		return id;
	}


	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ScheduleBean viewSchedulebyID(String scheduleID) {
		return (ScheduleBean) sessionFactory.getCurrentSession().get(ScheduleBean.class, scheduleID);
		
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList<ScheduleBean> viewallSchedule() {
		
		return (ArrayList<ScheduleBean>) sessionFactory.getCurrentSession().createQuery("From ScheduleBean").list();
	}


	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public int removeSchedule(ScheduleBean scheduleId) {
		try{
		sessionFactory.getCurrentSession().delete(scheduleId);
		
		return 1;
		
		}
		catch(Exception e)
		{
			return 0;
		}	
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public boolean updateSchedule(ScheduleBean scheduleBean) {
		try{
			sessionFactory.getCurrentSession().saveOrUpdate(scheduleBean);
			return true;
			}
			catch(Exception e)
			{
				return false;
			}
	}
	
//__________________________________________________________________________________________________
	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String createRoute(RouteBean routeBean)
	{
		try
    	{
			sessionFactory.getCurrentSession().save(routeBean);
			return "SUCCESS";
    	}
    	catch(HibernateException h)
    	{
    		return "ERROR";
    	}
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String getComputedId()
	{
		String i=sessionFactory.getCurrentSession().createSQLQuery("select FRS_SEQ_ROUTE_ID.nextval from dual").uniqueResult().toString();	
		return i;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public RouteBean viewByRouteId(String routeId)
	{
		return (RouteBean) sessionFactory.getCurrentSession().get(RouteBean.class, routeId);		
	}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public boolean viewByRouteIdJSP(String routeId)
	{System.out.println("Method called");
	Connection con=null;
	Statement pst=null;
	ResultSet rs=null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	} catch (ClassNotFoundException e){
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}

	try {
		pst=con.createStatement();
		String qry="select * from FRS_TBL_FLIGHT where FLIGHTID='"+routeId+"'";
		rs=pst.executeQuery(qry);
		if(rs.next())
		{
			return true;
		}
			
			
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally{   
	      try{
	         if(pst!=null)
	            pst.close();
	      }catch(SQLException se2){
	      }
	      try{
	         if(con!=null)
	            con.close();
	      }catch(SQLException se){
	         se.printStackTrace();
	      }
	   }
	return false;
}


	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public boolean gRouteIdJSP(String routeId)
	{System.out.println("Method called");
	Connection con=null;
	Statement pst=null;
	ResultSet rs=null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	} catch (ClassNotFoundException e){
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}

	try {
		pst=con.createStatement();
		String qry="select * from FRS_TBL_ROUTE where ROUTEID='"+routeId+"'";
		rs=pst.executeQuery(qry);
		if(rs.next())
		{
			return true;
		}
			
			
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally{   
	      try{
	         if(pst!=null)
	            pst.close();
	      }catch(SQLException se2){
	      }
	      try{
	         if(con!=null)
	            con.close();
	      }catch(SQLException se){
	         se.printStackTrace();
	      }
	   }
	return false;
}
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList<RouteBean> viewByAllRoute()
	{
		return (ArrayList<RouteBean>) sessionFactory.getCurrentSession().createQuery("From RouteBean").list();
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public boolean updateRoute(RouteBean routeBean)
	{		
		if(routeBean==null)
		{
			return false;
		}		
		try
    	{
			sessionFactory.getCurrentSession().saveOrUpdate(routeBean);
			return true;
    	}
    	catch(HibernateException h)
    	{
    		return false;
    	}
	}
	

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public int deleteroute(RouteBean routeId)
	{
		try
		{		
			sessionFactory.getCurrentSession().delete(routeId);
			return 1;
		}	
		catch(HibernateException h)
		{		
			return 0;
		}
	}

//_________________________________________________________________________________________

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList<PassengerBean> ViewAllPessenger(String ID) {
		
		Query q= sessionFactory.getCurrentSession().createQuery("From ReservationBean where scheduleID=? ");
		q.setString(0, ID);
		List list=q.list();
		 Iterator itt=list.iterator();
		 PassengerBean pBEan;
		 ArrayList pbean=new ArrayList(); 
		 while(itt.hasNext())
		 {
			 ReservationBean  rBean = (ReservationBean) itt.next();
			 pBEan=(PassengerBean) sessionFactory.getCurrentSession().get(PassengerBean.class, rBean.getReservationID());
			 pbean.add(pBEan);
		 }
		return pbean;
	}
	
	
	//_________________________________________cus____________________________
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList viewSchedulebyID(String source,String destination) {
		
		Query q=sessionFactory.getCurrentSession().createQuery("from RouteBean where source=? AND destination=?");
		q.setString(0, source);
		q.setString(1, destination);
		return (ArrayList) q.list();
	}


	
		@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
		public List showtouserfortravel() {
			
			return sessionFactory.getCurrentSession().createQuery("from ScheduleBean").list();
			
		}


		public List viewPassengersBySchedule(String rID) {
			System.out.println("This is DAO "+rID);
			List itt=new ArrayList();
			Query q = sessionFactory.getCurrentSession().createQuery("from PassengerBean where reservationID=?");
			q.setString(0,rID);
			PassengerBean p = (PassengerBean) q.uniqueResult();
			System.out.println("list is G "+q.list().size());
			return itt;
		
		}


		@Transactional(propagation=Propagation.REQUIRED,readOnly=false)

		public ArrayList viewByRealScheduleId(String source, String destination) {

			Query q=sessionFactory.getCurrentSession().createQuery("from ScheduleBean where route.source=? AND route.destination=?");
			q.setString(0, source);
			q.setString(1, destination);
			return (ArrayList) q.list();
		}
			
}
