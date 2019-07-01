<%@page import="com.oop.service.MailServiceImpl"%>
<%@page import="com.oop.service.IMailService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oop.model.LoginHandler"%>
<%@page import="com.oop.model.Employee"%>
<% LoginHandler login = (LoginHandler) session.getAttribute("loginDetails"); %>


<!DOCTYPE html>
<html>
<head>
	  <script src="javascript/sidebar.js"></script>
</head>
<body>
 <!--Header------------------------------------------------------------------------------------------------------------>
        <nav class="navbar ">
  <div class="container-fluid">
   <form method="POST" action = "MemberLogout" id="myform">
    <div class="navbar-header text-left">
     <button class="btn btn-info sidebarBtn" onclick="sidebarToggle() "  type="button"><i class="fa fa-bars" aria-hidden="true"></i></button>
	<a class = "logout" onclick="document.getElementById('myform').submit();" >
      <span class="text-right sidebarBtn" style="color : white; margin-top :3px;"><i class="fas fa-sign-out-alt"></i> <b>Logout</b></span></a>
      </form>
    
    </div>
   
  </div>
</nav>

  <!--End-of-the-Header--------------------------------------------------------------------------------------------------->
  <!--SideBar------------------------------------------------------------------------------------------------------------->        
    <div  id = "sidebar-wrapper" >
        <div class = "sidebar-header">
          <div id="hleft">
            <img src = "images/<%=(login.getImagePath()== null) ? "user.jpg" : login.getImagePath() %>" width="60px" > 
           </div>
             <div id="hright">
            <span id="AcName"><%=login.getEmpName() %></span>
             <span id="AcType"><%=(login.getAccessLevel() == 1 ) ? "Administrator" : "Employee" %></span>
            <span id="AcStatus"><i class="fa fa-circle" aria-hidden="true"></i> Online</span>
            </div>
        </div>
            <ul class = "list-unstyled " >
                
        		<li><a href="HomePage.jsp" ><i class="fa fa-home" aria-hidden="true"></i><span class="sidebaritems">Home</span></a></li>
            	
            	<%if(login.getAccessLevel() == 1){ %>
            	<li><a onClick = "employeeDropdown()"    ><i class="far fa-address-card"></i><span class="sidebaritems">Employee</span></a>
                  <ul id="employeeSubmenu">
   					<li class="Empsub">
   						<a href="AddEmployeePage.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Add Employee</a>
   					</li>
   					<li class="Empsub"><form method="GET" action="ListEmployee"  id = "list_emp">
   						<a  onclick="document.getElementById('list_emp').submit();" ><i class="far fa-address-card"></i>List Employee</a></form>
   					</li >
   				</ul> 
               </li>
               <%}else { %>
               <li><a href= "ViewEmployeePage.jsp"><i class="far fa-address-card"></i><span class="sidebaritems">Employee</span></a>
                 <%} %>
            <%if(login.getAccessLevel() == 1){ %>    
           <li><a onClick = "paymentDropdown()"    ><i class="fas fa-coins"></i><span class="sidebaritems">Payroll</span></a>
                  <ul id="payrollSubmenu">
   					<li class="Empsub">
   						<a href="ListForAddPaymentDetails.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Add Payments</a>
   					</li>
   					<li class="Empsub"><form method="GET" action="ListEmployee"  id = "list_emp">
   						<a  href="ViewAllPaymentRecords.jsp" ><i class="far fa-address-card"></i>List Payments</a></form>
   					</li >
   				</ul> 
               </li>
               <%}else{ %>
              <li><a href= "ViewEmployeePayment.jsp"><i class="fas fa-clipboard-check"></i><span class="sidebaritems">Payment</span></a>  
               <%} %>
              <%if(login.getAccessLevel() == 1){ %> 
            <li><a onClick = "AttendanceDropdown()"    ><i class="fas fa-clipboard-check"></i><span class="sidebaritems">Attendance</span></a>
                  <ul id="attendanceSubmenu">
   					<li class="Empsub">
   						<a href="AddAttendance.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Add Attendance</a>
   					</li>
   					<li class="Empsub"><form method="GET" action="ListEmployee"  id = "list_emp">
   						<a  href="ListAttendance.jsp" ><i class="far fa-address-card"></i>List Attendance</a></form>
   					</li >
   				</ul> 
               </li>
               <%}else{ %>
                <li><a href="ViewAttendance.jsp"  ><i class="fas fa-coins"></i><span class="sidebaritems">Attendance</span></a></li>
                <%} %>
            <li><a href="MailInboxPage.jsp"><i class="fas fa-envelope"></i><span class="sidebaritems">Mailbox 
			<% IMailService mailservice = new MailServiceImpl();
               int mailCount = mailservice.mailCount(login.getEmpId());
               if(mailCount > 0 ){
            %>
            <span class="badge badge-success" style="background-color: mediumseagreen;" ><%=String.format("%02d", mailCount )%></span>
            <% } %>
            </span></a></li>
              <!-- ---------------------------------------------------------------------------------------------------------- -->
             <li><a href="#" onClick = "leaveDropdown()"><i class="fas fa-clipboard-check"></i><span class="sidebaritems">Leave Management</span></a>
              <ul id="leaveSubmenu">
              <%if(login.getAccessLevel() == 0){ %>
   					<li class="Empsub">
   						<a href="LeaveRequestPage.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Leave Request</a>
   					</li>
   					 <%}if(login.getAccessLevel() == 1){ %>
   					<li class="Empsub">
   						<a href="AdminLeaveListManage.jsp"><i class="fa fa-address-card" aria-hidden="true"></i>Leave Management</a>
   					</li> 
   					<li class="Empsub">
   						<a href="AdminLeaveList.jsp"><i class="fa fa-address-card" aria-hidden="true"></i>Leave List</a>
   					</li> 
   					
   					<%}else{ %>
   					<li class="Empsub">
   						<a  href="UserLeaveList.jsp" ><i class="far fa-address-card"></i>Leave List </a>
   					</li >
   					<% } %>
   				</ul> 
             </li>
        <!-- ---------------------------------------------------------------------------------------------------------- -->    
             <%if(login.getAccessLevel() == 1){ %> 
             <li><a href="ListAnnouncement.jsp"><i class="fas fa-bell"></i><span class="sidebaritems">Announcements</span></a></li>
            <%} %>
            </ul>
       
    </div> 
     <!--End-of-the-SideBar---------------------------------------------------------------------------------------------------->
    
</body>
</html>