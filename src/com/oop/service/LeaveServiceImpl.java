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

import com.oop.model.Leave;
import com.oop.util.CommonConstants;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

/**
 * @author Pubudu Arosha
 *
 */
public class LeaveServiceImpl implements ILeaveService {

	
	private static Connection connection;
	private static PreparedStatement preparedStatement;

	/* (non-Javadoc)
	 * @see com.oop.service.ILeaveService#addLeave(com.oop.model.Leave)
	 */
	@Override
	public void addLeave(Leave leave) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_ADD_LEAVE));
			connection.setAutoCommit(false);
			preparedStatement.setInt( 1, leave.getEmpId() );
			preparedStatement.setInt( 2, leave.getDepNo() );
			preparedStatement.setString( 3, leave.getStartDate() );
			preparedStatement.setString( 4, leave.getEndDate() );
			preparedStatement.setInt( 5, leave.getCount() );
			preparedStatement.setString( 6, leave.getDescription() );
			preparedStatement.setString( 7, leave.getStatus() );
			
			preparedStatement.execute();
			connection.commit();
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.print(e);
		}	finally {
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
//--------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Leave> getLeavesList(int EmpId) {
		ArrayList<Leave> arrayList = new ArrayList<>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_VIEW_ALL_LEAVES_USER));
			preparedStatement.setInt( 1, EmpId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next() )
			{
				Leave leave = new Leave();
				leave.setLeaveId( resultSet.getInt(1) );
				leave.setEmpId( resultSet.getInt(2) );
				leave.setDepNo( resultSet.getInt(3) );
				leave.setStartDate( resultSet.getString(4) );
				leave.setEndDate( resultSet.getString(5) );
				leave.setCount( resultSet.getInt(6) );
				leave.setDescription( resultSet.getString(7) );
				leave.setStatus( resultSet.getString(8) );
				leave.setFeedback( resultSet.getString(9) );
				
				arrayList.add(leave);
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
		return arrayList;
	}
//---------------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Leave> getLeavesList(String Action) {
		ArrayList<Leave> arrayList = new ArrayList<>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_VIEW_ALL_LEAVES_ADMIN));
		 if( Action.equalsIgnoreCase("Pending"))
		 {
			 preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_VIEW_ALL_PENDING_LEAVES_ADMIN_));
		 }
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next() )
			{
				Leave leave = new Leave();
				leave.setLeaveId( resultSet.getInt(1) );
				leave.setEmpId( resultSet.getInt(2) );
				leave.setDepNo( resultSet.getInt(3) );
				leave.setStartDate( resultSet.getString(4) );
				leave.setEndDate( resultSet.getString(5) );
				leave.setCount( resultSet.getInt(6) );
				leave.setDescription( resultSet.getString(7) );
				leave.setStatus( resultSet.getString(8) );
				leave.setFeedback( resultSet.getString(9) );
				
				arrayList.add(leave);
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
		return arrayList;
	}
//--------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public void manageLeave( Leave leave) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_MANAGE_LEAVE));
			connection.setAutoCommit(false);
			preparedStatement.setString( 1 , leave.getStatus() );
			preparedStatement.setString( 2, leave.getFeedback() );
			preparedStatement.setInt( 3,  leave.getLeaveId() );
			System.out.println(preparedStatement);
			preparedStatement.execute();
			connection.commit();
			
			
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			System.out.println(e);
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


}
