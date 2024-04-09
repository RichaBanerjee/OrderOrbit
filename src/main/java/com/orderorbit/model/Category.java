package com.orderorbit.model;

import java.util.Objects;

public class Category {

	private int categoryId;
	private String categoryName;
	private String categoryDescription;

	public Category() {
		super();
	}

	public Category(int categoryId, String categoryName, String categoryDescription) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	@Override
	public String toString() {
		return " Category Name=" + categoryName;

	}

	@Override
	public int hashCode() {
		return Objects.hash(categoryDescription, categoryId, categoryName);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return Objects.equals(categoryDescription, other.categoryDescription) && categoryId == other.categoryId
				&& Objects.equals(categoryName, other.categoryName);
	}

}
