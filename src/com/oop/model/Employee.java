package com.oop.model;

public class Employee {
	
	//Personal Information of the Employee
	private int EmpId;
	private String FirstName;
	private String LastName;
	private String DateOfBirth;
	private String Gender;
	private String MaritalStatus;
	private String SpouseName;
	private String Nationality;
	private String NIC;
	
	//Contact Information of the Employee
	private String Address;
	private String City;
	private int ZipCode;
	private String Mobile;
	private String Phone;
	private String Email;
	private String EmergencyNo;
	
	//Company Information of the Employee
	private int DepartmentID;
	private String Designation;
	
	//Bank Information of the Employee
	private String BankName;
	private String BranchName;
	private double AccountNo;
	
	private String Uname;
	private String Password;
	private int Admin;
	private String ImagePath;
	
	/**
	 * @return the nIC
	 */
	public String getNIC() {
		return NIC;
	}
	/**
	 * @param nIC the nIC to set
	 */
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	/**
	 * @return the uname
	 */
	public String getUname() {
		return Uname;
	}
	/**
	 * @param uname the uname to set
	 */
	public void setUname(String uname) {
		Uname = uname;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return Password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		Password = password;
	}
	/**
	 * @return the admin
	 */
	public int getAdmin() {
		return Admin;
	}
	/**
	 * @param admin the admin to set
	 */
	public void setAdmin(int admin) {
		Admin = admin;
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
	 * @return the dateOfBirth
	 */
	public String getDateOfBirth() {
		return DateOfBirth;
	}
	/**
	 * @param dateOfBirth the dateOfBirth to set
	 */
	public void setDateOfBirth(String dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}
	/**
	 * @return the gender
	 */
	public String getGender() {
		return Gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		Gender = gender;
	}
	/**
	 * @return the maritalStatus
	 */
	public String getMaritalStatus() {
		return MaritalStatus;
	}
	/**
	 * @param maritalStatus the maritalStatus to set
	 */
	public void setMaritalStatus(String maritalStatus) {
		MaritalStatus = maritalStatus;
	}
	/**
	 * @return the spouseName
	 */
	public String getSpouseName() {
		return SpouseName;
	}
	/**
	 * @param spouseName the spouseName to set
	 */
	public void setSpouseName(String spouseName) {
		SpouseName = spouseName;
	}
	/**
	 * @return the nationality
	 */
	public String getNationality() {
		return Nationality;
	}
	/**
	 * @param nationality the nationality to set
	 */
	public void setNationality(String nationality) {
		Nationality = nationality;
	}
	
	/**
	 * @return the address
	 */
	public String getAddress() {
		return Address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		Address = address;
	}
	/**
	 * @return the city
	 */
	public String getCity() {
		return City;
	}
	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		City = city;
	}
	/**
	 * @return the zipCode
	 */
	public int getZipCode() {
		return ZipCode;
	}
	/**
	 * @param zipCode the zipCode to set
	 */
	public void setZipCode(int zipCode) {
		ZipCode = zipCode;
	}
	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return Mobile;
	}
	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return Phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		Phone = phone;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return Email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		Email = email;
	}
	/**
	 * @return the emergencyNo
	 */
	public String getEmergencyNo() {
		return EmergencyNo;
	}
	/**
	 * @param emergencyNo the emergencyNo to set
	 */
	public void setEmergencyNo(String emergencyNo) {
		EmergencyNo = emergencyNo;
	}
	/**
	 * @return the departmentID
	 */
	public int getDepartmentID() {
		return DepartmentID;
	}
	/**
	 * @param departmentID the departmentID to set
	 */
	public void setDepartmentID(int departmentID) {
		DepartmentID = departmentID;
	}
	/**
	 * @return the designation
	 */
	public String getDesignation() {
		return Designation;
	}
	/**
	 * @param designation the designation to set
	 */
	public void setDesignation(String designation) {
		Designation = designation;
	}
	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return BankName;
	}
	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		BankName = bankName;
	}
	/**
	 * @return the branchName
	 */
	public String getBranchName() {
		return BranchName;
	}
	/**
	 * @param branchName the branchName to set
	 */
	public void setBranchName(String branchName) {
		BranchName = branchName;
	}
	/**
	 * @return the accountNo
	 */
	public double getAccountNo() {
		return AccountNo;
	}
	/**
	 * @param accountNo the accountNo to set
	 */
	public void setAccountNo(double accountNo) {
		AccountNo = accountNo;
	}
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
	 * @return the imagePath
	 */
	public String getImagePath() {
		return ImagePath;
	}
	/**
	 * @param imagePath the imagePath to set
	 */
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
	
	/**
	 * @param 
	 */
	public void setGenderType(String type) {
		 
		
		if( this.Gender == type )
		{
			
		}
		
	}
	
	
	
	
	
	

}
