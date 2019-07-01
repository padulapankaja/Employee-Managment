 <%@page import="com.oop.service.DepartmentServiceImpl"%>
<%@page import="com.oop.service.IDepartmentService"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.oop.service.PaymentServiceImpl"%>
<%@page import="com.oop.service.IPaymentService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.oop.model.*" %>
<%@page import="com.oop.service.EmployeeServiceImpl"%>
<%@page import="com.oop.service.IEmployeeService"%>    
<%@page import="java.util.Date"%>    
<%@page import="java.text.SimpleDateFormat"%>    
<%	LoginHandler login = (LoginHandler) session.getAttribute("loginDetails");%> 
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
                         Payment Details </strong></h3>
               </div>
                
                <!--------------------------------------------------------------------------->
           <%  
           		String month = null;
           		int EmpID = 0;
           		Date currentDate = new Date();
           		DateFormat monthformat = new SimpleDateFormat("yyyy-MM");
           		
           		if( login.getAccessLevel() == 0 ){
           	   		if(request.getAttribute("Month") != null )
           	   		{
           	   			month = request.getAttribute("Month").toString();
           	   		}else{
           	   			month = monthformat.format(currentDate);
           	   		}
           	 		EmpID = login.getEmpId();
           		}else if( login.getAccessLevel() == 1 ){
           			
           			month = request.getAttribute("Month").toString();
           			EmpID = Integer.parseInt( request.getAttribute("EmpID").toString());
           		}
           			IDepartmentService departmentService = new DepartmentServiceImpl();
         	  		IPaymentService paymentService = new PaymentServiceImpl();
       	  			IEmployeeService employeeService = new EmployeeServiceImpl();
         	  		Payment payment = paymentService.getPaymentDetailsSelectedMonth( EmpID, month  );
       	  			Employee employee = employeeService.getEmployeeDetails(EmpID );
               %> 
               
               <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader" style="padding: 10px 0px;">
						<form action="ViewPayment" method="POST">
							<div class="form-row">
								<div class="col-md-3 col-sm-4 col-xs-6">
								 <input type="month"
										class="form-control" name="Month" min="2019-01"
										value="<%=month %>">
								</div>
								<div class="col-md-2 col-sm-3  col-xs-6">
								<input type="hidden" name="EmpID"  value="<%=EmpID%>"> 
								<input type="hidden" name="Search"  value='<%="true"%>' > 
									<button style="" type="submit"
										class="btn btn-block btn-primary" name="startDate">
										<b>Search</b>
									</button>
								</div>
								</div>
						</form>
					</div> 
					
                <% if( payment.getPaymentId() != 0 ){ %>
                <div class="col-md-12 col-sm-12 col-xs-12 FormSides">
                   
                      <!--Left Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">

                      
                        <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                            <!--Header-->
                        <h5 class="FormHeader"><strong>Employee Information</strong></h5>
                         <!----Input Component---------->
                        <div class="col-md-6 text-center" > 
                            
                        <div class = "pre text-center" >
                           <img class="addimage"  src="images/<%=( employee.getImagePath()== null) ? "user.jpg" : employee.getImagePath() %>"   style="width : 120px; height : 120px; margin-left : 5%;" >
                        </div> 
                        </div>
                            <!---Component End------------->
                        <div class="col-md-6">
                                <table>
                                <tr><td><label>Employee ID </label></td>
                                    <td><label class="labelDetails" >: <%=payment.getEmpId() %></label></td></tr>
                                <tr><td>  <label>Designation</label></td>
                                <td><label class="labelDetails" >: <%=employee.getDesignation() %></label></td></tr>
                                <tr><td><label>Department </label></td>
                                    <td><label class="labelDetails" >: <%=departmentService.getNameOfTheDepartment( employee.getDepartmentID() )%></label></td></tr>
                                    <tr><td><label>Month </label></td>
                                        <td><label class="labelDetails" >: <%=month %></label></td></tr>
                                    
                                </table>
                            </div>
                
                    </div>

                </div>
            
           <!--End of the Right Part-------------------------------------------->
            <!--Left Part of the page Content----------------------------------->
            <div class="col-md-6 col-sm-12 col-xs-12" id="l">

                      
                    <div class="col-md-12 col-sm-12 col-xs-12 " id="left">
                        <!--Header-->
						 <h5 class="FormHeader"><strong>Income</strong></h5>
                           
                            <div class="col-md-6">
                                <table>
                                <tr><td><label>Basic Salary</label></td>
                                    <td><label class="labelDetails" >: LKR <%=payment.getBasicSalary() %>0</label></td></tr>
                                <tr><td>  <label>Medical Allowance </label></td>
                                 <td><label class="labelDetails" >: LKR <%=payment.getMedicalAllowance() %>0</label></td></tr>  
                                <tr><td>  <label>Food Allowance </label></td>
                                    <td><label class="labelDetails" >: LKR <%=payment.getFoodAllowance() %>0</label></td></tr>   
                                <tr><td>  <label>Bonus </label></td>
                                    <td><label class="labelDetails" >: LKR <%=payment.getBonus() %>0</label></td></tr>  
                                
                                </table>
                            </div>
                            
                            <div class="col-md-6">
                                <table>
                                    <tr><td>  <label>Dearness A.</label></td>
                                        <td><label class="labelDetails" >: LKR <%=payment.getDearnessAllowance() %>0</label></td></tr>
                                    <tr><td>  <label>Telephone A. </label></td>
                                        <td><label class="labelDetails" >: LKR <%=payment.getTelephoneAllowance() %>0</label></td></tr> 
                                    <tr><td>  <label>Other </label></td>
                                        <td><label class="labelDetails" >: LKR <%=payment.getOther() %>0</label></td></tr>   
                                    
                                </table>
                            </div>
                            
                           
                                
                        </div>
                    </div>
                    <!--End of the left Part-------------------------------------------->
                        
                     <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                            <h5 class="FormHeader"><strong>Deduction</strong></h5>
								 <!----Input Component---------->

                            
                            <div class="col-md-6">
                                <table>
                                <tr><td><label>Professional Tax</label></td>
                                    <td><label class="labelDetails" >: LKR <%=payment.getProfessionalTax() %>0</label></td></tr>
                                <tr><td>  <label>Loan</label></td>
                                <td><label class="labelDetails" >: LKR <%=payment.getLoan() %>0</label></td></tr>
                                  
                                </table>
                            </div>
                           
                           
                            <div class="col-md-6">
                                <table>
                                <tr><td><label>Providet Tax </label></td>
                                    <td><label class="labelDetails" >: LKR <%=payment.getProvideTax() %>0</label></td></tr>
                                 <tr><td>  <label>Insurance</label></td>
                                <td><label class="labelDetails" >: LKR <%=payment.getInsurance() %>0</label></td></tr>  
                                </table>
                            </div>
                             
                            
                      
                            
                    </div>
                </div>
                <!--End of the left Part-------------------------------------------->
                      <!--Right Part of the page Content----------------------------------->
                    <div class="col-md-6 col-sm-12 col-xs-12" id="l" style="padding-bottom : 40px">
                        <div class="col-md-12 col-sm-12 col-xs-12  " id="right">

                            <h5 class="FormHeader"><strong>Net Salary</strong></h5>
								  <div class="col-md-6">
                                <table>
                                <tr><td><label>Total Income</label></td>
                                    <td><label class="labelDetails" >: LKR <%=payment.getTotalIncome() %>0</label></td></tr>
                                <tr><td>  <label>Net Salary </label></td>
                                <td><label class="labelDetails" >: LKR <%=payment.getTotalAmount() %>0</label></td></tr>
                                </table>
                            </div>
                        
                         <div class="col-md-6">
                                <table>
                                <tr><td><label>Total Deduction </label></td>
                                    <td><label class="labelDetails" >: LKR <%=payment.getTotalDeduction() %>0</label></td></tr>
                                </table>
                            </div>
                    </div>

                </div>
                <% } %>
            
           <!--End of the Right Part-------------------------------------------->
                     <!--Form-Submit-of-the-Page-------------------------------------------------->
                <% if( payment.getPaymentId() == 0 ){  %>
                <div class="col-md-12 col-sm-12 col-xs-12" id="contentHeader">
                    <img src="images/noPayment.jpg" width="100%" >
                         </div>
                    <%} %>
               </div>
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
