/**
 * 
 */
package com.oop.service;

import java.util.ArrayList;
import com.oop.model.Department;

/**
 * @author Amoda
 *
 */
public interface IDepartmentService {

	public ArrayList<Department> getDepartments();
	public String getNameOfTheDepartment(int DepID );

}
