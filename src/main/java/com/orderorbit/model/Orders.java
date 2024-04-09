package com.orderorbit.model;

import java.sql.Date;
import java.util.Objects;

public class Orders {

	private int orderId;
	private Customer customer;
	private Date orderDate;
	private String isPicked;
	private String orderStatus;
	private double totalAmount;

	public Orders() {
		super();

	}

	public Orders(Customer customer, Date orderDate, String isPicked, String orderStatus, double totalAmount) {
		super();

		this.customer = customer;
		this.orderDate = orderDate;
		this.isPicked = isPicked;
		this.orderStatus = orderStatus;
		this.totalAmount = totalAmount;
	}

	public Orders(int orderID, Customer customer, Date orderDate, String isPicked, String orderStatus,
			double totalAmount) {
		super();
		this.orderId = orderID;
		this.customer = customer;
		this.orderDate = orderDate;
		this.isPicked = isPicked;
		this.orderStatus = orderStatus;
		this.totalAmount = totalAmount;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getIsPicked() {
		return isPicked;
	}

	public void setIsPicked(String isPicked) {
		this.isPicked = isPicked;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", customer=" + customer + ", orderDate=" + orderDate + ", isPicked="
				+ isPicked + ", orderStatus=" + orderStatus + ", totalAmount=" + totalAmount + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(customer, isPicked, orderDate, orderId, orderStatus, totalAmount);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Orders other = (Orders) obj;
		return Objects.equals(customer, other.customer) && Objects.equals(isPicked, other.isPicked)
				&& Objects.equals(orderDate, other.orderDate) && orderId == other.orderId
				&& Objects.equals(orderStatus, other.orderStatus)
				&& Double.doubleToLongBits(totalAmount) == Double.doubleToLongBits(other.totalAmount);
	}

}
