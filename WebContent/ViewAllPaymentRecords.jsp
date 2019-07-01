<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.service.*"%>
<%@page import="com.oop.model.Payment"%>

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
         <h3><strong><i class="fa fa-list-alt" aria-hidden="true"></i> Payment Records</strong></h3>
         
               </div>
            <div class="col-md-12 col-sm-12 col-xs-12 bottomCont">
           
        <div class = "col-md-12 col-sm-12 col-xs-12 table-responsive cont">
        <table class="table table-striped " style="font-size: 1.1em">
		  <thead style="background-color: rgba(1, 50, 67, 1) ;color : white;">
		    <tr >
		      <th scope="col" width="5%">ID</th>
		      <th scope="col" width="15%">Employee</th>
		      <th scope="col" width="15%">Designation</th>
		      <th scope="col" width="10%">Month</th>
		      <th scope="col" width="10%" style="text-align: right;">Income</th>
		      <th scope="col" width="10%" style="text-align: right;" >Deduction</th>
		       <th scope="col" width="10%" style="text-align: right;" >Net Salary</th>
		       <th scope="col" width="5%"></th>
		        <th scope="col" width="5%"></th>
		     
		    </tr>
		  </thead>
		  <tbody>
		  <%  	IPaymentService paymentService = new PaymentServiceImpl();
		  		IEmployeeService employeeService = new EmployeeServiceImpl();
		  		ArrayList<Payment> arrayList =  paymentService.getAllPayments();
		  		DateFormat Monthformat = new SimpleDateFormat("MMMM");
		  		for( Payment payment : arrayList ){
		  			Employee employee = employeeService.getEmployeeDetails( payment.getEmpId() );	
		  %>
		    <tr>
		      <td><b><%=payment.getEmpId() %></b></td>
		      <td><%=employee.getFirstName() + " " + employee.getLastName() %></td>
		      <td><%=employee.getDesignation() %></td>
		      <td><%= Monthformat.format( new SimpleDateFormat("yyyy-MM-dd").parse(payment.getEndDate() ) )        %></td>
		      <td align="right">LKR <%=payment.getTotalIncome() %>0</td>
		      <td align="right">LKR <%=payment.getTotalDeduction() %>0</td>
		  	  <td align="right">LKR <%=payment.getTotalAmount() %>0</td>
		      <td><a href= "UpdatePaymentDetails.jsp?PaymentID=<%=payment.getPaymentId() %>" >
		            <button type="submit" class="btn btn-warning btn-xs " ><strong>Update</strong></button>
		        </a>
		     </td>
		     <td>
		     	<form method="POST" action="ViewPayment" >
		      		<input type="hidden" name="Month" value="<%=payment.getEndDate() %>" >
		      		<input type="hidden" name="EmpID" value="<%=payment.getEmpId() %>" >
		            <button  type="submit" class="btn btn-info btn-xs"><strong>View</strong></button>
		       </form>
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
    </script>
    
</body>
</html>
    