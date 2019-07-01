/**
 * 
 */
package com.oop.util;

/**
 * @author Amoda
 * @version 1.0
 */

public class CommonConstants {

	/** Constant for query tag in EmployeeQuery.xml */
	public static final String TAG_NAME = "query";

	/** Constant for query id in EmployeeQuery.xml */
	public static final String ID = "id";

	/** Constant for comma */
	public static final String COMMA = ",";

	/** Constant for url key of MySQL database in config.properties */
	public static final String URL = "url";

	/** Constant for user name key of MySQL database in config.properties */
	public static final String UNAME = "username";

	/** Constant for password key of MySQL database in config.properties */
	public static final String PWD = "password";

	/** Constant for driver name key of MySQL database in config.properties */
	public static final String DRV_NAME = "driverName";

	/** Constant for image save directory  */
	public static final String SAVE_DIR = "images/";

	/** Constant for query id of insert employees in EmployeeQuery.xml */
	public static final String ID_INSERT_EMPLOYEES = "insert_employee";
	
	/** Constant for query id of get all employee details in EmployeeQuery.xml */
	public static final String ID_ALL_EMPLOYEES = "all_employees";

	/** Constant for query id of get selected employee details in EmployeeQuery.xml */
	public static final String ID_SELECTED_EMPLOYEE = "selected_employee";
	
	/** Constant for query id of get delete employee details in EmployeeQuery.xml */
	public static final String ID_DELETE_EMPLOYEE = "delete_employee";
	
	/** Constant for default image of the user */
	public static final String DEFAULT_IMG = "user.jpg";
	
	/** Constant for query id of update profile pic of employee in EmployeeQuery.xml */
	public static final String ID_UPDATE_PROFILE_PIC = "update_profile_pic";
	
	/** Constant for query id of update employee in EmployeeQuery.xml */
	public static final String ID_UPDATE_EMPLOYEE = "update_employee";
	
	/** Constant for query id of employee authentication in  EmployeeQuery.xml */
	public static final String ID_EMPLOYEE_AUTHENTICATE = "authenticate_employee";
	
	
	/** Constant for query id of insert announcement in EmployeeQuery.xml */
	public static final String ID_ADD_ANNOUNCEMENT = "add_announcement";
	
	/** Constant for query id of compose mail in  EmployeeQuery.xml */
	public static final String ID_COMPOSE_MAIL = "compose_mail";
	
	/** Constant for query id of view all receive mails in  EmployeeQuery.xml */
	public static final String ID_VIEW_ALL_RECEIVE_MAILS ="view_all_receive_mails";
	
	/** Constant for query id of view all receive mails in  EmployeeQuery.xml */
	public static final String ID_VIEW_ALL_SEND_MAILS ="view_all_send_mails";
	
	/** Constant for query id of view all announcements in  EmployeeQuery.xml */
	public static final String ID_VIEW_ALL_ANNOUNCEMENT ="view_all_announcement";
	
	/** Constant for query id of delete announcement in  EmployeeQuery.xml */
	public static final String ID_DELETE_ANNOUNCEMENT ="delete_announcement";
	
	/** Constant for query id of select announcement in  EmployeeQuery.xml */
	public static final String ID_SELECT_ANNOUNCEMENT ="select_announcement";
	
	/** Constant for query id of edit announcement in  EmployeeQuery.xml */
	public static final String ID_EDIT_ANNOUNCEMENT ="edit_announcement";
	
	/** Constant for query id of view mail in  EmployeeQuery.xml */
	public static final String ID_VIEW_MAIL ="view_mail";
	
	/** Constant for query id of read mail in  EmployeeQuery.xml */
	public static final String ID_READ_MAIL ="read_mail";
	
	/** Constant for query id of delete mail in  EmployeeQuery.xml */
	public static final String ID_DELETE_MAIL ="delete_mail";
	
	/** Constant for query id of count new mail in  EmployeeQuery.xml */
	public static final String ID_MAIL_COUNT ="mail_count";
	//-----------------------------search------------------------------------------------------------------------------------------------------
	
