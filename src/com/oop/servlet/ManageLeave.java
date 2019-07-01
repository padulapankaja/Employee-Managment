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
 * Servlet implementation class ManageLeave
 */
@WebServlet("/ManageLeave")
public class ManageLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageLeave() {
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
		ILeaveService leaveService = new LeaveServiceImpl();
		Leave leave = new Leave();
		leave.setLeaveId(Integer.parseInt( request.getParameter("LeaveId")));
		leave.setStatus(request.getParameter("action") );
		leave.setFeedback(request.getParameter("feedback"));
		leaveService.manageLeave(leave);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminLeaveList.jsp");
		dispatcher.forward(request, response);
		
	}

}
