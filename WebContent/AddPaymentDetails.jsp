<%@page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.oop.util.CommonUtil"%>
<%@page import="com.oop.service.*" %>
<%@page import="com.oop.model.Employee" %>
<%@page import="com.oop.model.LoginHandler" %>  

	<%
		if(session.getAttribute("loginDetails") == null )
		{
       		getServletContext().getRequestDispatcher("/LoginPage.jsp").forward(request, response);
			return;
		} 
      		LoginHandler login = (LoginHandler) session.getAttribute("loginDetails"); 
  	%>
   
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles/style.css" />
<link rel="stylesheet" type="text/css" href="styles/styleLE.css" />
<link rel="stylesheet" type="text/css" href="styles/styleAE.css" />
<link rel="stylesheet"href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" >

</head>
<body>
	 <div class = "d-flex"> 
 			<jsp:include page="Sidebar.jsp"></jsp:include>
 			 									
 			
     <!-- -Page-Content------------------------------------------------------------------------------------------------------- -->
		<div id="page-wrapper">
		
			<div class="container-flex">
			
				<!-- Main-Title-of-the-Page------------------------------------------------ -->
				
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
				
					<h3>
						<strong> 
						<!-- Main-Header icon and Text goes here---------------------------- -->
						
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Payment Details </strong>
					</h3>
				</div>
				
				<!-- Form Sides start from here---------------------------------------------- -->
				
			
				<%  int EmpID = Integer.parseInt( request.getAttribute("EmpID").toString());
					String month = request.getAttribute("month").toString();
					IDepartmentService departmentService = new DepartmentServiceImpl();
					System.out.println("EmpID");
					Date date = new SimpleDateFormat("yyyy-MM").parse(month);
				  	CommonUtil util = new CommonUtil();
				 	String firstDate = util.getFirsttDate(date);
				  	String lastDate = util.getLastDate(date);
				
				   IEmployeeService employeeService = new EmployeeServiceImpl();
				   Employee employee = employeeService.getEmployeeDetails(EmpID);
			
					%> 
			
				<form method="post" action="AddPayment" name="addPayment" onsubmit="return paymentValidation()" >
					<div class="col-md-12 col-sm-12 col-xs-12 FormSides">

						<!-- Right Part of the page Content---------------------------------- -->
						<div class="col-md-6 col-sm-6 col-xs-12" id="l">

							<div class="col-md-12 col-sm-12 col-xs-12 " id="left">
								<!-- Header -->
								<h5 class="FormHeader">
									<strong>Personal Information</strong>
								</h5>
								<!-- --Input Component-------  -->
								<div class="col-md-6">
									<label>First Name</label> <input type="text"class="form-control" name="fname" value="<%=employee.getFirstName() %>" readonly>
								</div>
								<input type="hidden" class="form-control" name="empId"value="<%=employee.getEmpId() %>" >
								<!-- -Component End----------- -->
								<!-- --Input Component-------- -->
								<div class="col-md-6">
									<label>Last Name</label> <input type="text"class="form-control" name="lname" value="<%=employee.getLastName() %>" readonly >
								</div>
								<!-- -Component End----------- -->
								<!-- --Input Component-------- -->
								<div class="col-md-6">
									<label>Designation</label> <input type="text" class="form-control" value="<%=employee.getDesignation() %>" name="des" readonly>
								</div>
								<!-- -Component End----------- -->
								<!-- --Input Component-------- -->
								<div class="col-md-6">
									<label>Department</label> <input type="text" class="form-control" value="<%=employee.getDepartmentID() %>" name="dept" readonly>
								</div>
								<!-- -Component End----------- -->
								
								<!-- --Input Component---------->
								<div class="col-md-6">
									<label>Start Date</label> <input type="date" class="form-control" value="<%=firstDate %>" name="startdate" readonly>
								</div>
								<!-- -Component End----------- -->
								<!-- --Input Component-------- -->
								<div class="col-md-6">
									<label>End Date</label> <input type="date" class="form-control" value="<%=lastDate %>" name="enddate" readonly>
								</div>
								<!-- -Component End----------- -->
								</div>
							</div>

						
						<!-- End of the Right Part------------------------------------------ -->
				
				<!-- Left Part of the page Content--------------------------------- -->
				<div class="col-md-6 col-sm-6 col-xs-12" id="r">
					<div class="col-md-12 col-sm-12 col-xs-12  " id="right">

						<h5 class="FormHeader">
							<strong>Income (Rs.)</strong>
						</h5>
						<!-- --Input Component-------  -->
						<div class="col-md-6">
							<label>Basic Salary<span id="basicSalaryError" class="spanError"></span></label> <input type="text" class="form-control" id="basicSalary" name="basicSalary" placeholder="Basic Salary..." >
						</div>
						<!---Component End----------- -->
						<!----Input Component-------- -->
						<div class="col-md-6">
							<label>Dearness Allowance<span id="dearnessAllowError" class="spanError"></span></label> <input type="text"class="form-control" id="dearnessAllow" name="dearnessAllow"placeholder="Dearness Allowance...">
						</div>
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Medical Allowance<span id="medicalAllowError" class="spanError"></span></label> <input type="text"class="form-control" id="medicalAllow" name="medicalAllow"placeholder="Medical Allowance...">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>House Rent Allowance<span id="houserentAllowError" class="spanError"></span></label> <input type="text"class="form-control" id="houserentAllow" name="houserentAllow"placeholder="House Rent Allowance...">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Food Allowance<span id="foodAllowError" class="spanError"></span></label> <input type="text"class="form-control" id="foodAllow" name="foodAllow"placeholder="Food Allowance...">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Telephone Allowance<span id="telephoneAllowError" class="spanError"></span></label> <input type="text"class="form-control" id="telephoneAllow" name="telephoneAllow"placeholder="Telephone Allowance...">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Bonus<span id="bonusError" class="spanError"></span></label> <input type="text" class="form-control"id="bonus" name="bonus" placeholder="Bonus...">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Other<span id="otherError" class="spanError"></span></label> <input type="text" class="form-control"id="other" name="other" placeholder="Other...">
						</div>
						<!-- -Component End----------- -->

					</div>
				</div>
				<!-- End of the Left Part-------------------------------------------->

				<!-- Left Part of the page Content---------------------------------- -->
				<div class="col-md-6 col-sm-6 col-xs-12" id="l">

					<div class="col-md-12 col-sm-12 col-xs-12 " id="left">
						<!--   -Header- -->
						<h5 class="FormHeader">
							<strong>Deduction (Rs.)</strong>
						</h5>
						<!-- --Input Component---------->
						<div class="col-md-6">
							<label>Professional Tax<span id="professionalTaxError" class="spanError"></span></label> <input type="text"class="form-control" id="professionalTax" name="professionalTax"placeholder="Professional Tax...">
						</div>
						<!-- -Component End----------- -->
						<!-- --Input Component---------->
						<div class="col-md-6">
							<label>Providet Tax<span id="providentTaxError" class="spanError"></span></label> <input type="text"class="form-control" id="providentTax" name="providentTax"placeholder="Provident Tax...">
						</div>
						<!-- -Component End----------- -->
						<!-- - -Input Component-------- -->
						<div class="col-md-6">
							<label>Loan<span id="loanError" class="spanError"></span></label> <input type="text" class="form-control"id="loan" name="loan" placeholder="Loan...">
						</div>
						<!-- -Component End----------- -->
						<!-- --Input Component-------- -->
						<div class="col-md-6">
							<label>Insurance<span id="insurenceError" class="spanError"></span></label> <input type="text" class="form-control"id="insurence" name="insurence" placeholder="Insurance...">
						</div>
						<!---Component End----------- -->
					</div>
				</div>
				<!--End of the Left Part------------------------------------------ -->

				<!--Right Part of the page Content--------------------------------- -->
				<div class="col-md-6 col-sm-6 col-xs-12" id="r">
					<div class="col-md-12 col-sm-12 col-xs-12  " id="right">

						<h5 class="FormHeader">
							<strong>Total (Rs.)</strong>
						</h5>
						<!----Input Component---------->
						<div class="col-md-6">
							<label>Total income</label> <input type="text"class="form-control" id="totalIncome" name="totIncome" placeholder="00000.00" readonly >
						</div>
						<!---Component End----------- -->
						<!----Input Component---------->
						<div class="col-md-6">
							<label>Total Deduction</label> <input type="text"class="form-control" id="totDedution" name="totDedution" placeholder="00000.00" readonly>
						</div>
						<!---Component End----------- -->
						<!----Input Component---------->
						<div class="col-md-6">
							<label>Total Amount</label> <input type="text"class="form-control" id="totAmount" name="totAmount" placeholder="00000.00"readonly>
						</div>

						<!---Component End----------- -->

					</div>
				</div>
				<!-- End of the Rigth Part-------------------------------------------->

				<!--Form-Submit-of-the-Page-------------------------------------------------->
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
					<div class="col-md-7">
						<h5></h5>
					</div>
					<div class="col-md-5 text-right" style="padding-top: 10px;">
						<input type="hidden" name="month" value="<%=month%>">
 						<button type="reset" class="btn  btn-danger" >Clear</button>
						<button type="submit" class="btn btn-primary">Confirm Payment Details</button>							
					</div>
				</div>
				</form>
				<!--------------------------------------------------------------------------->
				</div>
			</div>

		</div>

		<!--End of the Page Content-------------------------------------------->

	</div>
	

  <!-- toggle side bar  -->
<script src="javascript/paymentCal.js"></script>
<script src="javascript/paymentValidation.js"></script>

</body>

</html>