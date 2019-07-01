<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
     <link rel="stylesheet" type="text/css" href="styles/Mail.css" />
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
                        <i class="fas fa-envelope"></i>
                        Mail Compose </strong></h3>
               </div>
                <!--------------------------------------------------------------------------->
                 <!--Form Sides start from here----------------------------------------------->

                
                <div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
                      <!--Left Part of the page Content----------------------------------->
                    <div class="col-md-7 col-sm-12 col-xs-12" id="l" >
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                           
                            <h5 class="FormHeader"><strong>Mail Compose</strong></h5>
                            <!----Input Component---------->
                            <form method="post" action="ComposeMail" >
                            <div class="col-md-4">
                                <label>Sender ID</label>
                                <input type="text" class="form-control" name = "SenderId" value = "<%=login.getEmpId() %>" readonly>
                            </div>
                            <div class="col-md-4">
                                <label>Employee ID</label>
                                <input type="text" class="form-control" name="ReceiverId" placeholder="EmployeeID">
                            </div>
                             <div class="col-md-11">
                                <label>Message Title</label>
                                <input type="text" class="form-control" name="Title" placeholder="Title">
                            </div>
                            <!---Component End------------->
                             <div class="col-md-12">
                                <label>Message</label>
                               <textarea class="form-control" rows="12" id="comment" name="Message"></textarea>
                            </div>
                            	<input type="hidden"  >
                            <!---Component End------------->
                              <div class="col-md-12">
                            <br>
                            <button type="submit" class="btn btn-sm btn-primary" ><b>Compose</b></button>
                            <button type="cancel" class="btn btn-sm btn-danger" ><b>Cancel</b></button>
                            </div>
                   	</form>
                        </div>
                    </div>
                    <!--End of the left Part-------------------------------------------->
                         
                     <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-5 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">
                        <div class="col-md-12 mailComposeBackground" >
                        </div>
                       	<div class="col-md-12" >
                       	<label >01. Enter the Receiver employee's employee ID </label>
                       	<label>02. Add message title and message text </label>
                       	<label>03. Click "Compose" button to compose the mail </label><br>
                       	<h6>Mail services are extended for the sole use of Employees, and other 
                       		appropriately authorized users to accomplish tasks
                       		related to and consistent with the Company's mission.
                       		Mail systems and services are Company facilities,
                       		  resources, and property as those terms are used in Company policies 
                       		  and applicable law. Any mail assigned by the Company 
                       		  to individuals, sub-units, or functions of the Company 
                       		  is the property of the Company.
                       	</div>	
                        </div>
                    </div>    
        </div>
    </div>
     <!--End of the Page Content-------------------------------------------->
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