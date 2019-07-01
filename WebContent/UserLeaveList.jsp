<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Leave"%>
<%@page import="com.oop.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.service.LeaveServiceImpl"%>
<%@page import="com.oop.service.ILeaveService"%>
<%@page import="com.oop.model.LoginHandler"%>
<%@page import="com.oop.service.LoginServiceImpl"%>
<%@page import="com.oop.service.ILoginService"%>
<%@page import="com.oop.service.IEmployeeService"%>
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



				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
					<h3>
						<strong><i class="fa fa-list-alt" aria-hidden="true"></i>
							Leave List</strong>
					</h3>

				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 bottomCont">


					<div class="col-md-12 col-sm-12 col-xs-12 table-responsive cont" >
						<table class="table table-striped " style="font-size: 1.1em">
							<thead
								style="background-color: rgba(1, 50, 67, 1); color: white;">
								<tr>
									<th scope="col" width="5%">ID</th>
									<th scope="col" width="10%">Start Date</th>
									<th scope="col" width="10%">End Date</th>
									<th scope="col" width="5%">Days</th>
									<th scope="col" width="45%">Description</th>
									<th scope="col" width="10%">Status</th>
									<th scope="col" width="5%">Actions</th>
									<th scope="col" width="5%"></th>

								</tr>
							</thead>
							<tbody>
								<%  LoginHandler login = (LoginHandler) session.getAttribute("loginDetails");
									ILeaveService leaveService = new LeaveServiceImpl();
									ArrayList<Leave> arrayList = leaveService.getLeavesList(login.getEmpId());
									if(!arrayList.isEmpty() ){
									int count = 0;
									 for( Leave leave : arrayList){     %>

								<tr>
									<td><%=leave.getLeaveId() %></td>
									<td><%=leave.getStartDate() %></td>
									<td><%=leave.getEndDate() %></td>
									<td><%=leave.getCount() %></td>
									<td><%=leave.getDescription() %></td>
									<td><span class="badge" id="<%=leave.getStatus() %>" ><%=leave.getStatus() %></span></td>
									<td>
										<a href="UserLeaveList.jsp?Index=<%=count++%>">
										<button type="submit" class="btn btn-info btn-xs">
											<strong><i class="fas fa-eye"></i> View</strong>
										</button></a>
									</td>
									<% if( leave.getStatus().equalsIgnoreCase("Pending") ){ %>
									<td>
										<form action="deleteLeave" method="POST">
										<input type="hidden" name="leaveID" value="<%=leave.getLeaveId()%>">
										<button type="submit" class="btn btn-danger btn-xs">
											<strong><i class="fas fa-eye"></i> Delete</strong>
										</button></form>
									</td>
										<%}else{ %><td></td> <% } %>
								</tr>
								<%  } }else { %>
								<tr>
								<td></td><td></td><td></td><td></td><td><b>No records</b></td></td><td></td><td></tr>
								<% } %>
							</tbody>
						</table>
					</div>
					
				</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------ -->
					<%if (request.getParameter("Index") != null ){ 
					 Leave leave = arrayList.get( Integer.parseInt(request.getParameter("Index").toString() ) );
					 IEmployeeService employeeService = new EmployeeServiceImpl();
					 Employee employee = employeeService.getEmployeeDetails(leave.getEmpId());
					%>
					<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader" style="margin-top:15px;padding:0px;">
				
				<div class="col-xs-1 text-center" style="padding:0px; vertic">
					<img src="images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>" width="60px"
					 style="border-radius:30px; vertical-align: middle;margin:10px 0px 0px 25px;" >
					</div>
				<div class="col-xs-9"  style="padding: 0px 0px 12px 0px;">	
						<label style="margin-top : 8px;" ><%=employee.getFirstName() + " " + employee.getLastName() %></label>
				
					<h5 style="margin:0px;" >Reason to request a leave</h5>
						<p style="color:darkgray; "><%=leave.getDescription() %></p>
					<h6>From : <%=leave.getStartDate()%> &nbsp To : <%=leave.getEndDate() %></h6> 
					<%if( leave.getFeedback() != null){ %>
					  <label>FeedBack</label>
					<p><%=leave.getFeedback() %></p>
                    <% } if(leave.getStatus().equalsIgnoreCase("Reject") ){ %>
					<span class="btn btn-sm btn-danger" name="action" ><b>Rejected</b></span>
					<%}else if( leave.getStatus().equalsIgnoreCase("Pending")){ %>
					<span class="btn btn-sm " style="background-color : #f39c12;color : white;" name="action"><b>Pending</b></span>
					<%}else{ %>
					<span class="btn btn-sm " style="background-color : #2ecc71;color : white;" name="action" ><b>Accepted</b></span>					
					<%} %>
					</div>
					</div>
					<%} %>
<!-- ------------------------------------------------------------------------------------------------------------------------------------ -->
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader" style="margin-top:15px;">
				<div class="col-xs-12">
						<h6 class="policyTitle">
							<b>MAXIMUM LENGTH OF LEAVE</b>
						</h6>
						<p class="policyDescription">The maximum length of leave
							allowed is 5 days. If the employee needs a longer leave due to
							medical complications, the employee should notify COMPANY as soon
							as possible.</p>

						<h6 class="policyTitle">
							<b>TRANSFERS</b>
						</h6>
						<p class="policyDescription">An employee requesting pregnancy
							leave may also ask for a transfer to another less strenuous or
							less hazardous position if so desired. The request must be in
							writing and must state the reason for the transfer</p>

						<h6 class="policyTitle">
							<b>MEDICAL INCAPACITY </b>
						</h6>
						<p class="policyDescription">The employee may continue to work
							up to the delivery date, depending upon the employee's medical
							circumstances and the nature of the employee's job.</p>
					</div>
					</div>
			</div>
		</div>
	</div>
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

</body>
</html>
