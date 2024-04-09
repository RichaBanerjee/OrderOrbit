package com.orderorbit.model;

import java.util.Objects;

public class Customer {

	private int customerId;
	private String customerName;
	private String customerPhone;
	private String customerEmail;
	private String customerPassword;

	public Customer() {
		super();
	}

	public Customer(int customerId) {
		this.customerId = customerId;
	}

	public Customer(int customer_id, String customerName, String customerPhone, String customerEmail,
			String customerPassword) {
		super();
		this.customerId = customer_id;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.customerEmail = customerEmail;
		this.customerPassword = customerPassword;

	}

	public Customer(String customerName, String customerPhone, String customerEmail, String customerPassword) {
		super();
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.customerEmail = customerEmail;
		this.customerPassword = customerPassword;

	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPassword() {
		return customerPassword;
	}

	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", customerPhone="
				+ customerPhone + ", customerEmail=" + customerEmail + ", customerPassword=" + customerPassword + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(customerEmail, customerId, customerName, customerPassword, customerPhone);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		return Objects.equals(customerEmail, other.customerEmail) && customerId == other.customerId
				&& Objects.equals(customerName, other.customerName)
				&& Objects.equals(customerPassword, other.customerPassword)
				&& Objects.equals(customerPhone, other.customerPhone);
	}

}
