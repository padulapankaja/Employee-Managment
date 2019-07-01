package com.oop.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.model.Attendance;
import com.oop.service.AttendanceServiceImpl;
import com.oop.service.IAttendanceService;

/**
 * Servlet implementation class SearchByDepartment
 */
@WebServlet("/SearchByDepartment")
public class SearchByDepartment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByDepartment() {
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
		 String date = request.getParameter("date");
		 int DepID =  Integer.parseInt(  request.getParameter("department") );
		 
		 IAttendanceService attendanceService = new AttendanceServiceImpl();
		 ArrayList<Attendance> arrayList = attendanceService.ViewEmployeeAttendanceAccDate(date, DepID);
		 
		 //if there is no attendace records to that date
		 if( arrayList.isEmpty()  ) {
			 request.setAttribute("DepID", DepID);
			 request.setAttribute("Date", date);
			 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddAttendance.jsp");
			 dispatcher.forward(request, response);
		 }else {
			 request.setAttribute("DepID", DepID);
			 request.setAttribute("Date", date);
			 request.setAttribute("ArrayListAttendance", arrayList );
			 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UpdateAttendance.jsp");
			 dispatcher.forward(request, response);
			 
		 }
		
		 
	}

}
