package com.wipro.frs.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.frs.bean.CredentialsBean;
import com.wipro.frs.service.Customer;
import com.wipro.frs.util.User;

@Controller
public class MainController {

	@Autowired
	User user;
	Customer customer;

	public static HashMap hm = new HashMap<>();

	@RequestMapping(value = "/open", method = RequestMethod.GET)
	public ModelAndView fun1(@ModelAttribute("command") CredentialsBean credentialsBean, BindingResult result,HttpSession session) {
		/*System.out.println("In Logout");
		String id = (String)session.getAttribute("login");
		user.changeStatus(id);
		session.removeAttribute("login");
		session.invalidate();*/
		
		return new ModelAndView("show");
	}
	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public ModelAndView fugf(@ModelAttribute("command") CredentialsBean credentialsBean, BindingResult result,HttpSession session) {
		
		return new ModelAndView("aboutUS");
	}
	@RequestMapping(value = "/contactus", method = RequestMethod.GET)
	public ModelAndView fun14(@ModelAttribute("command") CredentialsBean credentialsBean, BindingResult result,HttpSession session) {
		
		return new ModelAndView("ContactUs");
	}
	@RequestMapping(value = "/homep", method = RequestMethod.GET)
	public ModelAndView fun176(@ModelAttribute("command") CredentialsBean credentialsBean, BindingResult result,HttpSession session) {
		
		return new ModelAndView("../../Login");
	}
	
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public ModelAndView home(@ModelAttribute("command") CredentialsBean credentialsBean, HttpSession session) {
			return new ModelAndView("customer");
	}
	
	@RequestMapping(value = "/homepage2", method = RequestMethod.GET)
	public ModelAndView home1(@ModelAttribute("command") CredentialsBean credentialsBean, HttpSession session) {
			return new ModelAndView("adminhome");
	}
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public ModelAndView s1(@ModelAttribute("command") CredentialsBean credentialsBean, HttpSession session) {
			return new ModelAndView("schedule");
	}
	
	
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(@ModelAttribute("command") CredentialsBean credentialsBean, HttpSession session) {
		System.out.println("In Logout");
		String id = (String)session.getAttribute("login");
		user.changeStatus(id);
		session.removeAttribute("login");
		session.invalidate();
		return new ModelAndView("../../Login");
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView fun2(@ModelAttribute("command") CredentialsBean credentialsBean, BindingResult result,
			HttpServletRequest request) {

		
		String asd = user.login(credentialsBean);
		if (asd.equals("Invalid values")) {
			System.out.println("Invalid values");
			return new ModelAndView("show", "retVal", "Password Mismatch..!!");

		} else if (asd.equals("User Already Logged In")) {

			
			System.out.println("User already logged in");
			
			
			
			
			return new ModelAndView("myjsp", "retVal", "User Already Logged In");

		} else if (asd.equals("Customer")) {
			HttpSession session = request.getSession();
			session.setAttribute("login", credentialsBean.getUserID());
			hm.put("userId", credentialsBean.getUserID());
		    hm.put("pword",credentialsBean.getPassword());
			System.out.println("-------------------" + hm.get("userId"));
			System.out.println("Customer");
			return new ModelAndView("customer", "retVal", "Customer");

		} else {
			HttpSession session = request.getSession();
			session.setAttribute("login", credentialsBean.getUserID());
			return new ModelAndView("adminhome", "retVal", "Admin");

		}

	}

	// ---------------------------Customer--------------------------//

}
