/**
 * 
 */
package com.oop.model;

/**
 * @author Vishvi
 *
 */
public class Attendance {

	private int AttId;
	private int EmpId;
	private int EmpAttendance;
	private static String Date;
	private static int DepId;
	private String returnDate;
	
	/**
	 * @return the empId
	 */
	public int getEmpId() {
		return EmpId;
	}
	/**
	 * @param empId the empId to set
	 */
	public void setEmpId(int empId) {
		EmpId = empId;
	}
	/**
	 * @return the empAttendance
	 */
	public int getEmpAttendance() {
		return EmpAttendance;
	}
	/**
	 * @param empAttendance the empAttendance to set
	 */
	public void setEmpAttendance(int empAttendance) {
		EmpAttendance = empAttendance;
	}
	/**
	 * @return the date
	 */
	public static String getDate() {
		return Date;
	}
	/**
	 * @param date the date to set
	 */
	public static void setDate(String date) {
		Date = date;
	}
	/**
	 * @return the depId
	 */
	public static int getDepId() {
		return DepId;
	}
	/**
	 * @param depId the depId to set
	 */
	public static void setDepId(int depId) {
		DepId = depId;
	}
	/**
	 * @return the returnDate
	 */
	public String getReturnDate() {
		return returnDate;
	}
	/**
	 * @param returnDate the returnDate to set
	 */
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	/**
	 * @return the attId
	 */
	public int getAttId() {
		return AttId;
	}
	/**
	 * @param attId the attId to set
	 */
	public void setAttId(int attId) {
		AttId = attId;
	}
	
	
	

}
