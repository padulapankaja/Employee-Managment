<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.Payment"%>
<%@ page import="com.oop.model.Department" %> 
<%@ page import="com.oop.service.IDepartmentService" %> 
<%@ page import="com.oop.service.DepartmentServiceImpl" %> 
<%@ page import="java.util.ArrayList" %>
<%@page import="com.oop.service.PaymentServiceImpl"%>
<%@page import="com.oop.service.IPaymentService"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

		<!---Page-Content-------------------------------------------------------------------------------------------------------- -->         
    <div id="page-wrapper" >  
       <div class="container-flex" >
        
               
           
           <div class="col-md-12 col-sm-12 col-xs-12" id = "contentHeader" >
         <h3><strong><i class="fa fa-list-alt" aria-hidden="true"></i> Employee List</strong></h3>
         
               </div>
				<div class="col-md-12 col-sm-12 col-xs-12 bottomCont">
					<div class="col-md-12 col-sm-12 col-xs-12 active"
						id="searchbarCollapse" style="padding: 1% 0px;">
						<form action="ShowEmployeePayments" method="POST">
							<div class="form-row">
								<div class="col-md-3 col-sm-4 col-xs-6">
									<label> Select Month</label> <input type="month"
										class="form-control" name="month" min="2019-01"
										value="2019-04">
								</div>

								<div class="col-md-3 col-sm-4 col-xs-6">
									<label>Department</label> <select class="form-control"
										name="department">
										<% IDepartmentService ds = new DepartmentServiceImpl();
                           				ArrayList<Department> list = ds.getDepartments();
                           				for(Department dep : list ){
                           			%>
                           			<option value="<%=dep.getDepID() %>"  ><%=dep.getDepName() %></option>
                           			<%  } %>    
									</select>
								</div>
								<div
									class="col-md-3 col-sm-4 col-sm-offset-0 col-xs-offset-3 col-xs-6">
									<button style="margin-top: 25px;" type="submit"
										class="btn btn-block btn-primary" name="startDate">
										<b>Search</b>
									</button>
								</div>
						</form>
					</div>
				</div>

				<div class = "col-md-12 col-sm-12 col-xs-12 table-responsive cont">
        <table class="table table-striped " style="font-size: 1.1em">
  <thead style="background-color: rgba(1, 50, 67, 1) ;color : white;">
    <tr >
      <th scope="col" width="5%">ID</th>
      <th scope="col" width="20%">Employee</th>
      <th scope="col" width="20%">Designation</th>
       <th scope="col" width="20%">Basic Salary</th>
       <th scope="col" width="20%"></th>
    </tr>
  </thead>
  <tbody>
  <% if( request.getAttribute("search") != null &&  Boolean.parseBoolean( request.getAttribute("search").toString() ) == true )
  		{     String month = request.getAttribute("month").toString();
  			  int DepId = Integer.parseInt( request.getAttribute("department").toString() );
  			  
  			  
  			  IPaymentService paymentService = new PaymentServiceImpl();
  			  ArrayList<Payment> arrayList  = paymentService.getAllPaymentForSelectedMonth(DepId, month);
  			  
  			  for (Payment payment : arrayList )
  			  {  
  %>
		    <tr>
		      <td><%=payment.getEmpId() %></td>
		      <td><%=payment.getFirstName() %></td>
		      <td><%=payment.getPossition() %></td>
		      <td><%=payment.getMobile() %></td>
		        <td> <form action="AddEmployeePaymentDetails" method="POST" >
		        <input type="hidden" name="month" value="<%=month %>" >
		        <input type="hidden" name="EmpID" value="<%=payment.getEmpId() %>" >
		        <button type="submit" class="btn btn-info addPaymentBtn">
		        Add Payment Details</button></form>
		        </td>
		   </tr>	
		   <% }}else { %>
  				<tr>
		      <td>-</td>
		      <td>-</td>
		      <td>-</td>
		      <td>-</td>
		        <td>-</td>
		   </tr>	
 		 <%} %>
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
			 
		    	  <div class="modal-header " style="border-bottom:0px;" >
		        	<h4 class="modal-title w-100 text-center" id="myModalLabel">New Payment Added SuccessFully ! </h4>
		         
		    </div>
		  </div>
		</div>
<% } %>
<!-- Central Modal Small -->  
    
    
    
    
</body>
</html>
