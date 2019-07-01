package com.oop.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.model.Payment;
import com.oop.service.IPaymentService;
import com.oop.service.PaymentServiceImpl;

/**
 * Servlet implementation class UpdatePayment
 */
@WebServlet("/UpdatePayment")
public class UpdatePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePayment() {
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

		Payment payment = new Payment();
		
		payment.setBasicSalary(Double.parseDouble(request.getParameter("basicSalary")));
		payment.setDearnessAllowance(Double.parseDouble(request.getParameter("dearnessAllow")));
		payment.setMedicalAllowance(Double.parseDouble(request.getParameter("medicalAllow")));
		payment.setHouseRentAllowance(Double.parseDouble(request.getParameter("houserentAllow")));
		payment.setFoodAllowance(Double.parseDouble(request.getParameter("foodAllow")));
		payment.setTelephoneAllowance(Double.parseDouble(request.getParameter("telephoneAllow")));
		payment.setBonus(Double.parseDouble(request.getParameter("bonus")));
		payment.setOther(Double.parseDouble(request.getParameter("other")));
		payment.setProfessionalTax(Double.parseDouble(request.getParameter("professionalTax")));
		payment.setProvideTax(Double.parseDouble(request.getParameter("providentTax")));
		payment.setLoan(Double.parseDouble(request.getParameter("loan")));
		payment.setInsurance(Double.parseDouble(request.getParameter("insurence")));
		payment.setTotalIncome(Double.parseDouble(request.getParameter("totIncome")));
		payment.setTotalDeduction(Double.parseDouble(request.getParameter("totDedution")));
		payment.setTotalAmount(Double.parseDouble(request.getParameter("totAmount")));	
		payment.setPaymentId( Integer.parseInt(request.getParameter("PaymentID") ));
		
		IPaymentService paymentService = new PaymentServiceImpl();
		paymentService.updatePayment(payment);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewAllPaymentRecords.jsp");
		dispatcher.forward(request, response);
	}

}
