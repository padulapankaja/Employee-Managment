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
import com.oop.model.Employee;
import com.oop.service.AttendanceServiceImpl;
import com.oop.service.EmployeeServiceImpl;
import com.oop.service.IAttendanceService;
import com.oop.service.IEmployeeService;

/**
 * Servlet implementation class AddAttendance
 */
@WebServlet("/AddAttendance")
public class AddAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAttendance() {
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
		
		//set the date and department values
		Attendance.setDate( request.getParameter("date") );
		Attendance.setDepId(Integer.parseInt(request.getParameter("department")));
		
		//create an arraylist to set all attendance values
		ArrayList<Attendance> arrayListAttendance = new ArrayList<Attendance>();
		
		//create employee service object 
		IEmployeeService employeeService = new EmployeeServiceImpl();
		ArrayList<Employee> arrayListEmployee = employeeService.getEmployeesAccDepartment( Attendance.getDepId() );
		
		//for each loop to each employee
		for(Employee employee : arrayListEmployee )
		{
			Attendance EmpAttendance = new Attendance();
			
			EmpAttendance.setEmpId( employee.getEmpId()  );
			int Att =  Integer.parseInt( request.getParameter( String.valueOf( employee.getEmpId()  ) ) ); 
			EmpAttendance.setEmpAttendance( Att );
			
			arrayListAttendance.add(EmpAttendance);
			
		}
		//create Attendance service type object to get addAttendance service
		IAttendanceService attendanceService = new AttendanceServiceImpl();
		attendanceService.addAttendance(arrayListAttendance);
		
		
		request.setAttribute("month", Attendance.getDate()  );
		request.setAttribute("department", Attendance.getDepId());
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListAttendance.jsp");
		dispatcher.forward(request, response);
	}

}
