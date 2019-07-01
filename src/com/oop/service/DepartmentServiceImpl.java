/**
 * 
 */
package com.oop.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.oop.model.Department;
import com.oop.util.CommonConstants;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

/**
 * @author Amoda
 *
 */
public class DepartmentServiceImpl implements IDepartmentService {

	private static Connection connection;
	private PreparedStatement preparedStatement;
	@Override
	public ArrayList<Department> getDepartments() {
		
		ArrayList<Department> arrayList = new ArrayList<>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement( QueryUtil.queryByID(CommonConstants.ID_VIEW_DEPARTMENTS ) );
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next() )
			{
				Department department = new Department();
				department.setDepID(resultSet.getInt(1));
				department.setDepName( resultSet.getString(2));
				arrayList.add(department );
			}
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.print(e);
		}finally {
			
			
				try {
					
					if(preparedStatement != null )
					preparedStatement.close();
					
					if(connection != null )
						connection.close();
					
				} catch (SQLException e) {
					
				}
		}
		
		return arrayList;
	}
	
	public  String getNameOfTheDepartment(int DepID) {
	
		ArrayList<Department> list = getDepartments();
		for(Department dep : list)
		{
			if(dep.getDepID() == DepID )
				return dep.getDepName();
		}
		return null;
	}
	
	

}
