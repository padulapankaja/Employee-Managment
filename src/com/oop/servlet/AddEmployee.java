package com.oop.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.model.Employee;
import com.oop.service.EmployeeServiceImpl;
import com.oop.service.IEmployeeService;
import com.oop.util.CommonConstants;
import com.oop.util.CommonUtil;

/**
 * Servlet implementation class AddEmployee
 */
@WebServlet("/AddEmployee")

public class AddEmployee extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployee() {
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
		
		Employee employee = new Employee();
		IEmployeeService employeeService = new EmployeeServiceImpl();
		
		employee.setFirstName(request.getParameter("fname"));
		employee.setLastName(request.getParameter("lname"));
		employee.setDateOfBirth(request.getParameter("dob"));
		employee.setGender(request.getParameter("gender"));
		employee.setMaritalStatus(request.getParameter("status"));
		employee.setSpouseName(request.getParameter("spname"));
		employee.setNationality(request.getParameter("nationality"));
		employee.setNIC(request.getParameter("nic"));
		
		employee.setAddress(request.getParameter("address"));
		employee.setCity(request.getParameter("city"));
		employee.setZipCode( Integer.parseInt(request.getParameter("zipcode")) );
		employee.setMobile(request.getParameter("mobile"));
		employee.setPhone(request.getParameter("phone"));
		employee.setEmail(request.getParameter("email"));
		employee.setEmergencyNo(request.getParameter("enumber"));
		
		employee.setDepartmentID( Integer.parseInt(request.getParameter("department")) );
		employee.setDesignation(request.getParameter("designation"));
		employee.setBankName(request.getParameter("bankname"));
		employee.setBranchName(request.getParameter("branchno"));
		employee.setAccountNo( Double.parseDouble(request.getParameter("accountno")) );
		employee.setUname(request.getParameter("fname")+request.getParameter("lname"));
		employee.setPassword( CommonUtil.get_SHA_256_SecurePassword(request.getParameter("nic") )   );
		employee.setAdmin(0);
		employee.setImagePath(CommonConstants.DEFAULT_IMG);
		

		
		int EmpId = employeeService.addEmployee(employee);
		request.setAttribute( "EmpId" , EmpId );
		request.setAttribute( "newEmployee" , true );
		request.setAttribute( "Username" , employee.getUname() );
		request.setAttribute( "Password" , employee.getNIC() );
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewEmployeePage.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

}
