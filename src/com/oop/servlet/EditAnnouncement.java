package com.oop.servlet;

import java.io.IOException;
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
 * Servlet implementation class EditAnnouncement
 */
@WebServlet("/EditAnnouncement")
public class EditAnnouncement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAnnouncement() {
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
		  Announcement announcement = new Announcement();
		  IAnnouncementService announcementService = new AnnouncementServiceImpl();
		  
		  announcement.setAnnId( Integer.parseInt(request.getParameter("AnnID") ));
		  announcement.setType(Integer.parseInt( request.getParameter("type") ));
		  announcement.setTitle(request.getParameter("Title"));
		  announcement.setAnnouncementText(request.getParameter("Announcement"));
		  
		  announcementService.updateAnnouncement(announcement);
		  
		  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListAnnouncement.jsp");
		  dispatcher.forward(request, response);
	}

}
