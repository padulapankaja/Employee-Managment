package com.oop.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oop.model.LoginHandler;
import com.oop.service.ILoginService;
import com.oop.service.LoginServiceImpl;
import com.oop.util.CommonUtil;

/**
 * Servlet implementation class MemberLogin
 */
@WebServlet("/MemberLogin")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogin() {
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
		  
		  String Uname = request.getParameter("username");
		  String Password = request.getParameter("password");
		  String SecurePassword = CommonUtil.get_SHA_256_SecurePassword(Password);  
		  
		  ILoginService loginService = new LoginServiceImpl();
		  LoginHandler login = loginService.authenticateEmployee( Uname,  SecurePassword    );
		 
		  if(login.getEmpId() == 0 )
		  {
			  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginPage.jsp");
			  dispatcher.forward(request, response);
			  
			  
		  }else {
			  
			 HttpSession session = request.getSession();
			 session.setAttribute("loginDetails", login );
			 session.setAttribute("loginCheck", true );
			 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomePage.jsp");
			 dispatcher.forward(request, response);
		  }
		  
		  
			  
	}

}
