package com.orderorbit.model;

import java.util.Objects;

public class Employee {

	private int employeeId;
	private String employeeName;
	private String employeeEmail;;
	private String employeePassword;
	private String employeeRole;
	private int reportsTo;

	public Employee() {
		super();

	}

	public Employee(String employeeName, String employeeEmail, String employeePassword, String employeeRole,
			int reportsTo) {
		super();

		this.employeeName = employeeName;
		this.employeeEmail = employeeEmail;
		this.employeePassword = employeePassword;
		this.employeeRole = employeeRole;
		this.reportsTo = reportsTo;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeEmail() {
		return employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	public String getEmployeePassword() {
		return employeePassword;
	}

	public void setEmployeePassword(String employeePassword) {
		this.employeePassword = employeePassword;
	}

	public String getEmployeeRole() {
		return employeeRole;
	}

	public void setEmployeeRole(String employeeRole) {
		this.employeeRole = employeeRole;
	}

	public int getReportsTo() {
		return reportsTo;
	}

	public void setReportsTo(int reportsTo) {
		this.reportsTo = reportsTo;
	}

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", employeeEmail="
				+ employeeEmail + ", employeePassword=" + employeePassword + ", employeeRole=" + employeeRole
				+ ", reportsTo=" + reportsTo + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(employeeEmail, employeeId, employeeName, employeePassword, employeeRole, reportsTo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		return Objects.equals(employeeEmail, other.employeeEmail) && employeeId == other.employeeId
				&& Objects.equals(employeeName, other.employeeName)
				&& Objects.equals(employeePassword, other.employeePassword)
				&& Objects.equals(employeeRole, other.employeeRole) && reportsTo == other.reportsTo;
	}

}
