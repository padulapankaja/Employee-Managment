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
 * Servlet implementation class UpdateAttendance
 */
@WebServlet("/UpdateAttendance")
public class UpdateAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAttendance() {
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
		int department = Integer.parseInt(request.getParameter("department") );
		
		//create an arraylist to set all Update attendance values
		ArrayList<Attendance> arrayListUpdate = new ArrayList<Attendance>();
		
		IAttendanceService attendanceService = new AttendanceServiceImpl();
		ArrayList<Attendance> arrayList =  attendanceService.ViewEmployeeAttendanceAccDate(date, department);
		
		for( Attendance row : arrayList )
		{
			Attendance updateAttendance = new Attendance();
			updateAttendance.setAttId( row.getAttId() );
			updateAttendance.setEmpAttendance( Integer.parseInt( request.getParameter( String.valueOf( row.getAttId() ) ) ) );
			arrayListUpdate.add(updateAttendance);
		}
		
		attendanceService.UpdateAttendance(arrayListUpdate);
		request.setAttribute("month", date  );
		request.setAttribute("department", department );
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListAttendance.jsp");
		dispatcher.forward(request, response);
	}

}
