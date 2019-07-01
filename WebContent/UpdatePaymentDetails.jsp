<%@page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.oop.util.CommonUtil"%>
<%@page import="com.oop.service.*" %>
<%@page import="com.oop.model.Employee" %>
<%@page import="com.oop.model.Payment" %>
<%@page import="com.oop.model.LoginHandler" %>  

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
						
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update Payment Details </strong>
					</h3>
				</div>
				
				<!-- Form Sides start from here---------------------------------------------- -->
				
			
				<%  int PaymentId = Integer.parseInt( request.getParameter("PaymentID") );
					IDepartmentService departmentService = new DepartmentServiceImpl();
					IPaymentService paymentService = new PaymentServiceImpl();
					IEmployeeService employeeService = new EmployeeServiceImpl();
					Payment payment = paymentService.getPayment(PaymentId);
					Employee employee = employeeService.getEmployeeDetails(payment.getEmpId() );
				%>
			
				<form method="post" action="UpdatePayment">
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
								<input type="hidden" class="form-control" name="empId"value="" >
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
									<label>Department</label> <input type="text" class="form-control" value="<%=departmentService.getNameOfTheDepartment( employee.getDepartmentID() )%>" name="dept" readonly>
								</div>
								<!-- -Component End----------- -->
								
								<!-- --Input Component---------->
								<div class="col-md-6">
									<label>Start Date</label> <input type="date" class="form-control" value="<%=payment.getStartDate() %>" name="startdate" readonly>
								</div>
								<!-- -Component End----------- -->
								<!-- --Input Component-------- -->
								<div class="col-md-6">
									<label>End Date</label> <input type="date" class="form-control" value="<%=payment.getEndDate() %>" name="enddate" readonly>
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
							<label>Basic Salary</label> <input type="text" class="form-control" id="basicSalary" name="basicSalary" value="<%=payment.getBasicSalary() %>" >
						</div>
						<!---Component End----------- -->
						<!----Input Component-------- -->
						<div class="col-md-6">
							<label>Dearness Allowance</label> <input type="text"class="form-control" id="dearnessAllow" name="dearnessAllow" value="<%=payment.getDearnessAllowance() %>">
						</div>
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Medical Allowance</label> <input type="text"class="form-control" id="medicalAllow" name="medicalAllow" value="<%=payment.getMedicalAllowance() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>House Rent Allowance</label> <input type="text"class="form-control" id="houserentAllow" name="houserentAllow" value="<%=payment.getHouseRentAllowance() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Food Allowance</label> <input type="text"class="form-control" id="foodAllow" name="foodAllow" value="<%=payment.getFoodAllowance() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Telephone Allowance</label> <input type="text"class="form-control" id="telephoneAllow" name="telephoneAllow" value="<%=payment.getTelephoneAllowance() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Bonus</label> <input type="text" class="form-control"id="bonus" name="bonus" value="<%=payment.getBonus() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- -Component End----------- -->
						<div class="col-md-6">
							<label>Other</label> <input type="text" class="form-control"id="other" name="other" value="<%=payment.getOther() %>">
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
							<label>Professional Tax</label> <input type="text"class="form-control" id="professionalTax" name="professionalTax" value="<%=payment.getProfessionalTax() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- --Input Component---------->
						<div class="col-md-6">
							<label>Providet Tax</label> <input type="text"class="form-control" id="providentTax" name="providentTax" value="<%=payment.getProvideTax() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- - -Input Component-------- -->
						<div class="col-md-6">
							<label>Loan</label> <input type="text" class="form-control"id="loan" name="loan" value="<%=payment.getLoan() %>">
						</div>
						<!-- -Component End----------- -->
						<!-- --Input Component-------- -->
						<div class="col-md-6">
							<label>Insurance</label> <input type="text" class="form-control"id="insurence" name="insurence"  value="<%=payment.getInsurance()  %>">
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
							<label>Total income</label> <input type="text"class="form-control" id="totalIncome" name="totIncome" value="<%=payment.getTotalIncome() %>" readonly >
						</div>
						<!---Component End----------- -->
						<!----Input Component---------->
						<div class="col-md-6">
							<label>Total Deduction</label> <input type="text"class="form-control" id="totDedution" name="totDedution" value="<%=payment.getTotalDeduction() %>" readonly>
						</div>
						<!---Component End----------- -->
						<!----Input Component---------->
						<div class="col-md-6">
							<label>Total Amount</label> <input type="text"class="form-control" id="totAmount" name="totAmount" value="<%=payment.getTotalAmount() %>" readonly>
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
						<input type="hidden" name="PaymentID" value="<%=payment.getPaymentId() %>">
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
<script> 
    function sidebarToggle() {
        document.getElementById("sidebar-wrapper").classList.toggle("active");
        document.getElementById("page-wrapper").classList.toggle("active");
	}
        
    function employeeDropdown(){
        document.getElementById("employeeSubmenu").classList.toggle("active");
    }
        
    function searchbarToggle(){
        document.getElementById("searchbarCollapse").classList.toggle("active");
    }
   
    </script>
    
   
    <script>
  
    
document.getElementById("basicSalary").addEventListener("keyup", calTotal );
document.getElementById("dearnessAllow").addEventListener("keyup", calTotal );
document.getElementById("medicalAllow").addEventListener("keyup", calTotal );
document.getElementById("houserentAllow").addEventListener("keyup", calTotal );
document.getElementById("foodAllow").addEventListener("keyup", calTotal );
document.getElementById("telephoneAllow").addEventListener("keyup", calTotal );
document.getElementById("bonus").addEventListener("keyup", calTotal );
document.getElementById("other").addEventListener("keyup", calTotal );


		 
document.getElementById("professionalTax").addEventListener("keyup", calTotal );
document.getElementById("providentTax").addEventListener("keyup", calTotal );
document.getElementById("loan").addEventListener("keyup", calTotal );
document.getElementById("insurence").addEventListener("keyup", calTotal );


function calTotal() {
	var income = 0;
	var deduction = 0;
	var total = 0;
	
if(document.getElementById("basicSalary").value){
	income += parseFloat(document.getElementById("basicSalary").value);
}
 if(document.getElementById("dearnessAllow").value){
	income += parseFloat(document.getElementById("dearnessAllow").value);
 }
 if(document.getElementById("medicalAllow").value){
	income += parseFloat(document.getElementById("medicalAllow").value);
 }
 if(document.getElementById("houserentAllow").value){
	income += parseFloat(document.getElementById("houserentAllow").value);
 }
 if(document.getElementById("foodAllow").value){
	income += parseFloat(document.getElementById("foodAllow").value);
 }
 if(document.getElementById("telephoneAllow").value){
	income += parseFloat(document.getElementById("telephoneAllow").value);
 }
 if(document.getElementById("bonus").value){
	income += parseFloat(document.getElementById("bonus").value);
 }
 if(document.getElementById("other").value){
	income += parseFloat(document.getElementById("other").value);
 }
 if(document.getElementById("professionalTax").value){
	 deduction += parseFloat(document.getElementById("professionalTax").value);
 }
 if(document.getElementById("providentTax").value){
	 deduction += parseFloat(document.getElementById("providentTax").value);
 }
 if(document.getElementById("loan").value){
	 deduction += parseFloat(document.getElementById("loan").value);
 }
 if(document.getElementById("insurence").value){
	 deduction += parseFloat(document.getElementById("insurence").value);
 }
 
 total = income - deduction;
 document.getElementById("totalIncome").value = income;
 document.getElementById("totDedution").value = deduction;
 document.getElementById("totAmount").value = total;
}

</script>


</body>

</html>