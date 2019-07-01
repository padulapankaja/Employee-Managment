/**
 * 
 */
package com.oop.util;
import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.xml.sax.SAXException;

import com.oop.model.Attendance;
import com.oop.model.Employee;
import com.oop.service.AttendanceServiceImpl;
import com.oop.service.IAttendanceService;

/**
 * @author Amoda IT18130508
 *
 */
public class CommonUtil {
	
	private File file ;
	private String fileName;
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	
	public String UploadFileIntoPath( String filePath ,  List<FileItem> fileItems) {
		
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		   
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(8000);

	      new ServletFileUpload(factory);
	      
	      try {
	    	  // Process the uploaded file items
	         Iterator i = fileItems.iterator();

	         
	         while ( i.hasNext () ) {
	            FileItem fi = (FileItem)i.next();
	            if ( fi.isFormField () ) { 
	            	String name = fi.getFieldName();
	            	String value = fi.getString();
	            	 System.out.println("Value : " + value );
	            	 System.out.println("Field  : " + name );
	            }
	            else{
	            	
	            	// Get the uploaded file parameters
	            	fileName = fi.getName();
	     
	            
	               // Write the file
	               if( fileName.lastIndexOf("\\") >= 0 ) {
	                  file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
	               } else {
	                  file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	               }
	               fi.write( file ) ;
	               System.out.println("Uploaded Filename: " + filePath + fileName );
	              
	            }
	         }
	         
	         } catch(Exception ex) {
	            System.out.println(ex);
	         }
		return fileName ;
	}
//-------------------------------------------------------------------------------------------------------------------------------
	public String messageType(int mailID , int selectedID , int read)
	{
		if(mailID == selectedID ) {
			return "Selected";
		}else if(read == 0 )
		{
			return "Active";
		}else 
		{
			return "Deactive";
		}
	}
	
	//-------------------------------------------------------------------------------------------------------------------------------
		public String messageType(int mailID , int selectedID )
		{
			if(mailID == selectedID ) {
				return "Selected";
			
			}else 
			{
				return "Deactive";
			}
		}
//-----------------------------------------------------------------------------------------------------------------------------------------
		public String getFirsttDate(Date date)
		{
			 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
			 return  dateFormat.format(date);
		}
		
		public String getLastDate(Date date)
		{
			 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
			 Calendar cal = Calendar.getInstance();
		     cal.setTime(date);
		     cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			 
			 return  dateFormat.format(cal.getTime());
		}
//----------------------------------------------------------------------------------------------------------------------------------------
		public String greetingMessage()
		{
			Calendar calendar = Calendar.getInstance();
			int hours = calendar.get(Calendar.HOUR_OF_DAY );
			String greeting = null;
			if(hours>=0 && hours<=11){
			    greeting = "Good Morning, ";
			} else if(hours>=12 && hours<=15){
			    greeting = "Good Afternoon, ";
			} else if(hours>=16 && hours<=20){
			    greeting = "Good Evening, ";
			} else if(hours>=21 && hours<=23){
			    greeting = "Good Night, ";
			}
			return greeting;
		}
//-----------------------------------------------------------------------------------------------------------------------------------------
		public LinkedHashMap<String, Integer> getCounts(int EmpID)
		{
			LinkedHashMap<String , Integer> hashMap = new LinkedHashMap<String, Integer>();
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement = connection.prepareStatement(QueryUtil.queryByID(CommonConstants.ID_COMMON_COUNTS));
				connection.setAutoCommit(false);
				preparedStatement.setInt( 1 , EmpID);
				ResultSet resultSet =  preparedStatement.executeQuery();
				while(resultSet.next() )
				{
					hashMap.put( "Employees"  , resultSet.getInt(1) );
					hashMap.put( "Departments"  , resultSet.getInt(2) );
					hashMap.put( "Designations"  , resultSet.getInt(3) );
					hashMap.put( "New Mails"  , resultSet.getInt(4) );
					
				}
				connection.commit();
				
				
			} catch (SQLException | SAXException | IOException | ParserConfigurationException | ClassNotFoundException e) {
				System.out.print(e);
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
			return  hashMap;
		}
//---------------------------------------------------------------------------------------------------------------------------------------------
		public String AttendanceMarker( int EmpID, String month ) throws ParseException
		{
			DateFormat dateFormat = new SimpleDateFormat("dd");
			IAttendanceService attendanceService = new AttendanceServiceImpl();
			ArrayList<Attendance> arrayList = attendanceService.ViewEmployeeAttendance(EmpID, month);
			String output = "";
			boolean rowFound;
			if(!arrayList.isEmpty()) {
			
			for(int x = 1 ; x <= 30; x++ )
			{
				rowFound = false;
				for(Attendance attendance : arrayList)
				{
					Date date = new SimpleDateFormat("yyyy-MM-dd").parse(attendance.getReturnDate() );
					if( Integer.parseInt(dateFormat.format(date)) == x )
					{
						if(attendance.getEmpAttendance() == 1 )
							output += "<td><i class= 'fas fa-check-circle success'></i></td>";
						else
							output += "<td><i class='fas fa-times-circle danger'></i></td>";
						rowFound = true;
					}
				}
			if(rowFound == false)
				output += "<td></td>";
			}
			
			}else
			{
				for(int x = 1 ; x <= 30; x++ )
					output += "<td></td>";
			}
			return output;
		}
		
//-------------------------------------------------------------------------------------------------------------------------------
		public ArrayList<Calendar> getDaysOfWeek(){
			ArrayList<Calendar> week = new ArrayList<Calendar>(); 
			
			for( int x = 0 ; x < 6 ; x++ ) {
				Calendar c = Calendar.getInstance(); 
				c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
				c.add(Calendar.DATE, x);
				week.add(c);
			}
		    
			return week;
		}
//----------------------------------------------------------------------------------------------------------------------------
	public ArrayList<Employee> getBirthdaysInThisMonth() {
		ArrayList<Employee> arrayList = new ArrayList<Employee>();
		Calendar date = Calendar.getInstance();
		int monthID = date.get(Calendar.MONTH) + 1 ;
	
		try {
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement( QueryUtil.queryByID(CommonConstants.ID_VIEW_BIRTHDAYS ) );
			preparedStatement.setInt(1, monthID );
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Employee employee = new Employee();
				employee.setEmpId(resultSet.getInt(1));
				employee.setFirstName(resultSet.getString(2));
				employee.setLastName(resultSet.getString(3));
				employee.setDateOfBirth(resultSet.getString(4));
				employee.setImagePath(resultSet.getString(25));
				arrayList.add(employee);
			}
			
		} catch (ClassNotFoundException | SQLException | SAXException | IOException | ParserConfigurationException e) {
			System.out.println(e);
		} finally {
			try {

				if (preparedStatement != null)
					preparedStatement.close();

				if (connection != null)
					connection.close();

			} catch (SQLException e) { }
		}
		return arrayList;
	}
//-------------------------------------------------------------------------------------------------------------------------------------------
	public static String get_SHA_256_SecurePassword(String passwordToHash)
    {
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] bytes = md.digest(passwordToHash.getBytes());
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        return generatedPassword;
    }
}

