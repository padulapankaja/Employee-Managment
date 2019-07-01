package com.oop.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewPayment
 */
@WebServlet("/ViewPayment")
public class ViewPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String month = request.getParameter("Month");
		
		int EmpID = Integer.parseInt( request.getParameter("EmpID") );
		if( request.getParameter("Search") == null ) {
		DateFormat monthformat = new SimpleDateFormat("yyyy-MM");
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(month);
			month = monthformat.format(date);
		} catch (ParseException e) {
			
		} 
		}
		request.setAttribute("Month", month );
		request.setAttribute("EmpID", EmpID );
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewEmployeePayment.jsp");
		dispatcher.forward(request, response);
	}

}
