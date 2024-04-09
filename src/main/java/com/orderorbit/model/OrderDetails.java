package com.orderorbit.model;

import java.util.Objects;

public class OrderDetails {

	private Orders orderId;
	private MenuItem itemId;
	private int quantity;
	private double subTotal;

	public OrderDetails() {
		super();
	}

	public OrderDetails(Orders orderId, MenuItem itemId, int quantity, double subTotal) {
		super();
		this.orderId = orderId;
		this.itemId = itemId;
		this.quantity = quantity;
		this.subTotal = subTotal;
	}

	public Orders getOrderId() {
		return orderId;
	}

	public void setOrderId(Orders orderId) {
		this.orderId = orderId;
	}

	public MenuItem getItemId() {
		return itemId;
	}

	public void setItemId(MenuItem itemId) {
		this.itemId = itemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	@Override
	public String toString() {
		return "OrdersDetails [orderId=" + orderId + ", itemId=" + itemId + ", quantity=" + quantity + ", subTotal="
				+ subTotal + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(itemId, orderId, quantity, subTotal);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetails other = (OrderDetails) obj;
		return Objects.equals(itemId, other.itemId) && Objects.equals(orderId, other.orderId)
				&& quantity == other.quantity
				&& Double.doubleToLongBits(subTotal) == Double.doubleToLongBits(other.subTotal);
	}

}