	/** Constant for query id of search in  EmployeeQuery.xml */
	public static final String ID_SEARCHBY_EMPID ="search_by_EmpID";
	
	/** Constant for query id of search in  EmployeeQuery.xml */
	public static final String ID_SEARCHBY_MONTH ="search_by_Month";
	
	/** Constant for query id of search in  EmployeeQuery.xml */
	public static final String ID_SEARCHBY_FNAME ="search_by_Fname";
	
	
	//---------------------------Payment---------------------------------------------------------------------------------------------------------
	
	/** Constant for query id of get all payments details for employees who are not get paid yet for selected month in EmployeeQuery.xml */
	public static final String ID_ALL_PAYMENTS_FOR_SELECTED_MONTH = "search_payments";

	/** Constant for query id of get all payments details  in EmployeeQuery.xml */
	public static final String ID_ALL_PAYMENTS = "all_payments";
	
	/** Constant for query id of get  payment details  in EmployeeQuery.xml */
	public static final String ID_VIEW_PAYMENT = "view_employee_paymnet";
	
	/** Constant for query id of get all payments details  in EmployeeQuery.xml */
	public static final String ID_EMPLOYEE_PAYMENT_ACC_MONTH = "employee_payment_acc_month";
	
	/** Constant for query id of insert payment in EmployeeQuery.xml */
	public static final String ID_INSERT_PAYMENT = "insert_payment";
	
	/** Constant for query id of insert payment in EmployeeQuery.xml */
	public static final String ID_UPDATE_PAYMENT = "update_payment";

	//-----------------------Common Util-------------------------------------------------------------------------------------------------------
	
	/** Constant for query id of get common counts  in EmployeeQuery.xml */
	public static final String ID_COMMON_COUNTS = "common_counts";
	
	/** Constant for query id of get birthday buddies  in EmployeeQuery.xml */
	public static final String ID_VIEW_BIRTHDAYS = "view_birthdays";
	
	//-----------------------Attendance -------------------------------------------------------------------------------------------------------
	
	/** Constant for query id of add attendance  in EmployeeQuery.xml */
	public static final String ID_ADD_ATTENDANCE = "add_attendance";
	
	/** Constant for query id of get Attendace of employee according to a month in EmployeeQuery.xml */
	public static final String ID_GET_EMPLOYEE_ATTENDANCE = "get_emp_attendance_acc_month";
	
	/** Constant for query id of get Attendace of employee according to a date in EmployeeQuery.xml */
	public static final String ID_GET_EMPLOYEE_ATTENDANCE_ACC_DATE = "get_attendance_acc_date";
	
	/** Constant for query id of update attendance in EmployeeQuery.xml */
	public static final String ID_UPDATE_ATTENDANCE = "update_attendance";
	
	//----------------------- Leave Management -------------------------------------------------------------------------------------------------------
	

	/** Constant for query id of view all leaves  EmployeeQuery.xml */
	public static final String ID_VIEW_ALL_LEAVES_USER = "list_leaves";
	
	/** Constant for query id of view all leaves for all users  EmployeeQuery.xml */
	public static final String ID_VIEW_ALL_LEAVES_ADMIN = "list_all-leaves";
	
	/** Constant for query id of view all leaves for all users  EmployeeQuery.xml */
	public static final String ID_VIEW_ALL_PENDING_LEAVES_ADMIN_ = "list_all_pending_leaves";
	
	/** Constant for query id of insert leave in EmployeeQuery.xml */
	public static final String ID_ADD_LEAVE = "add_leave";
	
	/** Constant for query id of manage leave in EmployeeQuery.xml */
	public static final String ID_MANAGE_LEAVE = "manage_leave";
	
	//-----------------------Departments--------------------------------------------------------------------------------------------------
	
	/** Constant for query id of view departments in EmployeeQuery.xml */
	public static final String ID_VIEW_DEPARTMENTS = "view_departments";
}

