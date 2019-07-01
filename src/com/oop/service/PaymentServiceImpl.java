/**
 * 
 */
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

import com.oop.model.Payment;
import com.oop.util.CommonConstants;
import com.oop.util.CommonUtil;
import com.oop.util.DBConnectionUtil;
import com.oop.util.QueryUtil;

/**
 * @author User
 *
 */
public class PaymentServiceImpl implements IPaymentService {

	private static Connection connection;
	private static PreparedStatement preparedStatement = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.oop.service.IPaymentService#addPayment(com.oop.model.Payment)
	 */
	@Override
	public int addPayment(Payment payment) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_INSERT_PAYMENT));
			connection.setAutoCommit(false);
			preparedStatement.setInt(1, payment.getEmpId());
			preparedStatement.setInt(2, payment.getDepartment());
			preparedStatement.setString(3, payment.getStartDate());
			preparedStatement.setString(4, payment.getEndDate());
			preparedStatement.setDouble(5, payment.getBasicSalary());
			preparedStatement.setDouble(6, payment.getDearnessAllowance());
			preparedStatement.setDouble(7, payment.getMedicalAllowance());
			preparedStatement.setDouble(8, payment.getHouseRentAllowance());
			preparedStatement.setDouble(9, payment.getFoodAllowance());
			preparedStatement.setDouble(10, payment.getTelephoneAllowance());
			preparedStatement.setDouble(11, payment.getBonus());
			preparedStatement.setDouble(12, payment.getOther());
			preparedStatement.setDouble(13, payment.getProfessionalTax());
			preparedStatement.setDouble(14, payment.getProvideTax());
			preparedStatement.setDouble(15, payment.getLoan());
			preparedStatement.setDouble(16, payment.getInsurance());
			preparedStatement.setDouble(17, payment.getTotalIncome());
			preparedStatement.setDouble(18, payment.getTotalDeduction());
			preparedStatement.setDouble(19, payment.getTotalAmount());
			preparedStatement.execute();
			connection.commit();

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
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

		return 0;
	}
//---------------------------------------------------------------------------------------------------------------------------------------------------

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.oop.service.IPaymentService#getAllPayment()
	 */
	@Override
	public ArrayList<Payment> getAllPaymentForSelectedMonth(int DepID, String month  ) {
			
			ArrayList<Payment> arrayList = new ArrayList<>();
		try {
			   Date	date = new SimpleDateFormat("yyyy-MM").parse(month);
			   CommonUtil commonUtil = new CommonUtil();
			 
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_ALL_PAYMENTS_FOR_SELECTED_MONTH));
			preparedStatement.setInt(1, DepID );
			preparedStatement.setString(2, commonUtil.getFirsttDate(date)  );
			preparedStatement.setString(3, commonUtil.getLastDate(date)  );
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() )
			{
				Payment payment = new Payment();
				payment.setEmpId(resultSet.getInt(1));
				payment.setFirstName(resultSet.getString(2));
				payment.setLastName(resultSet.getString(3));
				payment.setPossition(resultSet.getString(4));
				payment.setMobile(resultSet.getString(5));
				
				arrayList.add(payment);
			}
			
		} catch (SQLException | IOException | ParserConfigurationException | ClassNotFoundException | SAXException | ParseException  e) {
			
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.oop.service.IPaymentService#getPaymentDetails(double)
	 */
	@Override
	public Payment getPaymentDetailsSelectedMonth(double EmpId , String month) {
		Payment payment = new Payment();
		try {
			CommonUtil commonUtil = new CommonUtil();
			Date date = new SimpleDateFormat("yyyy-MM").parse(month);
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_EMPLOYEE_PAYMENT_ACC_MONTH ));
			preparedStatement.setDouble(1, EmpId );
			preparedStatement.setString(2, commonUtil.getFirsttDate(date)  );
			preparedStatement.setString(3, commonUtil.getLastDate(date)  );
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() )
			{
				
				payment.setPaymentId( resultSet.getInt(1) );
				payment.setEmpId( resultSet.getInt(2) );
				payment.setDepartment( resultSet.getInt(3) );
				payment.setStartDate( resultSet.getString(4) );
				payment.setEndDate( resultSet.getString(5) );
				payment.setBasicSalary( resultSet.getDouble(6) );
				payment.setDearnessAllowance( resultSet.getDouble(7) );
				payment.setMedicalAllowance( resultSet.getDouble(8) );
				payment.setHouseRentAllowance( resultSet.getDouble(9) );
				payment.setFoodAllowance( resultSet.getDouble(10) );
				payment.setTelephoneAllowance( resultSet.getDouble(11) );
				payment.setBonus( resultSet.getDouble(12) );
				payment.setOther( resultSet.getDouble(13) );
				payment.setProfessionalTax( resultSet.getDouble(14) );
				payment.setProvideTax( resultSet.getDouble(15) );
				payment.setLoan( resultSet.getDouble(16) );
				payment.setInsurance( resultSet.getDouble(17) );
				payment.setTotalIncome( resultSet.getDouble(18) );
				payment.setTotalDeduction( resultSet.getDouble(19) );
				payment.setTotalAmount( resultSet.getDouble(20) );
				
				
			}
			
		} catch (SQLException | IOException | ParserConfigurationException | ClassNotFoundException | SAXException | ParseException  ee) {
			
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
		
		return payment;
	}
