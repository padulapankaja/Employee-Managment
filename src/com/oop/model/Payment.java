/**
 * 
 */
package com.oop.model;

/**
 * @author Padula Guruge IT18007534
 * 
 * 
 */
public class Payment {

	//Personal Information (From Employee)
	private String FirstName;
	private String LastName;
	private String Possition;
	private int Department;
	private String StartDate;
	private String EndDate;
	
	/**
	 * @return the startDate
	 */
	public String getStartDate() {
		return StartDate;
	}
	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(String startDate) {
		StartDate = startDate;
	}
	/**
	 * @return the endDate
	 */
	public String getEndDate() {
		return EndDate;
	}
	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(String endDate) {
		EndDate = endDate;
	}
	//Incomes
	private double BasicSalary;
	private double DearnessAllowance;
	private double MedicalAllowance;
	private double HouseRentAllowance;
	private double FoodAllowance;
	private double TelephoneAllowance;
	private double Bonus;
	private double Other;
	
	//Deductions
	private double ProfessionalTax;
	private double ProvideTax;
	private double Loan;
	private double Insurance;
	
	//Total
	private double TotalIncome;
	private double TotalDeduction;
	private double TotalAmount;
	
	private int PaymentId;
	private int EmpId;
	private String mobile;
	

	/**
	 * @return the empId
	 */
	public int getEmpId() {
		return EmpId;
	}
	/**
	 * @param empId the empId to set
	 */
	public void setEmpId(int empId) {
		EmpId = empId;
	}
	/**
	 * @return the paymentId
	 */
	public int getPaymentId() {
		return PaymentId;
	}
	/**
	 * @param paymentId the paymentId to set
	 */
	public void setPaymentId(int paymentId) {
		PaymentId = paymentId;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return FirstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return LastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	/**
	 * @return the possition
	 */
	public String getPossition() {
		return Possition;
	}
	/**
	 * @param possition the possition to set
	 */
	public void setPossition(String possition) {
		Possition = possition;
	}
	/**
	 * @return the department
	 */
	public int getDepartment() {
		return Department;
	}
	/**
	 * @param department the department to set
	 */
	public void setDepartment(int department) {
		Department = department;
	}
	/**
	 * @return the basicSalary
	 */
	public double getBasicSalary() {
		return BasicSalary;
	}
	/**
	 * @param basicSalary the basicSalary to set
	 */
	public void setBasicSalary(double basicSalary) {
		BasicSalary = basicSalary;
	}
	/**
	 * @return the dearnessAllowance
	 */
	public double getDearnessAllowance() {
		return DearnessAllowance;
	}
	/**
	 * @param dearnessAllowance the dearnessAllowance to set
	 */
	public void setDearnessAllowance(double dearnessAllowance) {
		DearnessAllowance = dearnessAllowance;
	}
	/**
	 * @return the medicalAllowance
	 */
	public double getMedicalAllowance() {
		return MedicalAllowance;
	}
	/**
	 * @param medicalAllowance the medicalAllowance to set
	 */
	public void setMedicalAllowance(double medicalAllowance) {
		MedicalAllowance = medicalAllowance;
	}
	/**
	 * @return the houseRentAllowance
	 */
	public double getHouseRentAllowance() {
		return HouseRentAllowance;
	}
	/**
	 * @param houseRentAllowance the houseRentAllowance to set
	 */
	public void setHouseRentAllowance(double houseRentAllowance) {
		HouseRentAllowance = houseRentAllowance;
	}
	/**
	 * @return the foodAllowance
	 */
	public double getFoodAllowance() {
		return FoodAllowance;
	}
	/**
	 * @param foodAllowance the foodAllowance to set
	 */
	public void setFoodAllowance(double foodAllowance) {
		FoodAllowance = foodAllowance;
	}
	/**
	 * @return the telephoneAllowance
	 */
	public double getTelephoneAllowance() {
		return TelephoneAllowance;
	}
	/**
	 * @param telephoneAllowance the telephoneAllowance to set
	 */
	public void setTelephoneAllowance(double telephoneAllowance) {
		TelephoneAllowance = telephoneAllowance;
	}
	/**
	 * @return the bonus
	 */
	public double getBonus() {
		return Bonus;
	}
	/**
	 * @param bonus the bonus to set
	 */
	public void setBonus(double bonus) {
		Bonus = bonus;
	}
	/**
	 * @return the other
	 */
	public double getOther() {
		return Other;
	}
	/**
	 * @param other the other to set
	 */
	public void setOther(double other) {
		Other = other;
	}
	/**
	 * @return the professionalTax
	 */
	public double getProfessionalTax() {
		return ProfessionalTax;
	}
	/**
	 * @param professionalTax the professionalTax to set
	 */
	public void setProfessionalTax(double professionalTax) {
		ProfessionalTax = professionalTax;
	}
	/**
	 * @return the provideTax
	 */
	public double getProvideTax() {
		return ProvideTax;
	}
	/**
	 * @param provideTax the provideTax to set
	 */
	public void setProvideTax(double provideTax) {
		ProvideTax = provideTax;
	}
	/**
	 * @return the loan
	 */
	public double getLoan() {
		return Loan;
	}
	/**
	 * @param loan the loan to set
	 */
	public void setLoan(double loan) {
		Loan = loan;
	}
	/**
	 * @return the insurance
	 */
	public double getInsurance() {
		return Insurance;
	}
	/**
	 * @param insurance the insurance to set
	 */
	public void setInsurance(double insurance) {
		Insurance = insurance;
	}
	/**
	 * @return the totalIncome
	 */
	public double getTotalIncome() {
		return TotalIncome;
	}
	/**
	 * @param totalIncome the totalIncome to set
	 */
	public void setTotalIncome(double totalIncome) {
		TotalIncome = totalIncome;
	}
	/**
	 * @return the totalDeduction
	 */
	public double getTotalDeduction() {
		return TotalDeduction;
	}
	/**
	 * @param totalDeduction the totalDeduction to set
	 */
	public void setTotalDeduction(double totalDeduction) {
		TotalDeduction = totalDeduction;
	}
	/**
	 * @return the totalAmount
	 */
	public double getTotalAmount() {
		return TotalAmount;
	}
	/**
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(double totalAmount) {
		TotalAmount = totalAmount;
	}
	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
	
}
