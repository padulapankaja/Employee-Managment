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
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.oop.model.Employee;
import com.oop.util.CommonConstants;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

/**
 * @author Amoda
 *
 */
public class EmployeeServiceImpl implements IEmployeeService {

	public static final Logger log = Logger.getLogger(EmployeeServiceImpl.class.getName());
	/* 
	 * @see com.oop.service.IEmployeeService#addEmployee(com.oop.model.Employee)
	 */
	private static Connection connection;
	private PreparedStatement preparedStatement;
	@Override
	public int addEmployee(Employee employee) {
		
			int EmpId = 0;
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_INSERT_EMPLOYEES ), 1 );
			connection.setAutoCommit(false);
			preparedStatement.setString( 1, employee.getFirstName());
			preparedStatement.setString( 2, employee.getLastName());
			preparedStatement.setString( 3, employee.getDateOfBirth());
			preparedStatement.setString( 4, employee.getGender());
			preparedStatement.setString( 5, employee.getMaritalStatus());
			preparedStatement.setString( 6, employee.getSpouseName());
			preparedStatement.setString( 7, employee.getNationality());
			preparedStatement.setString( 8, employee.getNIC());
			preparedStatement.setString( 9, employee.getAddress());
			preparedStatement.setString(10 ,employee.getCity() );
			preparedStatement.setInt(11, employee.getZipCode());
			preparedStatement.setString(12, employee.getMobile());
			preparedStatement.setString(13, employee.getPhone());
			preparedStatement.setString(14, employee.getEmail());
			preparedStatement.setString(15, employee.getEmergencyNo());
			preparedStatement.setInt(16, employee.getDepartmentID());
			preparedStatement.setString(17, employee.getDesignation());
			preparedStatement.setString(18, employee.getBankName());
			preparedStatement.setString(19, employee.getBranchName());
			preparedStatement.setDouble(20, employee.getAccountNo() );
			preparedStatement.setString(21, employee.getUname());
			preparedStatement.setString(22, employee.getPassword());
			preparedStatement.setInt(23, employee.getAdmin());
			preparedStatement.setString(24, employee.getImagePath() );
			
			preparedStatement.execute();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			while(resultSet.next())
			{
				EmpId = resultSet.getInt(1);
			}
			connection.commit();
			
		
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.print(e);
		}
		finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.out.print(e);
			}
		}
		
		return EmpId;
	}
	//-----------------------------------------------------------------------------------------------------------------
	
	public ArrayList<Employee> getEmployees(String Action){
		
		ArrayList<Employee> employeeList = new ArrayList<>();
		try {
			connection = DBConnectionUtil.getDBConnection();
		
			if(Action == null )
				preparedStatement = connection.prepareStatement( QueryUtil.queryByID(CommonConstants.ID_ALL_EMPLOYEES) );
			else
				preparedStatement = connection.prepareStatement( QueryUtil.queryByID(CommonConstants.ID_ALL_EMPLOYEES) + " " +  Action );
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next() )
			{
				Employee employee = new Employee();
				employee.setEmpId(resultSet.getInt(1) );
				employee.setFirstName(resultSet.getString(2) );
				employee.setLastName(resultSet.getString(3));
				employee.setDateOfBirth(resultSet.getString(4) );
				employee.setGender(resultSet.getString(5));
				employee.setMaritalStatus(resultSet.getString(6) );
				employee.setSpouseName(resultSet.getString(7));
				employee.setNationality(resultSet.getString(8) );
				employee.setNIC(resultSet.getString(9));
				employee.setAddress(resultSet.getString(10) );
				employee.setCity(resultSet.getString(11) );
				employee.setZipCode(resultSet.getInt(12));
				employee.setMobile(resultSet.getString(13) );
				employee.setPhone(resultSet.getString(14));
				employee.setEmail(resultSet.getString(15) );
				employee.setEmergencyNo(resultSet.getString(16));
				employee.setDepartmentID(resultSet.getInt(17) );
				employee.setDesignation(resultSet.getString(18));
				employee.setBankName(resultSet.getString(19) );
				employee.setBranchName(resultSet.getString(20));
				employee.setAccountNo(resultSet.getDouble(21));
				employee.setImagePath(resultSet.getString(25));
				
				employeeList.add(employee);
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
		
		return employeeList;
	}
 //--------------------------------------------------------------------------------------------------------------------------
	
	public Employee getEmployeeDetails(double EmpId )
	{
		Employee employee = new Employee();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_SELECTED_EMPLOYEE));
			preparedStatement.setDouble( 1, EmpId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next() )
			{
				employee.setEmpId(resultSet.getInt(1) );
				employee.setFirstName(resultSet.getString(2) );
				employee.setLastName(resultSet.getString(3));
				employee.setDateOfBirth(resultSet.getString(4) );
				employee.setGender(resultSet.getString(5));
				employee.setMaritalStatus(resultSet.getString(6) );
				employee.setSpouseName(resultSet.getString(7));
				employee.setNationality(resultSet.getString(8) );
				employee.setNIC(resultSet.getString(9));
				employee.setAddress(resultSet.getString(10) );
				employee.setCity(resultSet.getString(11) );
				employee.setZipCode(resultSet.getInt(12));
				employee.setMobile(resultSet.getString(13) );
				employee.setPhone(resultSet.getString(14));
				employee.setEmail(resultSet.getString(15) );
				employee.setEmergencyNo(resultSet.getString(16));
				employee.setDepartmentID(resultSet.getInt(17) );
				employee.setDesignation(resultSet.getString(18));
				employee.setBankName(resultSet.getString(19) );
				employee.setBranchName(resultSet.getString(20));
				employee.setAccountNo(resultSet.getDouble(21));
				employee.setImagePath(resultSet.getString(25));
			}
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			
		} finally {
			try {

			if( preparedStatement != null )
					preparedStatement.close();

			if(connection != null )
			connection.close();
			
				} catch (SQLException e) {
				
				}
		}
		
		return employee;
	}
	//----------------------------------------------------------------------------------------------------
	
	public void UploadProfilePicture(int EmpID , String filePath)
	{
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_UPDATE_PROFILE_PIC ) );
			connection.setAutoCommit(false);
			preparedStatement.setString( 1, filePath);
			preparedStatement.setInt( 2, EmpID );
			preparedStatement.execute();
			connection.commit();
			
		}catch(SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e)
		{
			
		} finally {
			try {

				if( preparedStatement != null )
						preparedStatement.close();

				if(connection != null )
				connection.close();
				
					} catch (SQLException e) {
					
					}
			
		}
		
		
	}
