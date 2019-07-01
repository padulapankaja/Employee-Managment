/**
 * 
 */
package com.oop.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.oop.model.LoginHandler;
import com.oop.util.CommonConstants;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

/**
 * @author Amoda
 *
 */
public class LoginServiceImpl implements ILoginService {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	
	public LoginHandler authenticateEmployee(String Uname , String Password )
	{
		LoginHandler login = new LoginHandler();
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_EMPLOYEE_AUTHENTICATE));
			preparedStatement.setString( 1, Uname );
			preparedStatement.setString( 2, Password );
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if( resultSet.next() )
			{	
				login.setEmpId(resultSet.getInt(1));
				login.setEmpName( resultSet.getString(2) + " " + resultSet.getString(3));
				login.setAccessLevel(resultSet.getInt(4));
				login.setImagePath(resultSet.getString(5));
			}
		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
			
		}
		return login;
	}

}
