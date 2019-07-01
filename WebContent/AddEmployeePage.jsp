<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
      		LoginHandler login = (LoginHandler) session.getAttribute("loginDetails"); 
  	%>
   
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
        
                <!--Main-Title-of-the-Page-------------------------------------------------->
                <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
                    <h3><strong>
                        <!--Main-Header icon and Text goes here----------------------------->
                        <i class="fas fa-address-card"></i>
                        Add Employee </strong></h3>
               </div>
                <!--------------------------------------------------------------------------->
                <!--Form Sides start from here----------------------------------------------->

                <form method = "post" action="AddEmployee" name="addEmployee" onsubmit="return validateform()"  >
                <div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
                      <!--Left Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">

                      
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                            <!--Header-->
                            <h5 class="FormHeader"><strong>Personal Information</strong></h5>
                            <!----Input Component---------->
                            <div class="col-md-6">
                                <label>First Name<span id="fnameError" class="spanError"></span></label>
                                <input type="text" class="form-control" name="fname" placeholder="First Name...">
                            </div>
                            <!---Component End------------->
                            <div class="col-md-6">
                                <label>Last Name<span id="lnameError" class="spanError"></span></label>
                                <input type="text" class="form-control" name="lname" placeholder="Last Name...">
                            </div>
                            <div class="col-md-12" >
                                <label>Date of Birth<span id="dobError" class="spanError"></span></label>
                                <input type="date" class="form-control" placeholder="06-10-1997" name="dob">
                            </div>
                            <div class="col-md-6" >
                                <label>Gender</label>
                                <select class="form-control" name="gender">
                                <option Selected value="male" >Male</option >
                                <option value="female" >Female</option>
                                </select>
                            </div>
                            <div class="col-md-6" >
                                <label>Marital Status</label>
                                <select class="form-control" name="status">
                                <option Selected value="Married" >Married</option>
                                <option value="Single">Single</option>
                                </select>
                            </div> 
                            <!----Input Component---------->
                            <div class="col-md-12">
                                    <label>Spouse's Name<span id="spnameError" class="spanError"></span></label>
                                    <input type="text" class="form-control" name="spname" placeholder="Spouse's Full Name...">
                                </div>
                            <!---Component End------------->
                            <!----Input Component---------->
                            <div class="col-md-6">
                                    <label>Nationality<span id="nationalityError" class="spanError"></span></label>
                                    <input type="text" class="form-control" name="nationality" placeholder="Nationality...">
                                </div>
                                <!---Component End------------->
                             <!----Input Component---------->
                             <div class="col-md-6">
                                    <label>NIC Number<span id="nicError" class="spanError"></span></label>
                                    <input type="text" class="form-control" name="nic" placeholder="NIC Number...">
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
                                        <label>Address<span id="addressError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="address" placeholder="Address...">
                                    </div>
                                    <!---Component End------------->
                                   
                                    <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>City<span id="cityError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="city" placeholder="City...">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Zip Code<span id="zipcodeError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="zipcode" placeholder="Zip Code...">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Mobile<span id="mobileError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="mobile" placeholder="Mobile...">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Phone<span id="phoneError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="phone" placeholder="Phone...">
                                    </div>
                                    <!---Component End------------->
                                    <!----Input Component---------->
                                 <div class="col-md-12">
                                        <label>Email<span id="emailError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="email" placeholder="Email...">
                                    </div>
                                    <!---Component End------------->
                                     <!----Input Component---------->
                                 <div class="col-md-8">
                                        <label>Emergency Contact No<span id="enumberError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="enumber" placeholder="Emergency no...">
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
                        <div class="col-md-12">
                            <label>Employee ID</label>
                            <input type="text" class="form-control" name="empid" disabled placeholder="ID will Auto generate by the system...">
                            </div>
                            <div class ="col-md-6" >
                            <label>Deparment</label>
                                <select class="form-control" name="department">
                               	 	<% IDepartmentService ds = new DepartmentServiceImpl();
                           				ArrayList<Department> list = ds.getDepartments();
                           				for(Department dep : list ){
                           			%>
                           			<option value="<%=dep.getDepID() %>" selected ><%=dep.getDepName() %></option>
                           			<%  } %>                                </select>
                                </div>
                             <div class = "col-md-8">
                             <label>Designation<span id="designationError" class="spanError"></span></label>
                               <input type="text" class="form-control" name="designation" placeholder="Designation..."> 
                            </div>
                            <!---Component End------------->
                            
                            
                    </div>
                </div>
                <!--End of the left Part-------------------------------------------->
                      <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                            <h5 class="FormHeader"><strong>Bank Information</strong></h5>
								 <!----Input Component---------->
                                 <div class="col-md-12">
                                        <label>Bank Name<span id="banknameError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="bankname" placeholder="Bank Name...">
                                    </div>
                                    <!---Component End------------->
                             <!----Input Component---------->
                                 <div class="col-md-6">
                                        <label>Branch No<span id="branchnoError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="branchno" placeholder="Branch Number...">
                                    </div>
                                    <!---Component End------------->
                              <!----Input Component---------->
                                 <div class="col-md-8">
                                        <label>Account No<span id="accountnoError" class="spanError"></span></label>
                                        <input type="text" class="form-control" name="accountno" placeholder="Account Number...">
                                    </div>
                                    <!---Component End------------->
                                   
                                 
                        
                        
                       
                    </div>

                </div>
            
           <!--End of the Right Part-------------------------------------------->
                     <!--Form-Submit-of-the-Page-------------------------------------------------->
                <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
                    <div class="col-md-7" > <h5> </h5></div>
                    <div class="col-md-5 text-right" style="padding-top : 10px;">
                    <button class= "btn btn-primary ">Submit Form</button>
                     <button class= "btn  btn-danger ">Cancel</button>
                         </div>
               </div>
                <!--------------------------------------------------------------------------->
        </div>
                    </form>
    </div>
     <!--End of the Page Content-------------------------------------------->
  </div>  
  </div>  
  
    	<script src="javascript/validation.js"></script>
</body>

</html>