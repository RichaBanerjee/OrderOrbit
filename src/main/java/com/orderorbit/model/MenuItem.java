package com.orderorbit.model;

import java.util.Objects;

public class MenuItem {

	private int itemId;
	private String itemName;
	private Category category;
	private double itemPrice;
	private String availability;
	private String item_image;

	public MenuItem() {
		super();
	}

	public MenuItem(int itemId, String itemName, Category category, double itemPrice, String item_image,
			String availability) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.category = category;
		this.itemPrice = itemPrice;
		this.item_image = item_image;
		this.availability = availability;
	}

	public MenuItem(String itemName, Category category, double itemPrice, String item_image, String availability) {
		super();
		this.itemName = itemName;
		this.category = category;
		this.itemPrice = itemPrice;
		this.item_image = item_image;
		this.availability = availability;
	}

	public String getItem_image() {
		return item_image;
	}

	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}

	public int getItemId() {
		return itemId;
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public double getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	@Override
	public String toString() {
		return "Item No :" + itemId + ", Item Name :" + itemName + " , " + category + ", Item Price :" + itemPrice
				+ ", Availability=" + availability + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(availability, category, itemId, itemName, itemPrice);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuItem other = (MenuItem) obj;
		return Objects.equals(availability, other.availability) && Objects.equals(category, other.category)
				&& itemId == other.itemId && Objects.equals(itemName, other.itemName)
				&& Double.doubleToLongBits(itemPrice) == Double.doubleToLongBits(other.itemPrice);
	}

}