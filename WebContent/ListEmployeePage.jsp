<%@page import="com.oop.service.DepartmentServiceImpl"%>
<%@page import="com.oop.service.IDepartmentService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Employee"%>
<%@page import="java.util.ArrayList"%>
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
         <h3><strong><i class="fa fa-list-alt" aria-hidden="true"></i> Employee List</strong></h3>
         
               </div>
            <div class="col-md-12 col-sm-12 col-xs-12 bottomCont">
           <div class="col-md-12 col-sm-12 col-xs-12 " id="search-bar" onClick="searchbarToggle()">
         <span id="search-header" onClick="searchbarToggle()" ><strong>Search</strong></span>
         <span  id="search-toggle-btn" onClick="searchbarToggle()"><strong><i class="fa fa-plus" aria-hidden="true"></i></strong></span>
               
               </div>
                	<form action="SearchEmployee" Method="GET" >
                   <div class="col-md-12 col-sm-12 col-xs-12 " id="searchbarCollapse" >
                                       <div class="form-row">
                    <div class="form-group col-md-4 col-sm-5 col-xs-7">
                    
                      <input type="text" class="form-control" id="Search" name="Search" placeholder="Search...">
                    </div>
                    <div class="form-group col-md-3 col-sm-4 col-xs-5">
                      <select id="inputState" name="Action" class="form-control">
                        <option value="Fname" selected>First Name</option>
                        <option value="EmpID" >EMP ID</option>
                      
                      </select>
                    </div>
                    <div class="form-group col-md-2 col-sm-3 col-xs-12">
                      <button class="btn btn-block btn-primary" ><strong>Search</strong></button>
                    </div>
                  </div>
               </div>
               </form>
        
           
           
        <div class = "col-md-12 col-sm-12 col-xs-12 table-responsive cont">
        <table class="table table-striped " style="font-size: 1.1em">
  <thead style="background-color: rgba(1, 50, 67, 1) ;color : white;">
    <tr >
      <th scope="col" width="5%">ID</th>
      <th scope="col" width="20%">Employee</th>
      <th scope="col" width="10%">Department</th>
      <th scope="col" width="15%">Mobile</th>
      <th scope="col" width="12%">Designation</th>
       <th scope="col" width="5%"></th>
        <th scope="col" width="5%">Actions</th>
         <th scope="col" width="5%"></th>
    </tr>
  </thead>
  <tbody>
  <% 
  IDepartmentService ds = new DepartmentServiceImpl();
  IEmployeeService employeeService = new EmployeeServiceImpl();
  ArrayList <Employee> arrayList;
  
  if( request.getAttribute("Search") != null    )
  {
	arrayList = employeeService.searchEmployees( request.getAttribute("Search").toString() , request.getAttribute("Action").toString()  );  
  }else {
   arrayList = employeeService.getEmployees(null);
 	
  }
 	for ( Employee employee : arrayList )
 	{
  %>
    <tr>
      <td><%=employee.getEmpId() %></td>
      <td><i class="fas fa-<%=employee.getGender()%>"></i> <%=employee.getFirstName()+" "+employee.getLastName() %></td>
      <td><%=ds.getNameOfTheDepartment(  employee.getDepartmentID() ) %> </td>
      <td><%=employee.getMobile() %></td>
      <td><%=employee.getDesignation() %></td>
        <td>
        	<form method = "GET" action ="ViewEmployeeDetails" >
       			 <input type = "hidden" name = "EmpId" value = "<%=employee.getEmpId()   %>"></input>
        		<button type = "submit" class="btn btn-info btn-xs"><strong><i class="fas fa-id-card-alt"></i> View</strong></button>
        	</form>
        </td>
        <td>
          	<form method = "GET" action ="EditEmployeeDetails">
          		 <input type = "hidden" name = "EmpId" value = "<%=employee.getEmpId()   %>"></input>
          		<button type="submit" class="btn btn-warning btn-xs"><strong><i class="fas fa-user-edit"></i> Edit</strong></button>
          	</form>
        </td>
          <td><a href="ListEmployeePage.jsp?DeleteID=<%=employee.getEmpId() %>" >
          <button class="btn btn-danger btn-xs"><strong><i class="fas fa-trash-alt"></i> Delete</strong></button></a>
        </td>
    </tr>
    <% } %>
  </tbody>
</table>
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
    
    $(document).ready(function(){
        $("#deleteModal").modal('show');
    });
 </script>
  
   <%if( request.getParameter("DeleteID") != null ){ %>
	<div id="deleteModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<form action="DeleteEmployee" method="POST" > 
				<div class="modal-body">
					<p>Do you really want to delete these records? This process cannot be undone.</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="EmpID" value="<%=request.getParameter("DeleteID") %>" >
					<button type="button" class="btn btn-info" data-dismiss="modal"><b>Cancel</b></button>
					<button type="submit" class="btn btn-danger"><b>Delete</b></button>
					</form>
				</div>
			</div>
		</div>
	
	<%} %>
</body>
</html>
    