//---------------------------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<Payment> getAllPayments() {
		
		ArrayList<Payment> arrayList = new ArrayList<>();
	try {
		  
		connection = DBConnectionUtil.getDBConnection();
		preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_ALL_PAYMENTS));
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while( resultSet.next() )
		{
			Payment payment = new Payment();
			payment.setPaymentId( resultSet.getInt(1) );
			payment.setEmpId( resultSet.getInt(2) );
			payment.setDepartment( resultSet.getInt(3) );
			payment.setStartDate( resultSet.getString(4) );
			payment.setEndDate( resultSet.getString(5) );
			payment.setBasicSalary( resultSet.getDouble(6) );
			payment.setDearnessAllowance( resultSet.getDouble(7) );
			payment.setMedicalAllowance( resultSet.getDouble(8) );
			payment.setHouseRentAllowance( resultSet.getDouble(9) );
			payment.setFoodAllowance( resultSet.getDouble(10) );
			payment.setTelephoneAllowance( resultSet.getDouble(11) );
			payment.setBonus( resultSet.getDouble(12) );
			payment.setOther( resultSet.getDouble(13) );
			payment.setProfessionalTax( resultSet.getDouble(14) );
			payment.setProvideTax( resultSet.getDouble(15) );
			payment.setLoan( resultSet.getDouble(16) );
			payment.setInsurance( resultSet.getDouble(17) );
			payment.setTotalIncome( resultSet.getDouble(18) );
			payment.setTotalDeduction( resultSet.getDouble(19) );
			payment.setTotalAmount( resultSet.getDouble(20) );
			arrayList.add(payment);
			
		}
		
	} catch (SQLException | IOException | ParserConfigurationException | ClassNotFoundException | SAXException   e) {
		
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
		return arrayList;
	}
//------------------------------------------------------------------------------------------------------------------------------------------
	@Override
	public Payment getPayment(int PaymentID) {
		Payment payment = new Payment();
		try {
			
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_VIEW_PAYMENT ));
			preparedStatement.setDouble(1, PaymentID );
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while( resultSet.next() )
			{
				
				payment.setPaymentId( resultSet.getInt(1) );
				payment.setEmpId( resultSet.getInt(2) );
				payment.setDepartment( resultSet.getInt(3) );
				payment.setStartDate( resultSet.getString(4) );
				payment.setEndDate( resultSet.getString(5) );
				payment.setBasicSalary( resultSet.getDouble(6) );
				payment.setDearnessAllowance( resultSet.getDouble(7) );
				payment.setMedicalAllowance( resultSet.getDouble(8) );
				payment.setHouseRentAllowance( resultSet.getDouble(9) );
				payment.setFoodAllowance( resultSet.getDouble(10) );
				payment.setTelephoneAllowance( resultSet.getDouble(11) );
				payment.setBonus( resultSet.getDouble(12) );
				payment.setOther( resultSet.getDouble(13) );
				payment.setProfessionalTax( resultSet.getDouble(14) );
				payment.setProvideTax( resultSet.getDouble(15) );
				payment.setLoan( resultSet.getDouble(16) );
				payment.setInsurance( resultSet.getDouble(17) );
				payment.setTotalIncome( resultSet.getDouble(18) );
				payment.setTotalDeduction( resultSet.getDouble(19) );
				payment.setTotalAmount( resultSet.getDouble(20) );
				
				
			}
			
		} catch (SQLException | IOException | ParserConfigurationException | ClassNotFoundException | SAXException  e) {
			
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
		
		return payment;
	}

	@Override
	public void updatePayment(Payment payment) {
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_UPDATE_PAYMENT));
			connection.setAutoCommit(false);
			preparedStatement.setDouble(1, payment.getBasicSalary());
			preparedStatement.setDouble(2, payment.getDearnessAllowance());
			preparedStatement.setDouble(3, payment.getMedicalAllowance());
			preparedStatement.setDouble(4, payment.getHouseRentAllowance());
			preparedStatement.setDouble(5, payment.getFoodAllowance());
			preparedStatement.setDouble(6, payment.getTelephoneAllowance());
			preparedStatement.setDouble(7, payment.getBonus());
			preparedStatement.setDouble(8, payment.getOther());
			preparedStatement.setDouble(9, payment.getProfessionalTax());
			preparedStatement.setDouble(10, payment.getProvideTax());
			preparedStatement.setDouble(11, payment.getLoan());
			preparedStatement.setDouble(12, payment.getInsurance());
			preparedStatement.setDouble(13, payment.getTotalIncome());
			preparedStatement.setDouble(14, payment.getTotalDeduction());
			preparedStatement.setDouble(15, payment.getTotalAmount());
			preparedStatement.setInt(16, payment.getPaymentId() );
			preparedStatement.execute();
			connection.commit();

		} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
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

}
