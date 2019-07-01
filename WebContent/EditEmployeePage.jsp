<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.oop.model.*" %>
<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@page import="com.oop.service.IEmployeeService"%> 
<%@ page import="com.oop.model.LoginHandler" %> 
<%@ page import="com.oop.model.Department" %> 
<%@ page import="com.oop.service.IDepartmentService" %> 
<%@ page import="com.oop.service.DepartmentServiceImpl" %> 
<%@ page import="java.util.ArrayList" %>
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
		<% int EmpId = Integer.parseInt(request.getAttribute("EmpId").toString());
		IEmployeeService employeeService = new EmployeeServiceImpl();
			Employee employee = employeeService.getEmployeeDetails(EmpId);
		%>
    <div class = "d-flex">
 	<jsp:include page="Sidebar.jsp"></jsp:include>
     <!---Page-Content--------------------------------------------------------------------------------------------------------->
    
  <div id="page-wrapper" >  
       <div class="container-flex" >
        
                <!--Main-Title-of-the-Page-------------------------------------------------->
                <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
                    <h3><strong>
                        <!--Main-Header icon and Text goes here----------------------------->
                        <i class="fas fa-address-card"></i>
                        Edit Employee </strong></h3>
               </div>
                <!--------------------------------------------------------------------------->
                <!--Form Sides start from here----------------------------------------------->

                <form method = "post" action="UpdateEmployee" >
                <div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
                      <!--Left Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">

                      
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                            <!--Header-->
                            <h5 class="FormHeader"><strong>Personal Information</strong></h5>
                            <!----Input Component---------->
                            <div class="col-md-6">
                                <label>First Name</label>
                                <input type="text" class="form-control" name="fname" value = "<%=employee.getFirstName() %>">
                            </div>
                            <!---Component End------------->
                            <div class="col-md-6">
                                <label>Last Name</label>
                                <input type="text" class="form-control" name="lname" value = "<%=employee.getLastName() %>">
                            </div>
                            <div class="col-md-12" >
                                <label>Date of Birth</label>
                                <input type="date" class="form-control" value = "<%=employee.getDateOfBirth() %>"  name="dob">
                            </div>
                            <div class="col-md-6" >
                                <label>Gender</label>
                                <select class="form-control" name="gender">
                                <option  <%=(employee.getGender().equalsIgnoreCase("male") ) ? "selected" : "" %> value="male" >Male</option >
                                <option <%= (employee.getGender().equalsIgnoreCase("female") ) ? "selected" : "" %> value="female" >Female</option>
                                </select>
                            </div>
                            <div class="col-md-6" >
                                <label>Marital Status</label>
                                <select class="form-control" name="status">
                                <option <%=(employee.getMaritalStatus().equalsIgnoreCase("Married") ) ? "selected" : "" %> value="Married" >Married</option>
                                <option <%=(employee.getMaritalStatus().equalsIgnoreCase("Single") ) ? "selected" : "" %> value="Single">Single</option>
                                </select>
                            </div> 
                            <!----Input Component---------->
                            <div class="col-md-12">
                                    <label>Spouse's Name</label>
                                    <input type="text" class="form-control" name="spname" value="<%=employee.getSpouseName()%>">
                                </div>
                            <!---Component End------------->
                            <!----Input Component---------->
                            <div class="col-md-6">
                                    <label>Nationality</label>
                                    <input type="text" class="form-control" name="nationality" value="<%=employee.getNationality()%>">
                                </div>
                                <!---Component End------------->
                             <!----Input Component---------->
                             <div class="col-md-6">
                                    <label>NIC Number</label>
                                    <input type="text" class="form-control" name="nic" value="<%=employee.getNIC()%>">
                                </div>
                                <!---Component End------------->
                                
                        </div>
                    </div>
                    <!--End of the left Part-------------------------------------------->
                        
                     <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                            <h5 class="FormHeader"><strong>Contact Information</strong></h5>
								 <!----Input Component---------->
                                 <div class="col-md-12">
                                        <label>Address</label>
                                        <input type="text" class="form-control" name="address" value="<%=employee.getAddress()%>">
                                    </div>
                                    <!---Component End------------->
                                   
                                    <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>City</label>
                                        <input type="text" class="form-control" name="city" value="<%=employee.getCity()%>">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Zip Code</label>
                                        <input type="text" class="form-control" name="zipcode" value="<%=employee.getZipCode()%>">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Mobile</label>
                                        <input type="text" class="form-control" name="mobile" value="<%=employee.getMobile()%>">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name="phone" value="<%=employee.getPhone()%>">
                                    </div>
                                    <!---Component End------------->
                                    <!----Input Component---------->
                                 <div class="col-md-12">
                                        <label>Email</label>
                                        <input type="text" class="form-control" name="email" value="<%=employee.getEmail()%>">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-8">
                                        <label>Emergency Contact No</label>
                                        <input type="text" class="form-control" name="enumber" value="<%=employee.getEmergencyNo()%>">
                                    </div>
                                    <!---Component End------------->
                        
                        
                       
                    </div>

                </div>
            
           <!--End of the Right Part-------------------------------------------->
            <!--Left Part of the page Content----------------------------------->
            <div class="col-md-6 col-sm-12 col-xs-12" id="l">

                      
                    <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                        <!--Header-->
                        <h5 class="FormHeader"><strong>Employee Information</strong></h5>
                        <!----Input Component---------->
                        <div class="col-md-6">
                            <label>Employee ID</label>
                            <input type="text" class="form-control" name="empid" readonly value="<%=employee.getEmpId()%>">
                            <label>Deparment</label>
                                <select class="form-control" name="department">
                               	 	<% IDepartmentService ds = new DepartmentServiceImpl();
                           				ArrayList<Department> list = ds.getDepartments();
                           				for(Department dep : list ){
                           			%>
                           			<option <%=(employee.getDepartmentID() == dep.getDepID() ) ? "selected" : "" %>
                           			value="<%=dep.getDepID() %>"  ><%=dep.getDepName() %></option>
                           			<%  } %>
                               	 	
                                </select>
                             <label>Designation</label>
                               <input type="text" class="form-control" name="designation" value="<%=employee.getDesignation()%>"> 
                            </div>
                            <!---Component End------------->
                            <div class="col-md-6 text-center" >
                             <img id="additemIMG1"  src="images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>"     >
                           
                            </div>
                            
                            
                    </div>
                </div>
                <!--End of the left Part-------------------------------------------->
                      <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l" styles="padding-bottom : 40px">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                            <h5 class="FormHeader"><strong>Bank Information</strong></h5>
								 <!----Input Component---------->
                                 <div class="col-md-12">
                                        <label>Bank Name</label>
                                        <input type="text" class="form-control" name="bankname" value="<%=employee.getBankName() %>" >
                                    </div>
                                    <!---Component End------------->
                             <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Branch No</label>
                                        <input type="text" class="form-control" name="branchno" value="<%=employee.getBranchName() %>"  >
                                    </div>
                                    <!---Component End------------->
                              <!----Input Component---------->
                                 <div class="col-md-8">
                                        <label>Account No</label>
                                        <input type="text" class="form-control" name="accountno" value="<%=Math.round(employee.getAccountNo()) %>" >
                                    </div>
                                    <!---Component End------------->
                                   
                                 
                        
                        
                       
                    </div>

                </div>
            
           <!--End of the Right Part-------------------------------------------->
                     <!--Form-Submit-of-the-Page-------------------------------------------------->
                <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
                    <div class="col-md-7" > <h5> </h5></div>
                    <div class="col-md-5 text-right" style="padding-top : 10px;">
                    <button class= "btn btn-primary ">Update</button>
                     <button class= "btn  btn-danger ">Cancel</button>
                         </div>
               </div>
                    </form>
                <!--------------------------------------------------------------------------->
        </div>
    </div>
     <!--End of the Page Content-------------------------------------------->
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