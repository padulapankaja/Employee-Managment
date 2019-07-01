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

import com.oop.model.Announcement;
import com.oop.util.CommonConstants;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

/**
 * @author Amoda
 *
 */
public class AnnouncementServiceImpl implements IAnnouncementService {

	private static Connection connection;
	private PreparedStatement preparedStatement;
	/* (non-Javadoc)
	 * @see com.oop.service.IAnnouncementService#addAnnouncement(com.oop.model.Announcement)
	 */
	@Override
	public void addAnnouncement(Announcement announcement) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_ADD_ANNOUNCEMENT));
			connection.setAutoCommit(false);
			
		
			preparedStatement.setInt(1, announcement.getEmpId() );
			preparedStatement.setInt(2, announcement.getType() );
			preparedStatement.setString(3, announcement.getTitle() );
			preparedStatement.setString(4, announcement.getAnnouncementText() );
			preparedStatement.setString(5, announcement.getDate() );
			
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

	/* (non-Javadoc)
	 * @see com.oop.service.IAnnouncementService#viewAllAnnouncement()
	 */
	@Override
	public ArrayList<Announcement> viewAllAnnouncement() {
		
		ArrayList <Announcement> arrayList =new ArrayList<>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_VIEW_ALL_ANNOUNCEMENT));
			connection.setAutoCommit(false);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() )
			{
				Announcement announcement = new Announcement();
				announcement.setAnnId(resultSet.getInt(1));
				announcement.setEmpId(resultSet.getInt(2));
				announcement.setType(resultSet.getInt(3));
				announcement.setTitle(resultSet.getString(4));
				announcement.setAnnouncementText(resultSet.getString(5));
				announcement.setDate(resultSet.getString(6));
				arrayList.add(announcement);
				
			}
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
		
		return arrayList;
	}
//----------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public void deleteAnnouncement(int AnnID) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_DELETE_ANNOUNCEMENT));
			connection.setAutoCommit(false);
			preparedStatement.setInt(1, AnnID);
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
//----------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public Announcement selectAnnouncement(int AnnID) {
		Announcement announcement = new Announcement();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_SELECT_ANNOUNCEMENT ));
			preparedStatement.setInt(1, AnnID);
			connection.setAutoCommit(false);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() )
			{
				
				announcement.setAnnId(resultSet.getInt(1));
				announcement.setEmpId(resultSet.getInt(2));
				announcement.setType(resultSet.getInt(3));
				announcement.setTitle(resultSet.getString(4));
				announcement.setAnnouncementText(resultSet.getString(5));
				announcement.setDate(resultSet.getString(6));
				
			}
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
		
		return announcement;
	}
//--------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public void updateAnnouncement(Announcement announcement) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_EDIT_ANNOUNCEMENT ));
			connection.setAutoCommit(false);
			
			preparedStatement.setInt(1, announcement.getType() );
			preparedStatement.setString(2, announcement.getTitle() );
			preparedStatement.setString(3, announcement.getAnnouncementText() );
			preparedStatement.setInt(4, announcement.getAnnId() );
			
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

}
