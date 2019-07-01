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

/**
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		
		employee.setEmpId(  Integer.parseInt(request.getParameter("empid")) );
		employeeService.updateEmployee(employee);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListEmployeePage.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
