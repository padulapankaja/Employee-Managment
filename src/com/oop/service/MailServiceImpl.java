/**
 * 
 */
package com.oop.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.oop.model.Mail;
import com.oop.util.CommonConstants;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

/**
 * @author Amoda
 *
 */
public class MailServiceImpl implements IMailService {

	private static Connection connection;
	private PreparedStatement preparedStatement;
	/* 
	 * @see com.oop.service.IMailService#composeMail()
	 */
	@Override
	public void composeMail(Mail mail) {
		
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_COMPOSE_MAIL));
				connection.setAutoCommit(false);
				
				preparedStatement.setInt(1, mail.getSenderId() );
				preparedStatement.setInt(2, mail.getReceiverId() );
				preparedStatement.setString(3, mail.getTitle() );
				preparedStatement.setString(4, mail.getMessage() );
				preparedStatement.setString(5, mail.getSentTime() );
				preparedStatement.setString(6, mail.getSentDate() );
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
	//-------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Mail> viewMails(int EmpId , String SendOrReceive) {
		
		ArrayList <Mail> arrayList =new ArrayList<>();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(SendOrReceive));
			connection.setAutoCommit(false);
			
			preparedStatement.setInt(1, EmpId );
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() )
			{
				Mail mail = new Mail();
				mail.setMailId(resultSet.getInt(1)); 
				mail.setSenderId(resultSet.getInt(2)); 
				mail.setReceiverId(resultSet.getInt(3));
				mail.setTitle(resultSet.getString(4));
				mail.setMessage(resultSet.getString(5));
				mail.setSentTime(resultSet.getString(6));
				mail.setSentDate(resultSet.getString(7));
				mail.setRead(resultSet.getInt(8) );
				mail.setReadTime(resultSet.getString(9));
				mail.setReadDate(resultSet.getString(10));
				arrayList.add(mail);
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
//--------------------------------------------------------------------------------------------------------------------------------
	@Override
	public Mail viewMail(int mailId) {
		Mail mail = new Mail();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_VIEW_MAIL));
			connection.setAutoCommit(false);
			
			preparedStatement.setInt(1, mailId );
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() )
			{
				
				mail.setMailId(resultSet.getInt(1)); 
				mail.setSenderId(resultSet.getInt(2)); 
				mail.setReceiverId(resultSet.getInt(3));
				mail.setTitle(resultSet.getString(4));
				mail.setMessage(resultSet.getString(5));
				mail.setSentTime(resultSet.getString(6));
				mail.setSentDate(resultSet.getString(7));
				mail.setRead(resultSet.getInt(8) );
				mail.setReadTime(resultSet.getString(9));
				mail.setReadDate(resultSet.getString(10));
			
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
		return mail;
	}
//----------------------------------------------------------------------------------------------------------------------------
	@Override
	public void read(int mailID) {
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat timeFormat = new SimpleDateFormat("HH:mm");
		
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_READ_MAIL));
			connection.setAutoCommit(false);		
			preparedStatement.setInt(1, 1 );
			preparedStatement.setString( 2, dateFormat.format(date) );
			preparedStatement.setString( 3, timeFormat.format(date) );
			preparedStatement.setInt(4, mailID );
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
//------------------------------------------------------------------------------------------------------------------------------
	@Override
	public void deleteMail(int mailID) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_DELETE_MAIL));
			connection.setAutoCommit(false);
			preparedStatement.setInt(1, mailID );
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
	
//-----------------------------------------------------------------------------------------------------------------------------
	@Override
	public int mailCount(int EmpID) {
		int mailCount = 0;
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_MAIL_COUNT ));
			connection.setAutoCommit(false);
			preparedStatement.setInt(1, EmpID );
		    ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next() )
			{
				mailCount = resultSet.getInt(1);
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
		

		return mailCount;
	}
}
