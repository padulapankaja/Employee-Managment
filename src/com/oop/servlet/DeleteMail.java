package com.oop.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.service.IMailService;
import com.oop.service.MailServiceImpl;

/**
 * Servlet implementation class DeleteMail
 */
@WebServlet("/DeleteMail")
public class DeleteMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMail() {
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
		int mailID = Integer.parseInt( request.getParameter("mailID") );
		String messageType = request.getParameter("messageType");
		IMailService mailService = new MailServiceImpl();
		mailService.deleteMail(mailID);
		RequestDispatcher dispatcher = null;
		
		if(messageType.equalsIgnoreCase("sentbox") )
		{
			dispatcher	= getServletContext().getRequestDispatcher("/MailSentboxPage.jsp");
		}
		if(messageType.equalsIgnoreCase("inbox")) 
		{
			dispatcher	= getServletContext().getRequestDispatcher("/MailInboxPage.jsp");	
		}
	
		dispatcher.forward(request, response);
	}

}
