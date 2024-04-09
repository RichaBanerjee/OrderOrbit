package com.orderorbit.model;

import java.util.Objects;

public class Cart {
	private int itemId;
	private MenuItem item;
	private String itemName;
	private double itemPrice;
	private int quantity;

	public Cart() {
		super();

	}

	public Cart(int itemId, String itemName, double itemPrice, int quantity) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.quantity = quantity;
	}

	public Cart(MenuItem item, int quantity) {
		this.item = item;
		this.quantity = quantity;
	}

	public int getItemId() {
		return itemId;
	}

	public MenuItem getItem() {
		return item;
	}

	public void setItem(MenuItem item) {
		this.item = item;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Cart [itemId=" + itemId + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", quantity="
				+ quantity + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(itemId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cart other = (Cart) obj;
		return itemId == other.itemId;
	}

}