package com.wipro.frs.bean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="FRS_TBL_CREDITCARD")
public class CardDetailsBean {
 @Id
 @NotNull(message="Enter the credit card number")

  private String creditcardNumber;
 @NotNull(message="Enter the value for Valid From")
  private String validFrom;
 @NotNull(message="Enter the value for Valid To")
  private String validTo;
  private Integer creditBalance;
  @OneToOne(cascade=CascadeType.ALL)
  
  @JoinColumn(name="userID")
  private CredentialsBean user;
public String getCreditcardNumber() {
	return creditcardNumber;
}
public void setCreditcardNumber(String creditcardNumber) {
	this.creditcardNumber = creditcardNumber;
}
public String getValidFrom() {
	return validFrom;
}
public void setValidFrom(String validFrom) {
	this.validFrom = validFrom;
}
public String getValidTo() {
	return validTo;
}
public void setValidTo(String validTo) {
	this.validTo = validTo;
}
public Integer getCreditBalance() {
	return creditBalance;
}
public void setCreditBalance(Integer creditBalance) {
	this.creditBalance = creditBalance;
}
}
