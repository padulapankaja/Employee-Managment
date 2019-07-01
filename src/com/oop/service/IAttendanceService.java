/**
 * 
 */
package com.oop.service;

import java.util.ArrayList;

import com.oop.model.Attendance;

/**
 * @author Amoda
 *
 */
public interface IAttendanceService {
	
	/**
	 * @param ArrayList<Attendance>
	 * @return void
	 */
	public void addAttendance(ArrayList<Attendance> arrayListAttendance );
	
	/**
	 * @param int EmpId, String month
	 * @return ArrayList<Attendance>
	 */
	public ArrayList<Attendance> ViewEmployeeAttendance( int EmpId , String month );
	
	/**
	 * @param int DeptID, String date
	 * @return ArrayList<Attendance>
	 */
	public ArrayList<Attendance> ViewEmployeeAttendanceAccDate( String date  , int DeptID );
	
	/**
	 * @param int DeptID, String date
	 * 
	 */
	public void UpdateAttendance( ArrayList<Attendance> arrayList );

}