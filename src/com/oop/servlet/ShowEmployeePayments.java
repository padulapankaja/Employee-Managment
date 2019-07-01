package com.oop.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowEmployeePayments
 */
@WebServlet("/ShowEmployeePayments")
public class ShowEmployeePayments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowEmployeePayments() {
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
		  
		int DepartmentID = Integer.parseInt(request.getParameter("department"));
		String month = request.getParameter("month");
		
		request.setAttribute( "month", month);
		request.setAttribute( "department", DepartmentID);
		request.setAttribute("search", true);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListForAddPaymentDetails.jsp");
		dispatcher.forward(request, response);
		
		
	
		   
		   
 
	}

}
