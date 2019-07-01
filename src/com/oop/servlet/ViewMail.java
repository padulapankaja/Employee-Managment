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
 * Servlet implementation class ViewMail
 */
@WebServlet("/ViewMail")
public class ViewMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMail() {
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
		int mailId = Integer.parseInt( request.getParameter("mailId").toString() );
		String MessageType = request.getParameter("MessageType");
		request.setAttribute("MessageID", mailId);
		RequestDispatcher dispatcher;
		if( MessageType.equalsIgnoreCase("Inbox") )
		{
			int read = Integer.parseInt( request.getParameter("readStatus").toString() );
			if(read == 0 )
			{
				IMailService mailService = new MailServiceImpl();
				mailService.read(mailId);
			}
			 dispatcher = getServletContext().getRequestDispatcher("/MailInboxPage.jsp");
		}else
		{
			 dispatcher = getServletContext().getRequestDispatcher("/MailSentboxPage.jsp");
		}
		dispatcher.forward(request, response);
	}
}
