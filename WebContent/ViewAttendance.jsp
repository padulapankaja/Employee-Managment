<%@page import="java.text.DateFormat"%>
<%@page import="com.oop.model.Attendance"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oop.service.AttendanceServiceImpl"%>
<%@page import="com.oop.service.IAttendanceService"%>
<%@page import="com.oop.service.IEmployeeService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@page import="com.oop.service.IEmployeeService"%>
<%@page import="com.oop.model.LoginHandler"%>
<%@page import="java.util.Date"%>
<%
		if(session.getAttribute("loginDetails") == null )
		{
       		getServletContext().getRequestDispatcher("/LoginPage.jsp").forward(request, response);
			return;
		} 
      LoginHandler login = (LoginHandler) session.getAttribute("loginDetails"); %> 

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

<!---Page-Content-------------------------------------------------------------------------------------------------------------------------------- -->
		<div id="page-wrapper">
			<div class="container-flex">
				<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
					<h3>
						<strong><i class="fa fa-list-alt" aria-hidden="true"></i>
							Employee Attendance
						</strong>
					</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
<!------------------------------------Left Part of the page Content--------------------------------------------------------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l" >
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                         	
                           	<form action="SearchByMonthAttendance" method="POST" >
                           	<% String month = "";
					 		   if(request.getAttribute("month") != null )
					 				month = request.getParameter("month").toString();
					 			else
					 				month = new SimpleDateFormat("yyyy-MM").format(new Date());
                           	%>
                           	<div class="col-xs-4" >
                           		<label>Date</label>
                           		<input type="month" name="month" class="form-control" value="<%=month %>" id="date">
                           	</div>
                           		
                           <div class="col-xs-3">
                           	<button style="margin-top: 35px;" class="btn btn-sm btn-block btn-primary">
                           		<strong>Search</strong>
                           	</button>
                           	</form>
                           	</div>
                           
                        
                          <div style="margin-top: 15px;" class = " col-md-12 col-sm-12 col-xs-12 table-responsive cont">
							      	
							      
							      <table class="table table-striped " style="font-size: 1.1em">
									  <thead style="background-color: rgba(1, 50, 67, 1) ;color : white;">
									    <tr >
									    
									      <th class="text-center" width="50%">Date</th>
									       <th class="text-left"  width="50%">Action</th>
									       
									    </tr>
									  </thead>
									  <tbody>
									 <%		
									 	DateFormat formatter = new SimpleDateFormat("E, dd MMM yyyy"); 	
									 	IAttendanceService attendanceService = new AttendanceServiceImpl();
									 	ArrayList<Attendance> arrayList	= attendanceService.ViewEmployeeAttendance( login.getEmpId() , month);
									 	if(!arrayList.isEmpty() ){	
									  	  for(Attendance attendance : arrayList )
									  	  {  
									  		 String Date = formatter.format( new SimpleDateFormat("yyyy-MM-dd").parse(attendance.getReturnDate()) );  
									  	 %>
									  	 
										  <tr >
										    
										     <td align="center" style="font-weight : 600;"><%=Date %></td>
										     <td align="center">
										    <div class="switch-field">
												<label class='<%=( attendance.getEmpAttendance() == 1 )? "AttPresent" : "none" %>'><i class="fas fa-check-circle"></i> Present</label>
												<label class='<%=( attendance.getEmpAttendance() == 0 )? "AttAbsent" : "none" %>'><i class="fas fa-times-circle"></i> Absent</label>
											</div>
  											</td>
  											
										   </tr>
										   <%}  %>
										   
									  </tbody>
								  </table>
								<%}else{ %>	
								  </tbody>
								  </table>
								  <div class="col-xs-12" >
                    	  <img src="images/noAttendance.jpg" width="100%" style="margin-top:40px;">
                    	  </div>
                    	  <% } %>							
       					 </div>
                          
                          
                        </div>
                    </div>
<!-----------------------------------End of the left Part------------------------------------------------------------------------------------------->
                         
<!-------------------------------Right Part of the page Content------------------------------------------------------------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right" style="padding: 0px !important;">
                       	<div class="col-md-12" >
                       	<label >01.  Select the date and click search to view Attendance. </label><br>
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
                       	 <div class="col-md-12 AttendanceBackground2" >
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
