package com.oop.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.model.Leave;
import com.oop.service.ILeaveService;
import com.oop.service.LeaveServiceImpl;

/**
 * Servlet implementation class LeaveRequest
 */
@WebServlet("/LeaveRequest")
public class LeaveRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveRequest() {
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
			Leave leave = new Leave();
			
			leave.setEmpId( Integer.parseInt(request.getParameter("EmpId") )  );
			leave.setEmployeeName(request.getParameter("EmpName"));
			leave.setDepNo( Integer.parseInt( request.getParameter("Department")));
			leave.setStartDate(request.getParameter("StartDate"));
			leave.setEndDate(request.getParameter("EndDate"));
			leave.setCount( Integer.parseInt( request.getParameter("count") ) );
			leave.setDescription( request.getParameter("Description"));
			leave.setStatus( "Pending" );
			
			ILeaveService leaveService = new LeaveServiceImpl();
			leaveService.addLeave(leave);
			
			RequestDispatcher dispatch  = getServletContext().getRequestDispatcher("/UserLeaveList.jsp");
			dispatch.forward(request, response);
	}

}
