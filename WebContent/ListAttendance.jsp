<%@page import="com.oop.util.CommonUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Employee"%>
<%@page import="com.oop.util.CommonUtil"%>
<%@ page import="com.oop.model.Department" %> 
<%@ page import="com.oop.service.IDepartmentService" %> 
<%@ page import="com.oop.service.DepartmentServiceImpl" %> 
<%@ page import="java.util.ArrayList" %>
<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@page import="com.oop.service.IEmployeeService"%>
<%@ page import="com.oop.model.LoginHandler" %> 
<%
		if(session.getAttribute("loginDetails") == null )
		{
       		getServletContext().getRequestDispatcher("/LoginPage.jsp").forward(request, response);
			return;
		} 
      LoginHandler login = (LoginHandler) session.getAttribute("loginDetails"); %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="styles/style.css" />
    <link rel="stylesheet" type="text/css" href="styles/styleLE.css" />
    <link rel="stylesheet" type="text/css" href="styles/styleAE.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
    
    </head>
<body>
    <div class = "d-flex">
   <jsp:include page="Sidebar.jsp"></jsp:include>
           <!---Page-Content--------------------------------------------------------------------------------------------------------->
          
    <div id="page-wrapper" >  
       <div class="container-flex" >
        
               
           
           <div class="col-md-12 col-sm-12 col-xs-12" id = "contentHeader" >
         <h3><strong><i class="fa fa-list-alt" aria-hidden="true"></i> Employee Attendance</strong>
         <a href="AddAttendance.jsp" ><button class="btn btn-sm btn-primary"><strong>Add Attendance</strong></button></a></h3>
         
               </div>
           	<div class="col-md-12 col-sm-12 col-xs-12 bottomCont">
					<div class="col-md-12 col-sm-12 col-xs-12 active"
						id="searchbarCollapse" style="padding: 1% 0px;">
						<form action="ShowAttendance" method="POST">
							<div class="form-row">
								<div class="col-md-3 col-sm-4 col-xs-6">
									<label> Select Month</label> <input type="month"
										class="form-control" name="month" min="2019-01"
										value='<%=( request.getAttribute("month") != null) ? request.getAttribute("month").toString() : "2019-05" %>'>
								</div>
								<%if(request.getAttribute("department") != null){ %>
								<div class="col-md-3 col-sm-4 col-xs-6">
									<label>Department</label> <select class="form-control"
										name="department">
										<% IDepartmentService ds = new DepartmentServiceImpl();
                           				ArrayList<Department> list = ds.getDepartments();
                           				for(Department dep : list ){
                           			%>
                           			<option <%=( Integer.parseInt(request.getAttribute("department").toString()) == dep.getDepID() ) ? "selected" : "" %>
                           			value="<%=dep.getDepID() %>"  ><%=dep.getDepName() %></option>
                           			<%  } %>
									</select>
								</div><%}else{ %>
								<div class="col-md-3 col-sm-4 col-xs-6">
									<label>Department</label> <select class="form-control"
										name="department">
										<% 
										IDepartmentService ds = new DepartmentServiceImpl();
                           				ArrayList<Department> list = ds.getDepartments();
                           				for(Department dep : list ){
                           			%>
                           			<option value="<%=dep.getDepID() %>"  ><%=dep.getDepName() %></option>
                           			<%  } %>    
									</select>
								</div>
								<%} %>
								<div
									class="col-md-3 col-sm-4 col-sm-offset-0 col-xs-offset-3 col-xs-6">
									<button style="margin-top: 25px;" type="submit"
										class="btn btn-block btn-primary" name="startDate">
										<b>Search</b>
									</button>
								</div>
								</div>
						</form>
					</div>
				</div>
          
                
             
        
           <div class = "col-md-12 col-sm-12 col-xs-12 table-responsive cont">
        <table class="table table-striped table-dark" style="font-size: 1.1em">
  <thead style="background-color: rgba(1, 50, 67, 1) ;color : white;">
    <tr >
      <th scope="col" width="10%">Name</th>
	<%for(int x = 1; x <= 30 ; x++ ){ %>     
      <th width="3%"><%=x %></th>
   <%} %>
     
  </thead>
  <tbody>
  <% 
  	String month;
  	int DeptNo;
  	if( request.getAttribute("month") != null)
  	{
  		month =  request.getAttribute("month").toString();
  		DeptNo = Integer.parseInt( request.getAttribute("department").toString() );
  	}else
  	{
  		month = "2019-05";
  		DeptNo = 1;
  	}
  	 	
  	IEmployeeService employeeService = new EmployeeServiceImpl();
  	CommonUtil common = new CommonUtil();
  	ArrayList<Employee> arrayList = employeeService.getEmployeesAccDepartment(DeptNo);
  	for(Employee employee : arrayList )
  		{
  %>
  	<tr>
   		<td><strong><%=employee.getFirstName() %></strong></td>
		<%=common.AttendanceMarker( employee.getEmpId(), month) %>
    </tr>
    <%  } %>
  </tbody>
</table>

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
    