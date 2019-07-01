<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.oop.model.*"%>
<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@page import="com.oop.service.IEmployeeService"%>
<%
	LoginHandler login = (LoginHandler) session.getAttribute("loginDetails");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles/style.css" />
<link rel="stylesheet" type="text/css" href="styles/styleLE.css" />
<link rel="stylesheet" type="text/css" href="styles/styleAE.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">


</head>

<body>
	<div class="d-flex">
		<jsp:include page="Sidebar.jsp"></jsp:include>
		<!---Page-Content--------------------------------------------------------------------------------------------------------->

		<div id="page-wrapper">
			<div class="container-flex">

				<!--Main-Title-of-the-Page-------------------------------------------------->
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
					<h3>
						<strong> <!--Main-Header icon and Text goes here----------------------------->
							<i class="fas fa-award"></i> Leave Management
						</strong>
					</h3>
				</div>
				<!--------------------------------------------------------------------------->
				<!--Form Sides start from here----------------------------------------------->
				<%
					IEmployeeService employeeService = new EmployeeServiceImpl();
					Employee employee = employeeService.getEmployeeDetails(login.getEmpId());
				%>

				<div class="col-md-12 col-sm-12 col-xs-12 FormSides">

					<!--Left Part of the page Content----------------------------------->
					<div class="col-md-8 col-sm-12 col-xs-12" id="l">
						<div class="col-md-12 col-sm-12 col-xs-12 " id="left">

							<h5 class="FormHeader">
								<strong>Leave Request</strong>
							</h5>
							<!----Input Component---------->

							<form method="post" action="LeaveRequest">
								<div class="col-md-3">
									<label>Employee ID</label> <input type="text"
										class="form-control" name="EmpId"
										value="<%=login.getEmpId()%>" readonly>
								</div>
								<div class="col-md-5">
									<label>Employee Name</label> <input type="text"
										class="form-control" name="EmpName"
										value="<%=login.getEmpName()%>" readonly>
								</div>
								<div class="col-md-4">
									<label>Department</label> <input type="text"
										class="form-control" name="Department"
										value="<%=employee.getDepartmentID()%>" readonly>
								</div>
								<div class="col-md-5">
									<label>Start Date</label> <input type="date"
										class="form-control" name="StartDate" id="StartDate" onchange="dateDiffInDays()">
								</div>
								<div class="col-md-5">
									<label>End Date</label> <input type="date" class="form-control"
										name="EndDate" id="EndDate" onchange="dateDiffInDays()">
								</div>
								<div class="col-md-2">
									<label>Date Count</label> <input type="text" class="form-control" id="count"
										name="count"   readonly value="0" >
								</div>
								<!---Component End------------->
								<div class="col-md-12">
									<label>Description</label>
									<textarea class="form-control" rows="10" id="comment"
										name="Description"></textarea>
								</div>

								<!---Component End------------->
								<div class="col-md-12 text-right">
									<br>
									<button type="submit" class="btn btn-sm btn-primary">
										<b>Compose</b>
									</button>
									<button type="cancel" class="btn btn-sm btn-danger">
										<b>Cancel</b>
									</button>
								</div>
							</form>
						</div>
					</div>
					<!--End of the left Part-------------------------------------------->
					<!--Right Part of the page Content----------------------------------->
					<div class="col-md-4 col-sm-12 col-xs-12" id="l">
						<div class="col-md-12 col-sm-12 col-xs-12  " id="right">

							<h5 class="FormHeader">
								<strong>Policy</strong>
							</h5>
							<div class="col-md-12  text-center">
							
							</div>
							<div class="col-md-12 ">
								<h6 class="policyTitle">
									<b>MAXIMUM LENGTH OF LEAVE</b>
								</h6>
								<p class="policyDescription">The maximum length of leave
									allowed is 5 days. If the employee needs a longer leave due to
									medical complications, the employee should notify COMPANY as
									soon as possible.</p>

								<h6 class="policyTitle">
									<b>TRANSFERS</b>
								</h6>
								<p class="policyDescription">An employee requesting
									pregnancy leave may also ask for a transfer to another less
									strenuous or less hazardous position if so desired. The request
									must be in writing and must state the reason for the transfer</p>
							
							<h6 class="policyTitle">
								<b>MEDICAL INCAPACITY </b>
							</h6>
							<p class="policyDescription">The employee may
								continue to work up to the delivery date, depending upon the
								employee's medical circumstances and the nature of the
								employee's job.</p>
						</div>
						</div>
					</div>

					<!--End of the Right Part-------------------------------------------->


				</div>
			</div>
			<!--End of the Page Content-------------------------------------------->
		</div>

		<script>
			function sidebarToggle() {
				document.getElementById("sidebar-wrapper").classList
						.toggle("active");
				document.getElementById("page-wrapper").classList
						.toggle("active");
			}

			function employeeDropdown() {
				document.getElementById("employeeSubmenu").classList
						.toggle("active");
			}

			function searchbarToggle() {
				document.getElementById("searchbarCollapse").classList
						.toggle("active");
			}
			
			
			const _MS_PER_DAY = 1000 * 60 * 60 * 24;

			
			function dateDiffInDays() {
			
			const a = new Date(document.getElementById("StartDate").value);
			const b = new Date(document.getElementById("EndDate").value);  
			  const utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
			  const utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());
			const diff = Math.floor((utc2 - utc1) / _MS_PER_DAY) + 1;
			if(diff >= 0 && diff != null ) 
			document.getElementById("count").value =  diff; 
			}

			
			 
		</script>
</body>

</html>