package com.wipro.frs.util;

public interface Payment {
	
	boolean findByCardNumber(String userid, String cardnumber);
	String process(Payment payment);

}
