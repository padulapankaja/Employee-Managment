package com.oop.servlet;

import java.io.IOException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oop.model.Mail;
import com.oop.service.EmployeeServiceImpl;
import com.oop.service.IEmployeeService;
import com.oop.service.IMailService;
import com.oop.service.MailServiceImpl;

/**
 * Servlet implementation class ComposeMail
 */
@WebServlet("/ComposeMail")
public class ComposeMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComposeMail() {
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
		
		Mail newMail = new Mail();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat timeFormat = new SimpleDateFormat("HH:mm");
		Date date = new Date();
		newMail.setReceiverId(Integer.parseInt( request.getParameter("ReceiverId") ));
		
		IEmployeeService employeeService = new EmployeeServiceImpl();
		if( employeeService.getEmployeeDetails(newMail.getReceiverId()).getEmpId() != 0 ) 
		{
	
		newMail.setReceiverId(Integer.parseInt( request.getParameter("ReceiverId") ));
		newMail.setTitle(request.getParameter("Title"));
		newMail.setMessage(request.getParameter("Message"));
		newMail.setSenderId( Integer.parseInt( request.getParameter("SenderId") ));
		newMail.setSentDate(dateFormat.format(date));
		newMail.setSentTime(timeFormat.format(date));
		
		IMailService mailService = new MailServiceImpl();
		mailService.composeMail(newMail) ;
		
		request.setAttribute("MessageSent", true);
		}else {
			
		request.setAttribute("MessageSent", false);
		}
		
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MailSentboxPage.jsp");
		  dispatcher.forward(request, response);
		
		
		
	}

}
