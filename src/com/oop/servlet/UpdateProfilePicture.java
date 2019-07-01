package com.oop.servlet;


import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.oop.service.EmployeeServiceImpl;
import com.oop.service.IEmployeeService;

/**
 * Servlet implementation class UpdateProfilePicture
 */
@WebServlet("/UpdateProfilePicture")

public class UpdateProfilePicture extends HttpServlet {

	private String filePath = System.getProperty("catalina.home") + "\\EMS\\WebContent\\images\\";
	private int EmpId;
	private String value;
	private File file ;
	private String fileName;

	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfilePicture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletFileUpload.isMultipartContent(request);
		
		
			try {
		       List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));
		    
			DiskFileItemFactory factory = new DiskFileItemFactory();
			   
		      // maximum size that will be stored in memory
		      factory.setSizeThreshold(8000);

		      new ServletFileUpload(factory);
		      
		     
		    	  // Process the uploaded file items
		         Iterator i = fileItems.iterator();

		         
		         while ( i.hasNext () ) {
		            FileItem fi = (FileItem)i.next();
		            if ( fi.isFormField () ) { 
		            	
		             value = fi.getString();
		            	 
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
			 EmpId = Integer.parseInt(value );
			 IEmployeeService employeeService = new EmployeeServiceImpl();
			 employeeService.UploadProfilePicture(EmpId, fileName);
			 request.setAttribute( "EmpId" , EmpId);
			 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListEmployeePage.jsp");
			 dispatcher.forward(request, response);
	}

}
