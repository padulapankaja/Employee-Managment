package com.oop.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.oop.model.Attendance;
import com.oop.util.CommonConstants;
import com.oop.util.CommonUtil;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

public class AttendanceServiceImpl implements IAttendanceService {

	public static Connection connection ;
	public static PreparedStatement preparedStatement ;
	
	@Override
	public void addAttendance(ArrayList<Attendance> arrayListAttendance) 
	{
	
		try {
			
			connection= DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement( QueryUtil.queryByID(CommonConstants.ID_ADD_ATTENDANCE ));
			connection.setAutoCommit(false);
		
			for(Attendance attendance : arrayListAttendance ){
				preparedStatement.setInt(1, attendance.getEmpId() );
				preparedStatement.setInt(2, Attendance.getDepId() );
				preparedStatement.setString(3, Attendance.getDate() );
				preparedStatement.setInt(4, attendance.getEmpAttendance() );
				preparedStatement.addBatch();
				
			}
			preparedStatement.executeBatch();
			connection.commit();
			
		} catch (ClassNotFoundException | SQLException | SAXException | IOException | ParserConfigurationException e) {
			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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
//---------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Attendance> ViewEmployeeAttendance(int EmpId, String month) {
		ArrayList<Attendance> arrayList = new ArrayList<>();
		try {
			   Date	date = new SimpleDateFormat("yyyy-MM").parse(month);
			   CommonUtil commonUtil = new CommonUtil();
			 
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_GET_EMPLOYEE_ATTENDANCE));
			connection.setAutoCommit(false);
			preparedStatement.setInt(1, EmpId );
			preparedStatement.setString(2, commonUtil.getFirsttDate(date)  );
			preparedStatement.setString(3, commonUtil.getLastDate(date)  );
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() )
			{
				Attendance attendance = new Attendance();
				attendance.setReturnDate(resultSet.getString(1));
				attendance.setEmpAttendance(resultSet.getInt(2));
				arrayList.add(attendance);
			}
			connection.commit();
			
		} catch (SQLException | IOException | ParserConfigurationException | ClassNotFoundException | SAXException | ParseException  e) {
			System.out.print(e);
		}finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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
		
		return arrayList;
	}
//----------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Attendance> ViewEmployeeAttendanceAccDate(String date, int DeptID) {
		
		ArrayList<Attendance> arrayList = new ArrayList<>();
		try {
			 
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_GET_EMPLOYEE_ATTENDANCE_ACC_DATE));
			connection.setAutoCommit(false);
			preparedStatement.setString(1 , date  );
			preparedStatement.setInt(2 , DeptID  );
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() )
			{
				Attendance attendance = new Attendance();
				attendance.setAttId(resultSet.getInt(1) );
				attendance.setEmpId(resultSet.getInt(2));
				attendance.setEmpAttendance(resultSet.getInt(3));
				arrayList.add(attendance);
			}
			connection.commit();
			
		} catch (SQLException | IOException | ParserConfigurationException | ClassNotFoundException | SAXException  e) {
			System.out.print(e);
		}finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
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
		return arrayList;
	}
//----------------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public void UpdateAttendance(ArrayList<Attendance> arrayList) {
		
		try {
			connection= DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement( QueryUtil.queryByID(CommonConstants.ID_UPDATE_ATTENDANCE ));
			connection.setAutoCommit(false);
			for(Attendance attendance : arrayList ){
				preparedStatement.setInt(1, attendance.getEmpAttendance() );
				preparedStatement.setInt(2, attendance.getAttId() );
				preparedStatement.addBatch();
			}
			preparedStatement.executeBatch();
			connection.commit();
			
			} catch (SQLException | IOException | ParserConfigurationException | ClassNotFoundException | SAXException  e){
				System.out.println(e);
			}finally {
				/*
				 * Close prepared statement and database connectivity at the end of transaction
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
}
