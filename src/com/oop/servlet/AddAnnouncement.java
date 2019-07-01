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

import com.oop.model.Announcement;
import com.oop.service.AnnouncementServiceImpl;
import com.oop.service.IAnnouncementService;

/**
 * Servlet implementation class AddAnnouncement
 */
@WebServlet("/AddAnnouncement")
public class AddAnnouncement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAnnouncement() {
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
		  
		  Announcement announcement = new Announcement();
		  Date date = new Date();
		  DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		  IAnnouncementService announcementService = new AnnouncementServiceImpl();
		  
		  announcement.setEmpId(Integer.parseInt( request.getParameter("EmpId") ));
		  announcement.setType(Integer.parseInt( request.getParameter("type") ));
		  announcement.setTitle(request.getParameter("Title"));
		  announcement.setAnnouncementText(request.getParameter("Announcement"));
		  announcement.setDate( dateformat.format(date));
		  
		  announcementService.addAnnouncement(announcement);
		  
		  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListAnnouncement.jsp");
		  dispatcher.forward(request, response);
		  
		  
		  
	}

}
