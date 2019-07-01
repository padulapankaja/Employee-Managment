<%@page import="com.oop.service.DepartmentServiceImpl"%>
<%@page import="com.oop.service.IDepartmentService"%>
<%@page import="com.oop.model.Attendance"%>
<%@page import="com.oop.service.IEmployeeService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@page import="com.oop.service.IEmployeeService"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%  IDepartmentService departmentService = new DepartmentServiceImpl(); %>
<!---Page-Content-------------------------------------------------------------------------------------------------------------------------------- -->
		<div id="page-wrapper">
			<div class="container-flex">
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
					<h3>
						<strong><i class="fa fa-list-alt" aria-hidden="true"></i>
							Update Attendance
						</strong>
					</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
<!------------------------------------Left Part of the page Content--------------------------------------------------------------------------------->
                    <div class="col-md-7 col-sm-12 col-xs-12" id="l" >
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                          
                           	 	<div class="col-xs-3" >
                           		<label>Date : <span><%=request.getAttribute("Date").toString() %></span></label>
                           		</div>
                           		<div class="col-xs-3" >
                           		<label>Department : <span><%=departmentService.getNameOfTheDepartment( Integer.parseInt( request.getAttribute("DepID").toString() ) ) %></span></label>
                           		</div>
								<div class="col-xs-12">
								<h5 class="updateAtt">Attendance is already submitted , Use update feature instead</h5>
								</div>	                           	
                     
                        
                          <div style="margin-top :8px;" class = "col-md-12 col-sm-12 col-xs-12 table-responsive cont">
							    
							      	<form action="UpdateAttendance" method="POST" >
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
									 	IEmployeeService employeeService = new EmployeeServiceImpl();
									  	 ArrayList<Attendance> arrayList = (ArrayList<Attendance>) request.getAttribute("ArrayListAttendance");
									  	 			for(Attendance attendance : arrayList ){
									  	 				Employee employee = employeeService.getEmployeeDetails(attendance.getEmpId() );
									  	     %>
									  	 
										  <tr >
										     <td><%=employee.getEmpId() %></td>
										     <td><%=employee.getFirstName() + " " + employee.getLastName() %></td>
										     <td><%=employee.getDesignation() %></td>
										     <td align="center">
										    <div class="switch-field">
												<input type="radio" id="1<%=employee.getEmpId() %>" name="<%=attendance.getAttId() %>" 
													value="1" <%=(attendance.getEmpAttendance() == 1 ) ? "Checked" : "" %>  >
												<label class="present" for="1<%=employee.getEmpId() %>"><i class="fas fa-check-circle"></i> Present</label>
												<input type="radio" id="2<%=employee.getEmpId() %>" name="<%=attendance.getAttId() %>" value="0" 
												 <%=(attendance.getEmpAttendance() == 0 ) ? "Checked" : "" %> >
												<label class="absent" for="2<%=employee.getEmpId() %>"><i class="fas fa-times-circle"></i> Absent</label>
											</div>
  											</td>
  											
										   </tr>
										   <%} %>
										   
									  </tbody>
								  </table>
								    <input type="hidden" value="<%=request.getAttribute("DepID") %>" name="department" >
								  <input type="hidden" value="<%=request.getAttribute("Date") %>" name="date" >
								  <button type="submit" class="btn btn-sm btn-info" ><strong>Update</strong></button>
								 
								 </form>  
								 
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
    document.getElementById('date').valueAsDate = new Date();
    </script>
		<% 	
    	if( request.getAttribute("NewPaymentAdded") != null  ){ %>

		<!-- Central Modal Small -->

		<script type="text/javascript">
		    $(document).ready(function(){
		        $("#PaymentModal").modal('show');
		    });
	</script>

		<div class="modal fade" id="PaymentModal" aria-hidden="true">

			<!-- Change class .modal-sm to change the size of the modal -->
			<div class="modal-dialog modal-md" role="document">

				<div class="modal-header " style="border-bottom: 0px;">
					<h4 class="modal-title w-100 text-center" id="myModalLabel">New
						Payment Added SuccessFully !</h4>

				</div>
			</div>
		</div>
		<% } %>
		<!-- Central Modal Small -->
</body>
</html>
