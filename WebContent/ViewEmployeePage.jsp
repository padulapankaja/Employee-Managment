<%@page import="com.oop.service.DepartmentServiceImpl"%>
<%@page import="com.oop.service.IDepartmentService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.oop.model.*" %>
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
        
                <!--Main-Title-of-the-Page-------------------------------------------------->
                <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
                    <h3><strong>
                        <!--Main-Header icon and Text goes here----------------------------->
                        <i class="fas fa-address-card"></i>
                        Employee Details </strong></h3>
               </div>
                <!--------------------------------------------------------------------------->
               <% 
               		
               		int EmpId = 0;
               		if( login.getAccessLevel() == 1  ){	
               			EmpId = Integer.parseInt( request.getAttribute("EmpId").toString());
             		}else{
             			EmpId = login.getEmpId();
             		}
             		IDepartmentService departmentService = new DepartmentServiceImpl();	
             		IEmployeeService employeeService = new EmployeeServiceImpl();
 					Employee employee = employeeService.getEmployeeDetails(EmpId);
               %>

                
                <div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
                      <!--Left Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">

                      
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                            <!--Header-->
                            <h5 class="FormHeader"><strong>Personal Information</strong></h5>
                           
                            <div class="col-md-6">
                                <table>
                                <tr><td><label>First Name </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getFirstName()%></label></td></tr>
                                <tr><td>  <label>Date of Birth</label></td>
                                <td><label class="labelDetails" >: <%=employee.getDateOfBirth() %></label></td></tr>
                                 <tr><td>  <label>Marital Status </label></td>
                                <td><label class="labelDetails" >: <%=employee.getMaritalStatus() %></label></td></tr>  
                                  <tr><td>  <label>Nationality </label></td>
                                <td><label class="labelDetails" >: <%=employee.getNationality() %></label></td></tr>  
                                </table>
                            </div>
                            
                            <div class="col-md-6">
                                <table>
                                <tr><td><label>Last Name </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getLastName() %></label></td></tr>
                                <tr><td>  <label>Gender</label></td>
                                <td><label class="labelDetails" >: <%=employee.getGender() %></label></td></tr>
                                 <tr><td>  <label>Spouse's Name </label></td>
                                <td><label class="labelDetails" >: <%=employee.getSpouseName() %></label></td></tr>  
                                  <tr><td>  <label>NIC  </label></td>
                                <td><label class="labelDetails" >: <%=employee.getNIC() %></label></td></tr>  
                                </table>
                            </div>
                            
                           
                                
                        </div>
                    </div>
                    <!--End of the left Part-------------------------------------------->
                        
                     <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                            <h5 class="FormHeader"><strong>Contact Information</strong></h5>
								 <!----Input Component---------->
                                
                            <div class="col-md-12">
                                <table>
                                <tr><td><label>Address </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getAddress() %></label></td></tr>
                                </table>
                            </div>
                            
                            <div class="col-md-6">
                                <table>
                                <tr><td><label>City </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getCity() %></label></td></tr>
                                <tr><td>  <label>Mobile</label></td>
                                <td><label class="labelDetails" >: <%=employee.getMobile() %></label></td></tr>
                                 <tr><td>  <label>Email </label></td>
                                <td><label class="labelDetails" >: <%=employee.getEmail() %></label></td></tr>  
                                </table>
                            </div>
                           
                           
                            <div class="col-md-6">
                                <table>
                                <tr><td><label>Zip Code </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getZipCode() %></label></td></tr>
                                <tr><td>  <label>Phone</label></td>
                                <td><label class="labelDetails" >: <%=employee.getPhone() %></label></td></tr>
                                 <tr><td>  <label>Emergency No</label></td>
                                <td><label class="labelDetails" >: <%=employee.getEmergencyNo() %></label></td></tr>  
                                </table>
                            </div>
                             
                       
                    </div>

                </div>
            
           <!--End of the Right Part-------------------------------------------->
            <!--Left Part of the page Content----------------------------------->
            <div class="col-md-6 col-sm-12 col-xs-12" id="l">

                      
                    <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                        <!--Header-->
                        <h5 class="FormHeader"><strong>Employee Information</strong></h5>
                         <!----Input Component---------->
                        <div class="col-md-6 text-center" > 
                            
                        <div class = "pre text-center" >
                           <img class="addimage"  src="images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>"  >
                        </div>
                        </div>
                            <!---Component End------------->
                        <div class="col-md-6">
                                <table>
                                <tr><td><label>Employee ID </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getEmpId() %></label></td></tr>
                                <tr><td>  <label>Designation</label></td>
                                <td><label class="labelDetails" >: <%=employee.getDesignation() %></label></td></tr>
                                <tr><td><label>Department </label></td>
                                    <td><label class="labelDetails" >: <%=departmentService.getNameOfTheDepartment( employee.getDepartmentID() )%></label></td></tr>
                                </table>
                            </div>

                            
                      
                            
                    </div>
                </div>
                <!--End of the left Part-------------------------------------------->
                      <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l" styles="padding-bottom : 40px">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                            <h5 class="FormHeader"><strong>Bank Information</strong></h5>
								  <div class="col-md-6">
                                <table>
                                <tr><td><label>Bank Name </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getBankName() %></label></td></tr>
                                <tr><td>  <label>Account No</label></td>
                                <td><label class="labelDetails" >: <%=employee.getAccountNo() %></label></td></tr>
                                </table>
                            </div>
                        
                         <div class="col-md-6">
                                <table>
                                <tr><td><label>Branch Name </label></td>
                                    <td><label class="labelDetails" >: <%=employee.getBranchName() %></label></td></tr>
                                </table>
                            </div>
                    </div>

                </div>
            
           <!--End of the Right Part-------------------------------------------->
                     <!--Form-Submit-of-the-Page-------------------------------------------------->
               <%if(login.getAccessLevel() == 1){ %>
					<div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
						
						<div class="col-md-5 text-left" style="padding-top: 10px;">
							<form method="GET" action="EditEmployeeDetails">
								<input type="hidden" name="EmpId"
									value="<%=employee.getEmpId()%>"></input>
								<button type="submit" class="btn btn-primary btn-sm">
									<strong><i class="fas fa-user-edit"></i> Edit</strong>
								</button>
								<button type="button" class="btn btn-success btn-sm"  onclick= "window.history.back()"><b>Go Back</b></button>
							</form>
							
						</div>
					</div>
					<%
						}
					%>
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
    <% 	
    	if( request.getAttribute("newEmployee") != null  && Boolean.parseBoolean( request.getAttribute("newEmployee").toString() ) == true  ){ %>
    <!-- Central Modal Small -->
    <script type="text/javascript">
    $(document).ready(function(){
        $("#centralModalSm").modal('show');
    });
    
    var loadFile = function(event) 
    {
        var reader = new FileReader();
        reader.onload = function()
        {
          var output = document.getElementById('additemIMG1');
          output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
      }; 
</script>   
<div class="modal fade" id="centralModalSm" aria-hidden="true">

  <!-- Change class .modal-sm to change the size of the modal -->
  <div class="modal-dialog modal-md" role="document">


    <div class="modal-content">
      <div class="modal-header ">
        <h4 class="modal-title w-100 text-center" id="myModalLabel">New Employee Added SuccessFully ! </h4>
         
      </div>
      <div class="modal-body text-center">
        <!----Input Component---------->
                      <form method="POST" action="UpdateProfilePicture" enctype="multipart/form-data" >
                            <div class = "pre text-center" >
                              <label  class="">
                              You can upload an Image
                              <img id="additemIMG1"  src="images/user.jpg"     >
                              <input required  type="file" name="file" id ="file"  onchange="loadFile(event)" >
                              </label>
                        </div>
                       
                        <!---Component End------------->
        <h5>Employee ID : <%=employee.getEmpId() %></h5>
        <h5>UserName : <%=request.getAttribute("Username").toString() %></h5>
        <h5>Password : <%=request.getAttribute("Password").toString() %></h5>
        	<input type="hidden" name = "EmpId" value = "<%=employee.getEmpId() %>" >
         <button type="submit" class="btn btn-primary btn-sm" ><strong>Upload Image</strong></button>  
        <button type="button" class="btn btn-info btn-sm" ><strong>Close</strong></button> 
        </form> 
      </div>
    </div>
  </div>
</div>
<% } %>
<!-- Central Modal Small -->
</body>

</html>