//---------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Employee> getEmployeesAccDepartment(int DepId) {
			
		ArrayList<Employee> arrayList = new ArrayList<Employee>();
	try {
		connection = DBConnectionUtil.getDBConnection();
		preparedStatement = connection.prepareStatement( QueryUtil.queryByID("view_employee_acc_dept")  );
		preparedStatement.setInt(1, DepId);
		ResultSet resultSet = preparedStatement.executeQuery();
		while( resultSet.next() )
		{
			Employee employee = new Employee();
			employee.setEmpId(resultSet.getInt(1) );
			employee.setFirstName(resultSet.getString(2) );
			employee.setLastName(resultSet.getString(3));
			employee.setDateOfBirth(resultSet.getString(4) );
			employee.setGender(resultSet.getString(5));
			employee.setMaritalStatus(resultSet.getString(6) );
			employee.setSpouseName(resultSet.getString(7));
			employee.setNationality(resultSet.getString(8) );
			employee.setNIC(resultSet.getString(9));
			employee.setAddress(resultSet.getString(10) );
			employee.setCity(resultSet.getString(11) );
			employee.setZipCode(resultSet.getInt(12));
			employee.setMobile(resultSet.getString(13) );
			employee.setPhone(resultSet.getString(14));
			employee.setEmail(resultSet.getString(15) );
			employee.setEmergencyNo(resultSet.getString(16));
			employee.setDepartmentID(resultSet.getInt(17) );
			employee.setDesignation(resultSet.getString(18));
			employee.setBankName(resultSet.getString(19) );
			employee.setBranchName(resultSet.getString(20));
			employee.setAccountNo(resultSet.getDouble(21));
			employee.setImagePath(resultSet.getString(25));
			arrayList.add(employee);
			
		}
		
	
		} catch (ClassNotFoundException | SQLException | SAXException | IOException | ParserConfigurationException e) {
		
		}finally {
			try {

				if( preparedStatement != null )
						preparedStatement.close();

				if(connection != null )
				connection.close();
				
					} catch (SQLException e) {
					
					}
			
		}
	
	
	
	return arrayList;
	}
//---------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public void updateEmployee(Employee employee) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_UPDATE_EMPLOYEE ) );
			connection.setAutoCommit(false);
			preparedStatement.setString( 1, employee.getFirstName());
			preparedStatement.setString( 2, employee.getLastName());
			preparedStatement.setString( 3, employee.getDateOfBirth());
			preparedStatement.setString( 4, employee.getGender());
			preparedStatement.setString( 5, employee.getMaritalStatus());
			preparedStatement.setString( 6, employee.getSpouseName());
			preparedStatement.setString( 7, employee.getNationality());
			preparedStatement.setString( 8, employee.getNIC());
			preparedStatement.setString( 9, employee.getAddress());
			preparedStatement.setString(10 ,employee.getCity() );
			preparedStatement.setInt(11, employee.getZipCode());
			preparedStatement.setString(12, employee.getMobile());
			preparedStatement.setString(13, employee.getPhone());
			preparedStatement.setString(14, employee.getEmail());
			preparedStatement.setString(15, employee.getEmergencyNo());
			preparedStatement.setInt(16, employee.getDepartmentID());
			preparedStatement.setString(17, employee.getDesignation());
			preparedStatement.setString(18, employee.getBankName());
			preparedStatement.setString(19, employee.getBranchName());
			preparedStatement.setDouble(20, employee.getAccountNo() );
			preparedStatement.setInt(21, employee.getEmpId() );
			
			preparedStatement.execute();
			connection.commit();
			
		
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.print(e);
		}
		finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.out.print(e);
			}
		}
		
	}
//----------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public void deleteEmployee(int EmpID) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_DELETE_EMPLOYEE));
			connection.setAutoCommit(false);
			preparedStatement.setInt(1, EmpID);
			preparedStatement.execute();
			connection.commit();
		
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.print(e);
			
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.out.print(e);
			}
		}
		
	}
//-----------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Employee> searchEmployees(String SeachID, String Action) {
		
		String sql = null;
		ArrayList<Employee> arrayList = new ArrayList<Employee>();
		try {
				if(Action.equalsIgnoreCase("Fname") )
				{
					sql = QueryUtil.queryByID(CommonConstants.ID_SEARCHBY_FNAME) + " '%" + SeachID + "%'";
				}else if(Action.equalsIgnoreCase("EmpID"))
				{
					sql = QueryUtil.queryByID(CommonConstants.ID_SEARCHBY_EMPID) + " " + SeachID  ;
				}
				
					arrayList = getEmployees(sql);
			
		
		} catch (SAXException | IOException | ParserConfigurationException e) {
			
		}
		return arrayList;
	}
}
