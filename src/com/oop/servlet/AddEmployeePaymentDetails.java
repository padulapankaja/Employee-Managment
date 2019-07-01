package com.oop.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddEmployeePaymentDetails
 */
@WebServlet("/AddEmployeePaymentDetails")
public class AddEmployeePaymentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeePaymentDetails() {
        super();
      
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
		  int EmpID = Integer.parseInt( request.getParameter("EmpID").toString() );
		  String month = request.getParameter("month");
		
		  request.setAttribute( "EmpID" , EmpID);
		  request.setAttribute( "month" , month );
		
		  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddPaymentDetails.jsp");
		  dispatcher.forward(request, response);
		  
	
	}

}
