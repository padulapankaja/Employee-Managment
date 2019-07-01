/**
 * 
 */
package com.oop.service;

import java.util.ArrayList;


import com.oop.model.Payment;

/**
 * @author User
 *
 */
public interface IPaymentService {


	/**
	 * Add payment for payment table
	 * @param payment 
	 * @return paymentId
	 */
	public int  addPayment(Payment payment); 
	
	
	
	
	/**
	 * Get all payment  details   
	 * @param payment 
	 * @return ArrayList<Payment>
	 */
	
	public ArrayList<Payment> getAllPaymentForSelectedMonth(int DepID, String month );
	
	/**
	 * Get payment details of a employee
	 * @param Employee ID
	 * @return Payment 
	 */
	public Payment getPaymentDetailsSelectedMonth(double EmpId , String month);
	
	/**
	 * Get all payment  details  of all employees 
	 * @return ArrayList<Payment>
	 */
	
	public ArrayList<Payment> getAllPayments();
	
	
	public Payment getPayment(int PaymentID);

	public void updatePayment(Payment payment);
}



