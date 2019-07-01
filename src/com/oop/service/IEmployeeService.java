/**
 * 
 */
package com.oop.service;

import java.util.ArrayList;

import com.oop.model.Employee;

/**
 * @author Amoda
 *
 */
public interface IEmployeeService {

	/**
	 * Add employees for employee table
	 * @param employee
	 * @return employeeID
	 */
	public int addEmployee(Employee employee);
	
	/**
	 * Get all Details of employees 
	 * 
	 * @return ArrayList<Employee>
	 */
	public ArrayList<Employee> getEmployees(String Action);
	
	/**
	 * Get all details of a employee
	 * @param Employee ID
	 * @return Employee 
	 */
	public Employee getEmployeeDetails(double EmpId );
	
	public ArrayList<Employee> searchEmployees(String SeachID , String Action);

	public void UploadProfilePicture(int EmpID , String filePath);
	
	public ArrayList<Employee> getEmployeesAccDepartment(int DepId);
	
	public void updateEmployee(Employee employee);
	
	public void deleteEmployee(int EmpID);
}
