<%@page import="com.oop.model.Department"%>
<%@page import="com.oop.service.DepartmentServiceImpl"%>
<%@page import="com.oop.service.IDepartmentService"%>
<%@page import="com.oop.service.IEmployeeService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@page import="com.oop.service.IEmployeeService"%>
<%@page import="com.oop.model.LoginHandler"%>

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles/style.css" />
<link rel="stylesheet" type="text/css" href="styles/styleLE.css" />
<link rel="stylesheet" type="text/css" href="styles/styleAE.css" />
<link rel="stylesheet" type="text/css" href="styles/Attendance.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">


</head>
<body>
	<div class="d-flex">

		<jsp:include page="Sidebar.jsp"></jsp:include>

<!---Page-Content-------------------------------------------------------------------------------------------------------------------------------- -->
		<div id="page-wrapper">
			<div class="container-flex">
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
					<h3>
						<strong><i class="fa fa-list-alt" aria-hidden="true"></i>
							Add Attendance
						</strong>
					</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
<!------------------------------------Left Part of the page Content--------------------------------------------------------------------------------->
                    <div class="col-md-7 col-sm-12 col-xs-12" id="l" >
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                           	 <%if(request.getAttribute("DepID") == null ){ %>
                           	<form action="SearchByDepartment" method="POST" >
                           	<div class="col-xs-4" >
                           		<label>Date</label>
                           		<input type="date" name="date" class="form-control" value="" id="date">
                           	</div>
                           		<div class="col-xs-4" >
                           		<label>Department</label>
                           		<select name= "department" class = "form-control">
                           			<% IDepartmentService ds = new DepartmentServiceImpl();
                           				ArrayList<Department> list = ds.getDepartments();
                           				for(Department dep : list ){
                           			%>
                           			<option value="<%=dep.getDepID() %>"  ><%=dep.getDepName() %></option>
                           			<%  } %>
                           			</select>
                           	</div>
                           <div class="col-xs-4">
                           	<button style="margin-top: 35px;" class="btn btn-sm btn-block btn-primary">
                           		<strong>Search</strong>
                           	</button>
                           	</div>
                           	</form>
                           	<%}else{ %>
                           	 	<div class="col-xs-3" >
                           		<label>Date : <span><%=request.getAttribute("Date").toString() %></span></label>
                           		</div>
                           		<div class="col-xs-3" >
                           		<label>Department : <span><%=request.getAttribute("DepID").toString() %></span></label>
                           		</div>
									                           	
                           	<%} %>
                        
                          <div style="margin-top: 15px;" class = "col-md-12 col-sm-12 col-xs-12 table-responsive cont">
							      	 <%  if(request.getAttribute("DepID") != null )  { %>
							      	<form action="AddAttendance" method="POST" >
							      <table class="table table-striped " style="font-size: 1.1em">
									  <thead style="background-color: rgba(1, 50, 67, 1) ;color : white;">
									    <tr >
									      <th scope="col" width="10%">ID</th>
									      <th scope="col" width="35%">Employee</th>
									      <th scope="col" width="30%">Designation</th>
									       <th scope="col" width="25%">Action</th>
									       
									    </tr>
									  </thead>
									  <tbody>
									 <% 
									  	 int DepID = Integer.parseInt(  request.getAttribute("DepID").toString() );
									  	  IEmployeeService employeeService = new EmployeeServiceImpl();
									  	  ArrayList<Employee>	arrayList = employeeService.getEmployeesAccDepartment(DepID);
									  	 	
									  	  for(Employee employee : arrayList )
									  	  {   %>
									  	 
										  <tr >
										     <td><%=employee.getEmpId() %></td>
										     <td><%=employee.getFirstName() + " " + employee.getLastName() %></td>
										     <td><%=employee.getDesignation() %></td>
										     <td align="center">
										    <div class="switch-field">
												<input type="radio" id="1<%=employee.getEmpId() %>" name="<%=employee.getEmpId() %>" value="1" >
												<label class="present" for="1<%=employee.getEmpId() %>"><i class="fas fa-check-circle"></i> Present</label>
												<input type="radio" id="2<%=employee.getEmpId() %>" name="<%=employee.getEmpId() %>" value="0" >
												<label class="absent" for="2<%=employee.getEmpId() %>"><i class="fas fa-times-circle"></i> Absent</label>
											</div>
  											</td>
  											
										   </tr>
										   <%}  %>
										   
									  </tbody>
								  </table>
								  <input type="hidden" value="<%=DepID %>" name="department" >
								  <input type="hidden" value="<%=request.getAttribute("Date") %>" name="date" >
								  <button type="submit" class="btn btn-sm btn-info" ><strong>Submit</strong></button>
								 <button type="reset" class="btn btn-sm btn-danger" ><strong>Cancel</strong></button> 
								 </form>  
								 <%}else{ %>
								 <div class="col-xs-12" style="padding-bottom: 15px; " >
                    				  <img src="images/attendanceImage.png" width="100%">
                    	  		</div> 
								<% } %> 
       					 </div>
                          
                          
                        </div>
                    </div>
<!-----------------------------------End of the left Part------------------------------------------------------------------------------------------->
                         
<!-------------------------------Right Part of the page Content------------------------------------------------------------------------------------->
                    <div class="col-md-5 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right" style="padding: 0px !important;">
                       	<div class="col-md-12" >
                       	<label >01.  Select the date and the department name and click search. </label>
                       	<label>02. Mark the attendance of each employee.</label>
                       	<label>03. Click "Submit" button to add the details to the system. </label><br>
							<h6>It is an established fact that we are facing
								difficulties in the attendance management. Presently the
								attendance in most of the organizations is marked manually on
								paper which is an error-prone process. Specifically, in
								educational institutions, a significant amount of time of both
								students and staff is wasted while marking the attendance
								manually. Further, there are additional malpractices like proxy
								and bunking which make this system flawed.
							</h6>	
						</div>
                       	 <div class="col-md-12 AttendanceBackground" >
                        </div>	
                        </div>
                    </div>    
<!-----------------------------------End of the right Part------------------------------------------------------------------------------------------->
                 </div>           
       		</div>
		</div>
	
			
		<script> document.getElementById('date').valueAsDate = new Date(); </script>
		
</body>
</html>
